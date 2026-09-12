# Ivory Column Theme -- Design Specification

## Theme Identity

**Name**: Ivory Column
**Concept**: Classical Greek/Roman column architecture
**Mood**: Authoritative, timeless, elegant, warm precision
**Tier**: custom-rich
**Best For**: Business strategy presentations, financial reviews, institutional communications, leadership briefings, advisory reports

---

## Design Philosophy

The Ivory Column theme translates the architectural language of classical Greek and Roman temples into modern slide design. The Parthenon's proportional systems -- columns supporting entablatures, balanced triglyphs and metopes, classical symmetry -- become a framework for presenting information with gravitas and clarity.

Key principles:
- **Proportion over decoration**: Clean, authoritative layouts with purposeful ornamentation
- **Warm neutrality**: Cream/ivory warmth replaces cold corporate whites
- **Structural hierarchy**: Information organized like architectural orders (base, shaft, capital)
- **Timeless authority**: Design that commands respect without being dated

---

## Color System

### Primary Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Warm Ivory | `#FAF8F3` | Emulates aged marble and parchment |
| Secondary BG | Ivory | `#F5F1E8` | Slightly warmer for card backgrounds |
| Card Surface | Marble White | `#FFFFFF` | Clean reading surface |
| Text | Deep Charcoal | `#2C2C34` | Rich black with warm undertone |
| Primary | Warm Slate Blue | `#4A5B7A` | Authority and trust (column stone) |
| Primary Dark | Deep Slate | `#3A4A66` | Darker variant for emphasis |
| Accent | Antique Gold | `#B8943F` | Decorative gilding and non-text markers |
| Accent Text | Deep Antique Gold | `#80601B` | Contrast-safe functional gold text |
| Accent Light | Bright Gold | `#D4B55A` | Lighter gold for subtle highlights |
| Secondary | Muted Blue-Gray | `#536A80` | Contrast-safe supporting text and structure |
| Marble | Marble White | `#F0ECE3` | Focus slide background |
| Border | Warm Sand | `#D6CFC2` | Subtle card borders |
| Text Muted | Warm Gray | `#6B6B73` | Secondary text, captions |
| Shadow | Warm Shadow | `#E8E2D6` | Divider fills |

### Color Usage Rules

1. **Background**: Always warm ivory (`#FAF8F3`), never pure white for page fill
2. **Text hierarchy**: Charcoal for headings, text-muted for captions and metadata
3. **Accent gold**: Bright gold is decorative; `accent-text` carries highlighted text and KPI values
4. **Primary slate blue**: Structural elements -- borders, pillar accents, section dividers
5. **Secondary blue-gray**: Supporting elements, technical content, less prominent cards

---

## Typography

### Font Ownership and Demo Stack

The reusable theme entry sets size and color but does not own a font family. The demo uses verified installed fonts:

| Role | Primary | CJK fallback |
|------|------|----------|
| Body | Libertinus Serif | Noto Serif SC |
| Raw/code | Menlo | Noto Sans SC |

### Type Scale

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Slide Title | 1.3em (23.4pt) | Semibold | Charcoal |
| Section Number | 3.5em (63pt) | Bold | Accent Text |
| Section Title | 2em (36pt) | Semibold | Charcoal |
| Title Slide Title | 2.4em (43.2pt) | Bold | Charcoal |
| Body Text | 18pt (base) | Regular | Charcoal |
| Card Title | 0.92em (16.6pt) | Semibold | Contrast-safe accent role |
| Card Body | 0.82em (14.8pt) | Regular | Text |
| Tag Text | 0.75em (13.5pt) | Semibold | Accent color |
| Footer | 0.65em (11.7pt) | Regular | Text Muted |
| KPI Value | 1.8em (32.4pt) | Bold | Contrast-safe accent role |
| KPI Label | 0.75em (13.5pt) | Regular | Text Muted |

---

## SVG Decorative System

### Background: Fluted Columns

Full-page vertical fluting lines simulate the channeled surface of classical columns. Rendered at very low opacity (0.03-0.06) so they add texture without competing with content. Includes horizontal entablature lines at top and bottom (opacity 0.12).

**Elements**: 20 vertical rectangles (paired -- wide + narrow), 2 horizontal lines
**Viewport**: 840x474 (16:9 slide dimensions)
**Opacity range**: 0.03 to 0.12

### Bookend: Temple Pediment Frame

Shared visual element between title and ending slides. Features:
- Triangular pediment (outer + inner) at top
- Horizontal entablature bands (architrave, frieze, cornice simulated)
- Vertical column lines on left and right
- Base entablature at bottom
- Gold accent circles at key structural points

**Elements**: 15+ shapes (rects, polygons, lines, circles)
**Opacity range**: 0.3 to 0.6

### Header: Entablature Border

Horizontal decorative band simulating classical entablature with triglyph blocks:
- Top cornice bar (full width, solid)
- Thin accent line (gold)
- Repeating triglyph blocks below

**Width**: Configurable (default 160pt for slide headers)
**Height**: 12pt

### Ornament: Ionic Volute

Spiral scroll pattern inspired by Ionic column capitals:
- Logarithmic spiral path
- Center dot (gold)
- Used in corners for subtle decoration

**Size**: Configurable (22-36pt)

### Divider: Greek Key/Meander

Classical meander pattern rendered as a continuous stepped path:
- Alternating vertical segments creating key pattern
- Gold color with moderate opacity
- Used between content sections

**Width**: Configurable (default 80%)
**Height**: 10pt

### Accent: Pillar

Single miniature fluted column for card border decoration:
- Top and bottom capital bars
- Three fluting lines in between

**Height**: Configurable

---

## Layout Architecture

### Slide Grid

```
+--------------------------------------------------+
| Header (4em top margin)                          |
|   [Title Text]                                   |
|   [Entablature Border ~~~~]                      |
+--------------------------------------------------+
|                                                  |
|  Content Area (2.2em x-margin)                   |
|  [Fluted column background atmosphere]           |
|                                                  |
|                                                  |
+--------------------------------------------------+
| Footer (2em bottom margin)                       |
|   [text]    [diamond]    [page/total]            |
+--------------------------------------------------+
```

### Footer Structure

Three-column grid: `(1fr, auto, 1fr)`
- Left: Custom footer text
- Center: Gold diamond separator (rotated square)
- Right: Page counter (right-aligned)

### Background Atmosphere

Every content slide renders these elements through `config-page(background: ...)`, below both body and footer chrome:
1. Full-page fluted columns SVG (via `_content-atmosphere()`)
2. Top-right corner volute ornament (`opacity: 0.4`, size 22pt)
3. Bottom-left corner volute ornament (`opacity: 0.35`, size 20pt), lifted above the footer zone

This creates a persistent classical "presence" without visual heaviness.

---

## Component Design Details

### pillar-card

- Left border: 4pt solid accent color (simulates column shaft)
- Right/top/bottom border: 1pt warm sand
- Fill: Marble white
- SVG fluted pillar inset beside the left structural border
- Title: Semibold in a contrast-safe accent color
- Gold accent bar (40pt) below title
- Right side rounded (4pt radius)

### capital-box

- Top border: 3pt gold (simulates capital crown)
- Fill: Ivory (warmer than card white)
- Gold circle indicator (8pt) beside title
- Bottom rounded (4pt radius)

### frieze-tag

- Capsule shape (99pt radius)
- Light fill (color lightened 88%)
- 1pt border in tag color
- Square dot indicator (5pt, no radius -- geometric)
- Compact padding

### pediment-card

- All-around border: 1pt warm sand
- Fill: Marble white
- Triangle pediment symbol (10x8pt polygon) beside title
- Full-width accent line below title
- 4pt corner radius

### order-stat

- Bottom border: 3pt in stat color (inverted from typical top accent)
- Top rounded (4pt radius)
- One centered `stack(spacing: .8em)` containing square marker, large value, muted label, and the flexible tail
- Labels sit below values and may wrap to two centered lines
- Used only as the direct child of bounded `cols(lazy-layout: true)` rows

### colonnade-card

- Numbered circle (22pt diameter, filled in accent color)
- White number text inside circle
- Standard card borders
- Used in sequences (Roman numerals recommended: I, II, III)

### forum-grid

- Two-panel layout via grid
- Left panel: Ivory fill
- Center: Thin column divider (2pt gold line in warm-shadow background)
- Right panel: White fill
- Outer clip with rounded corners

### portico-box

- Left border: 4pt in accent color
- Thin column indicator bar (3x12pt) beside a deck-font title
- Raw body content uses the raw font configured by the consuming deck
- Light warm fill (`#F8F7F4`)
- Right side rounded

### inscription-note

- Left border: 3pt semi-transparent gold
- Fill: Marble
- Title in deep gold, semibold
- Body in italic (engraved feel)
- Right side rounded

### Layout Semantics

- Use `stack(spacing: ...)` for composed vertical regions and component internals.
- Use `cols` for semantic side-by-side content; `forum-grid` retains native `grid` because it is a regular three-cell comparison matrix with a dedicated divider column.
- Only `order-stat` and `portico-box` end in `lazy-v(1fr)`. Each must be the sole component in its lazy column and must sit inside an explicit-height ancestor.
- `pillar-card`, `capital-box`, `pediment-card`, `colonnade-card`, and `inscription-note` remain natural-height so they can safely participate in mixed stacks.
- `meander-divider` is retained as a named decorative component, not a generic layout wrapper; both its `width` and `color` parameters affect the SVG output.

---

## Spacing Standards

| Element | Value |
|---------|-------|
| Card internal padding (x) | 1em |
| Card internal padding (y) | 0.8em |
| Column gutter (standard) | 1.2em |
| Column gutter (tight) | 0.8em |
| Vertical spacing between components | 0.4-0.6em |
| Title-to-content spacing | 8pt (via stack) |
| Header margin top | 0.6em |
| Footer margin y | 0.4em |
| Page margin x | 2.2em |
| Page margin top | 3.5em |
| Page margin bottom | 2em |

---

## Architectural Metaphor Mapping

| Architecture Element | Theme Element |
|---------------------|---------------|
| Column shaft (fluted) | Left borders on pillar-card, background fluting |
| Column capital (Ionic volute) | Corner ornaments, capital-box top accent |
| Entablature (architrave+frieze+cornice) | Header border decoration, triglyph blocks |
| Temple pediment | Title/ending frame, pediment-card triangle |
| Greek key/meander | Section dividers, content separators |
| Stylobate (base) | Footer bar, bottom borders on order-stat |
| Colonnade (row of columns) | Sequential colonnade-cards |
| Forum (public square) | Two-panel comparison layout |
| Portico (covered entrance) | Technical content framing |
| Inscription (carved stone) | Italic annotation notes |

---

## Accessibility Notes

- Functional text meets WCAG AA contrast on its actual light surfaces
- Charcoal text (`#2C2C34`) on page ivory (`#FAF8F3`): 13.04:1
- Primary blue (`#4A5B7A`) on page ivory: 6.45:1
- Accent text (`#80601B`) ranges from 4.94:1 on marble to 5.82:1 on white
- Secondary blue-gray (`#536A80`) ranges from 4.76:1 on marble to 5.61:1 on white
- Bright gold (`#B8943F`) is decorative only and does not carry small functional text
- SVG decorations are purely atmospheric (opacity 0.03-0.12) and do not carry information
- Structural borders provide visual grouping redundant with spatial layout
