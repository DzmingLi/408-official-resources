"""Reassemble the October 2026 mixed scans without altering source PDFs or pixels.

Printed page numbers were visually checked in full: 2018 pp. 1-76;
2024 pp. 1-87. The two 2018 body sequences match on all 76 pages.
All page indices below are one-based physical source PDF page numbers.
"""
import argparse
import hashlib
import json
from pathlib import Path
from pypdf import PdfReader, PdfWriter

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--source-dir', type=Path, default=Path('官方出版物'))
parser.add_argument('--output', type=Path, default=Path('内容来源/修复版'))
args = parser.parse_args()
files = {
    'named-2018': args.source_dir / '2018年全国硕士研究生招生考试计算机科学与技术学科联考计算机学科专业基础考试大纲 （94.pdf',
    'named-2024': args.source_dir / '2024年全国硕士研究生招生考试计算机学科专业基础考试大纲 （162.pdf',
}
digests = {key: hashlib.sha256(path.read_bytes()).hexdigest() for key, path in files.items()}
readers = {key: PdfReader(path) for key, path in files.items()}
assert len(readers['named-2018'].pages) == 94
assert len(readers['named-2024'].pages) == 162
plans = {
    '2018': [('named-2018', [1, 2]), ('named-2024', list(range(83, 163)))],
    '2024': [('named-2024', [1, 3]), ('named-2018', list(range(4, 95)))],
}
args.output.mkdir(parents=True, exist_ok=True)
manifest = {'sources': {key: {'path': str(path), 'sha256': digests[key]} for key, path in files.items()}, 'outputs': {}}
for edition, groups in plans.items():
    target = args.output / f'{edition}年计算机考试大纲.pdf'
    if target.exists():
        raise FileExistsError(f'Refusing to overwrite {target}')
    writer = PdfWriter()
    mapping = []
    for key, numbers in groups:
        for number in numbers:
            writer.add_page(readers[key].pages[number-1])
            mapping.append({'source': key, 'source_page': number})
    writer.add_metadata({'/Title': f'{edition}年计算机考试大纲（扫描修复版）',
                         '/Subject': '原始扫描页面无损重组；原文件未修改'})
    writer.write(target)
    repaired = PdfReader(target)
    assert len(repaired.pages) == len(mapping)
    for page, origin in zip(repaired.pages, mapping):
        original = readers[origin['source']].pages[origin['source_page']-1]
        assert list(page.mediabox) == list(original.mediabox)
        assert page.get_contents().get_data() == original.get_contents().get_data()
        old_images = original['/Resources']['/XObject']
        new_images = page['/Resources']['/XObject']
        for name, value in old_images.items():
            if value.get_object().get('/Subtype') == '/Image':
                assert value.get_object()._data == new_images[name].get_object()._data
    manifest['outputs'][edition] = {'path': str(target), 'page_count': len(mapping), 'pages': mapping}
    print(f'{target}: {len(mapping)} pages; content streams and compressed image data unchanged.')
for key, path in files.items():
    assert hashlib.sha256(path.read_bytes()).hexdigest() == digests[key]
# Audit data stays local; the official source directory contains only PDFs.
audit = Path('tmp/pdfs/new-syllabi/repair-manifest.json')
audit.parent.mkdir(parents=True, exist_ok=True)
audit.write_text(json.dumps(manifest, ensure_ascii=False, indent=2))
