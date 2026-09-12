# Mosaic Tile Theme — Design Specification

## Design Philosophy

The Mosaic Tile theme draws inspiration from centuries-old geometric tilework traditions: Islamic zellige (Morocco), Portuguese azulejo, Moorish architecture (particularly the Alhambra in Granada), and Ottoman geometric patterns. These traditions share a common language of mathematical precision, interlocking geometry, and controlled color palettes that translate naturally into modern business presentation design.

The theme avoids overtly "corporate" naming while delivering a professional aesthetic suitable for strategy presentations, executive briefings, and business keynotes. The geometric vocabulary suggests precision, interconnection, and timeless craftsmanship without being culturally appropriative — treating these patterns as universal geometric principles.

---

## Visual Identity

### Core Visual Elements

1. **8-Point Star Pattern (Zellige)**: The primary background atmosphere uses interlocking 8-point stars at very low opacity, creating subtle texture without competing with content. Stars appear in cobalt blue, terracotta, and teal at varying opacities (0.05-0.12).

2. **Tile Frame (Bookend)**: Title and ending slides share a geometric border frame featuring corner flourishes, zigzag edge accents, and node markers. This creates visual bookends that frame the presentation.

3. **Tessellation Strip**: A repeating octagon + square pattern serves as the primary horizontal divider and header underline element. References the classic Islamic tessellation of regular octagons with square gaps.

4. **Star Polygon Divider**: A row of small filled star polygons connected by faint lines, used as section separators and decorative elements.

5. **Rosette**: A radial pattern with 8 petals created by triangular facets, used as corner decorations and accent elements. References the geometric rosettes found in Moorish ceiling designs.

### Color Palette Rationale

The palette draws from traditional glazed tilework:

| Color | Hex | Inspiration |
|-------|-----|-------------|
| Warm Cream (bg) | `#FDF8F0` | Plaster walls behind tilework, warm natural stone |
| Midnight Blue (text) | `#1B2A4A` | Deep cobalt glaze, highly readable |
| Cobalt Blue (primary) | `#1E5AAF` | Classic zellige blue, dominant in Fez tilework |
| Terracotta (secondary) | `#C75B2A` | Fired clay, warm earth tones of Mediterranean tiles |
| Teal (highlight) | `#1A8A8A` | Turquoise glaze common in Ottoman and Persian tiles |
| Gold (accent) | `#C6953A` | Gilded accents in Islamic geometric art |
| Warm border | `#D4C5B0` | Grouting between tiles, natural mortar |

The palette maintains WCAG AA contrast ratios for text on the cream background. The warm cream avoids the coldness of pure white while providing excellent readability.

### Typography

- **Base font**: Avenir Next at 18pt, with Arial fallback — a clean geometric sans-serif that harmonizes with the tilework
- **CJK support**: PingFang SC for multilingual presentations
- **Monospace**: Menlo with DejaVu Sans Mono fallback for code/technical content
- **Weight hierarchy**: Bold (focal numbers and strong emphasis) > Semibold (headings and component titles) > Medium (labels) > Regular (body)
- **Size scale**: 2.4em (title) > 1.3em (slide header) > 0.92em (component headers) > 0.82em (body) > 0.75em (labels)

---

## Component Design Language

### Design Principles

1. **Geometric borders over shadows**: Cards use colored top/left borders rather than drop shadows, echoing tile edges and grouting.

2. **Rotated diamonds as indicators**: Small 45-degree-rotated squares serve as bullet points and tag indicators, referencing the diamond/rhombus shapes found in tilework.

3. **Layered opacity**: SVG elements use multiple opacity levels (0.05-0.8) to create depth without visual weight.

4. **Contained geometry**: Decorative elements are constrained within borders and corners, never overwhelming content areas.

5. **Modular composition**: Components are designed to work in grid layouts (2-column, 3-column, 4-column) with consistent guttering.

### Component Catalog

| Component | Visual Metaphor | Use Case |
|-----------|----------------|----------|
| `tile-card` | Individual ceramic tile with colored top edge | General content containers |
| `zellige-box` | Highlighted tile with teal glaze | Key insights, important callouts |
| `tessera-tag` | Small tessera (tile fragment) label | Category tags, status indicators |
| `rosette-card` | Tile with geometric rosette watermark | Priority items, strategic content |
| `interlace-divider` | Woven geometric border between sections | Section separators |
| `facet-stat` | Cut gemstone facet displaying a value | KPIs, metrics, statistics |
| `pattern-card` | Sequential tiles in a pattern row | Ordered steps, timelines |
| `muqarnas-grid` | Honeycomb muqarnas ceiling structure | Multi-item feature grids |
| `glazed-box` | Ceramic glazed technical tile | Code, configs, technical specs |
| `arabesque-note` | Vine-pattern annotation margin | Notes, annotations, caveats |

---

## SVG Architecture

### Background Pattern (zellige-bg)

- **Dimensions**: 840x474 (16:9 ratio)
- **Element count**: 32 eight-point star polygons
- **Opacity range**: 0.05 to 0.12
- **Colors**: Alternating cobalt blue, terracotta, and teal
- **Stroke widths**: 0.4pt to 0.6pt
- **Layout**: 7 columns x 4-5 rows with offset alignment

### Frame Border (tile-frame)

- **Dimensions**: 840x474 (full slide)
- **Elements**: Double rectangle border, corner flourishes (4), edge zigzag accents (top/bottom), side wave accents, corner/edge node circles
- **Opacity range**: 0.4 to 0.8
- **Structure**: Outer border (cobalt, 2.5pt) + inner border (terracotta, 1pt)

### Tessellation Strip

- **Dimensions**: 300x12
- **Pattern**: Alternating octagons (6-sided approximation) and squares
- **Repeat count**: 11 octagon+square pairs
- **Colors**: Cobalt octagons, terracotta squares, occasional teal variation

### Star Divider

- **Dimensions**: 200x16
- **Elements**: 6 star polygons with connecting lines
- **Colors**: Alternating cobalt, terracotta, teal
- **Opacity range**: 0.3 to 0.5

### Rosette

- **Dimensions**: 60x60
- **Structure**: 2 concentric circles + 8 triangular petals (4 cardinal + 4 diagonal)
- **Colors**: Cobalt petals (cardinal), teal (horizontal), terracotta (diagonal)
- **Center**: Small filled circle

---

## Slide Architecture

### Content Slide Structure

```
+------------------------------------------+
| Header: Title + Tessellation Strip       |
+------------------------------------------+
|                                          |
|  [Zellige BG pattern - low opacity]     |
|  [Corner rosette - top right]           |
|                                          |
|  Content area (user content)            |
|                                          |
|  [Corner rosette - bottom left]         |
|                                          |
+------------------------------------------+
| Footer: text | diamond | page number    |
+------------------------------------------+
```

### Title/Ending Slide Structure (Bookend)

```
+==========================================+
||  [Tile Frame - outer border]           ||
||  +------------------------------------+||
||  |  [Zellige BG pattern]              |||
||  |                                    |||
||  |  [Rosette decoration]              |||
||  |  Title / Farewell text             |||
||  |  [Tessellation strip]              |||
||  |  Subtitle / Author / Date          |||
||  |                                    |||
||  +------------------------------------+||
||  [Corner flourishes + edge accents]    ||
+==========================================+
```

### Section Slide Structure

```
+------------------------------------------+
|█|                                        |
|█|  [Zellige BG]                         |
|█|                                        |
|█|  3          [Rosette - top right]     |
|█|  ★ ─ ★ ─ ★ (star divider)           |
|█|  Section Title                         |
|█|                                        |
|█|  [Tessellation strip - bottom center] |
+------------------------------------------+
```

---

## Spacing and Metrics

| Element | Value |
|---------|-------|
| Page margin (top) | 4em |
| Page margin (bottom) | 2em |
| Page margin (x) | 2.2em |
| Card inset (x) | 1em |
| Card inset (y) | 0.8em |
| Column gutter (standard) | 1.2em |
| Column gutter (compact) | 0.8em |
| Component spacing (v) | 0.4-0.5em |
| Border radius (cards) | 4pt |
| Border radius (tags) | 99pt (capsule) |
| Top border thickness | 3pt |
| Left border thickness | 3-4pt |
| Standard border | 1pt |

---

## Accessibility Considerations

- **Contrast ratios**: All text colors exceed WCAG AA requirements against their backgrounds
- **Color independence**: Information is never conveyed by color alone — borders, shapes, and text weight provide redundant coding
- **Pattern opacity**: Background patterns are kept below 12% opacity to avoid visual noise for users with photosensitivity
- **Font sizing**: Base 18pt ensures readability at typical projection distances
- **Component structure**: All components follow a consistent title > separator > body hierarchy for predictable scanning

---

## Implementation Notes

- All slide functions use `touying-slide-wrapper(self => {...})` pattern
- Headers use `stack(spacing:)` not `v()` between elements
- Card components intended for lazy column layouts end with `#lazy-v(1fr)`; native grid cells remain top-aligned without lazy height fill
- Footer uses `grid(columns: (1fr, auto, 1fr))` for alignment
- SVGs contain no HTML comments (would cause Typst compile errors)
- Background atmosphere is applied via `setting(body)` function in content slides
- Adjacent blocks use `stack(spacing: 0pt)` with `clip: true` where needed
- Frame elements use percentage-based dimensions for responsive scaling
