# Origami Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `origami-theme`
**Style**: Japanese paper-folding aesthetic -- geometric facets, crane motifs, crease lines
**Primary color**: `#C41E3A` (Crimson Red, default washi preset)
**Best For**: Japanese culture, paper craft, geometric design, architecture, meditation, creative workshops
**Style Objective**: Japanese Paper-Folding Aesthetic
**Complexity Level**: Canvas

## Description

A Japanese paper-folding aesthetic presentation theme with geometric faceted shapes, fold lines, paper texture feeling, and crane motifs. Colors drawn from traditional Japanese washi paper. Features triangular facets, crease-line dividers, angular geometries, and inline SVG decorative elements (fold patterns, crane watermark, faceted backgrounds, corner folds). Ships with 3 presets (washi, twilight, cloud) for different moods.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial"), size: 20pt)

#show: origami-theme.with(
  aspect-ratio: "16-9",
  preset: "washi",
  footer: [ORIGAMI],
  config-info(
    title: [The Art of Paper Folding],
    subtitle: [Traditional Techniques],
    author: [Author Name],
    date: datetime.today(),
    institution: [Workshop],
  ),
)

#title-slide()

= Fundamentals

== Basic Folds

Your content here.
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `preset` | string | `"washi"` | Preset: `"washi"`, `"twilight"`, `"cloud"` |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#title-slide()`
Crane-watermark cover with fold pattern, accent lines, paper-tag kicker, large bold title, and author/date metadata.

### `#slide(title: auto, align: auto)`
Standard slide with subtle fold-line frame, bold title with accent bar, and diamond-dot footer.

### `#dark-slide(title: auto)`
Twilight-colored dark variant with fold pattern decoration in background.

### `#new-section-slide[...]`
Faceted background with diamond-framed section number, crease divider, and paper-tag kicker. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Full accent-colored background with faceted pattern overlay, corner diamonds, and large bold centered text.

### `#ending-slide[...]`
Crane motif farewell with large watermark, accent rules, diamond decoration, and ORIGAMI label.

## Reusable Components

### `#origami-card(title, body)`
Card with triangular fold corner (SVG) and thin border.
```typst
#origami-card([Paper Types], [Traditional washi comes in many varieties...])
```

### `#facet-stat(value, label, pal: palette)`
Number in diamond shape with tracked label below.
```typst
#facet-stat([1,000], [CRANES FOLDED])
```

### `#crane-divider(width: 100%)`
Angular zigzag crease-line divider (SVG).
```typst
#crane-divider(width: 80%)
```

### `#fold-quote(body, cite: none, pal: palette)`
Quote with zigzag fold-line left border.
```typst
#fold-quote([One crane for each wish.], cite: "Japanese Proverb")
```

### `#tessellation-grid(items)`
Grid with alternating triangular accent fills (up to 3 columns).
```typst
#tessellation-grid(([Item 1], [Item 2], [Item 3]))
```

### `#paper-tag(body, color: palette.accent)`
Small folded-corner label pill.
```typst
#paper-tag([SECTION]) #paper-tag([NOTE], color: palette.secondary)
```

### SVG Rendering Functions

- `#fold-pattern(color, width, height)` -- Interconnected triangles
- `#crease-divider-render(color, width, height)` -- Zigzag crease line
- `#corner-fold-render(color, size)` -- Corner fold decoration
- `#crane-watermark(color, size)` -- Large crane motif
- `#facet-background(color, width, height)` -- Faceted triangle background

## Color Scheme

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary |
|--------|-----------|-----|--------|-----------|
| `washi` | `#F5F0E8` | `#2D2926` | `#C41E3A` | `#1B4332` |
| `twilight` | `#1A1A2E` | `#E8E0D4` | `#E6B325` | `#4A0E4E` |
| `cloud` | `#E8F0F2` | `#1A1A2E` | `#0077B6` | `#FF6B35` |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Page background |
| `palette.ink` | Primary text |
| `palette.accent` | Fold marks, diamond frames |
| `palette.secondary` | Bottom bars, secondary accents |
| `palette.ink-light` | 25% transparent text |
| `palette.ink-muted` | 50% transparent text |
| `palette.ink-faint` | 75% transparent (frame lines) |
| `palette.ink-ghost` | 90% transparent |
| `palette.accent-light` | 40% transparent accent |
| `palette.accent-faint` | 75% transparent accent |
| `palette.accent-ghost` | 90% transparent accent |
| `palette.surface` | 92% transparent ink (card bg) |
| `palette.divider` | 70% transparent ink |
| `palette.fold-shadow` | 85% transparent ink |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.ink,
  neutral-darkest: palette.bg,
)
```

## Files

- `template.typ` -- Theme definition (presets, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (paper folding topic)

## Demo

See `demo.typ` for a compilable example.
