"""Convert SVG paint colours to luminance without rasterising any geometry."""
import re
import sys
from pathlib import Path


def grayscale(text):
    def hex_colour(match):
        value = match[0][1:]
        if len(value) == 3:
            value = ''.join(c * 2 for c in value)
        rgb = [int(value[i:i+2], 16) for i in (0, 2, 4)]
        gray = round(sum(c * k for c, k in zip(rgb, (0.2126, 0.7152, 0.0722))))
        return '#' + f'{gray:02x}' * 3

    def rgb_colour(match):
        values = match[1].split(',')
        percentage = '%' in values[0]
        rgb = [float(v.strip().rstrip('%')) for v in values]
        gray = sum(c * k for c, k in zip(rgb, (0.2126, 0.7152, 0.0722)))
        channel = f'{gray:.6f}%' if percentage else str(round(gray))
        return 'rgb(' + ', '.join([channel] * 3) + ')'

    text = re.sub(r'#[0-9a-fA-F]{6}\b|#[0-9a-fA-F]{3}\b', hex_colour, text)
    return re.sub(r'rgb\(([^)]+)\)', rgb_colour, text)


if __name__ == '__main__':
    for arg in sys.argv[1:]:
        path = Path(arg)
        path.write_text(grayscale(path.read_text()))
