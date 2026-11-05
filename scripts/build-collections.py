"""Build a selected year range and paper size without changing classified sources."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import re
import runpy
import subprocess
import shutil
import tempfile

PAPER_SIZES = {'A4': (210, 297), 'A5': (148, 210)}

MERGED_COLLECTIONS = {
    '操作系统的基本概念与发展历程-题目': ('操作系统的基本概念', '操作系统发展历程'),
    '物理层分类汇编-题目': ('通信基础', '传输介质'),
    '传输层提供的服务与UDP协议-题目': ('传输层提供的服务', 'UDP协议'),
    'FTP与电子邮件-题目': ('FTP', '电子邮件'),
    '流量控制与可靠传输机制-题目': ('数据链路层的功能', '差错控制', '流量控制与可靠传输机制'),
    'DNS系统-题目': ('网络应用模型', 'DNS系统'),
}

def generate_previews(root, plans=None):
    """Generate disposable compilation entry points from the lecture plans."""
    if plans is None:
        plans = runpy.run_path(str(Path(__file__).with_name('extract-collections.py')))['PLANS']
    collections = root / '分类汇编'
    merged = {title: name for name, titles in MERGED_COLLECTIONS.items() for title in titles}
    outputs = {}
    for title, plan in plans.items():
        name = merged.get(title, title + '-题目')
        if name in outputs:
            continue
        titles = tuple(t for t in MERGED_COLLECTIONS.get(name, (title,)) if t in plans)
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


def collection_inputs(source, collections, plans=None):
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
    expected = MERGED_COLLECTIONS.get(merge_name)
    if expected is not None and plans is not None:
        expected = tuple(title for title in expected if title in plans)
    if len(contents) > 1 and titles != expected:
        raise ValueError(f'{source}: unregistered or out-of-order merge')
    if merge_name in MERGED_COLLECTIONS and titles != expected:
        raise ValueError(f'{source}: incomplete merge')
    return contents, next(iter(chapters))


def prepare_sources(root, stage, plans):
    """Render filtered questions/answers in an isolated, disposable source tree."""
    for name in ('template.typ', '历年真题+参考解答', '旧版题型示例'):
        (stage / name).symlink_to(root / name, target_is_directory=(root / name).is_dir())
    collections = stage / '分类汇编'
    collections.mkdir()
    shutil.copyfile(root / '分类汇编/template.typ', collections / 'template.typ')
    extract = runpy.run_path(str(root / 'scripts/extract-collections.py'))
    answers = runpy.run_path(str(root / 'scripts/extract-collection-answers.py'))
    for title, plan in plans.items():
        target, text, _ = extract['render'](stage, title, plan)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text)
    for target, text in answers['outputs'](stage, plans):
        target.write_text(text)
    generate_previews(stage, plans)
    return collections


def validate_pdf(target, paper):
    from pypdf import PdfReader
    pages = PdfReader(target).pages
    expected = tuple(mm * 72 / 25.4 for mm in PAPER_SIZES[paper])
    if not pages:
        raise ValueError(f'{target}: empty PDF')
    for number, page in enumerate(pages, 1):
        actual = float(page.mediabox.width), float(page.mediabox.height)
        if any(abs(a - b) > 0.1 for a, b in zip(actual, expected)):
            raise ValueError(f'{target}: page {number} is {actual}, expected {paper} {expected}')


def main():
    extract = runpy.run_path(str(Path(__file__).with_name('extract-collections.py')))
    parser = argparse.ArgumentParser()
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--from-year', type=int, default=extract['MIN_YEAR'])
    parser.add_argument('--through-year', type=int, default=extract['MAX_YEAR'])
    parser.add_argument('--paper-size', choices=tuple(PAPER_SIZES), default='A4')
    parser.add_argument('--current-syllabus-only', action='store_true',
                        help='Omit the four retained historical-syllabus questions')
    args = parser.parse_args()
    root = Path.cwd().resolve()
    try:
        plans = extract['select_plans'](args.from_year, args.through_year, args.current_syllabus_only)
    except ValueError as error:
        parser.error(str(error))
    if args.output.exists() and any(args.output.iterdir()):
        parser.error('--output must be empty; use a new directory for a different build')
    args.output = args.output.resolve()
    subprocess.run(['python3', 'scripts/extract-collections.py', '--check'], check=True)
    subprocess.run(['python3', 'scripts/extract-collection-answers.py', '--check'], check=True)
    scratch = root / '.build'
    scratch.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='collections-', dir=scratch) as temporary:
        collections = prepare_sources(root, Path(temporary), plans)

        def build(source):
            _, chapter = collection_inputs(source, collections, plans)
            target = args.output.joinpath(*chapter, source.stem + '.pdf')
            target.parent.mkdir(parents=True, exist_ok=True)
            result = subprocess.run(['typst', 'compile', '--ignore-system-fonts', '--root', str(root),
                                     '--input', f'collection-size={args.paper_size}',
                                     '--input', f'from-year={args.from_year}',
                                     '--input', f'through-year={args.through_year}',
                                     str(source), str(target)], capture_output=True, text=True)
            if result.returncode:
                raise RuntimeError(f'{source}:\n{result.stderr}')
            validate_pdf(target, args.paper_size)
            return str(target.relative_to(args.output))

        sources = sorted((collections / 'preview').glob('*.typ'))
        sources += sorted((collections / 'answers-preview').glob('*.typ'))
        with ThreadPoolExecutor(max_workers=4) as pool:
            for target in pool.map(build, sources):
                print(target, flush=True)


if __name__ == '__main__':
    main()
