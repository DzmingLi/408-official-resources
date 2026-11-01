"""Impose ISO B5 reading PDFs onto ISO B4 sheets without cropping or scaling."""

from pathlib import Path

from pypdf import PdfReader, PdfWriter
from pypdf.generic import DecodedStreamObject, DictionaryObject, NameObject, RectangleObject


MM = 72 / 25.4
PAGE_WIDTH = 176 * MM
PAGE_HEIGHT = 250 * MM
SHEET_WIDTH = 353 * MM
SHEET_HEIGHT = 250 * MM

def page_order(page_count, *, cover_back_blank=False, back_cover_blank=False):
    """Return zero-based source page pairs, in front/back order for each sheet."""
    if page_count < 1:
        raise ValueError('A booklet requires at least one source page')
    pages = list(range(page_count))
    if cover_back_blank:
        pages.insert(1, None)
    if back_cover_blank:
        pages.append(None)
    pages.extend([None] * (-len(pages) % 4))
    sides = []
    for sheet in range(len(pages) // 4):
        sides.append((pages[-1 - 2 * sheet], pages[2 * sheet]))
        sides.append((pages[2 * sheet + 1], pages[-2 - 2 * sheet]))
    return sides


def build_booklet(source, target, *, cover_back_blank=False, back_cover_blank=False):
    """Preserve PDF page contents at 1:1 size, translating them into two slots."""
    source, target = Path(source), Path(target)
    if source.resolve() == target.resolve():
        raise ValueError('The reading PDF must not be overwritten by its booklet')
    reader = PdfReader(source)
    if reader.is_encrypted:
        raise ValueError('Encrypted PDFs are not supported')
    sides = page_order(len(reader.pages), cover_back_blank=cover_back_blank,
                       back_cover_blank=back_cover_blank)
    for number, page in enumerate(reader.pages, 1):
        if page.rotation or page.user_unit != 1:
            raise ValueError(f'Page {number}: rotated or nonstandard PDF units')
        if (abs(float(page.mediabox.width) - PAGE_WIDTH) > 0.01 or
                abs(float(page.mediabox.height) - PAGE_HEIGHT) > 0.01):
            raise ValueError(f'Page {number}: expected ISO B5 (176 × 250 mm)')
        if any(abs(float(a) - float(b)) > 0.01
               for a, b in zip(page.cropbox, page.mediabox)):
            raise ValueError(f'Page {number}: a cropped reading PDF is not supported')

    writer = PdfWriter()
    for pair in sides:
        sheet = writer.add_blank_page(width=SHEET_WIDTH, height=SHEET_HEIGHT)
        xobjects = DictionaryObject()
        sheet[NameObject('/Resources')] = DictionaryObject({NameObject('/XObject'): xobjects})
        placements = []
        for slot, index in enumerate(pair):
            if index is None:
                continue
            page = reader.pages[index]
            tx = slot * SHEET_WIDTH / 2 + (SHEET_WIDTH / 2 - PAGE_WIDTH) / 2
            tx -= float(page.mediabox.left)
            ty = -float(page.mediabox.bottom)
            # A page-local Form preserves the default coordinate system of its
            # gradient patterns. Flattening page resources while adding a `cm`
            # moves paths but not pattern space, turning offset gradients black.
            form = DecodedStreamObject()
            contents = page.get_contents()
            form.set_data(contents.get_data() if contents is not None else b'')
            form.update({
                NameObject('/Type'): NameObject('/XObject'),
                NameObject('/Subtype'): NameObject('/Form'),
                NameObject('/BBox'): RectangleObject(page.mediabox),
                NameObject('/Resources'): page['/Resources'].clone(writer),
            })
            if '/Group' in page:
                form[NameObject('/Group')] = page['/Group'].clone(writer)
            name = f'/Page{index + 1}'
            xobjects[NameObject(name)] = writer._add_object(form.flate_encode())
            placements.append(f'q 1 0 0 1 {tx:.10f} {ty:.10f} cm {name} Do Q\n')
        contents = DecodedStreamObject()
        contents.set_data(''.join(placements).encode('ascii'))
        sheet[NameObject('/Contents')] = writer._add_object(contents)
        sheet.compress_content_streams()
    title = reader.metadata.title if reader.metadata else source.stem
    writer.add_metadata({
        '/Title': (title or source.stem) + ' - ISO B4 booklet',
        '/Creator': '408-zhenti vector booklet imposition',
        '/Subject': 'ISO B4 landscape; duplex short edge; actual size 100%; no crop',
    })
    writer.create_viewer_preferences()
    writer.viewer_preferences.duplex = '/DuplexFlipShortEdge'
    writer.viewer_preferences.print_scaling = '/None'
    writer.viewer_preferences.pick_tray_by_pdfsize = True
    writer.write(target)
    return {
        'paper': 'ISO B4',
        'width_mm': 353,
        'height_mm': 250,
        'orientation': 'landscape',
        'duplex': 'short-edge',
        'scale': 1,
        'crop': False,
        'reading_pages': len(reader.pages),
        'cover_back_blank': cover_back_blank,
        'back_cover_blank': back_cover_blank,
        'padding_blank_pages': (len(sides) * 2 - len(reader.pages)
                                - int(cover_back_blank) - int(back_cover_blank)),
        'printed_sides': len(sides),
        'sheets': len(sides) // 2,
        # One-based reading PDF page numbers; null means an inserted blank.
        'page_order': [[None if n is None else n + 1 for n in pair] for pair in sides],
    }
