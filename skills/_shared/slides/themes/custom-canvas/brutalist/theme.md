# Brutalist Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `brutalist-theme`
**Style**: Brutalist architecture / Raw concrete, heavy sans-serif, exposed structure
**Primary color**: Derived from preset (default `#1A1A1A` ink on `#E8E4E0` concrete, `#D4380D` accent)
**Best For**: Design manifestos, architecture presentations, bold statements, data reports, tech critiques
**Style Objective**: Brutalist Architecture
**Complexity Level**: Canvas

## Description

A brutalist architecture-inspired presentation theme with heavy sans-serif typography, exposed grid structures, and monochrome palette with a single accent color. No rounded corners, no shadows, no gradients. Visual hierarchy comes from weight (heavier = more important), thick rules, and raw structural elements.

Key features: built-in **dark-slide**, **manifesto-slide** (full-page bold statement), and **grid-expose-slide** (visible structural gridlines) functions with automatic color inversion, ghost number placement, and persistent exposed-joint marks on ordinary slides.

Design philosophy: "Nothing is hidden. Structure IS the decoration."

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("concrete")

#show: brutalist-theme.with(
  aspect-ratio: "16-9",
  preset: "concrete",
  footer: self => self.info.institution,
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [YOUR ORG],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content goes here.

// Manifesto slide -- full-page bold statement
#manifesto-slide[
  Nothing is hidden.
  Structure IS the decoration.
]

// Dark slide with ghost number
#dark-slide(ghost: [01], header-left: [TOPIC], header-right: [2025])[
  #text(size: 36pt, weight: "black")[A bold claim.]
]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | string | `"concrete"` | Color preset name |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#slide(title: auto, align: auto)`

Standard LIGHT content slide. Heavy black title with thick ink rule below, mono chrome header (metadata + page number), brutalist footer. Title auto-detects from `== Heading`.

```typst
== My Slide Title
Content here...
```

### `#dark-slide(title: auto, ghost: none, ...)`

Dark variant with ink background, inverted text, accent bar at top. All text inside automatically set to bg color.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (set to `none` for no title) |
| `ghost` | none/content | `none` | Ghost text/number shown in background |
| `ghost-dx` | length | `-20pt` | Ghost text horizontal offset |
| `ghost-dy` | length | `-40pt` | Ghost text vertical offset |
| `ghost-size` | length | `220pt` | Ghost text font size |
| `header-left` | none/content | `none` | Custom left header text |
| `header-right` | none/content | `none` | Custom right header text |

```typst
#dark-slide(
  ghost: [47],
  header-left: [DATA],
  header-right: [BRUTALIST 2025],
)[
  #text(size: 42pt, weight: "black")[72% of ornament is crime.]
]
```

### `#manifesto-slide[...]`

Full-page bold statement slide. Massive black text, left-aligned, with accent bar at top and ink bar at bottom. For proclamations and design principles.

```typst
#manifesto-slide[
  Nothing is hidden. #linebreak()
  Structure IS the decoration.
]
```

### `#grid-expose-slide(title: auto, cols: 3, ...)`

Content slide with visible background grid lines as a structural element. The `cols` argument controls the real page grid, and the custom header arguments replace the normal institution/page metadata for this slide type.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title |
| `cols` | integer | `3` | Number of grid columns (visible lines) |
| `header-left` | none/content | `none` | Custom left header text |
| `header-right` | none/content | `none` | Custom right header text |

```typst
#grid-expose-slide(
  title: [Grid Analysis],
  cols: 4,
  header-left: [STRUCTURE LOG],
  header-right: [GRID 04],
)[
  Content with visible grid lines in background...
]
```

### `#title-slide()`

Full-page cover with massive black title, accent rule, ghost "B" letter, institution kicker, author/date metadata. Accent bar at top, ink bar at bottom.

```typst
#title-slide()
```

### `#new-section-slide[...]`

Section divider with oversized ghost section number, tracked kicker label, heavy section title, accent rule. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`

Full-page centered statement with heavy black text, thick ink rules at top and bottom, accent corner mark.

```typst
#focus-slide[
  The weight of a word
  is measured in concrete.
]
```

### `#ending-slide[...]`

Closing page with centered heavy title, ink/accent rules, ghost "END" text, BRUTALIST meta label.

```typst
#ending-slide[Thank You]
```

## Reusable Components

### `#slab(title, body, border-width: 5pt)`

Heavy block card with thick left accent border. The primary content container for brutalist layouts.

```typst
#slab([Honesty], [Materials should appear as they are. No veneer.])
```

### `#kicker(body)`

Uppercase monospace label with bold weight and wide tracking. Place above titles for context.

```typst
#kicker[DESIGN MANIFESTO]
```

### `#brutalist-rule(width: 100%, thickness: 5pt)`

Thick horizontal ink rule. Default 5pt thickness.

```typst
#brutalist-rule()
#brutalist-rule(width: 60pt, thickness: 3pt)
```

### `#section-number(num, size: 140pt, opacity: 12%)`

Oversized sans-serif number at low opacity for decorative numbering.

```typst
#section-number(1)
#section-number(42, size: 200pt, opacity: 8%)
```

### `#raw-stat(value, label)`

Giant number + tiny uppercase mono label in one centered `stack(spacing:)`. The component has no flexible spacer, so use ordinary `cols` when several metrics sit above unrelated following content.

```typst
#raw-stat([340], [Projects Completed])
```

### `#exposed-grid(cols, ..children)`

Grid with visible gridlines (cell borders) as a design element. This theme-specific wrapper is retained because it adds measured structural borders to every matrix cell; use ordinary `cols` for borderless semantic columns.

```typst
#exposed-grid(3,
  [Phase 01: Foundation],
  [Phase 02: Structure],
  [Phase 03: Finish],
)
```

### `#pull-quote(body, cite: none)`

Large bold text with heavy left accent bar (6pt). Optional citation in uppercase mono.

```typst
#pull-quote([
  Ornament is crime. Every surface must earn its place.
], cite: [Adolf Loos])
```

### `#stamp(body, angle: -12deg, dx: 0pt, dy: 0pt)`

Rotated bold text overlay, like an architectural approval stamp. Accent color at 30% opacity.

```typst
#stamp[APPROVED]
#stamp([DRAFT], angle: -8deg, dx: -60pt, dy: 40pt)
```

### `#data-strip(..items)`

Horizontal strip of key-value pairs separated by thick dividers. Each item is a 2-element array: `("Label", [Value])`.

```typst
#data-strip(
  ("Material", [Exposed Concrete]),
  ("Load", [47 kN/m2]),
  ("Finish", [Board-Formed]),
  ("Year", [2025]),
)
```

### `#mono-label(body)`

Small monospace metadata label for references and annotations.

```typst
#mono-label[REF: STRUCTURAL ANALYSIS 2025]
```

### `#ghost-num(num, dx: 0pt, dy: 0pt, size: 200pt)`

Massive background number at 7% opacity. Uses `place()` for background positioning.

```typst
#ghost-num(42, dx: -20pt, dy: -10pt)
```

## Palette System

### `build-palette(preset-name)`

Exposed factory function. Returns a full palette dictionary from a preset name.

```typst
#let pal = build-palette("concrete")
// Access: pal.bg, pal.ink, pal.accent, pal.ink-light, etc.
```

### Preset Dictionary

| Preset | Background | Ink | Accent | Best For |
|--------|-----------|-----|--------|----------|
| `concrete` | `#E8E4E0` warm concrete | `#1A1A1A` near-black | `#D4380D` oxide red | Architecture, design critique |
| `carbon` | `#1C1C1C` dark carbon | `#F0EDE8` warm white | `#00B4D8` cyan | Tech, engineering, night mode |
| `formwork` | `#F5F0E8` plywood | `#2D2D2D` dark grey | `#E6A817` construction yellow | Construction, industrial, warning |

### Derived Palette Keys

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `palette.bg` | base | Page background |
| `palette.ink` | base | Primary text, titles, rules |
| `palette.accent` | base | Accent color, left borders, bars |
| `palette.accent-text` | preset-specific contrast color | Accent-colored text and Touying alerts |
| `palette.on-accent` | preset-specific contrast color | Small text placed on solid accent fills |
| `palette.ink-light` | ink @ 30% transparent | Secondary text |
| `palette.ink-muted` | ink @ 30% transparent | Kicker labels, metadata |
| `palette.ink-faint` | ink @ 78% transparent | Faint borders, gridlines |
| `palette.ink-ghost` | ink @ 92% transparent | Ghost text, background marks |
| `palette.accent-light` | accent @ 40% transparent | Light accent elements |
| `palette.accent-faint` | accent @ 80% transparent | Very faint accent marks |
| `palette.surface` | ink @ 94% transparent | Subtle surface fills |
| `palette.divider` | ink @ 65% transparent | Grid dividers |
| `palette.inv-text` | bg | Inverted text (dark slides) |
| `palette.inv-muted` | bg @ 30% transparent | Muted inverted text |
| `palette.inv-faint` | bg @ 80% transparent | Faint inverted elements |
| `palette.inv-ghost` | bg @ 92% transparent | Ghost elements on dark |

## Typography Constants

Available via the `typo` dictionary:

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 48pt | Hero/manifesto text |
| `typo.h1` | 32pt | Main title |
| `typo.h2` | 22pt | Subtitle, pull quote |
| `typo.body` | 16pt | Body text, slab titles |
| `typo.kicker-size` | 9pt | Kicker label |
| `typo.meta-size` | 8pt | Metadata, mono-label |
| `typo.stat-size` | 56pt | raw-stat number |
| `typo.ghost-size` | 140pt | section-number default |

## Fonts

Configure the primary font in your document:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)
```

The reusable entry point does not set the document font. Components inherit the document's sans stack; administrative chrome and mono labels use the verified installed `"IBM Plex Mono"` family.

## Design Principles

1. **No rounded corners** -- Every corner is 90 degrees
2. **No shadows** -- Depth comes from weight and overlap
3. **No gradients** -- Flat fills only
4. **Weight hierarchy** -- Larger elements use heavier weights (opposite of Swiss)
5. **Exposed construction** -- Grid lines and borders are features, not defects
6. **Monochrome + one accent** -- Two neutrals plus exactly one accent color
7. **Monospace metadata** -- All administrative text uses monospace

## Files

- `template.typ` -- Theme definition (palette, components, slides, entry point)
- `demo.typ` -- Compilable showcase demonstrating all slide types and components

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
