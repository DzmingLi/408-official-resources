"""Publish the complete, already validated build to the rolling pdf-latest release.

Invoked only by the default-branch Actions job with a contents:write token.
"""
import argparse
import json
import os
from pathlib import Path
import re
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


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--directory', type=Path, required=True)
    parser.add_argument('--check-only', action='store_true', help='Validate PDF-only output without publishing')
    args = parser.parse_args()
    directory = args.directory.resolve()
    try:
        actual = release_files(directory)
    except ValueError as error:
        raise SystemExit(str(error))
    if args.check_only:
        print(f'Validated {len(actual)} PDFs in complete reading/print pairs.')
        return
    commit = os.environ['SOURCE_COMMIT']
    repo = os.environ['GH_REPO']
    tag = 'pdf-latest'
    # Never let a queued older build overwrite a newer default-branch build.
    default_branch = json.loads(gh('api', f'repos/{repo}'))['default_branch']
    head = json.loads(gh('api', f'repos/{repo}/commits/{default_branch}'))['sha']
    if head != commit:
        print('Default branch advanced; skip publishing this older build.')
        return
    releases = json.loads(gh('api', f'repos/{repo}/releases?per_page=100'))
    existing = next((r for r in releases if r['tag_name'] == tag), None)
    notes = (f'由提交 {commit} 自动生成，共 {len(actual)//2} 份阅读版和 {len(actual)//2} 份小册子打印版 PDF。\n\n'
             '只提供可单独下载的 PDF，打印版文件名以 -print.pdf 结尾。'
             '打印版使用 ISO B4 横向纸张，100% 打印、双面短边翻转，每面 1 页。'
             '不要再次开启小册子拼版，也不要跳过空白面；请先用一张纸试打。\n')
    with tempfile.TemporaryDirectory() as tmp:
        body = Path(tmp) / 'notes.txt'
        body.write_text(notes)
        if existing:
            gh('api', '--method', 'PATCH', f'repos/{repo}/git/refs/tags/{tag}', '-f', f'sha={commit}', '-F', 'force=true')
            gh('release', 'edit', tag, '--title', 'PDF downloads', '--notes-file', str(body), '--latest')
        else:
            gh('release', 'create', tag, '--target', commit, '--title', 'PDF downloads', '--notes-file', str(body), '--latest')
        paths = [str(directory / name) for name in sorted(actual)]
        # Chunk uploads to keep command length bounded as the repository grows.
        for start in range(0, len(paths), 40):
            gh('release', 'upload', tag, *paths[start:start + 40], '--clobber')
        # Delete removed papers only after every current file has been uploaded.
        assets = json.loads(gh('release', 'view', tag, '--json', 'assets'))['assets']
        for asset in assets:
            if asset['name'] not in actual:
                gh('release', 'delete-asset', tag, asset['name'], '--yes')


if __name__ == '__main__':
    main()
