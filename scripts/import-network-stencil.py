"""Extract the original vector appearance of the two 2025 Q47 stencil icons.

Usage: python3 scripts/import-network-stencil.py Detailed_Network_Diagram.zip
Requires pypdf and pdftocairo. OmniGraffle embeds a vector QuickLook PDF, so no
raster tracing or reinterpretation of its proprietary gradient styles is needed.
"""
import argparse
import hashlib
import io
from pathlib import Path
import plistlib
import re
import runpy
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile

from pypdf import PdfReader, PdfWriter
from pypdf.generic import RectangleObject


def numbers(value):
    return [float(v) for v in re.findall(r"[-+]?(?:\d*\.\d+|\d+)(?:[eE][-+]?\d+)?", value)]


def export(document, group, archive_hash, output):
    boxes = [numbers(g['Bounds']) for g in group['Graphics'] if 'Bounds' in g]
    # Bounds are in top-down page points; include half of the 1.5pt outline.
    x0 = min(b[0] for b in boxes) - .8
    y0 = min(b[1] for b in boxes) - .8
    x1 = max(b[0] + b[2] for b in boxes) + .8
    y1 = max(b[1] + b[3] for b in boxes) + .8
    reader = PdfReader(io.BytesIO(document['QuickLookPreview']))
    assert len(reader.pages) == 1
    page = reader.pages[0]
    # Fail rather than silently export an embedded bitmap as an alleged vector.
    assert not list(page.images), 'The embedded preview is not vector-only'
    height = float(page.mediabox.height)
    page.mediabox = RectangleObject((x0, height-y1, x1, height-y0))
    page.cropbox = page.mediabox
    writer = PdfWriter()
    writer.add_page(page)
    with tempfile.TemporaryDirectory(prefix='408-stencil-') as temporary:
        pdf = Path(temporary)/'icon.pdf'
        svg = Path(temporary)/'icon.svg'
        writer.write(pdf)
        subprocess.run(['pdftocairo','-svg',str(pdf),str(svg)],check=True)
        text = svg.read_text()
    root = ET.fromstring(text)
    assert not root.findall('.//{http://www.w3.org/2000/svg}image')
    # Quartz paints a white page behind the icons. Remove only that rectangle,
    # so the SVG does not erase CeTZ link segments outside the device contour.
    backgrounds = root.findall('.//{http://www.w3.org/2000/svg}rect')
    assert len(backgrounds) == 1
    background = backgrounds[0].attrib
    assert background['fill'] == 'rgb(100%, 100%, 100%)'
    assert float(background['x']) < 0 and float(background['y']) < 0
    assert float(background['width']) > x1-x0 and float(background['height']) > y1-y0
    text, removed = re.subn(r'^<rect[^\n]+/>\n', '', text, flags=re.MULTILINE)
    assert removed == 1
    comment = (
        '\n<!--\n Original Visio 2007 artwork, converted by kcjones76 to OmniGraffle.\n'
        ' Source: https://www.graffletopia.com/stencils/528\n'
        f' User-supplied Detailed_Network_Diagram.zip SHA256: {archive_hash}\n'
        f' Original group ID: {group["ID"]}. SVG extracted from the embedded vector PDF.\n'
        ' Reproduce with scripts/import-network-stencil.py; outlines and shading are preserved.\n'
        ' PDF page background removed; paint converted to grayscale for printing.\n-->\n')
    text = text.replace('?>','?>'+comment,1)
    output.parent.mkdir(parents=True,exist_ok=True)
    grayscale = runpy.run_path(str(Path(__file__).with_name('grayscale-svg.py')))['grayscale']
    output.write_text(grayscale(text))
    print(output)


if __name__ == '__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('archive',type=Path)
    parser.add_argument('--output',type=Path,default=Path('2025/assets'))
    args=parser.parse_args()
    with zipfile.ZipFile(args.archive) as z:
        document=plistlib.loads(z.read('Detailed Network Diagram.gstencil'))
    digest=hashlib.sha256(args.archive.read_bytes()).hexdigest()
    for name,ident in (('satellite',281),('satellite-dish',295)):
        group=next(g for g in document['GraphicsList'] if g['ID']==ident)
        export(document,group,digest,args.output/f'visio-{name}.svg')
