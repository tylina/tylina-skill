# Brutalist - Theme Design Specification

> **Purpose**: Visual and structural design spec for the Brutalist Touying theme. Inspired by Brutalist architecture: raw, exposed, honest. Heavy sans-serif type, exposed grid structures, monochrome with single accent.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | brutalist |
| **Page Format** | 16:9 Presentation (254mm x 142.9mm) |
| **Best For** | Design manifestos, architecture presentations, bold statements, data reports, tech critiques |
| **Style Objective** | Brutalist Architecture |
| **Complexity Level** | Canvas |
| **Created Date** | 2025-05-21 |

### Complexity Guide

This theme is **Canvas** level:
- `place()` + inline styling per page
- 11 reusable components referencing `palette.xxx`
- 40-100+ lines/slide for complex compositions
- Ghost numbers, stamps, exposed grids as decorative structure

## II. Page Specification

| Property | Value |
| -------- | ----- |
| **Format** | 16:9 Presentation |
| **Touying Setting** | `config-page(..utils.page-args-from-aspect-ratio("16-9"))` |
| **Margins** | top: 6em, bottom: 1.3em, x: 2em (standard slides) |

## III. Visual Theme

### Design Philosophy

"Nothing is hidden. Structure IS the decoration."

Inspired by Brutalist architecture (Le Corbusier, Tadao Ando, Boston City Hall). Every element is exposed and honest. Grid lines are features, not defects. Thick borders and heavy type weights create hierarchy through mass, not delicacy. Monochrome palette with exactly one accent color for emphasis. No rounded corners, no shadows, no gradients.

Weight hierarchy is intentionally inverted from Swiss/International Style: larger = heavier (bold/black), not lighter. This creates visual "mass" that mirrors concrete architecture.

### Color Scheme (palette dictionary)

#### Preset: `concrete` (default)

| Role | Color Name | HEX | `palette.key` | Purpose |
| ---- | ---------- | --- | ------------- | ------- |
| **Background** | Warm Concrete | `#E8E4E0` | `palette.bg` | Page background |
| **Ink** | Near Black | `#1A1A1A` | `palette.ink` | Primary text, titles, rules |
| **Accent** | Oxide Red | `#D4380D` | `palette.accent` | Accent bars, left borders |
| **Accent Text** | Deep Oxide | `#8C260D` | `palette.accent-text` | Readable accent text and alerts |
| **On Accent** | White | `#FFFFFF` | `palette.on-accent` | Small text on oxide fills |
| **Ink Light** | -- | ink@30% | `palette.ink-light` | Secondary text |
| **Ink Muted** | -- | ink@30% | `palette.ink-muted` | Kickers, metadata |
| **Ink Faint** | -- | ink@78% | `palette.ink-faint` | Faint borders, gridlines |
| **Ink Ghost** | -- | ink@92% | `palette.ink-ghost` | Ghost text |
| **Inverted** | -- | bg color | `palette.inv-text` | Text on dark backgrounds |

#### Preset: `carbon`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#1C1C1C` dark carbon | Dark mode base |
| **Ink** | `#F0EDE8` warm white | Light text on dark |
| **Accent** | `#00B4D8` cyan | Cool accent |

#### Preset: `formwork`

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#F5F0E8` plywood | Warm construction feel |
| **Ink** | `#2D2D2D` dark grey | Slightly softer than black |
| **Accent** | `#E6A817` construction yellow | Warning/industrial |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent-text` | Contrast-safe alert text |
| `neutral-lightest` | `palette.bg` | Light backgrounds |
| `neutral-darkest` | `palette.ink` | Dark text |

## IV. Typography System

### Font Plan

| Role | Font Stack | Typst Setting |
| ---- | ---------- | ------------- |
| **Primary** | IBM Plex Sans, Noto Sans SC | `set text(font: ("IBM Plex Sans", "Noto Sans SC"))` |
| **Mono** | IBM Plex Mono | Used internally for kickers/metadata |

> **Important**: Font is set ONLY in `demo.typ` / `main.typ`, NOT in `template.typ`. The template sets only `size`.

### Base Font Size

| Property | Value | Notes |
| -------- | ----- | ----- |
| **Base Size** | 20pt | Set via `set text(size: 20pt)` in theme entry point |

### Weight Hierarchy (Brutalist-specific)

| Element | Weight | Rationale |
|---------|--------|-----------|
| Display/Title | `"black"` (900) | Maximum visual mass |
| Headings | `"black"` (900) | Structure carries load |
| Body text | `"regular"` (400) | Readable baseline |
| Kickers/Meta | `"bold"` (700) | Monospace + bold for machine aesthetic |
| Stats/Numbers | `"black"` (900) | Data demands attention |

## V. Slide Type Definitions

### Cover Slide (`title-slide`)

- **Background**: Preset `bg` color, full page
- **Layout**: Left-aligned, vertically centered. Institution kicker, massive title, accent rule, subtitle, author/date
- **Decorative elements**: Ghost "B" letter (top-right, 220pt, ink-ghost), 6pt accent bar at top, 6pt ink bar at bottom
- **Typography**: Title at 2.6em black weight, subtitle at 22pt regular

### Section Slide (`new-section-slide`)

- **Background**: Preset `bg` color
- **Layout**: Left-aligned section title with accent rule below
- **Decorative elements**: Giant ghost section number (180pt, 90% transparent) at top-right, 6pt accent bar top, 6pt ink bar bottom
- **Numbering**: Via `utils.display-current-heading-number(level: 1, numbering: "01")`

### Content Slide (`slide`)

- **Background**: `palette.bg`
- **Header**: Mono metadata bar + heavy black title + full-width 4pt ink rule
- **Footer**: BRUTALIST label + ink square + page number
- **Content area**: Standard margins with body text
- **Persistent atmosphere**: faint 2x2 construction joint at top-right and a registration angle at bottom-left, always below content/footer

### Dark Slide (`dark-slide`)

- **Background**: `palette.ink`
- **Layout**: Same as content slide but inverted colors
- **Decorative elements**: 5pt accent bar at top, optional ghost number
- **Text**: Auto-set to `palette.inv-text` (bg color)

### Manifesto Slide (`manifesto-slide`)

- **Background**: `palette.bg`, no header/footer
- **Layout**: Left-aligned, vertically centered, massive text
- **Typography**: 2.8em black weight
- **Decorative elements**: 6pt accent bar top, 6pt ink bar bottom

### Grid Expose Slide (`grid-expose-slide`)

- **Background**: `palette.bg` with visible vertical grid lines
- **Layout**: Standard content slide with background structure visible
- **Decorative elements**: Vertical lines at the real `cols` column boundaries (0.75pt, ink-faint)
- **Header variants**: `header-left` and `header-right` replace the ordinary metadata when supplied

### Focus Slide (`focus-slide`)

- **Background**: `palette.bg`, no header/footer
- **Layout**: Centered text, horizontally and vertically
- **Typography**: 1.8em black weight
- **Decorative elements**: 5pt ink rules top and bottom, accent corner mark (left)

### Ending Slide (`ending-slide`)

- **Background**: `palette.bg`
- **Layout**: Centered heavy title with ink/accent rules
- **Decorative elements**: Ghost "END" text (220pt, 95% transparent), 6pt bars top/bottom, BRUTALIST meta label

## VI. Component Design

| Component | Signature | Purpose | Visual Description |
|-----------|-----------|---------|-------------------|
| `slab` | `slab(title, body, border-width: 5pt)` | Primary content card | Block with 5pt accent left border, bold title, body text |
| `kicker` | `kicker(body)` | Section label | Uppercase mono, bold, 2pt tracking, muted fill |
| `brutalist-rule` | `brutalist-rule(width: 100%, thickness: 5pt)` | Thick horizontal divider | Full-width ink block, 5pt default |
| `section-number` | `section-number(num, size: 140pt, opacity: 12%)` | Decorative large number | Oversized black weight at low opacity |
| `raw-stat` | `raw-stat(value, label)` | Data display | Giant black number + tiny mono label in one centered `stack(spacing:)`; no flexible spacer |
| `exposed-grid` | `exposed-grid(cols, ..children)` | Structural matrix | Native grid with visible cell borders (0.75pt); retained because the borders are the theme-specific treatment |
| `pull-quote` | `pull-quote(body, cite: none)` | Quotation | Bold text with 6pt accent left bar |
| `stamp` | `stamp(body, angle: -12deg, dx, dy)` | Overlay mark | Rotated black text at 30% accent opacity |
| `data-strip` | `data-strip(..items)` | Key-value strip | Horizontal pairs with thick ink dividers, top/bottom borders |
| `mono-label` | `mono-label(body)` | Metadata label | Small monospace, muted color |
| `ghost-num` | `ghost-num(num, dx, dy, size)` | Background number | Massive placed number at 7% opacity |

## VII. Design References

| Reference | Description |
|-----------|-------------|
| Le Corbusier -- Unite d'Habitation | Raw concrete facade, exposed structure |
| Tadao Ando -- Church of the Light | Minimal, honest materials |
| Boston City Hall | Monumental brutalist civic architecture |
| Massimo Vignelli -- Unigrid System | Exposed grid as design element |
| Adolf Loos -- Ornament and Crime | "Every surface must earn its place through function" |

---

## Output Files

```
brutalist/
  template.typ          # Theme definition -- palette, components, slide functions
  demo.typ              # Compilable demonstration showcasing all components
  theme_design_spec.md  # This specification document
  theme.md              # API summary and reference
```

> **Template-Content Separation**: `template.typ` contains ZERO content text. It defines colors, components, and slide types. Switching topics requires ZERO template changes.
