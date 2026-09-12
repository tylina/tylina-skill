# Greenhouse - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Greenhouse Touying theme. Inspired by Victorian-era botanical greenhouses — iron and glass architecture, lush verdant greens, botanical illustration style, structured yet organic.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | greenhouse |
| **Page Format** | 16:9 (presentation-16-9) |
| **Best For** | Sustainability, science, education, nature topics, environmental reports, botanical research |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 Widescreen |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4.5em, bottom: 1.8em, x: 2em |

## III. Visual Theme

### Design Philosophy

Victorian botanical greenhouse aesthetic — the feeling of standing in the Palm House at Kew Gardens on a sunny morning. Light and airy like sunlight through glass panels, with iron-frame structural elements providing elegant geometry. Rich greens as accent against generous white/cream space. Botanical illustration styling with delicate line-work. Structured yet organic — precision of iron engineering meets the flowing forms of nature.

### Color Scheme — Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Deep Fern Green | `#2D6A4F` | `palette.primary` | Headers, accent bars, main branding |
| **Dark** | Forest Dark | `#1B3A2E` | `palette.dark` | Dark backgrounds, section slides |
| **Accent** | Terracotta Pot Orange | `#E07A3A` | `palette.accent` | Data highlights, emphasis, warmth |
| **Background** | Greenhouse Light | `#F8FAF7` | `palette.bg` | Page background (slightly green-tinted white) |
| **Card** | Leaf-tinted Card | `#EFF5ED` | `palette.card` | Content cards, boxes |
| **Text Dark** | Forest Dark | `#1B3A2E` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Garden Moss | `#3A5A4A` | `palette.text-body` | Body text |
| **Text Light** | Sage | `#7A9A8A` | `palette.text-light` | Captions, secondary text |
| **Border** | Pale Leaf | `#C8DCC4` | `palette.border` | Card borders, dividers |
| **Iron** | Iron Grey | `#4A5C56` | `palette.iron` | Structural elements, frames |
| **Glass** | Glass Green | `#E8F2E8` | `palette.glass` | Light glass-tinted surfaces |
| **Bloom** | Rose Bloom | `#D4577A` | `palette.bloom` | Flowering accent, warnings |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent, alert() text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.dark` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | Avenir Next, Arial | `set text(font: ("Avenir Next", "Arial"))` |
| **Code** | Menlo, DejaVu Sans Mono | `show raw: set text(font: ("Menlo", "DejaVu Sans Mono"))` |

> **Important**: Font is set ONLY in `demo.typ`/`main.typ`, NOT in `template.typ`. The template sets only `size`.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 19pt | Set via `set text(size: 19pt)` in theme entry point |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Soft gradient from `palette.bg` through `palette.glass` — greenhouse light effect
- **Layout**: Centered card (68% width) with green top border, rounded bottom corners
- **Decorative elements**: Iron arch SVG ghosted above, botanical corner SVGs in corners, vertical glass pane lines, leaf vein SVG at bottom
- **Colors**: Dark green title text, body-colored metadata, light text date

### Section Slide (`new-section-slide`)

- **Background**: Dark gradient from `palette.dark` to darkened `palette.primary` — deep forest
- **Layout**: Left-aligned section title with generous padding
- **Decorative elements**: Ghosted iron arch top-right, terracotta orange accent bar left, leaf vein SVG bottom-left
- **Colors**: White title text, terracotta accent underline

### Content Slide (`slide`)

- **Background**: Light `palette.bg`
- **Header**: Iron-grey top bar (3pt) + bold dark title + green accent underline (60pt)
- **Footer**: Three-column grid: footer text | green dot | page counter
- **Content area**: Open area with standard margins

### Focus Slide (`focus-slide`)

- **Background**: Dark gradient (forest dark to primary) with ghosted iron arch SVG centered
- **Text**: Large white bold centered text, width-constrained

### Ending Slide (`ending-slide`)

- **Background**: Soft greenhouse light gradient, botanical corners, iron arch ghosted above
- **Layout**: Centered card (55% width) with green top border, thank-you text, green underline
- **Decorative elements**: Leaf vein SVG at bottom

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `pane-card` | `pane-card(title, body, accent: palette.primary)` | Glass pane content card | White card with colored top border, thin iron-grey side borders, rounded bottom |
| `growth-stat` | `growth-stat(label, value, trend: none, accent: palette.primary, compact: false)` | Statistic with growth indicator | Left-bordered card on leaf-tinted background, large number, small trend text; compact mode changes inset only |
| `specimen-quote` | `specimen-quote(body, attribution: none)` | Botanical specimen-style pull quote | Glass-green background, left terracotta accent border, italic text, attribution |
| `propagation-box` | `propagation-box(title, body, accent: palette.primary, compact: false)` | Planting tray-styled info box | Lightened accent fill, segmented top strip effect, colored top border; compact mode changes inset only |
| `seed-tag` | `seed-tag(label, accent: palette.primary)` | Small round plant label | Pill-shaped tag with lightened fill, small bold text |
| `trellis-divider` | `trellis-divider(color: palette.border)` | Lattice pattern horizontal rule | Three parallel lines at different opacities |
| `conservatory-highlight` | `conservatory-highlight(title, body, accent: palette.primary)` | Featured area with arched top | Rounded-top header bar (filled accent) + content below, like greenhouse entrance |
| `botanical-table` | `botanical-table(headers, rows)` | Styled data table | Dark green header, alternating white/glass rows |
| `bloom-box` | `bloom-box(title, body)` | Warning/attention box (pink) | Alias of propagation-box with bloom accent |
| `terracotta-box` | `terracotta-box(title, body)` | Alert/emphasis box (orange) | Alias of propagation-box with terracotta accent |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Light and airy over dark and heavy | Like sunlight through glass — generous white space with green as accent |
| 2 | Structural elegance from geometry | Iron-frame arches and grid lines provide order without rigidity |
| 3 | Botanical illustration delicacy | Thin strokes, gentle curves, organic forms in SVG decorations |
| 4 | Verdant but not overwhelming | Rich greens used as accent and emphasis, never as dominant fill on content slides |
| 5 | Warmth through terracotta | Orange accent provides human warmth against cool greens — like clay pots in a greenhouse |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Palm House at Kew Gardens | Primary architectural inspiration — iron and glass, curved arches |
| Victorian botanical illustration | Detailed line-work, specimen labelling, serif typography style |
| Curtis's Botanical Magazine | Color palette reference — rich greens, terracotta, cream paper |
| Temperate House restoration | Modern meets heritage — clean lines respecting historical form |

---

## Output Files

```
greenhouse/
├── template.typ          # Theme definition — colors, components, slide functions
├── demo.typ              # Compilable demonstration showcasing all components
├── theme_design_spec.md  # This specification document
└── theme.md              # API summary for downstream roles
```
