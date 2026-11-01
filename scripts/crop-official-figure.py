"""Crop a verified official PDF figure using fractions of the rendered page."""
import argparse
from pathlib import Path
import subprocess
import tempfile
from pypdf import PdfReader, PdfWriter
from pypdf.generic import RectangleObject

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('pdf', type=Path)
p.add_argument('page', type=int)
p.add_argument('output', type=Path)
p.add_argument('--bounds', type=float, nargs=4, required=True, metavar=('LEFT','TOP','RIGHT','BOTTOM'))
a = p.parse_args()
left, top, right, bottom = a.bounds
assert 0 <= left < right <= 1 and 0 <= top < bottom <= 1
reader = PdfReader(a.pdf)
page = reader.pages[a.page-1]
x, y, width, height = float(page.mediabox.left), float(page.mediabox.bottom), float(page.mediabox.width), float(page.mediabox.height)
page.mediabox = RectangleObject((x+left*width,y+(1-bottom)*height,x+right*width,y+(1-top)*height))
page.cropbox = page.mediabox
writer = PdfWriter()
writer.add_page(page)
a.output.parent.mkdir(parents=True, exist_ok=True)
with tempfile.TemporaryDirectory() as tmp:
    pdf = Path(tmp)/'figure.pdf'
    writer.write(pdf)
    subprocess.run(['pdftoppm','-r','300','-png','-singlefile',str(pdf),str(a.output.with_suffix(''))],check=True)
print(a.output)
