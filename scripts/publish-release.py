"""Publish validated annual PDFs and per-subject collection releases.

Invoked only by the default-branch Actions job with a contents:write token.
"""
import argparse
import json
import os
from pathlib import Path
import re
import runpy
import shutil
import unicodedata
from urllib.parse import quote
import subprocess
import tempfile


def gh(*args):
    return subprocess.run(['gh', *args], check=True, capture_output=True, text=True).stdout


def release_files(directory):
    """Require a nonempty PDF-only directory of complete reading/print pairs."""
    entries = list(directory.iterdir())
    pattern = r'20\d{2}(?:-answers|-sample(?:-answers)?)?(?:-print)?\.pdf'
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


COLLECTION_SUBJECTS = {'数据结构': 'ds', '计算机组成原理': 'coa', '操作系统': 'os', '计算机网络': 'cn'}


def collection_plan():
    """Use the reviewed lecture plan and merge rules to enumerate release pairs."""
    root = Path(__file__).resolve().parent.parent
    plans = runpy.run_path(str(root / 'scripts/extract-collections.py'))['PLANS']
    merges = runpy.run_path(str(root / 'scripts/build-collections.py'))['MERGED_COLLECTIONS']
    merged = {title: name for name, titles in merges.items() for title in titles}
    rows = {}
    for title, plan in plans.items():
        name = merged.get(title, title + '-题目')
        if name in rows:
            continue
        members = merges.get(name, (title,))
        directory = Path(plan['directory'])
        subject, chapter = directory.parts[:2]
        question = directory.parent / (name + '.pdf')
        answer = question.with_name(name.replace('-题目', '-answers') + '.pdf')
        rows[name] = dict(subject=subject, chapter=chapter, title=name.removesuffix('-题目'),
                          question=question, answer=answer, members=members)
    groups = []
    for subject, prefix in COLLECTION_SUBJECTS.items():
        normalize = lambda text: unicodedata.normalize('NFKC', text).replace(' ', '').replace('／', '/')
        syllabus = (root / '考试大纲' / (subject + '.org')).read_text()
        headings = [re.sub(r'^(?:[一二三四五六七八九十]+、|\([一二三四五六七八九十]+\))', '', normalize(line))
                    for line in re.findall(r'^\*+\s+(.+)', syllabus, re.MULTILINE)]

        def position(name):
            name = {'输入输出管理': '输入/输出(I/O)管理'}.get(name, name)
            name = normalize(name)
            return headings.index(name) if name in headings else len(headings)

        def order(row):
            topics = [topic for title in row['members'] for topic in (title, *plans[title]['sections'])]
            return position(row['chapter']), min(position(topic) for topic in topics)

        selected = sorted((r for r in rows.values() if r['subject'] == subject), key=order)
        chapters = list(dict.fromkeys(row['chapter'] for row in selected))
        numbers = {}
        for row in selected:
            chapter = row['chapter']
            numbers[chapter] = numbers.get(chapter, 0) + 1
            code = f'{prefix}-{chapters.index(chapter) + 1:02d}-{numbers[chapter]:02d}'
            row['question_name'] = code + '-questions.pdf'
            row['answer_name'] = code + '-answers.pdf'
        groups.append(dict(subject=subject, tag='collection-' + subject,
                           title=subject + '分类汇编', rows=selected))
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
             '', '收录2009—2022年真题及相关旧版题型示例，保留2023—2026年整卷练习。',
             '历年真题选择题仅列答案字母；综合题保留对应参考答案或整理解析。旧版题型示例保留详细解析，标注为自制、非官方。',
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
             '旧版题型示例解析为本仓库自制，非官方答案，包含选择题与综合题的详细解析。\n\n'
             '只提供可单独下载的 PDF，打印版文件名以 -print.pdf 结尾。'
             '打印版使用 ISO B4 横向纸张，100% 打印、双面短边翻转，每面 1 页。'
             '不要再次开启小册子拼版，也不要跳过空白面；请先用一张纸试打。\n')
    assets = {name: (directory / name, None) for name in actual}
    publish_assets('pdf-latest', 'PDF downloads', notes, assets, commit, repo, existing_tags, latest=True)


if __name__ == '__main__':
    main()
