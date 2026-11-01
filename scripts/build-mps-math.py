"""Use MPS's four faces in a local math font; retain Termes for stretch construction.

Requires fontTools. Original fonts are read only; the generated font is local cache.
"""
import argparse
import hashlib
import json
import unicodedata
from pathlib import Path
from fontTools.ttLib import TTFont
from fontTools.pens.boundsPen import BoundsPen
from fontTools.pens.transformPen import TransformPen
from fontTools.pens.qu2cuPen import Qu2CuPen
from fontTools.pens.t2CharStringPen import T2CharStringPen

parser = argparse.ArgumentParser()
parser.add_argument('--source-dir', type=Path, required=True)
parser.add_argument('--fallback', type=Path, required=True)
parser.add_argument('--output', type=Path, required=True)
args = parser.parse_args()
files = {
    'regular': '方正科技符号_MPS.ttf',
    'italic': '方正科技符号_MPS_Italic.ttf',
    'bold': '方正科技符号_MPS_Bold.ttf',
    'bolditalic': '方正科技符号_MPS_Bold_Italic.ttf',
    'extra': '方正科技符号_Extra_MPS.ttf',
}
faces = {key: TTFont(args.source_dir / name) for key, name in files.items()}
cmaps = {key: font.getBestCmap() for key, font in faces.items()}
sets = {key: font.getGlyphSet() for key, font in faces.items()}
font = TTFont(args.fallback, recalcTimestamp=False)
cmap = font.getBestCmap()
charstrings = font['CFF '].cff.topDictIndex[0].CharStrings
upem = font['head'].unitsPerEm
axis = font['MATH'].table.MathConstants.AxisHeight.Value
# Font encodings contain legacy and private-use slots: use only explicit Unicode.
plain = set(map(ord, 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'))
plain.update(range(0x391, 0x3aa))
plain.update(range(0x3b1, 0x3ca))
plain.update(map(ord, 'ϑϕϖϱϵϰ∂∇'))
symbols = set(map(ord, '+−=<>±×÷!,:;.()[]|∀∃∅∈∉∋∏∑∓∗∘∙∝∞∠∣∥∧∨∩∪∫∬∭∮∴∵∼≃≅≈≠≡≤≥≪≫⊂⊃⊆⊇⊕⊗⊙⊥⋅⋯⋮⋱'))
symbols.update(cp for face in ('regular', 'extra') for cp in cmaps[face]
               if 0x2000 <= cp <= 0x2bff and unicodedata.category(chr(cp)) == 'Sm')
# Keep the original Termes absolute-value delimiters, including their bearings
# and MATH stretch constructions. Replacing only their outlines with MPS made
# abs() use a mixture of unrelated base, variant, and assembly-part glyphs.
absolute_value_bars = set(map(ord, '|∣'))
symbols.difference_update(absolute_value_bars)
axis_symbols = symbols - set(map(ord, '!,:;.'))
operators = set(map(ord, '∫∬∭∮∑∏'))
integrals = set(map(ord, '∫∬∭∮'))
compact_symbols = set(map(ord, '+−=<>±×÷∓≠≡≤≥≈'))
integral_display_height = round(1.9 * upem)
replaced = {}
metrics = {}

def bounds(glyphset, name):
    pen = BoundsPen(glyphset)
    glyphset[name].draw(pen)
    return pen.bounds

fallback_set = font.getGlyphSet()
original_bounds = {name: bounds(fallback_set, name) for name in font.getGlyphOrder()}

def replace(name, face, codepoint, target_height=None, vertical_stretch=1):
    source = cmaps[face].get(codepoint)
    if source is None and face == 'regular':
        face = 'extra'
        source = cmaps[face].get(codepoint)
    if source is None:
        return
    gs = sets[face]
    box = bounds(gs, source)
    if box is None:
        return
    x0, y0, x1, y1 = box
    scale = upem / faces[face]['head'].unitsPerEm
    if target_height is not None:
        scale = target_height / (y1 - y0)
    elif codepoint in compact_symbols:
        # The legacy operator slots use nearly full-em ink widths. Match the
        # source syllabus' proportions without changing the italic letters.
        scale = 0.62 * upem / (x1 - x0)
    advance = faces[face]['hmtx'][source][0] * scale
    dx = 0
    dy = 0
    if codepoint in axis_symbols:
        # Discard legacy full-width padding and align signs to the math axis.
        bearing = 35
        dx = bearing - x0 * scale
        advance = (x1 - x0) * scale + 2 * bearing
        dy = axis - (y0 + y1) / 2 * scale * vertical_stretch
    width = round(advance)
    pen = T2CharStringPen(width, gs)
    convert = Qu2CuPen(pen, max_err=0.5, all_cubic=True)
    gs[source].draw(TransformPen(convert, (scale, 0, 0, scale * vertical_stretch, dx, dy)))
    result = pen.getCharString(private=charstrings[name].private, globalSubrs=charstrings.globalSubrs)
    charstrings[name] = result
    font['hmtx'][name] = (width, round(x0 * scale + dx))
    metrics[name] = (round(x1 * scale + dx), width, round((x0 + x1) / 2 * scale + dx))
    replaced[name] = {'face': face, 'unicode': f'U+{codepoint:04X}', 'source_glyph': source}

for cp, name in cmap.items():
    face = 'regular'
    base = cp
    if 0x1d400 <= cp <= 0x1d7ff:
        description = unicodedata.name(chr(cp), '')
        if description.startswith('MATHEMATICAL BOLD ITALIC '):
            face = 'bolditalic'
        elif description.startswith('MATHEMATICAL ITALIC '):
            face = 'italic'
        elif description.startswith('MATHEMATICAL BOLD ') and not any(s in description for s in ('SCRIPT', 'FRAKTUR', 'SANS-SERIF')):
            face = 'bold'
        else:
            continue
        decoded = unicodedata.normalize('NFKD', chr(cp))
        if len(decoded) != 1:
            continue
        base = ord(decoded)
    elif cp == 0x210e:  # Unicode's legacy mathematical italic h.
        face, base = 'italic', ord('h')
    elif cp not in plain | symbols:
        continue
    replace(name, face, base)

# Keep MPS outlines for display operators. Termes' first display integral is too
# short for the reference exam layout: lengthen integral variants vertically,
# keeping their widths and the base (text-style) glyph unchanged.
variants = font['MATH'].table.MathVariants
for cp in operators:
    name = cmap.get(cp)
    if name not in variants.VertGlyphCoverage.glyphs:
        continue
    idx = variants.VertGlyphCoverage.glyphs.index(name)
    construction = variants.VertGlyphConstruction[idx]
    stretch = 1
    if cp in integrals:
        first_large = next((r for r in construction.MathGlyphVariantRecord if r.VariantGlyph != name), None)
        if first_large:
            box = original_bounds[first_large.VariantGlyph]
            stretch = max(1, integral_display_height / (box[3] - box[1]))
    for record in construction.MathGlyphVariantRecord:
        glyph_name = record.VariantGlyph
        box = original_bounds[glyph_name]
        factor = stretch if glyph_name != name else 1
        replace(glyph_name, 'regular', cp, target_height=box[3] - box[1], vertical_stretch=factor)
        record.AdvanceMeasurement = round(record.AdvanceMeasurement * factor)

info = font['MATH'].table.MathGlyphInfo
corrections = info.MathItalicsCorrectionInfo
if corrections:
    for name, record in zip(corrections.Coverage.glyphs, corrections.ItalicsCorrection):
        if name in metrics:
            ink_right, advance, _ = metrics[name]
            record.Value = max(0, ink_right - advance)
accents = info.MathTopAccentAttachment
if accents:
    for name, record in zip(accents.TopAccentCoverage.glyphs, accents.TopAccentAttachment):
        if name in metrics:
            record.Value = metrics[name][2]
# Font selection uses this new family; four math styles are Unicode glyph ranges.
for record in list(font['name'].names):
    if record.nameID in (1, 2, 3, 4, 6, 16, 17):
        font['name'].names.remove(record)
values = {1: 'FZSTS_MPS Math', 2: 'Regular', 3: 'FZSTS_MPS-Math-local-1', 4: 'FZSTS_MPS Math', 6: 'FZSTS_MPS-Math', 16: 'FZSTS_MPS Math', 17: 'Regular'}
for nid, value in values.items():
    font['name'].setName(value, nid, 3, 1, 0x409)
top = font['CFF '].cff.topDictIndex[0]
top.FamilyName = 'FZSTS_MPS Math'
top.FullName = 'FZSTS_MPS Math'
font['CFF '].cff.fontNames = ['FZSTS_MPS-Math']
args.output.parent.mkdir(parents=True, exist_ok=True)
font.save(args.output)
report = {
    'sources': {name: hashlib.sha256((args.source_dir / name).read_bytes()).hexdigest() for name in files.values()},
    'fallback': str(args.fallback),
    'replaced_glyph_count': len(replaced),
    'replaced_glyphs': replaced,
    'fallback_structures': 'radicals, stretch delimiter variants, accents; unavailable characters and styles',
    'integral_display_min_height_em': integral_display_height / upem,
    'absolute_value_bar_face': 'TeX Gyre Termes Math',
    'absolute_value_bar_metrics': 'original base glyphs, variants, and assemblies',
    'parentheses_face': 'FZSTS_MPS',
    'basic_operator_ink_width_em': 0.62,
}
args.output.with_suffix('.json').write_text(json.dumps(report, ensure_ascii=False, indent=2))
print(f'{len(replaced)} MPS glyphs installed in {args.output}')
