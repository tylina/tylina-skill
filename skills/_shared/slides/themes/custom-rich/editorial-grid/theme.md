# Editorial Grid

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `editorial-grid-theme`
**Style**: Strict editorial grid -- Bloomberg/Monocle/Economist precision typography
**Primary color**: `#E63946` (Editorial Red)
**Best For**: Data journalism, research presentations, media briefings, quarterly reports, thought leadership
**Style Objective**: General Versatile (editorial)
**Complexity Level**: Rich

## Description

A high-end editorial magazine theme that channels Bloomberg Businessweek, Monocle, and The Economist. Built on strict constraint: one accent color (red), inverse weight hierarchy (bigger text = lighter weight), monospace metadata, zero rounded corners, and a visible dot-grid background. Beauty from precision.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)

#show: editorial-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [EDITORIAL GRID],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |
| `align` | alignment | `horizon` | Default vertical alignment for slide content |

## Fonts

Fonts are configured in `demo.typ` / `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC", "Arial"), size: 18pt)
```

The theme internally uses:
- `("IBM Plex Mono", "Menlo", "DejaVu Sans Mono")` for kickers, metadata, page numbers, bylines, labels

## Available Slide Types

### `#title-slide()`
Pure paper background with dot-grid. Title in 44pt light weight, red square mark (8x8pt), author in monospace uppercase tracking. No header/footer.

### `#slide(title: auto)`
Standard content slide. Paper background, title in large LIGHT weight with 60pt red accent underline, monospace page number top-right, hairline rule at top. Footer: three-column grid with red square separator.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Section number in enormous (140pt) extra-light weight, section title in bold monospace uppercase. One thin red horizontal rule across center.

### `#focus-slide[...]`
Ink (dark) background, paper-colored text in large light weight, red accent line at corner. For key statements and dramatic emphasis.

### `#ending-slide[...]`
Paper background with dot-grid, centered large light-weight farewell text, red square mark above.

### `#outline-slide(title: [Contents])`
Clean table of contents with monospace numbering and red accent underline.

## Reusable Components

### `#hairline(color: palette.rule)`
Thin 0.3pt horizontal line across full width. Used as a visual separator.

```typst
#hairline()
```

### `#byline(body)`
Monospace uppercase tracked attribution text in gray. For sources and credits.

```typst
#byline[Source: Reuters Digital News Report 2025]
```

### `#metric-block(value, label, accent: palette.ink)`
Large light-weight number (48pt) with monospace label below. For KPI displays.

```typst
#metric-block([78%], [digital ad share])
#metric-block([-23%], [print decline], accent: palette.accent)
```

### `#data-card(label, value, description: none)`
Hairline-bordered card with monospace label, bold number, and optional description. Zero rounded corners.

```typst
#data-card([SUBSCRIBERS], [412M], description: [Global paid news subscriptions])
```

### `#red-callout(body)`
Left red border (3pt), no background fill. For editorial emphasis and key findings.

```typst
#red-callout[
  Print advertising declined 23% year-over-year in established markets.
]
```

### `#pull-quote(body, cite: none)`
Large italic light-weight text with thin left rule. Optional monospace uppercase citation.

```typst
#pull-quote([
  The average time spent with a single article has dropped to 47 seconds.
], cite: [Emma Tucker, Editor, The Sunday Times])
```

### `#dot-grid-bg(color: rgb("#1a1a1a"), dot-opacity: 4%)`
Subtle dot-grid background pattern. Used automatically in title/ending/section slides.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Ink** | `#1A1A1A` | `palette.ink` | Primary text, dark backgrounds |
| **Paper** | `#FAFAF8` | `palette.paper` | Page background (warm off-white) |
| **Accent** | `#E63946` | `palette.accent` | Editorial red -- single accent |
| **Gray** | `#8C8C8C` | `palette.gray` | Metadata, bylines |
| **Rule** | `#D4D4D2` | `palette.rule` | Hairline separators |
| **Ink Light** | 40% transparent | `palette.ink-light` | Secondary text |
| **Ink Faint** | 75% transparent | `palette.ink-faint` | Borders |
| **Ink Ghost** | 94% transparent | `palette.ink-ghost` | Ghost elements |

### Inverse Weight Hierarchy

| Size Range | Weight | Usage |
|---|---|---|
| >= 36pt | Light (300) / ExtraLight (200) | Display, hero, section numbers |
| 24-35pt | Light (300) | Slide titles |
| 16-23pt | Light-Regular (300-400) | Subtitles, quotes |
| 12-15pt | Regular-Medium (400-500) | Body |
| 8-11pt | Medium-Semibold (500-600) | Kickers, metadata |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,         // Editorial red
  neutral-lightest: palette.paper,  // Warm off-white
  neutral-darkest: palette.ink,     // Near-black
)
```

## Design Rules

1. **NO gradients** -- ever
2. **NO shadows** -- ever
3. **NO rounded corners** -- all `radius: 0pt`
4. **Red used sparingly** -- thin lines (2pt), small squares (8pt) -- NEVER large fills
5. **Inverse weight** -- bigger text = lighter weight
6. **Monospace for metadata** -- page numbers, kickers, bylines, labels

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example: "The State of Global Media in 2025"

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with Bloomberg/Economist-style data journalism content.
