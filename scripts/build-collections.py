"""Compile only the explicitly requested A4 lecture previews, like the math repo."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import re
import runpy
import subprocess

MERGED_COLLECTIONS = {
    '操作系统的基本概念与发展历程-题目': ('操作系统的基本概念', '操作系统发展历程'),
    '物理层分类汇编-题目': ('通信基础', '传输介质'),
    '传输层提供的服务与UDP协议-题目': ('传输层提供的服务', 'UDP协议'),
    'FTP与电子邮件-题目': ('FTP', '电子邮件'),
    '流量控制与可靠传输机制-题目': ('数据链路层的功能', '流量控制与可靠传输机制'),
    'DNS系统-题目': ('网络应用模型', 'DNS系统'),
}

# Only automatic space-saving merges must remain a single page. The user
# explicitly requested other lectures join their corresponding longer files.
SINGLE_PAGE_MERGES = {'传输层提供的服务与UDP协议-题目', 'FTP与电子邮件-题目', '操作系统的基本概念与发展历程-题目'}


def generate_previews(root):
    """Generate disposable compilation entry points from the lecture plans."""
    plans = runpy.run_path(str(Path(__file__).with_name('extract-collections.py')))['PLANS']
    collections = root / '分类汇编'
    merged = {title: name for name, titles in MERGED_COLLECTIONS.items() for title in titles}
    outputs = {}
    for title, plan in plans.items():
        name = merged.get(title, title + '-题目')
        if name in outputs:
            continue
        titles = MERGED_COLLECTIONS.get(name, (title,))
        subject, chapter = Path(plan['directory']).parts[:2]
        heading = name.removesuffix('-题目').replace('／', '/')
        if name == '物理层分类汇编-题目':
            heading = '物理层'
        elif subject == '计算机网络' and heading != '计算机网络概述':
            heading = chapter + ' · ' + ('设备' if heading == '数据链路层设备' else heading)
        elif subject == '数据结构' and chapter == '图':
            heading = '图 · ' + heading
        lines = [
            '#import "../template.typ": collection',
            f'#show: collection.with(title: "{subject}分类汇编", subject: "{heading}")',
        ]
        lines += [f'#include "../{plans[t]["directory"]}/{t}-题目.typ"' for t in titles]
        outputs[name] = '\n'.join(lines) + '\n'
    for directory in ('preview', 'answers-preview'):
        target = collections / directory
        target.mkdir(parents=True, exist_ok=True)
        for stale in target.glob('*.typ'):
            stale.unlink()
        for name, text in outputs.items():
            if directory == 'answers-preview':
                name = name.replace('-题目', '-answers')
                text = text.replace('collection.with(', 'collection.with(solutions: true, ')
                text = text.replace('-题目.typ"', '-answers.typ"')
            (target / (name + '.typ')).write_text(text)


def collection_inputs(source, collections):
    includes = re.findall(r'^#include "([^"\n]+)"', source.read_text(), re.MULTILINE)
    if not includes:
        raise ValueError(f'{source}: missing collection include')
    contents = [(source.parent / path).resolve() for path in includes]
    relatives = [path.relative_to(collections.resolve()) for path in contents]
    chapters = {path.parts[:-2] for path in relatives}
    if len(chapters) != 1:
        raise ValueError(f'{source}: cannot merge across top-level chapters')
    titles = tuple(path.stem.removesuffix('-题目').removesuffix('-answers') for path in contents)
    merge_name = source.stem.replace('-answers', '-题目')
    if len(contents) > 1 and titles != MERGED_COLLECTIONS.get(merge_name):
        raise ValueError(f'{source}: unregistered or out-of-order merge')
    if merge_name in MERGED_COLLECTIONS and titles != MERGED_COLLECTIONS[merge_name]:
        raise ValueError(f'{source}: incomplete merge')
    return contents, next(iter(chapters))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    root = Path.cwd()
    collections = root / '分类汇编'
    generate_previews(root)
    subprocess.run(['python3', 'scripts/test-collections.py'], check=True)
    subprocess.run(['python3', 'scripts/extract-collections.py', '--check'], check=True)
    subprocess.run(['python3', 'scripts/extract-collection-answers.py', '--check'], check=True)

    def build(source):
        _, chapter = collection_inputs(source, collections)
        # Preserve subject/chapter grouping but not the redundant lecture folder.
        target = args.output.joinpath(*chapter, source.stem + '.pdf')
        target.parent.mkdir(parents=True, exist_ok=True)
        result = subprocess.run(['typst', 'compile', '--ignore-system-fonts', '--root', str(root),
                                 str(source), str(target)], capture_output=True, text=True)
        if result.returncode:
            raise RuntimeError(f'{source}:\n{result.stderr}')
        if source.stem in SINGLE_PAGE_MERGES:
            from pypdf import PdfReader
            if len(PdfReader(target).pages) != 1:
                raise RuntimeError(f'{source}: merged collection exceeds one page; split it before publishing')
        return str(target.relative_to(args.output))

    sources = sorted(p for p in (collections / 'preview').glob('*.typ') if p.name != 'template.typ')
    sources += sorted((collections / 'answers-preview').glob('*-answers.typ'))
    if not sources:
        raise SystemExit('No requested collection previews found')
    with ThreadPoolExecutor(max_workers=4) as pool:
        for target in pool.map(build, sources):
            print(target, flush=True)


if __name__ == '__main__':
    main()
