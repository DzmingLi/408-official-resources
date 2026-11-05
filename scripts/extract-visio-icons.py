"""Export one native Visio stencil master to SVG; never trace a bitmap.

Requires libvisio (vss2xhtml), librsvg (rsvg-convert), and Pillow. The raster
render is used only to measure transparent canvas padding; output paths,
gradients, strokes, and grouping remain those exported from the VSS master.
"""
import argparse
import hashlib
import io
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET

from PIL import Image


def grayscale(text):
    def replace(match):
        value = match[0][1:]
        if len(value) == 3:
            value = ''.join(channel * 2 for channel in value)
        channels = [int(value[i:i + 2], 16) for i in (0, 2, 4)]
        gray = round(sum(c * weight for c, weight in zip(channels, (0.2126, 0.7152, 0.0722))))
        return '#' + f'{gray:02x}' * 3
    return re.sub(r'#[0-9a-fA-F]{6}\b|#[0-9a-fA-F]{3}\b', replace, text)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stencil', type=Path, required=True)
    parser.add_argument('--master', type=int, required=True, help='Zero-based libvisio master index')
    parser.add_argument('--cabinet', type=Path, required=True)
    parser.add_argument('--source', required=True, help='Original installation media URL')
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--grayscale', action='store_true')
    parser.add_argument('--converter', default='vss2xhtml')
    parser.add_argument('--renderer', default='rsvg-convert')
    args = parser.parse_args()
    exported = subprocess.check_output([args.converter, str(args.stencil)])
    document = ET.fromstring(exported)
    shapes = document.findall('.//{http://www.w3.org/2000/svg}svg')
    if not 0 <= args.master < len(shapes):
        parser.error(f'master index must be between 0 and {len(shapes) - 1}')
    svg = shapes[args.master]
    if svg.findall('.//{http://www.w3.org/2000/svg}image'):
        raise ValueError('Selected master embeds an image or metafile; WMF/EMF may contain vectors and must be inspected separately')
    png = subprocess.check_output([args.renderer, '-w', '1440', '-h', '1440'], input=ET.tostring(svg))
    bounds = Image.open(io.BytesIO(png)).getchannel('A').getbbox()
    if bounds is None:
        raise ValueError('Selected master is empty')
    x, y, width, height = map(float, svg.attrib['viewBox'].split())
    left, top, right, bottom = bounds
    left, top = max(0, left - 1), max(0, top - 1)
    right, bottom = min(1440, right + 1), min(1440, bottom + 1)
    cropped_width, cropped_height = (right - left) * width / 1440, (bottom - top) * height / 1440
    svg.set('viewBox', f'{x + left * width / 1440:g} {y + top * height / 1440:g} {cropped_width:g} {cropped_height:g}')
    svg.set('width', f'{cropped_width:g}pt')
    svg.set('height', f'{cropped_height:g}pt')
    stencil_hash = hashlib.sha256(args.stencil.read_bytes()).hexdigest()
    cabinet_hash = hashlib.sha256(args.cabinet.read_bytes()).hexdigest()
    svg.insert(0, ET.Comment(
        f' Native Visio master extracted directly from installation media.\n'
        f' Source: {args.source}\n'
        f' Cabinet: {args.cabinet.name}; SHA256: {cabinet_hash}\n'
        f' Stencil: {args.stencil.name}; SHA256: {stencil_hash}\n'
        f' Zero-based libvisio master index: {args.master}.\n'
        f' Native vector paths retained; transparent canvas padding cropped.'
        + (' Paint converted to grayscale for printing.' if args.grayscale else '') + ' '
    ))
    ET.register_namespace('', 'http://www.w3.org/2000/svg')
    ET.register_namespace('xlink', 'http://www.w3.org/1999/xlink')
    text = ET.tostring(svg, encoding='unicode')
    if args.grayscale:
        text = grayscale(text)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(text.rstrip() + '\n')


if __name__ == '__main__':
    main()
