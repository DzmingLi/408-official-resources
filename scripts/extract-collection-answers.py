"""Generate companion answers from the same classification plan as the questions.

Only emits an apply_patch; --check checks reproducibility without writing files.
"""
import argparse
import difflib
import os
from pathlib import Path
import re
import runpy

ROOT = Path(__file__).resolve().parent.parent
EXTRACT = runpy.run_path(str(ROOT / 'scripts/extract-collections.py'))
PLANS = EXTRACT['PLANS']
questions = EXTRACT['questions']
rebase_images = EXTRACT['rebase_images']


def answers(root, year, sample=False):
    if sample:
        source = root / '题型示例/旧版/2013-题型示例-答案.typ'
    elif year in (2016, 2017):
        source = root / f'分类汇编/答案来源补录/{year}.typ'
    else:
        source = root / f'历年真题+参考解答/{year}/{year}-答案.typ'
    text = source.read_text()
    result = {}
    if sample or year <= 2014:
        pattern = (r'^(?:=+\s*)?(\d{1,2})[.．、]\s*'
                   + (r'(?=\S)' if sample else r'(?=[ABCD](?:\s|$)|【答案要点】)'))
        matches = list(re.finditer(pattern, text, re.MULTILINE))
        for i, match in enumerate(matches):
            number = int(match[1])
            body = text[match.end():matches[i + 1].start() if i + 1 < len(matches) else len(text)]
            # A source chapter header is not part of the preceding answer.
            body = re.sub(r'^=+\s*[一二]、[^\n]*\n?', '', body, flags=re.MULTILINE)
            body = re.sub(r'^=+\s*(.*)$', r'*\1*', body, flags=re.MULTILINE).strip()
            if number in result:
                # 2014's OCR repeats the answer letters for 38 and 40.
                previous = result[number]
                if body == previous or body in 'ABCD':
                    continue
                if previous in 'ABCD':
                    result[number] = body
                else:
                    raise ValueError(f'{source}: conflicting repeated answer {number}')
            else:
                result[number] = body
        if sample:
            result.update({n: result[n + 32] for n in range(9, 16)})
    else:
        result.update({int(n): letter for n, letter in re.findall(r'\[(\d+)[．.]\s*([ABCD])\]', text)})
        if set(range(1, 41)) - result.keys():
            raise ValueError(f'{source}: incomplete official answer key')
        if year in (2016, 2017):
            numbers = (41, 45, 46, 44, 42, 43, 47) if year == 2016 else (42, 47, 45, 46, 43, 44, 41)
            blocks = questions(source, expected=len(numbers), command='answer-question')
        else:
            numbers = range(41, 48)
            command = 'question' if year == 2022 else 'answer-question'
            blocks = questions(source, expected=7, command=command)
        result.update(zip(numbers, (body.strip() for body in blocks)))
    result.update({int(n): letter for n, letter in re.findall(r'\[(\d+)[．.]\s*([ABCD])\]', text)})
    # Like the syllabus answer appendix, MCQs publish only their answer letter.
    # Old sample composite numbers 9–15 are aliases for source numbers 41–47.
    limit = 8 if sample else 40
    for number in range(1, limit + 1):
        if number in result:
            match = re.match(r'^([ABCD])(?:\s|$)', result[number])
            if not match:
                raise ValueError(f'{source}: missing MCQ answer letter {number}')
            result[number] = match[1]
    return source, result


def clean_answer(body, year, number, sample):
    # These old OCR artefacts were checked in the rendered answer pages.
    body = body.replace('【答案要点】', '').strip()
    for n, glyph in enumerate('①②③④⑤⑥⑦⑧⑨⑩', 1):
        body = body.replace('\\$\\\\textcircled{' + str(n) + '}\\$', glyph)
    if not sample and (year, number) == (2012, 6):
        # This is the tree for question 4, accidentally included by old OCR.
        body = re.sub(r'#image\("[^"]+"\)\s*第4题图\s*', '', body)
    # Old bare images otherwise expand to the full A4 width. Match each
    # inspected diagram's size to its content, without changing source assets.
    widths = {
        (2009, 41): '15em', (2010, 34): '29em', (2010, 40): '24em',
        (2011, 41): '28em', (2013, 40): '32em', (2014, 42): '27em',
    }
    if not sample and (year, number) in widths:
        width = widths[year, number]
        body = re.sub(r'#image\("([^"\n]+)"\)',
                      lambda m: '#align(center, image("' + m[1] + '", width: ' + width + '))', body)
    return body


def outputs(root):
    cache = {}
    for title, plan in PLANS.items():
        target = root / '分类汇编' / plan['directory'] / f'{title}-answers.typ'
        template = os.path.relpath(root / 'template.typ', target.parent)
        lines = [
            '// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。',
            f'#import "{template}": subquestions, statements, inline-node',
            '#import "@preview/cetz:0.5.2" as cetz',
            '#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge',
            f'= 分类汇编：{title.replace("／", "/")}', '',
        ]
        for section, entries in plan['sections'].items():
            if not entries:
                continue
            if plan.get('section_headings', True):
                lines += [f'== {section}', '']
            for entry in entries:
                year, number = entry[:2]
                sample = len(entry) == 3 and entry[2] == 'sample'
                key = (year, sample)
                if key not in cache:
                    cache[key] = answers(root, year, sample)
                source, items = cache[key]
                if number not in items or not items[number].strip():
                    raise ValueError(f'{source}: missing answer {number}')
                body = clean_answer(items[number], year, number, sample)
                body = rebase_images(body, source, target)
                label = '旧版题型示例' if sample else f'{year} {number}'
                lines += [f'=== {label}', '']
                if sample:
                    body = '编注：以下为本仓库整理解析，非官方参考答案。\n\n' + body
                if (sample and number not in (10, 14)) or (year, number) in ((2009, 41), (2011, 41), (2015, 42), (2016, 41), (2017, 47)):
                    lines += ['#block(breakable: false)[', body, ']', '']
                elif not sample and number <= 40 and body in 'ABCD':
                    # Keep a one-letter key with its source label.
                    lines[-2:] = [f'=== {label}：{body}', '']
                elif not sample and number <= 40:
                    lines += ['#block(breakable: false)[', body, ']', '']
                else:
                    lines += [body, '']
        yield target, '\n'.join(lines).rstrip() + '\n'
    # Preserve every formal merge and its order verbatim in the answer edition.
    for preview in sorted((root / '分类汇编/preview').glob('*-题目.typ')):
        text = preview.read_text().replace('"template.typ"', '"../preview/template.typ"')
        text = text.replace('collection.with(', 'collection.with(solutions: true, ')
        text = text.replace('-题目.typ"', '-answers.typ"')
        yield root / '分类汇编/answers-preview' / preview.name.replace('-题目', '-answers'), text


def main():
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--patch', action='store_true')
    mode.add_argument('--check', action='store_true')
    args = parser.parse_args()
    if args.patch:
        print('*** Begin Patch')
    for target, text in outputs(ROOT):
        previous = target.read_text() if target.exists() else None
        if args.check:
            if previous != text:
                raise SystemExit(f'{target}: answer collection needs regeneration')
        elif previous is None:
            print(f'*** Add File: {target}')
            print('\n'.join('+' + line for line in text.splitlines()))
        elif previous != text:
            print(f'*** Update File: {target}')
            for line in list(difflib.unified_diff(previous.splitlines(), text.splitlines(), n=3))[2:]:
                print('@@' if line.startswith('@@') else line)
    if args.patch:
        print('*** End Patch')


if __name__ == '__main__':
    main()
