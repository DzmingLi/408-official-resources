"""Extract companion answers using the same selected classification as the questions."""
import os
from pathlib import Path
import re
import runpy

ROOT = Path(__file__).resolve().parent.parent
EXTRACT = runpy.run_path(str(ROOT / 'scripts/extract-collections.py'))
PLANS = EXTRACT['PLANS']
questions = EXTRACT['questions']
rebase_images = EXTRACT['rebase_images']


def answers(root, year):
    source = root / f'历年真题+参考解答/{year}/{year}-答案.typ'
    if not source.exists() and year in (2023, 2026):
        # Retain one explicit answer slot for every question; never invent a
        # reference answer or silently omit an otherwise classified paper.
        return source, {n: '本仓库尚未收录本题参考答案。' for n in range(1, 48)}
    text = source.read_text()
    result = {}
    if year <= 2014:
        pattern = r'^(?:=+\s*)?(\d{1,2})[.．、]\s*(?=[ABCD](?:\s|$)|【答案要点】)'
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
    else:
        result.update({int(n): letter for n, letter in re.findall(r'\[(\d+)[．.]\s*([ABCD])\]', text)})
        if set(range(1, 41)) - result.keys():
            raise ValueError(f'{source}: incomplete official answer key')
        numbers = range(41, 48)
        command = 'question' if year == 2022 else 'answer-question'
        blocks = questions(source, expected=7, command=command)
        result.update(zip(numbers, (body.strip() for body in blocks)))
    for n, letter in re.findall(r'\[(\d+)[．.]\s*([ABCD])\]', text):
        result.setdefault(int(n), letter)
    # Official paper MCQs publish only letters.
    for number in range(1, 41):
        if number in result:
            match = re.match(r'^([ABCD])(?:\s|$)', result[number])
            if not match:
                raise ValueError(f'{source}: missing MCQ answer letter {number}')
            result[number] = match[1]
    return source, result


def clean_answer(body, year, number):
    if year >= 2023:
        body = '\n'.join(line.rstrip() for line in body.splitlines())
    # These old OCR artefacts were checked in the rendered answer pages.
    body = body.replace('【答案要点】', '').strip()
    for n, glyph in enumerate('①②③④⑤⑥⑦⑧⑨⑩', 1):
        body = body.replace('\\$\\\\textcircled{' + str(n) + '}\\$', glyph)
    if (year, number) == (2012, 6):
        # This is the tree for question 4, accidentally included by old OCR.
        body = re.sub(r'#image\("[^"]+"\)\s*第4题图\s*', '', body)
    # Old bare images otherwise expand to the full A4 width. Match each
    # inspected diagram's size to its content, without changing source assets.
    widths = {
        (2009, 41): '15em', (2010, 34): '29em', (2010, 40): '24em',
        (2011, 41): '28em', (2013, 40): '32em', (2014, 42): '27em',
    }
    if (year, number) in widths:
        width = widths[year, number]
        body = re.sub(r'#image\("([^"\n]+)"\)',
                      lambda m: '#align(center, image("' + m[1] + '", width: ' + width + '))', body)
    return body


def outputs(root, plans=None, output_root=None):
    cache = {}
    for title, plan in (PLANS if plans is None else plans).items():
        target = (output_root or root) / '真题分类汇编' / plan['directory'] / f'{title}-answers.typ'
        template = os.path.relpath(root / 'template.typ', target.parent)
        lines = [
            '// 与题目版共用分类清单；由 scripts/extract-collection-answers.py 生成。',
            f'#import "{template}": subquestions, statements, inline-node',
            '#import "@preview/cetz:0.5.2" as cetz',
            '#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge',
            f'= 真题分类汇编：{title.replace("／", "/")}', '',
        ]
        for section, entries in plan['sections'].items():
            if not entries:
                continue
            if plan.get('section_headings', True):
                lines += [f'== {section}', '']
            for entry in entries:
                year, number = entry
                if year not in cache:
                    cache[year] = answers(root, year)
                source, items = cache[year]
                if number not in items or not items[number].strip():
                    raise ValueError(f'{source}: missing answer {number}')
                body = clean_answer(items[number], year, number)
                body = rebase_images(body, source, target)
                label = f'{year} {number}'
                lines += [f'=== {label}', '']
                if (year, number) in ((2009, 41), (2011, 41), (2015, 42), (2016, 41), (2017, 47)):
                    lines += ['#block(breakable: false)[', body, ']', '']
                elif number <= 40 and body in 'ABCD':
                    # Keep a one-letter key with its source label.
                    lines[-2:] = [f'=== {label}：{body}', '']
                elif number <= 40:
                    lines += ['#block(breakable: false)[', body, ']', '']
                else:
                    lines += [body, '']
        yield target, '\n'.join(lines).rstrip() + '\n'
