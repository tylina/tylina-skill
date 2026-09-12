# Botanical Theme - Visual Design Specification

## Theme Overview

| Property | Value |
|----------|-------|
| Name | botanical |
| Display Name | Botanical |
| Complexity | Canvas |
| Style | Victorian botanical illustration meets modern layout |
| Best For | Nature/environment, luxury skincare/cosmetics, botanical science, wellness, organic food brands, garden/landscape architecture |

## Color System

### Palette Factory: `build-palette(ink, paper)`

The theme uses a two-tone derivation palette with an additional accent (gold/copper) channel.

### Presets

| Preset | Ink | Paper | Accent | Character |
|--------|-----|-------|--------|-----------|
| `forest` (default) | #1B3A2D (deep forest green) | #FDF8F0 (warm cream/parchment) | #8B6914 (antique gold) | Classic botanical garden |
| `autumn` | #4A1C2B (burgundy/wine) | #FDF5E6 (warm ivory) | #B8860B (dark goldenrod) | Autumn herbarium |
| `tropical` | #1A4F4F (deep teal) | #F0FFF0 (honeydew/light mint) | #CD853F (peru/copper) | Tropical conservatory |

### Derived Colors (from ink + paper + accent)

| Token | Derivation | Usage |
|-------|-----------|-------|
| `ink` | Base ink color | Primary text, headings |
| `paper` | Base paper color | Page background |
| `accent` | Gold/copper tone | Decorative rules, ornaments, highlights |
| `ink-light` | ink @ 20% transparent | Readable secondary/body text |
| `ink-faint` | ink @ 80% transparent | Borders, subtle rules |
| `ink-ghost` | ink @ 94% transparent | Ghost decorative elements |
| `ink-muted` | ink @ 30% transparent | Metadata text |
| `accent-light` | accent @ 40% transparent | Subtle accent borders |
| `accent-faint` | accent @ 80% transparent | Light accent fills |
| `accent-text` | accent darkened 25% | Small accent-colored labels with safe contrast |
| `meta-color` | ink @ 30% transparent | Footer/chrome text |
| `rule-color` | accent @ 30% transparent | Decorative golden rules |

## Typography

### Size Hierarchy

| Level | Size | Weight | Usage |
|-------|------|--------|-------|
| Display | 40pt | Bold | Cover title |
| H1 | 28pt | Semibold | Section titles |
| H2 | 22pt | Medium | Slide titles |
| Body | 16pt | Regular | Body text |
| Small | 12pt | Regular | Captions, labels |
| Tiny | 9pt | Medium | Metadata, kickers |
| Ornament | 8pt | Regular tracked | Decorative labels |

### Font Stack (set in demo.typ, NOT template.typ)

- Display/Titles: Libertinus Serif + Noto Serif SC (serif)
- Body: IBM Plex Sans + Noto Sans SC (sans)
- Metadata/Labels: IBM Plex Mono (mono)

## Slide Types

### 1. `slide()` - Light Content Slide
- Background: paper color
- Header: slide title (serif bold) + golden rule accent line below
- Persistent atmosphere: a low-opacity pressed-sprig SVG at the outer body edge
- Subtle L-shaped corner marks at top-right and bottom-left
- Footer: three-part grid with BOTANICAL label, ornamental dot, page number
- Content area: generous margins for elegance

### 2. `dark-slide()` - Forest Dark Slide
- Background: deep forest green (ink)
- Text: cream (paper)
- Ghost numeral when supplied plus low-opacity pressed-sprig silhouettes
- Header: inverted metadata chrome
- Footer: inverted three-part grid

### 3. `title-slide()` - Elegant Cover
- Full page, no header/footer
- Percentage-centered responsive double frame with golden corner ornaments
- Large and small pressed-sprig silhouettes bookend the closing slide
- Centered title on cream background
- Botanical-style ornamental divider (symmetrical curved lines) below title
- Institution and date in tracked uppercase mono
- Top/bottom golden accent lines

### 4. `new-section-slide()` - Section Divider
- Light background (paper)
- Large ghost section number (top-right, 94% transparent)
- Pressed-sprig silhouette balances the ghost section number
- Section title with golden underline rule
- SECTION label in tracked uppercase

### 5. `focus-slide()` - Statement Slide
- Forest green background (ink)
- Cream text
- Decorative golden corner rules and an offset pressed-sprig silhouette
- Centered italic text for impactful statements

### 6. `ending-slide()` - Closing Slide
- Cream background
- Responsive frame and pressed-sprig silhouettes shared with the cover
- Centered thank-you text
- Golden rules as dividers
- Ghost "FIN" text at low opacity

### 7. `hero-slide()` - Full-Bleed Image
- Full-bleed background image
- Dark gradient scrim from bottom
- Floating opaque text box positioned over image; the demo includes a vector botanical plate
- No header/footer, 0pt margin

## Components

### 1. `leaf-card(title, body)`
- Card with a dark green top rule and a small pressed-sprig watermark
- Light fill (paper tinted)
- Serif title, sans body
- No flexible spacer; use ordinary `cols` for card rows and mixed compositions

### 2. `specimen-box(label, title, body)`
- Styled like a herbarium specimen label
- Double-line border (thin + thick)
- Tracked uppercase label at top
- Clean structured content with opaque paper fill and a small pressed-sprig watermark

### 3. `root-stat(label, value, description)`
- KPI display with organic decoration
- Large bold value
- Small tracked label above
- Optional description below
- Restrained gold accent rule

### 4. `vine-divider(width)`
- Decorative horizontal separator
- Curving organic line using positioned elements
- Gold/accent color
- Centered on page

### 5. `seed-tag(body)`
- Organic rounded tag/badge
- Filled with accent-faint color
- Small text with ink color
- Pill-shaped (large radius)

### 6. `herbarium-quote(body, cite)`
- Elegant italic quotation
- Left border in accent/gold
- Optional attribution in tracked mono
- Botanical ornament (leaf symbol) as decoration

### 7. `plate-frame(path, caption)`
- Image frame with decorative border
- Double-line border like botanical plates
- Caption below in italic small text
- Clip + fixed height

### 8. `gold-rule(width)`
- Decorative horizontal rule in accent/gold color
- Configurable width

## Layout Parameters

| Parameter | Value |
|-----------|-------|
| Aspect ratio | 16:9 |
| Page margins (content) | top: 5em, bottom: 1.3em, x: 2em |
| Dark slide margins | top: 3em, bottom: 1.5em, x: 2.5em |
| Header ascent | 30% |
| Footer descent | 30% |
| Corner decoration size | ~20pt |
| Frame border width | 1.5pt (outer) + 0.5pt (inner) |

## Design Philosophy

The elegance of Victorian botanical plates translated into modern presentation design:
- Rich greens evoke lush gardens and conservatories
- Gold/copper adds aged refinement and scholarly authority
- Organic curved elements contrast with structured content grids
- Heavy use of decorative borders and framing
- Like looking through a conservatory window
- Restraint in ornamentation - each element serves composition
