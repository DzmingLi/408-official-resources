"""Publish validated annual PDFs and per-subject collection releases.

Invoked only by the default-branch Actions job with a contents:write token.
"""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
from urllib.parse import quote
import subprocess
import tempfile


def gh(*args):
    return subprocess.run(['gh', *args], check=True, capture_output=True, text=True).stdout


def release_files(directory):
    """Require a nonempty PDF-only directory of complete reading/print pairs."""
    entries = list(directory.iterdir())
    pattern = r'(?:20\d{2}(?:-answers)?|old-sample)(?:-print)?\.pdf'
    invalid = [p.name for p in entries if not p.is_file() or not re.fullmatch(pattern, p.name)]
    if invalid:
        raise ValueError(f'Unexpected release files: {sorted(invalid)}')
    actual = {p.name for p in entries}
    if not actual:
        raise ValueError('No PDFs found')
    reading = {name for name in actual if not name.endswith('-print.pdf')}
    expected = reading | {name.removesuffix('.pdf') + '-print.pdf' for name in reading}
    if actual != expected:
        raise ValueError(f'Reading/print pair mismatch: missing={expected-actual}, extra={actual-expected}')
    return actual


def collection_plan():
    """Read the same lecture catalog used by native Nix targets."""
    root = Path(__file__).resolve().parent.parent
    groups = json.loads((root / '真题分类汇编/collections.json').read_text())
    for group in groups:
        for row in group['rows']:
            row['question'] = Path(row['question'])
            row['answer'] = Path(row['answer'])
    return groups


def collection_release_files(directory):
    """Reject partial builds before replacing any published collection assets."""
    groups = collection_plan()
    expected = {row[k] for group in groups for row in group['rows'] for k in ('question', 'answer')}
    entries = list(directory.rglob('*'))
    invalid = [p.relative_to(directory) for p in entries if not p.is_dir() and
               (not p.is_file() or p.suffix != '.pdf')]
    actual = {p.relative_to(directory) for p in entries if p.is_file()}
    if invalid or actual != expected:
        raise ValueError(f'Collection PDF mismatch: missing={expected-actual}, extra={actual-expected}')
    return groups


def collection_notes(group, commit, repo):
    lines = [f'由提交 {commit} 自动生成，共 {len(group["rows"])} 讲，各含题目与答案 PDF（A4 阅读版）。',
             '', '收录2009—2026年全部真题，不含题型示例；历史考点单独标明。',
             '2023、2026年尚无参考答案源稿，答案册逐题标为“本仓库尚未收录本题参考答案”。',
             '自行构建可通过 Nix 的 mkCollections 函数选择 fromYear、throughYear 和 A4/A5 paperSize。',
             '历年真题选择题仅列答案字母；综合题保留对应参考答案或整理解析。',
             '下载文件按科目、章节和讲次编号，中文讲名及下载入口如下。', '']
    chapter = None
    for row in group['rows']:
        if row['chapter'] != chapter:
            chapter = row['chapter']
            lines += ['', '## ' + chapter, '', '| 讲名 | 题目 | 答案 |', '|---|---|---|']
        base = f'https://github.com/{repo}/releases/download/{quote(group["tag"], safe="")}/'
        lines.append(f'| {row["title"].replace("|", "&#124;")} | '
                     f'[题目]({base}{row["question_name"]}) | [答案]({base}{row["answer_name"]}) |')
    return '\n'.join(lines) + '\n'


def publish_assets(tag, title, notes, assets, commit, repo, existing_tags, latest):
    """Upload every current asset successfully before deleting obsolete assets."""
    with tempfile.TemporaryDirectory() as tmp:
        body = Path(tmp) / 'notes.txt'
        body.write_text(notes)
        latest_flag = '--latest' if latest else '--latest=false'
        if tag in existing_tags:
            gh('api', '--method', 'PATCH', f'repos/{repo}/git/refs/tags/{quote(tag, safe="")}',
               '-f', f'sha={commit}', '-F', 'force=true')
            gh('release', 'edit', tag, '--title', title, '--notes-file', str(body), latest_flag)
        else:
            gh('release', 'create', tag, '--target', commit, '--title', title,
               '--notes-file', str(body), latest_flag)
        paths = []
        for name, (source, label) in sorted(assets.items()):
            if label:
                target = Path(tmp) / name
                shutil.copyfile(source, target)
                paths.append(str(target) + '#' + label)
            else:
                paths.append(str(source))
        for start in range(0, len(paths), 40):
            gh('release', 'upload', tag, *paths[start:start + 40], '--clobber')
            print(f'{tag}: uploaded {min(start + 40, len(paths))}/{len(paths)} PDFs', flush=True)
        published = json.loads(gh('release', 'view', tag, '--json', 'assets'))['assets']
        missing = set(assets) - {asset['name'] for asset in published}
        if missing:
            raise RuntimeError(f'{tag}: uploaded assets missing: {sorted(missing)}')
        for asset in published:
            if asset['name'] not in assets:
                gh('release', 'delete-asset', tag, asset['name'], '--yes')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--directory', type=Path, required=True)
    parser.add_argument('--kind', choices=('papers', 'collections'), default='papers')
    parser.add_argument('--check-only', action='store_true', help='Validate output without publishing')
    args = parser.parse_args()
    directory = args.directory.resolve()
    try:
        actual = release_files(directory) if args.kind == 'papers' else collection_release_files(directory)
    except ValueError as error:
        raise SystemExit(str(error))
    if args.check_only:
        if args.kind == 'papers':
            print(f'Validated {len(actual)} PDFs in complete reading/print pairs.')
        else:
            print(f'Validated {sum(len(g["rows"]) * 2 for g in actual)} collection PDFs across {len(actual)} subjects.')
        return
    commit = os.environ['SOURCE_COMMIT']
    repo = os.environ['GH_REPO']
    default_branch = json.loads(gh('api', f'repos/{repo}'))['default_branch']
    head = json.loads(gh('api', f'repos/{repo}/commits/{default_branch}'))['sha']
    if head != commit:
        print('Default branch advanced; skip publishing this older build.')
        return
    existing_tags = {r['tag_name'] for r in json.loads(gh('api', f'repos/{repo}/releases?per_page=100'))}
    if args.kind == 'collections':
        for group in actual:
            assets = {}
            for row in group['rows']:
                assets[row['question_name']] = (directory / row['question'], row['title'] + '-题目.pdf')
                assets[row['answer_name']] = (directory / row['answer'], row['title'] + '-答案.pdf')
            publish_assets(group['tag'], group['title'], collection_notes(group, commit, repo),
                           assets, commit, repo, existing_tags, latest=False)
        return
    notes = (f'由提交 {commit} 自动生成，共 {len(actual)//2} 份阅读版和 {len(actual)//2} 份小册子打印版 PDF。\n\n'
             '旧版题型示例仅发布官方题目，不发布本地自制解析。\n\n'
             '只提供可单独下载的 PDF，打印版文件名以 -print.pdf 结尾。'
             '打印版使用 ISO B4 横向纸张，100% 打印、双面短边翻转，每面 1 页。'
             '不要再次开启小册子拼版，也不要跳过空白面；请先用一张纸试打。\n')
    assets = {name: (directory / name, None) for name in actual}
    publish_assets('pdf-latest', 'PDF downloads', notes, assets, commit, repo, existing_tags, latest=True)


if __name__ == '__main__':
    main()
