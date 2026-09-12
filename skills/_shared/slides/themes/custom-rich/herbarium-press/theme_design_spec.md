# Herbarium Press Theme - Design Specification

## Theme Overview

| Property | Value |
|----------|-------|
| Theme Name | herbarium-press |
| Display Name | Herbarium Press |
| Complexity | Rich |
| Style Objective | Botanical / Scientific / Natural History |
| Aspect Ratio | 16:9 |
| Touying Version | 0.7.4 |

## Design Philosophy

Opening a centuries-old herbarium cabinet -- each slide is a specimen sheet of aged cream paper bearing faint leaf vein impressions, mounting tape corner marks, and the quiet authority of Victorian botanical illustration. The aesthetic is delicate, scientific, and beautiful: pressed flowers, natural history museums, archival specimen labels. Every element feels hand-mounted and carefully preserved.

## Best For

Botanical research presentations, natural history museum talks, ecology and conservation science, academic conferences, herbarium digitisation projects, environmental field reports, taxonomy workshops, science communication with an elegant tone.

---

## Color Palette

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Background | Warm Cream | #FAF7F0 | Content slide background (aged paper) |
| Primary | Deep Forest Green | #2D5016 | Titles, accent borders, decorative elements |
| Secondary | Dried Sage | #8B9F6F | Dividers, leaf accents, subtle fills |
| Accent | Pressed Rose/Mauve | #9B6B7D | Highlights, field notes, petal cards |
| Text | Sepia | #3D3226 | Primary text on light backgrounds |
| Text Light | Lighter Sepia | #6B5D52 | Secondary text, subtitles, institutions |
| Text Muted | Warm Grey | #7A6D63 | Accessible captions, metadata, footer |
| Card | Darker Cream | #F5F1E8 | Card background fills |
| Border | Warm Border | #D4C9B8 | Strokes, rules, structural lines |
| Label BG | Specimen White | #FFFDF8 | Specimen card and label backgrounds |
| Vein | Leaf Vein Green | #C4D4A8 | Very soft decorative vein patterns |

## Typography

| Level | Font | Size | Weight | Color |
|-------|------|------|--------|-------|
| Display (Cover) | Libertinus Serif (demo) | 2em | Bold | Deep forest green (#2D5016) |
| H1 (Section) | Libertinus Serif (demo) | 2em | Semibold | White (on green bg) |
| H2 (Slide Title) | Libertinus Serif (demo) | 1.3em | Semibold | Deep forest green (#2D5016) |
| Body | Libertinus Serif (demo) | 20pt (base) | Regular | Sepia (#3D3226) |
| Small/Caption | Libertinus Serif (demo) | 0.72-0.82em | Regular | Muted (#7A6D63) |
| Code | Consuming deck choice | inherit | Regular | Sepia |

The theme entry sets text size and color only. Font ownership stays with the consuming `main.typ`; the demo selects bundled Libertinus Serif to demonstrate the intended archival scientific voice without causing a template-level fallback.

---

## Slide Types

### 1. Content Slide (`slide`)
- Background: Warm cream (#FAF7F0) with specimen sheet SVG atmosphere (faint leaf veins, fiber dots)
- Mounting corner brackets in all four slide corners (subtle border color)
- Header: Thin sepia rule at top edge, forest green title (1.3em semibold), sage accent line (50pt) beneath
- Footer: 3-column grid -- footer text left, sage dot separator center, page number right
- Margin: top 4.5em, bottom 1.8em, x 2.2em

### 2. Title Slide (`title-slide`)
- Background: Aged paper gradient (cream to slightly darker cream at 135deg)
- Full-page specimen sheet SVG (leaf veins, fiber texture, corner marks -- 30% transparent green)
- Full-page botanical frame SVG (ornamental border with corner leaves, vine runners)
- Leaf divider SVGs above and below center content (45% width, sage color)
- Center: Specimen label card (58% width, label-bg fill, green top border 2.5pt, border sides)
- Card contains: title (2em bold green), subtitle, leaf divider, author, institution, date

### 3. Section Slide (`new-section-slide`)
- Background: Deep forest green gradient (primary to 20% darker, 150deg angle)
- Ghosted specimen sheet SVG (white at 92% transparent -- barely visible)
- Left accent bar: Pressed rose/mauve (3pt wide, 35% height, rounded)
- Ghosted specimen label frame in top-right corner (white at 85% transparent)
- Section title: White 2em semibold, positioned left with dx offset
- Mauve accent underline (55pt, 2.5pt, rounded)
- Leaf divider at bottom (white at 80% transparent)

### 4. Focus Slide (`focus-slide`)
- Background: Sepia/dark brown (palette.text color as fill)
- Ghosted specimen sheet (white at 92% transparent)
- Mauve leaf dividers at top and bottom (35% width, 50% transparent)
- Content: White text (1.7em semibold), centered, 75% width
- Mauve accent underline (65pt, 2pt, rounded)
- Margin: 3em all sides

### 5. Ending Slide (`ending-slide`)
- Mirrors title slide exactly (bookend design)
- Same aged paper gradient, specimen sheet, botanical frame
- Leaf dividers at top and bottom (40% width)
- Center: Smaller specimen label card (50% width)
- Text: 2em bold forest green
- Leaf divider below text (90pt, sage)

---

## Components

### 1. `specimen-card(title, body, accent)`
Mounting-corner bracket card: label-bg fill (#FFFDF8), border stroke (0.6pt), bracket decorations in all four corners using lines at 0/90/180/-90 degrees (8pt, accent at 40% transparent). Title is semibold in a contrast-safe darkened accent, and the body is sepia. Includes `lazy-v(1fr)`.

### 2. `botanical-box(title, body, accent)`
Left-border insight box: white fill, accent left border (3pt), pale border on remaining sides (30% transparent). Faint leaf divider SVG at top-right (80% transparent accent). Semibold title in a contrast-safe darkened accent. Includes `lazy-v(1fr)`.

### 3. `collection-stat(label, value, note, accent)`
Metric display: label-bg fill, accent top+bottom borders (1.5pt), pale side borders. Small accessible-muted uppercase label (0.72em), contrast-safe darkened value (1.65em semibold), and optional text-light note (0.7em) are arranged in a predictable stack. Includes `lazy-v(1fr)` and is intended as the sole component in each `lazy-layout` column.

### 4. `pressed-quote(body, attribution)`
Quote block: Top and bottom sage lines (0.8pt), label-bg fill, leaf accent mark at start (double comma glyph in a contrast-safe darkened secondary). Italic sepia body (0.88em), semibold uppercase attribution in a contrast-safe darkened accent with letter-spacing.

### 5. `genus-tag(label, accent)`
Taxonomic pill tag: accent lightened 90% fill, accent lightened 40% stroke (0.6pt). Italic medium-weight text in a contrast-safe darkened accent (0.75em). Radius 2pt.

### 6. `vine-divider(color)`
Centered leaf divider SVG at 75% width, with restrained 0.15em internal vertical padding. Uses secondary color by default (10% transparentized).

### 7. `field-note(title, body, accent)`
Naturalist notebook box: off-white fill (#FFFEF9), mauve left border (2pt), pale remaining borders. Three faint horizontal ruled lines (border at 60% transparent). Diamond-filled symbol before a contrast-safe semibold darkened-accent title. Body text 0.8em. Includes `lazy-v(1fr)`.

### 8. `classification-table(headers, rows)`
Taxonomy table: header cells with primary lightened 85% fill, semibold primary text (0.8em). Body cells alternate between label-bg and white. Border stroke 0.5pt. Inset padding (x: 0.8em, y: 0.5em).

### 9. `petal-card(title, body, accent)`
Pressed-flower gradient card: linear gradient from accent lightened 92% to label-bg (135deg). Accent top border (2pt), lightened sides (60%). Semibold darkened accent title with compact stack spacing. Bottom radius 3pt. Includes `lazy-v(1fr)`.

---

## SVG Decorative Elements

### Specimen Sheet Background
Full-page texture with paper fiber dots (14 circles, varying sizes/opacities), leaf vein network (primary midrib + 5 secondary veins + 5 tertiary veinlets), and mounting tape corner marks (8 lines forming L-shapes in all four corners). Total 35+ elements.

### Botanical Frame
Ornamental border with 4 border lines, pressed leaf silhouettes in each corner (ellipses + paths), and vine runners along top and bottom edges with small leaf shapes. Total 30+ elements.

### Leaf Divider
Horizontal separator with central line, central pressed leaf (ellipse + vein paths), left and right leaf clusters with stems, and seed-dot accents along the line. Total 14 elements.

### Specimen Label
Rectangular label frame with double borders, three horizontal ruled lines, decorative corner brackets, leaf motif at top center, and curved bottom decoration. Total 12 elements.

## Aesthetic Principles

1. **Archival authenticity**: Every element references real herbarium practices -- mounting tape, specimen labels, pressed flowers
2. **Aged warmth**: Cream papers, sepia tones, warm borders -- nothing cold or clinical
3. **Botanical precision**: Decorations are subtle and scientific, not whimsical or cartoonish
4. **Layered atmosphere**: Multiple transparent SVG layers create depth without distraction
5. **Bookend symmetry**: Title and ending slides mirror each other perfectly
6. **Victorian restraint**: Rich in detail but never cluttered -- generous whitespace preserved
