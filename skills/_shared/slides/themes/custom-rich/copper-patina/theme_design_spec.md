# Copper Patina - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Copper Patina Touying theme. Inspired by aged copper and bronze metalwork, verdigris patina, steampunk machinery, and industrial elegance.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | copper-patina |
| **Display Name** | Copper Patina |
| **Page Format** | 16:9 (841.89pt x 473.56pt) |
| **Best For** | Engineering, industrial design, steampunk, manufacturing, material science |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |
| **Created Date** | 2026-05-23 |

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 |
| **Touying Setting** | `config-page(paper: "presentation-16-9")` |
| **Margins** | top: 4em, bottom: 2em, x: 2.2em |

## III. Visual Theme

### Design Philosophy

A warm industrial world of aged copper, brass, and verdigris green. The viewer inhabits a Victorian engineering workshop where time has painted metal with patina and every surface tells a story of oxidation and craftsmanship. Think Statue of Liberty patina, brass instruments, steam-age engineering drawings, and riveted steel plates.

### Color Scheme — Fixed Palette (Rich)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Primary** | Copper | `#B87333` | `palette.primary` | Headers, accent bars, main branding |
| **Primary Ink** | Dark Copper | `#995721` | `palette.primary-ink` | Accessible copper text on light surfaces |
| **Dark** | Dark Steel | `#1A1A2E` | `palette.dark` | Dark backgrounds, focus slides |
| **Accent** | Verdigris | `#4A8C7B` | `palette.accent` | Patina highlights, emphasis |
| **Accent Ink** | Deep Verdigris | `#356F61` | `palette.accent-ink` | Accessible verdigris text on light surfaces |
| **Background** | Warm Cream | `#FAF6F0` | `palette.bg` | Page background (old engineering paper) |
| **Card** | White | `#FFFFFF` | `palette.card` | Content cards, boxes |
| **Text Dark** | Dark Brown | `#2A1F14` | `palette.text-dark` | Headings, primary text |
| **Text Body** | Warm Brown | `#4A3F35` | `palette.text-body` | Body text |
| **Text Light** | Aged Brass | `#7B6D5C` | `palette.text-light` | Accessible captions and secondary text |
| **Border** | Oxidized | `#D4C4A8` | `palette.border` | Card borders, dividers |
| **Copper Light** | Polished | `#D4956A` | `palette.copper-light` | Highlights on dark |
| **Verdigris** | Green Patina | `#4A8C7B` | `palette.verdigris` | Patina accents |
| **Steel** | Blued Steel | `#3A4A5C` | `palette.steel` | Blueprint elements |
| **Rivet** | Brass Rivet | `#8B6914` | `palette.rivet` | Rivet decorations |
| **Patina Light** | Light Wash | `#A8D5C8` | `palette.patina-light` | Subtle green backgrounds |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary-ink` (#995721) | Accessible alert and strong text |
| `neutral-lightest` | `palette.bg` (#FAF6F0) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (#2A1F14) | Dark text on light backgrounds |

### Gradient Scheme

```typst
// Copper-to-verdigris gradient (signature element)
gradient.linear(palette.primary, palette.accent, angle: 0deg)
// Vertical gradient for section bars
gradient.linear(palette.primary, palette.accent, angle: 180deg)
```

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | Arial, Noto Sans SC | `set text(font: ("Arial", "Noto Sans SC"))` |
| **Code** | Document default monospace | Override at document level only when required |

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 18pt | Set in theme entry point |

### Weight Hierarchy

Traditional (corporate/industrial):
- Display/Cover: Bold (700)
- Section titles: Bold (700)
- Slide titles: Semibold (600)
- Body: Regular (400)
- Labels/captions: Regular (400)

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Warm cream (`palette.bg`)
- **Layout**: Centered title + subtitle + author + date
- **Decorative elements**: Pipe frame (corner pipes with elbow joints, valves, pressure gauge), rivet rows top/bottom (bookending)
- **Colors**: Copper title text, warm body text, gradient accent line

### Section Slide (`new-section-slide`)

- **Background**: Warm cream with subtle gear pattern
- **Layout**: Left-aligned section number (faded copper) + title + rivet row separator
- **Decorative elements**: Left gradient bar (copper-to-verdigris), gear pattern background
- **Numbering**: Section counter in large faded copper text

### Content Slide (`slide`)

- **Background**: Warm cream (`palette.bg`) with persistent gear pattern atmosphere
- **Header**: Semibold title + copper-to-verdigris gradient accent line with rivet dots at ends
- **Footer**: Three-column grid: footer text | gear dot | page counter
- **Atmosphere**: Corner rivet dots on all four corners

### Focus Slide (`focus-slide`)

- **Background**: Dark steel (`palette.dark`) with inverted gear pattern
- **Text**: Copper-light centered text, bold, constrained width
- **Decorative elements**: Rivet rows top and bottom, gear pattern in cream

### Ending Slide (`ending-slide`)

- **Background**: Warm cream (bookends with title)
- **Layout**: Centered thank-you text with gradient accent line
- **Decorative elements**: Pipe frame + rivet rows (shared with title slide = bookending)
- **Text**: Copper-colored main text, tagline below

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| rivet-card | `rivet-card(title, body, accent: palette.primary)` | General content card | Card with rivet dots along top/bottom edges, shadow elevation |
| gauge-stat | `gauge-stat(label, value, color: palette.primary)` | Numeric statistics display | Circular gauge border around centered number, like a pressure meter |
| blueprint-box | `blueprint-box(title, body)` | Technical specifications | Dashed steel border, corner measurement marks (+), technical title |
| patina-highlight | `patina-highlight(title, body)` | Key information emphasis | Green-tinted left-border accent, verdigris background wash |
| brass-tag | `brass-tag(content, color: palette.primary)` | Inline labels/badges | Small stamped brass plate style tag |
| copper-divider | `copper-divider(width: 80%)` | Section separator | Copper-to-verdigris gradient horizontal line |
| forge-quote | `forge-quote(quote, source: none)` | Blockquotes | Copper pipe-style left rail, italic text, source attribution |
| oxide-section | `oxide-section(title, body)` | Borderless section | Typography-only: title + copper divider + content (no box border) |
| rivet-row | `rivet-row(color: palette.rivet, width: 100%)` | Decorative separator | Row of brass rivet dots with highlight reflections |

## VII. Design Principles

| # | Principle | Rationale |
|---|-----------|-----------|
| 1 | Warm over cold | Copper and cream create warmth; avoid cold blue-tech aesthetics |
| 2 | Patina tells time | The copper-to-verdigris gradient represents transformation and history |
| 3 | Mechanical precision | Rivets, gauges, and blueprint elements convey engineering rigor |
| 4 | Layered depth | Shadows and gear backgrounds create a sense of industrial depth |
| 5 | Bookended narrative | Title and ending share pipe-frame + rivet-row elements for narrative arc |

## VIII. Design References

| Reference | Description |
|-----------|-------------|
| Statue of Liberty | Iconic verdigris patina development over time |
| Victorian engineering drawings | Blueprint-style technical illustration |
| Steampunk aesthetic | Brass gears, pipes, rivets, pressure gauges |
| Industrial Revolution machinery | Steam engines, copper boilers, brass instruments |

---

## Output Files

```
copper-patina/
├── template.typ          # Theme definition — colors, components, slide functions
├── demo.typ              # Compilable demonstration showcasing all components
├── theme_design_spec.md  # This specification document
└── theme.md              # API summary for downstream roles
```
