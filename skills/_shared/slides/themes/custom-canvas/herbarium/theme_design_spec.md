# Herbarium Theme Design Specification

## Theme Identity

**Name**: Herbarium
**Category**: custom-canvas
**Metaphor**: Scientific botanical herbarium — pressed plant specimens mounted on archival paper, handwritten Latin labels, specimen numbers, museum collection catalog aesthetic.
**Complexity Level**: Canvas

## Color Palette

### Primary Preset: "herbarium"
| Role | Hex | Usage |
|------|-----|-------|
| Background | #FDFAF5 | Archival paper cream |
| Ink | #2B3A2B | Botanical dark green (primary text) |
| Accent | #6B8F6B | Specimen green (muted, scientific) |
| Secondary | #8B6914 | Label gold/amber (old adhesive tape) |
| Surface | #F5F2EA | Card stock |

### Preset: "field-notes"
| Role | Hex | Usage |
|------|-----|-------|
| Background | #FAF8F0 | Warm field paper |
| Ink | #3A3028 | Earth brown-black |
| Accent | #5A7A50 | Forest green |
| Secondary | #9B7830 | Weathered gold |
| Surface | #F0ECE0 | Notebook page |

### Preset: "autumn-collection"
| Role | Hex | Usage |
|------|-----|-------|
| Background | #FBF7F0 | Late-season parchment |
| Ink | #3D2B1F | Rich umber |
| Accent | #8B5E3C | Autumn brown |
| Secondary | #6B7F3A | Olive green |
| Surface | #F2EDE4 | Aged card |

## Typography

| Level | Size | Weight | Style |
|-------|------|--------|-------|
| Display | 38pt | Regular | Roman |
| H1 | 26pt | Regular | Roman |
| H2 | 20pt | Medium | Roman |
| Body | 16pt | Regular | Roman |
| Small | 12pt | Regular | Roman/Italic for Latin |
| Tiny | 9pt | Medium | Roman |
| Specimen Number | 11pt | Bold | Monospace |

**Font Stack**: Libertinus Serif with Noto Serif SC fallback (body), DejaVu Sans Mono (numbers/labels)
**Design Note**: Italic serif for Latin binomials, small caps style via tracking for labels, monospace for catalog numbers.

## SVG Decorations

1. **Pressed Leaf** — Elliptical silhouette with center midrib and paired lateral veins. Used as watermark on content slides.
2. **Mounting Tape Corners** — Diagonal triangular strips at card corners, evoking herbarium sheet photo-corner mounts.
3. **Botanical Cross-Section** — Circle with radial lines suggesting a stem cross-section. Used as ornamental accent.
4. **Scale Bar** — Ruler-like measurement marks. Subtle scientific authenticity marker.
5. **Collection Label Frame** — Dashed-border rectangle for specimen metadata display.

## Component Inventory

| Component | Purpose | Visual Character |
|-----------|---------|-----------------|
| `specimen-card` | Primary content card | Cream fill, green border, tape corners |
| `taxonomy-stat` | Large number + label | Monospace number, italic subtitle |
| `vein-divider` | Section separator | Thin branching horizontal line |
| `genus-tag` | Inline label/tag | Italic text in dashed frame |
| `field-quote` | Quotation block | Left accent bar, italic text |
| `catalog-panel` | Numbered content block | Top accent, specimen-number header |
| `herbarium-table` | Data table | Museum catalog style headers |
| `collection-label` | Specimen metadata | Dashed border, collector/number/location |
| `pressed-specimen` | Card with leaf watermark | Content over ghost leaf |
| `accession-number` | Inline catalog number | Monospace in subtle frame |
| `determination-label` | Species name display | Italic genus+species + authority |

## Slide Types

| Slide | Background | Decorations |
|-------|-----------|-------------|
| `slide` | Archival cream | Leaf watermark (bottom-right), scale bar (top-right) |
| `dark-slide` | Dark green (#2B3A2B) | Cross-section ornament, ghost leaf |
| `title-slide` | Archival cream | Full mounting corners, leaf, cross-section, border frame |
| `new-section-slide` | Archival cream | Section number (monospace), leaf, mounting tape |
| `focus-slide` | Surface card stock | Botanical border, mounting corners, leaf+cross-section |
| `ending-slide` | Archival cream | Ghost "FINIS", full mounting corners, leaf pair |

## Aesthetic Principles

1. **Scientific Beauty**: The elegance of systematic documentation
2. **Muted Restraint**: Museum palette — never loud, always composed
3. **Tactile Feel**: Mounting tape SVGs create physicality
4. **Dense Information**: Taxonomy-style data is beautiful here, not cluttered
5. **Quiet Confidence**: Natural history museum atmosphere
