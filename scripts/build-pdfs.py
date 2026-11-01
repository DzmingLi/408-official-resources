"""Compile self-contained 408 papers that import the shared exam template."""
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
import re
import subprocess
import sys

from booklet import build_booklet

SUSPENDED_YEARS = set()


def sources(root):
    paper_root = root / '历年真题+参考解答'
    if not paper_root.exists():
        paper_root = root
    papers = [p for year in paper_root.iterdir() if year.is_dir() and re.fullmatch(r'20\d{2}', year.name)
              and year.name not in SUSPENDED_YEARS
              for p in year.glob('*.typ') if p.name in (year.name + '.typ', year.name + '-答案.typ')]
    samples = list((root / '旧版题型示例').glob('*-题型示例*.typ'))
    return sorted(papers + samples)


def output_stem(source, root):
    """Use year[-answers|-sample][-print] names for this single subject."""
    relative = source.relative_to(root)
    if relative.parts[0] != '旧版题型示例' and re.fullmatch(r'20\d{2}', source.parent.name):
        suffix = '-answers' if source.stem.endswith('-答案') else ''
        return f'{source.parent.name}{suffix}'
    if relative.parts[0] == '旧版题型示例':
        suffix = '-answers' if source.stem.endswith('-答案') else ''
        return f'{source.stem.split("-", 1)[0]}-sample{suffix}'
    raise ValueError(f'Unsupported source: {relative}')


def print_cover_blanks(source):
    """Answer documents have no cover; only pad them to a multiple of four."""
    has_cover = not source.stem.endswith('-答案')
    return {'cover_back_blank': has_cover, 'back_cover_blank': has_cover}


def validate_question_syntax(source):
    """Question bodies must use ezexam directly; native subquestion lists remain valid."""
    legacy = re.compile(r'^\s*#(?:enum\s*\(|questions\s*\(|let\s+questions\b)', re.MULTILINE)
    match = legacy.search(source.read_text())
    if match:
        raise ValueError(f'{source}: legacy question container {match.group().strip()}')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', type=Path, default=Path.cwd())
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--jobs', type=int, default=4)
    parser.add_argument('--only', help='Preview one reading/print pair')
    args = parser.parse_args()
    root, output = args.root.resolve(), args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    selected = sources(root)
    if args.only:
        selected = [p for p in selected if p.relative_to(root).as_posix() == args.only]
        if len(selected) != 1:
            parser.error('--only must identify one supported source')
    if not selected:
        parser.error('No sources found')
    for source in selected:
        validate_question_syntax(source)

    def build(source):
        relative = source.relative_to(root)
        stem = output_stem(source, root)
        target = output / (stem + '.pdf')
        result = subprocess.run(['typst', 'compile', '--ignore-system-fonts', '--root', str(root), str(source), str(target)], capture_output=True, text=True)
        if result.returncode:
            raise RuntimeError(f'{relative}\n{result.stderr}')
        if result.stderr:
            print(f'{relative}\n{result.stderr}', file=sys.stderr, flush=True)
        print_target = output / (stem + '-print.pdf')
        build_booklet(target, print_target, **print_cover_blanks(source))
        return target.name, print_target.name

    records, failed = [], False
    with ThreadPoolExecutor(max_workers=max(1, args.jobs)) as executor:
        futures = {executor.submit(build, source): source for source in selected}
        for future in as_completed(futures):
            try:
                records.append(future.result())
                print(f'Compiled reading/print pair {len(records)}/{len(selected)}', flush=True)
            except Exception as error:
                print(error, file=sys.stderr, flush=True)
                failed = True
    if failed:
        raise SystemExit('Build failed.')
    if args.only:
        print(f'Preview built in {output}.', flush=True)
        return
    print(f'Built {len(records)} reading PDFs and {len(records)} print PDFs in {output}', flush=True)


if __name__ == '__main__':
    main()
