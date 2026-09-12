# Bauhaus - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Bauhaus custom Touying theme.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | bauhaus |
| **Page Format** | 16:9 Presentation (840x474pt) |
| **Best For** | Design talks, art education, architecture presentations, creative pitches |
| **Style Objective** | A) General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 Presentation |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` via `utils.page-args-from-aspect-ratio` |
| **Margins** | top: 4em, bottom: 2em, x: 2.2em |

## III. Visual Theme

### Design Philosophy

Bold geometric modernism inspired by the 1920s Bauhaus school. Primary colors (red, yellow, blue) on white backgrounds with persistent structural grids, Kandinsky-inspired abstract compositions, and large dominating geometric shapes. Every slide feels like a Bauhaus poster -- shapes are the primary visual language.

### Color Scheme -- Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Bauhaus Red | `#E63946` | `palette.primary` | Headers, accent bars, main branding |
| **Dark** | Dark Navy | `#1D1D2C` | `palette.dark` | Dark backgrounds (title, focus, ending) |
| **Accent** | Steel Blue | `#457B9D` | `palette.accent` | Secondary accent, grid-box headers |
| **Background** | Near White | `#FAFAFA` | `palette.bg` | Content slide background |
| **Card** | Light Gray | `#F0F0F0` | `palette.card` | Card surfaces |
| **Text Dark** | Dark Navy | `#1D1D2C` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Charcoal | `#333333` | `palette.text-body` | Body text |
| **Text Light** | Gray | `#666666` | `palette.text-light` | Accessible captions and footers |
| **Border** | Light Gray | `#E0E0E0` | `palette.border` | Card borders, grid lines |
| **Bauhaus Yellow** | Warm Orange | `#F4A261` | `palette.bauhaus-yellow` | Triangles, subtitles |
| **Bauhaus Red** | Signal Red | `#E63946` | `palette.bauhaus-red` | Circles, emphasis |
| **Bauhaus Blue** | Steel Blue | `#457B9D` | `palette.bauhaus-blue` | Squares, accents |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent, `alert()` text |
| `neutral-lightest` | `#ffffff` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.dark` | Dark text on light backgrounds |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | Avenir Next, Noto Sans SC | `set text(font: ("Avenir Next", "Noto Sans SC"))` in `demo.typ` / `main.typ` |
| **Code** | IBM Plex Mono | `show raw: set text(font: "IBM Plex Mono")` in `demo.typ` / `main.typ` |

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 18pt | Set in theme entry point |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Dark fill (`palette.dark`) with grid at higher opacity (2x normal)
- **Layout**: Asymmetric left-weighted -- title block at 60% width, offset left
- **Decorative elements**: LARGE red circle (200pt, top-right), LARGE yellow triangle (bottom-left), blue square (90pt, mid-right), Kandinsky composition (120pt, top-left), diagonal stripe accent (bottom-right)
- **Colors**: White text, thick red bar (6pt, 80pt wide) above title, subtitle in bauhaus-yellow, author in semi-transparent white

### Section Slide (`new-section-slide`)

- **Background**: White (`palette.bg`) with grid background
- **Layout**: Content offset left (5em), vertical red bar (12pt wide, full height) on left edge
- **Decorative elements**: Large red circle (140pt, top-right), Kandinsky composition (80pt, bottom-right), diagonal stripe below title
- **Numbering**: Slide counter at 4em size in primary red

### Content Slide (`slide`)

- **Background**: Near-white (`palette.bg`) with persistent grid + corner shapes
- **Header**: Thick red vertical bar (6pt x 28pt) + bold dark title (1.3em)
- **Footer**: Three-column grid: footer text | three shapes (circle+square+triangle) | page counter
- **Content area**: Open area with grid atmosphere + large red circle bottom-right + small blue square top-left

### Focus Slide (`focus-slide`)

- **Background**: Dark (`palette.dark`) with grid overlay at slightly higher opacity
- **Layout**: Centered content at 70% width
- **Decorative elements**: Large yellow circle (160pt, left), blue square (100pt, top-right), red triangle (bottom-right)
- **Text**: Large white bold (1.8em), centered

### Ending Slide (`ending-slide`)

- **Background**: Dark, bookends with title (same grid opacity, same shapes)
- **Layout**: Centered at 60% width
- **Decorative elements**: Same as title -- red circle top-right, yellow triangle bottom-left, Kandinsky top-left, diagonal stripe bottom-right
- **Text**: Three decorative shapes above, large white bold text (2.4em), red bar below

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `form-card` | `form-card(title, body, shape: "circle", accent: palette.primary)` | Content card with geometric identity | Card with 4pt left accent border, LARGE (40pt) geometric shape overlapping top-right corner, accessible dark-accent title + thin accent bar + body text |
| `primary-stat` | `primary-stat(label, value, accent: palette.primary)` | Large metric/number display | Card with 3pt bottom accent border, large overlapping circle behind number, small label above, large 2em dark-accent value |
| `manifesto-quote` | `manifesto-quote(quote, author: none)` | Statement/quote callout | THICK 8pt left primary border, italic text, diagonal stripe accent in top-right, optional dark-red author attribution |
| `grid-box` | `grid-box(title, body, accent: palette.accent)` | Structured content box | Full-width colored header bar + 2pt accent border, with zero-gap stacked surfaces |
| `shape-tag` | `shape-tag(content, shape: "circle", color: palette.primary)` | Categorization tag | Shape IS the tag: circle=pill, square=sharp, triangle=asymmetric radius. Bold contrast-safe text on 85% transparent fill |
| `werkstatt-divider` | `werkstatt-divider(count: 6)` | Decorative section divider | Row of alternating large (20pt) circles (red), triangles (yellow), squares (blue) centered |
| `module-highlight` | `module-highlight(title, body, accent: palette.primary)` | Emphasis content block | 3pt thick accent border, colored 24pt square in top-left with diamond symbol, contrast-safe dark-accent title + body |
| `color-block` | `color-block(body, color: palette.primary)` | Full-width emphasis band | Darkened hue fill, white bold text, accessible Bauhaus poster style |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Shapes dominate | Geometric forms are the primary visual language, not decoration |
| 2 | Primary colors only | Red, yellow, blue + black + white -- the Bauhaus canon |
| 3 | Persistent grid structure | Every slide has the underlying Mondrian-style grid visible |
| 4 | Asymmetric composition | Nothing centered by default -- tension creates visual interest |
| 5 | Zero rounded corners on structural elements | Sharp angles, no softness -- precision over comfort |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Bauhaus School (1919-1933) | Original design language: primary colors, geometric forms |
| Kandinsky's compositions | Abstract geometric art with overlapping shapes and lines |
| Mondrian grid paintings | Orthogonal grid as persistent structural element |
| Herbert Bayer poster design | Bold asymmetric typography + shape compositions |
