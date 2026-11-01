"""Regression tests for page order, vector fidelity and release integration."""

from pathlib import Path
import runpy
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from pypdf import PdfReader, PdfWriter
from pypdf.generic import ArrayObject, DecodedStreamObject, DictionaryObject, NameObject, NumberObject, RectangleObject

from booklet import PAGE_HEIGHT, PAGE_WIDTH, SHEET_HEIGHT, SHEET_WIDTH, build_booklet, page_order


def reading_pdf(path, count, *, width=PAGE_WIDTH, height=PAGE_HEIGHT, crop=False, rotate=False):
    writer = PdfWriter()
    font = DictionaryObject({
        NameObject('/Type'): NameObject('/Font'),
        NameObject('/Subtype'): NameObject('/Type1'),
        NameObject('/BaseFont'): NameObject('/Helvetica'),
    })
    for number in range(1, count + 1):
        page = writer.add_blank_page(width=width, height=height)
        page[NameObject('/Resources')] = DictionaryObject({
            NameObject('/Font'): DictionaryObject({NameObject('/F1'): font}),
        })
        content = DecodedStreamObject()
        content.set_data(f'BT /F1 10 Tf 20 30 Td (P{number:03d}) Tj ET\n'.encode('ascii'))
        page[NameObject('/Contents')] = content
        if crop:
            page.cropbox = RectangleObject((10, 10, width - 10, height - 10))
        if rotate:
            page.rotate(90)
    writer.write(path)


class PageOrderTests(unittest.TestCase):
    def test_eight_page_booklet(self):
        self.assertEqual(page_order(8), [(7, 0), (1, 6), (5, 2), (3, 4)])

    def test_cover_blank_belongs_behind_cover(self):
        self.assertEqual(page_order(7, cover_back_blank=True),
                         [(6, 0), (None, 5), (4, 1), (2, 3)])

    def test_padding_and_exactly_one_copy_of_each_reading_page(self):
        for count in range(1, 41):
            for cover_blank in (False, True):
                with self.subTest(count=count, cover_blank=cover_blank):
                    order = page_order(count, cover_back_blank=cover_blank)
                    pages = [page for pair in order for page in pair]
                    self.assertEqual(len(pages) % 4, 0)
                    self.assertEqual(sorted(p for p in pages if p is not None), list(range(count)))
                    self.assertEqual(len(pages), ((count + int(cover_blank) + 3) // 4) * 4)

    def test_no_empty_booklet(self):
        for count in (0, -1):
            with self.assertRaises(ValueError):
                page_order(count)

    def test_math_repository_cover_blanks_and_padding(self):
        for count in range(1, 41):
            pages = list(range(count))
            pages.insert(1, None)
            pages.append(None)
            pages.extend([None] * (-len(pages) % 4))
            expected = []
            for i in range(len(pages) // 4):
                expected += [(pages[-1 - 2*i], pages[2*i]),
                             (pages[2*i + 1], pages[-2 - 2*i])]
            self.assertEqual(page_order(count, cover_back_blank=True,
                                        back_cover_blank=True), expected)
            # 即使正文刚好填满一张纸，也必须为封底保留空页。
            self.assertIsNone(expected[0][0])
            self.assertIsNone(expected[1][0])


class BookletPDFTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        self.source = self.root / 'reading.pdf'
        self.target = self.root / 'booklet.pdf'

    def tearDown(self):
        self.tmp.cleanup()

    def test_vector_pages_and_print_preferences(self):
        reading_pdf(self.source, 4)
        original = self.source.read_bytes()
        layout = build_booklet(self.source, self.target)
        self.assertEqual(self.source.read_bytes(), original)
        self.assertEqual(layout['page_order'], [[4, 1], [2, 3]])
        self.assertEqual(layout['sheets'], 1)
        self.assertEqual(layout['padding_blank_pages'], 0)
        reader = PdfReader(self.target)
        self.assertEqual(len(reader.pages), 2)
        for page, expected in zip(reader.pages, [('P004', 'P001'), ('P002', 'P003')]):
            self.assertAlmostEqual(float(page.mediabox.width), SHEET_WIDTH, places=4)
            self.assertAlmostEqual(float(page.mediabox.height), SHEET_HEIGHT, places=4)
            text = page.extract_text()
            self.assertTrue(text.index(expected[0]) < text.index(expected[1]))
            resources = page['/Resources']
            self.assertEqual(len(resources['/XObject']), 2)
            for reference in resources['/XObject'].values():
                form = reference.get_object()
                self.assertEqual(form['/Subtype'], '/Form')
                self.assertTrue(form['/Resources']['/Font'])
                for actual, value in zip(form['/BBox'], [0, 0, PAGE_WIDTH, PAGE_HEIGHT]):
                    self.assertAlmostEqual(float(actual), value, places=4)
            transforms = [operands for operands, op in page.get_contents().operations if op == b'cm']
            self.assertEqual(len(transforms), 2)
            for transform in transforms:
                self.assertEqual(list(transform[:4]), [1, 0, 0, 1])
        prefs = reader.trailer['/Root']['/ViewerPreferences']
        self.assertEqual(prefs['/Duplex'], '/DuplexFlipShortEdge')
        self.assertEqual(prefs['/PrintScaling'], '/None')

    def test_gradient_patterns_keep_page_local_coordinates(self):
        reading_pdf(self.source, 2)
        writer = PdfWriter(clone_from=self.source)
        def array(*values):
            return ArrayObject([NumberObject(n) for n in values])
        for index, page in enumerate(writer.pages):
            pattern = DictionaryObject({
                NameObject('/Type'): NameObject('/Pattern'),
                NameObject('/PatternType'): NumberObject(2),
                NameObject('/Matrix'): array(1, 0, 0, 1, index * 10, 20),
                NameObject('/Shading'): DictionaryObject({
                    NameObject('/ShadingType'): NumberObject(2),
                    NameObject('/ColorSpace'): NameObject('/DeviceGray'),
                    NameObject('/Coords'): array(0, 0, 100, 0),
                    NameObject('/Function'): DictionaryObject({
                        NameObject('/FunctionType'): NumberObject(2),
                        NameObject('/Domain'): array(0, 1),
                        NameObject('/C0'): array(0), NameObject('/C1'): array(1),
                        NameObject('/N'): NumberObject(1),
                    }),
                }),
            })
            page['/Resources'][NameObject('/Pattern')] = DictionaryObject({
                NameObject('/p0'): writer._add_object(pattern),
            })
            contents = DecodedStreamObject()
            contents.set_data(page.get_contents().get_data() + b'\n/Pattern cs /p0 scn 0 0 100 100 re f\n')
            page[NameObject('/Contents')] = writer._add_object(contents)
        patterned = self.root / 'patterned.pdf'
        writer.write(patterned)
        build_booklet(patterned, self.target)
        forms = [ref.get_object() for page in PdfReader(self.target).pages
                 for ref in page['/Resources']['/XObject'].values()]
        self.assertEqual(len(forms), 2)
        self.assertEqual(sorted(list(form['/Resources']['/Pattern']['/p0']['/Matrix']) for form in forms),
                         [[1, 0, 0, 1, 0, 20], [1, 0, 0, 1, 10, 20]])

    def test_cover_and_end_blanks_are_print_only(self):
        reading_pdf(self.source, 4)
        layout = build_booklet(self.source, self.target, cover_back_blank=True)
        self.assertEqual(layout['page_order'], [[None, 1], [None, None], [None, 2], [3, 4]])
        self.assertEqual(layout['reading_pages'], 4)
        self.assertEqual(layout['padding_blank_pages'], 3)
        self.assertEqual(layout['printed_sides'], 4)
        self.assertEqual(len(PdfReader(self.source).pages), 4)
        self.assertFalse(PdfReader(self.target).pages[1].extract_text().strip())

    def test_reproducible_output(self):
        reading_pdf(self.source, 7)
        build_booklet(self.source, self.target, cover_back_blank=True)
        other = self.root / 'again.pdf'
        build_booklet(self.source, other, cover_back_blank=True)
        self.assertEqual(self.target.read_bytes(), other.read_bytes())

    def test_fixed_back_cover_requires_extra_sheet(self):
        reading_pdf(self.source, 7)
        layout = build_booklet(self.source, self.target, cover_back_blank=True,
                               back_cover_blank=True)
        self.assertEqual(layout['sheets'], 3)
        self.assertTrue(layout['back_cover_blank'])
        self.assertEqual(layout['padding_blank_pages'], 3)
        self.assertEqual(layout['page_order'][0], [None, 1])

    def test_refuse_overwriting_reading_pdf(self):
        reading_pdf(self.source, 4)
        original = self.source.read_bytes()
        with self.assertRaises(ValueError):
            build_booklet(self.source, self.source)
        self.assertEqual(self.source.read_bytes(), original)

    def test_refuse_mismatched_pages_without_changing_source(self):
        for kwargs in ({'width': 200}, {'crop': True}, {'rotate': True}):
            with self.subTest(kwargs=kwargs):
                reading_pdf(self.source, 1, **kwargs)
                original = self.source.read_bytes()
                with self.assertRaises(ValueError):
                    build_booklet(self.source, self.target)
                self.assertEqual(self.source.read_bytes(), original)


class ReleaseTests(unittest.TestCase):
    def test_reject_legacy_question_containers(self):
        validate = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))['validate_question_syntax']
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp) / 'paper.typ'
            for legacy in ('#enum([题目])', '#questions([题目])', '#let questions(..args) = {}'):
                source.write_text(legacy)
                with self.assertRaisesRegex(ValueError, 'legacy question container'):
                    validate(source)

    def test_allow_question_and_native_subquestion_lists(self):
        validate = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))['validate_question_syntax']
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp) / 'paper.typ'
            source.write_text('#question[题干\n#subquestions[\n+ 小问\n]]')
            validate(source)

    def test_restored_2022_papers_are_selected(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for year in ('2021', '2022', '2023', '2024'):
                folder = root / year
                folder.mkdir()
                (folder / f'{year}.typ').touch()
                (folder / f'{year}-答案.typ').touch()
            selected = module['sources'](root)
            self.assertEqual(len(selected), 8)
            self.assertEqual({source.parent.name for source in selected}, {'2021', '2022', '2023', '2024'})
            self.assertTrue((root / '2022' / '2022.typ').exists())
            self.assertTrue((root / '2023' / '2023.typ').exists())

    def test_answer_printing_has_no_cover_blanks(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        self.assertEqual(module['print_cover_blanks'](Path('2024/2024-答案.typ')),
                         {'cover_back_blank': False, 'back_cover_blank': False})
        self.assertEqual(module['print_cover_blanks'](Path('题型示例/旧版/2013-题型示例-答案.typ')),
                         {'cover_back_blank': False, 'back_cover_blank': False})
        for source in ('2024/2024.typ', '题型示例/旧版/2013-题型示例.typ'):
            self.assertEqual(module['print_cover_blanks'](Path(source)),
                             {'cover_back_blank': True, 'back_cover_blank': True})

    def test_math_style_output_names(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        root = Path('/sources')
        expected = {
            '2024/2024.typ': '2024',
            '2024/2024-答案.typ': '2024-answers',
            '题型示例/旧版/2013-题型示例.typ': '2013-sample',
            '题型示例/旧版/2013-题型示例-答案.typ': '2013-sample-answers',
        }
        for source, stem in expected.items():
            with self.subTest(source=source):
                actual = module['output_stem'](root / source, root)
                self.assertEqual(actual, stem)
                self.assertEqual(actual + '-print.pdf', stem + '-print.pdf')

    def test_output_names_are_unique_for_all_sources(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        root = Path(__file__).resolve().parent.parent
        names = [module['output_stem'](source, root) for source in module['sources'](root)]
        self.assertTrue(names)
        self.assertEqual(len(names), len(set(names)))
        self.assertFalse(any('答案' in name or '--' in name for name in names))

    def test_only_old_samples_and_their_answers_are_selected(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for name in ('旧版/2013-题型示例.typ', '旧版/2013-题型示例-答案.typ',
                         '新版/2026-题型示例.typ'):
                source = root / '题型示例' / name
                source.parent.mkdir(parents=True, exist_ok=True)
                source.touch()
            selected = module['sources'](root)
            self.assertEqual({p.name for p in selected},
                             {'2013-题型示例.typ', '2013-题型示例-答案.typ'})

    def test_reading_and_print_assets_are_both_expected(self):
        module = runpy.run_path(str(Path(__file__).with_name('publish-release.py')))
        names = {'2024.pdf', '2024-print.pdf',
                 '2024-answers.pdf', '2024-answers-print.pdf',
                 '2013-sample.pdf', '2013-sample-print.pdf',
                 '2013-sample-answers.pdf', '2013-sample-answers-print.pdf'}
        with tempfile.TemporaryDirectory() as tmp:
            directory = Path(tmp)
            for name in names:
                (directory / name).touch()
            self.assertEqual(module['release_files'](directory), names)

    def test_reject_extra_release_files(self):
        module = runpy.run_path(str(Path(__file__).with_name('publish-release.py')))
        for extra in ('SHA256SUMS', 'PRINTING.txt', 'manifest.json', 'past-exams.zip'):
            with self.subTest(extra=extra), tempfile.TemporaryDirectory() as tmp:
                directory = Path(tmp)
                for name in ('2024.pdf', '2024-print.pdf', extra):
                    (directory / name).touch()
                with self.assertRaisesRegex(ValueError, 'Unexpected release files'):
                    module['release_files'](directory)

    def test_reject_incomplete_pdf_pairs(self):
        module = runpy.run_path(str(Path(__file__).with_name('publish-release.py')))
        for name in ('2024.pdf', '2024-print.pdf'):
            with self.subTest(name=name), tempfile.TemporaryDirectory() as tmp:
                directory = Path(tmp)
                (directory / name).touch()
                with self.assertRaisesRegex(ValueError, 'pair mismatch'):
                    module['release_files'](directory)

    def test_reject_empty_release(self):
        module = runpy.run_path(str(Path(__file__).with_name('publish-release.py')))
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaisesRegex(ValueError, 'No PDFs found'):
                module['release_files'](Path(tmp))

    def test_build_outputs_only_pdfs(self):
        module = runpy.run_path(str(Path(__file__).with_name('build-pdfs.py')))
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / '2024').mkdir()
            for name in ('2024.typ', '2024-答案.typ'):
                (root / '2024' / name).touch()
            output = root / 'pdfs'

            def fake_compile(command, **kwargs):
                reading_pdf(Path(command[-1]), 4)
                return SimpleNamespace(returncode=0, stderr='')

            with patch('sys.argv', ['build-pdfs.py', '--root', str(root), '--output', str(output)]), \
                    patch.object(module['subprocess'], 'run', side_effect=fake_compile):
                module['main']()
            self.assertEqual({p.name for p in output.iterdir()}, {
                '2024.pdf', '2024-print.pdf',
                '2024-answers.pdf', '2024-answers-print.pdf',
            })


if __name__ == '__main__':
    unittest.main(verbosity=2)
