# Amber Ink Theme — Design Specification

## Concept

**Theme Name:** Amber Ink
**Aesthetic:** Vintage letterpress / typography workshop
**Mood:** Craft, authority, timeless elegance, premium editorial
**Metaphor:** A master printer's workshop where movable type is set with precision and inked with warm amber pigments

### Target Use Cases
- Publishing and media industry presentations
- Investment and financial analysis reports
- Executive communications and board decks
- Consulting deliverables and strategy briefs
- Editorial and content strategy presentations

---

## Color System

### Light Theme Palette

| Role | Hex | RGB | Description |
|------|-----|-----|-------------|
| Background | `#FDFAF5` | 253, 250, 245 | Warm cream white (aged fine paper) |
| Primary | `#8B5E3C` | 139, 94, 60 | Amber / burnt sienna (main accent) |
| Secondary | `#C47B2B` | 196, 123, 43 | Warm golden amber (highlights) |
| Tertiary | `#5B6B4E` | 91, 107, 78 | Olive ink green (editorial accent) |
| Text Dark | `#2A2018` | 42, 32, 24 | Near-black sepia (headings) |
| Text Body | `#4A3B2E` | 74, 59, 46 | Warm dark brown (body copy) |
| Text Muted | `#8B7B6A` | 139, 123, 106 | Muted sepia (captions, footnotes) |
| Card | `#FFFEF9` | 255, 254, 249 | Soft cream (card surfaces) |
| Border | `#DFC9A8` | 223, 201, 168 | Aged amber border |
| Print | `#F5EFE4` | 245, 239, 228 | Printing paper fill |

### Color Relationships
- **Primary to Secondary:** Warm tone progression (burnt sienna to golden)
- **Primary to Tertiary:** Complementary warmth (amber vs olive)
- **Background hierarchy:** bg > print > card (subtle layering)
- **Text hierarchy:** text-dark > text-body > text-muted

### Contrast Ratios (WCAG)
- Text Dark on Background: ~15:1 (AAA)
- Text Body on Background: ~9.5:1 (AAA)
- Primary on Background: ~5.2:1 (AA+)
- Text Muted on Background: ~4.1:1 (AA for large text)

---

## Typography

### Scale
- Theme base: `20pt`
- Slide title: `1.3em` (26pt equivalent)
- Title slide heading: `2.4em` (48pt equivalent)
- Section number: `4em` (80pt, transparentized)
- Body text: `0.82em` (16.4pt)
- Component headers: `0.88em` (17.6pt)
- Tags/labels: `0.7em` (14pt)
- Footnotes: `0.65em` (13pt)
- Footer: `0.6em` (12pt)

### Weight Usage
- **Bold:** Titles, headings, component headers, KPI values
- **Semibold:** Tags, attribution, emphasis labels
- **Medium:** Author name
- **Regular:** Body text, descriptions

### Font Configuration
Fonts are set in the document (not theme) via:
```typst
#set text(font: ("Noto Sans", "Noto Sans CJK SC"))
```

---

## Layout Architecture

### Slide Dimensions
- Aspect ratio: 16:9 (default), 4:3 supported
- Margins: top 4.5em, bottom 1.8em, x 2.2em

### Content Slide Structure
```
┌────────────────────────────────────────────┐
│ [reg mark]                      [reg mark] │
│   Title Text                               │
│   ●━━━━━━━━━━━━○  (amber rule)            │
│                                            │
│   [Content Area]                           │
│                                            │
│   footer-left   ◇   page/total            │
│ [reg mark]                      [reg mark] │
└────────────────────────────────────────────┘
```

### Title / Ending Slide Structure (Bookending)
```
┌────────────────────────────────────────────┐
│ ❧ ══════════ ◇ ══════════ ❧              │
│ │                                        │ │
│ │         TITLE TEXT                     │ │
│ │     ~~~flourish divider~~~             │ │
│ │       subtitle / author                │ │
│ │                                        │ │
│ ❧ ══════════ ◇ ══════════ ❧              │
└────────────────────────────────────────────┘
```

---

## SVG Decorations

### 1. Paper Grain Texture (`_paper-grain-svg`)
- **Elements:** 13 horizontal fibers + 10 vertical fibers + 8 grain dots = 31 elements
- **Purpose:** Full-page aged paper simulation
- **Opacity range:** 0.025 - 0.04
- **Application:** Every slide via `_bg-atmosphere()`

### 2. Letterpress Frame (`_letterpress-frame-svg`)
- **Elements:** 4 corner fleurons + 4 double-rule lines + 2 diamond marks + 2 side rules = 30+ elements
- **Purpose:** Ornamental border for title/ending slides (bookending)
- **Opacity range:** 0.08 - 0.20
- **Application:** Title slide + ending slide only

### 3. Typographic Flourish (`_flourish-divider-svg`)
- **Elements:** Central diamond + 2 swash curves + 2 counter-swashes + 2 terminal dots + 2 extending lines = 9 elements
- **Purpose:** Decorative section divider
- **Opacity range:** 0.2 - 0.5
- **Application:** `ornament-divider()` component, title/ending/section slides

### 4. Corner Registration Marks (`_corner-marks-svg`)
- **Elements:** 4 crosshair marks (each: 2 lines + 1 circle) + 4 margin guides = 16 elements
- **Purpose:** Printer's crop marks evoking the letterpress workshop
- **Opacity range:** 0.06 - 0.12
- **Application:** Every content slide via `_bg-atmosphere()`

### 5. Vintage Number Frame (`_number-frame-svg`)
- **Elements:** Outer border + inner border + 4 corner diamonds + 2 center ornaments = 8 elements
- **Purpose:** Decorative frame around KPI values
- **Opacity range:** 0.2 - 0.3
- **Application:** `kpi-card` component

---

## Component Catalog

### Structural Diversity Matrix

| Component | Structure Type | Fill | Stroke | SVG | Border Style |
|-----------|---------------|------|--------|-----|-------------|
| `press-card` | Stack (header+body) | Yes | Full | No | Corner dots |
| `edition-box` | Block with accent | Yes | Left-only | No | Left bar |
| `ornament-divider` | SVG rendering | No | No | Yes | None |
| `type-tag` | Inline box | Tinted | Full thin | No | Diamond mark |
| `kpi-card` | Centered with SVG | Yes | Full thin | Yes | Frame |
| `editorial-card` | Block with rule | Yes | Top-only | No | Top bar |
| `insight-box` | Block with icon | Tinted | Left + thin | No | Accent bar |
| `comparison-table` | Table | Alternating | Grid | No | Rule grid |
| `timeline-point` | Horizontal stack | No | No | No | Dot + line |
| `quote-press` | Block with mark | Yes | No | No | Quote mark |
| `footnote-block` | Block with rule | No | No | No | Top rule |

### Component Count: 11
(Plus `ornament-divider` as a purely decorative component = 12 total exports)

---

## Atmosphere & Persistence

### Content Slides
Every content slide rendered by the `slide()` function includes:
1. Paper grain texture (full-bleed, extremely subtle)
2. Printer's corner registration marks (four corners)

These create the "workshop atmosphere" — the sense of being inside a printing house.

### Bookending Pattern
Title slide and ending slide share identical decorative frames:
- Letterpress ornamental frame (corner fleurons, double rules, diamond marks)
- Typographic flourish dividers
- Paper grain texture

These shared elements are NOT present on content slides, creating clear visual bookends.

### Focus Slide
Inverted color scheme (dark sepia background, cream text) with:
- Paper grain (inverted, using bg color on dark)
- Amber gradient rules top and bottom

---

## Technical Implementation Notes

### Key Patterns Used
- `stack(spacing: 0pt)` — Adjacent colored blocks in `press-card`
- `lazy-v(1fr)` — Height equalization in column layouts
- `std.align` — Avoid shadowing inside slide functions
- `image(bytes(...))` — SVG rendering (NOT `image.decode`)
- `place()` — Atmosphere overlays and absolute positioning
- Content-block API — `#component[title][body]` pattern
- `.text` on raw blocks — SVG string extraction

### Performance Considerations
- SVG strings defined at module level (computed once)
- Color replacement via `.replace("currentColor", ...)` at render time
- Atmosphere rendered via `place()` to avoid layout interference
- No `height: 100%` in flow containers

---

## Visual Hierarchy

### Information Density Levels
1. **Low density (emphasis):** Focus slide, KPI cards
2. **Medium density (narrative):** Edition boxes, insight boxes, quotes
3. **High density (data):** Comparison tables, press cards with lists, timeline sequences

### Reading Flow
- Left-to-right, top-to-bottom (Western reading pattern)
- Header rule anchors the eye at slide top
- Footer provides navigation context without distraction
- Corner marks create subtle frame without constraining content

---

## Accessibility

- All text meets WCAG AA contrast minimums on the warm cream background
- Primary accent meets AA for large text (headings, labels)
- Component fills use high-contrast text (text-body or text-dark)
- Table alternating fills maintain readability
- SVG decorations are purely ornamental (no semantic content)
