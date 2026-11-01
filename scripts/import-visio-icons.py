"""Export native Visio 2003 masters; crop canvas padding, never trace/recolour.

Source: OFFICE11VIS.ISO, Visio Professional 2003 evaluation media,
https://archive.org/details/office-11-vis (N5614A01/N5614E01.CAB).
Requires libvisio vss2xhtml, librsvg rsvg-convert and Pillow.
"""
import argparse
import io
import runpy
import subprocess
import xml.etree.ElementTree as ET
from pathlib import Path
from PIL import Image

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--stencils", type=Path, required=True)
parser.add_argument("--output", type=Path, required=True)
parser.add_argument("--converter", default="vss2xhtml")
parser.add_argument("--renderer", default="rsvg-convert")
args = parser.parse_args()
grayscale = runpy.run_path(str(Path(__file__).with_name("grayscale-svg.py")))["grayscale"]
args.output.mkdir(parents=True, exist_ok=True)
ET.register_namespace("", "http://www.w3.org/2000/svg")
ET.register_namespace("xlink", "http://www.w3.org/1999/xlink")
for stencil, masters in (("COMPS_U", ((0, "pc"), (6, "laptop"))),
                         ("PERIPH_U", ((3, "server"),)),
                         ("NETSYM_U", ((0, "router"), (5, "switch"))),
                         ("NETLOC_U", ((0, "cloud"),))):
    doc = ET.fromstring(subprocess.check_output(
        [args.converter, str(args.stencils / (stencil + ".VSS"))]))
    shapes = doc.findall(".//{http://www.w3.org/2000/svg}svg")
    for index, name in masters:
        svg = shapes[index]
        assert not svg.findall(".//{http://www.w3.org/2000/svg}image")
        png = subprocess.check_output([args.renderer, "-w", "1440", "-h", "1440"],
                                      input=ET.tostring(svg), stderr=subprocess.DEVNULL)
        bounds = Image.open(io.BytesIO(png)).getchannel("A").getbbox()
        x, y, w, h = map(float, svg.attrib["viewBox"].split())
        left, top, right, bottom = bounds
        # One pixel guard retains antialiased path outlines; paths stay native.
        left, top = max(0, left - 1), max(0, top - 1)
        right, bottom = min(1440, right + 1), min(1440, bottom + 1)
        nw, nh = (right-left)*w/1440, (bottom-top)*h/1440
        svg.set("viewBox", f"{x+left*w/1440:g} {y+top*h/1440:g} {nw:g} {nh:g}")
        svg.set("width", f"{nw:g}pt")
        svg.set("height", f"{nh:g}pt")
        svg.insert(0, ET.Comment(f" Original Visio 2003 {stencil}.VSS master {index}; native vector paths, grayscale paint for printing. "))
        target = args.output / ("visio-2003-" + name + ".svg")
        target.write_text(grayscale(ET.tostring(svg, encoding="unicode")))
        print(target)
