# terracotta-mosaic - Theme Design Specification

> Visual and structural design spec for the Terracotta Mosaic Touying theme.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | terracotta-mosaic |
| **Display Name** | Terracotta Mosaic |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Architecture, travel, cultural studies, history presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 3.5em, bottom: 2em, x: 2.2em |

## III. Visual Theme

### Design Philosophy

A warm, inviting Mediterranean world inspired by the Alhambra palace, Moroccan zellige tilework, and sun-baked terracotta craft. The viewer inhabits a Moorish courtyard -- geometric patterns tessellate subtly across every slide, warm earthy tones evoke clay and sandstone, and pops of deep Mediterranean blue recall ceramic glazes. The arch motif (horseshoe/pointed Islamic arch) serves as the signature framing element on title and ending slides.

### Color Scheme -- Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Burnt Terracotta | `#C75B12` | `palette.primary` | Headers, accent bars, main branding |
| **Secondary** | Mediterranean Blue | `#1B4B6B` | `palette.secondary` | Contrast accent, alternate cards |
| **Dark** | Dark Umber | `#2A1810` | `palette.dark` | Deepest text, dark backgrounds |
| **Accent** | Moorish Gold | `#D4A03C` | `palette.accent` | Highlights, decorative elements |
| **Background** | Warm Cream | `#FDF8F3` | `palette.bg` | Page background |
| **Card** | White | `#FFFFFF` | `palette.card` | Content cards |
| **Text Dark** | Umber | `#2A1810` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Warm Brown | `#4A3728` | `palette.text-body` | Body text |
| **Text Light** | Faded Terracotta | `#8B7355` | `palette.text-light` | Captions, secondary text |
| **Border** | Sandy | `#E8D5C4` | `palette.border` | Card borders, dividers |
| **Tile Warm** | Light Terracotta | `#E8A065` | `palette.tile-warm` | Warm accent variant |
| **Tile Blue** | Ceramic Blue | `#2D6A8F` | `palette.tile-blue` | Blue tile variant |
| **Sand** | Stucco | `#F5EDE4` | `palette.sand` | Subtle warm background |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (#C75B12) | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `palette.bg` (#FDF8F3) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (#2A1810) | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Deck-owned family** | IBM Plex Serif, Georgia, Times New Roman (demo choice) | `set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"))` in `demo.typ` / `main.typ` |
| **Code** | Inherits the deck's font policy | No font family is fixed in `template.typ` |

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 18pt | Set in theme entry point |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm cream parchment with enhanced zellige pattern (stronger opacity)
- **Layout**: Centered title inside Moorish arch frame (horseshoe arch SVG)
- **Decorative elements**: Full-page arch frame (bookending), enhanced zellige mosaic, tile border under title
- **Colors**: Dark umber text on warm cream, terracotta accents

### Section Slide (`new-section-slide`)

- **Background**: Warm cream with zellige pattern + left terracotta accent bar (6pt)
- **Layout**: Left-aligned section number (large, faded) + section title + tile border divider
- **Decorative elements**: Left accent bar, zellige pattern, small diamond ornament bottom-right
- **Numbering**: Large faded current-section number via `utils.display-current-heading-number()`

### Content Slide (`slide`)

- **Background**: Warm cream (`palette.bg`) with persistent zellige pattern atmosphere
- **Header**: Bold title + tile border SVG pattern as accent underline (NOT a plain line)
- **Footer**: Three-column grid: footer text | diamond mosaic marker | page counter
- **Content area**: Open area with persistent subtle mosaic background

### Focus Slide (`focus-slide`)

- **Background**: Deep Mediterranean blue (`palette.secondary`) with light zellige pattern
- **Text**: White centered bold text with gold tile border decoration below
- **Layout**: Centered content with width constraint

### Ending Slide (`ending-slide`)

- **Background**: Warm cream with enhanced zellige pattern (bookends with title)
- **Layout**: Centered text with arch frame decoration (bookends with title)
- **Decorative elements**: Arch frame, tile border, mosaic divider

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| tile-card | `tile-card(title, body, accent: palette.primary)` | Primary content card | Card with geometric tile border on top, shadow elevation |
| courtyard-stat | `courtyard-stat(label, value, color: palette.primary)` | Large number display | Centered arch icon → value → label stack with no intervening `v()` |
| arabesque-quote | `arabesque-quote(quote, author: none)` | Quote/verse display | Left-bordered quote with decorative diamond ornament |
| zellige-box | `zellige-box(title, body, accent: palette.secondary)` | Info card with star | Card with 8-pointed star SVG next to title, colored top border |
| mosaic-tag | `mosaic-tag(content, color: palette.primary)` | Inline tag/badge | Small pill-shaped label |
| timeline-entry | `timeline-entry(year, title, description, color: palette.primary)` | Timeline display | Year with diamond bullet + content in grid layout |
| arch-highlight | `arch-highlight(title, body)` | Feature highlight | Title with arch icon, indented body (no box border) |
| sunbaked-card | `sunbaked-card(title, body)` | Warm gradient card | Card with sand-to-white gradient, evoking sun-dried clay |
| mosaic-divider | `mosaic-divider(color: palette.primary, width: 60%)` | Section separator | Centered tile border pattern as divider |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Warm earth tones dominate | Creates a unified Mediterranean world; blue is used sparingly for contrast |
| 2 | Geometric patterns, never organic curves | Reflects Islamic geometric art tradition; tessellation > free-form |
| 3 | Arch as signature motif | The pointed horseshoe arch instantly signals Moorish architecture |
| 4 | Persistent atmosphere via zellige stars | Every content slide carries the "world" through subtle background pattern |
| 5 | Bookending via arch frame | Title and ending slides share the arch frame that content slides lack |
| 6 | Intrinsic component sizing | Cards do not contain `lazy-v`; regular matrices use `grid` by default, with one-card-per-column `cols` used where a top-level grid interferes with Touying footer chrome |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Alhambra Palace, Granada | Primary inspiration for geometric patterns and arch forms |
| Moroccan Zellige | Tessellated star patterns inform the background atmosphere SVG |
| Moorish arch typology | Horseshoe/pointed arch shape used as signature frame element |
| Mediterranean ceramics | Color palette derived from terracotta clay and blue glazes |

---

## Output Files

```
terracotta-mosaic/
├── template.typ          # Theme definition -- colors, components, slide functions
├── demo.typ              # Compilable demonstration (15 slides showcasing all components)
├── theme_design_spec.md  # This specification document
└── theme.md              # API summary
```
