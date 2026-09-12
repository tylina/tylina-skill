# Newspaper Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `newspaper-theme`
**Style**: Classic broadsheet newspaper -- serif headlines, column rules, masthead ornaments
**Primary color**: `#8B0000` (Dark Red, default broadsheet preset)
**Best For**: Journalism, news reporting, media analysis, editorial commentary, data journalism
**Style Objective**: Classic Broadsheet Newspaper
**Complexity Level**: Canvas

## Description

A classic broadsheet newspaper layout theme with multi-column typesetting, serif headlines (Libertinus Serif in the demo), justified body text, rule lines, and "above the fold" prominence hierarchy. Features inline SVG ornaments (column-rule diamond, masthead flourish, edition marker frame), masthead-style title slides, dark-slide (printing plate), and a news-grid component for multi-column layouts. Ships with 3 presets (broadsheet, tabloid, financial).

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Libertinus Serif", size: 18pt)

#show: newspaper-theme.with(
  aspect-ratio: "16-9",
  preset: "broadsheet",
  footer: [The Daily Report],
  config-info(
    title: [The Daily Report],
    subtitle: [Analysis and Commentary],
    author: [Editorial Staff],
    date: datetime.today(),
    institution: [Press Corp],
  ),
)

#title-slide()

= Front Page

== Lead Story

#news-grid(cols: 2,
  headline-card([Story Title], [Body text...]),
  headline-card([Second Story], [More text...]),
)
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `preset` | string | `"broadsheet"` | Preset: `"broadsheet"`, `"tabloid"`, `"financial"` |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#title-slide()`
Full masthead with newspaper name (48pt tracked uppercase serif), ornament flourish, double rules, dateline, edition, author byline, and subtitle.

### `#slide(title: auto, align: auto)`
Standard newsprint slide with dateline header, bold serif title, thin rule, and diamond-separator footer.

### `#dark-slide(title: auto, ghost: none, ghost-size: 180pt, header-left: none, header-right: none)`
Inverted dark slide (printing plate style) with optional ghost serif character.

### `#new-section-slide[...]`
Section front with double rules, SECTION label, large serif title, and accent rule. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Large editorial quote with ghost quotation mark, top/bottom rules, and centered italic serif text.

### `#ending-slide[...]`
Colophon ending with "-- 30 --" tradition, masthead ornament, and "END OF EDITION" label.

## Reusable Components

### `#column-rule(height: 160pt)`
Vertical separator with center diamond ornament (SVG).
```typst
#column-rule(height: 120pt)
```

### `#masthead-ornament()`
Decorative typographic flourish SVG.
```typst
#masthead-ornament()
```

### `#edition-marker(vol: "I", no: "1")`
Vol./No. decorative frame element.
```typst
#edition-marker(vol: "II", no: "4")
```

### `#headline-card(title, body, accent-rule: true)`
Card with bold serif headline and justified body text.
```typst
#headline-card([Market Rally], [Stocks surged for the fifth day...])
```

### `#edition-stat(value, label, description: none)`
Large bold number with dateline label.
```typst
#edition-stat([3.2%], [GDP GROWTH], description: [Year-over-year])
```

### `#pull-quote(body, cite: none)`
Italic quote with accent left border and citation.
```typst
#pull-quote([The market is never wrong.], cite: "J. Livermore")
```

### `#byline-tag(author, date: none)`
Author/date attribution tag.
```typst
#byline-tag([JOHN SMITH], date: [May 24, 2026])
```

### `#masthead-block(name, date: none, edition: none, subtitle: none)`
Full-width newspaper masthead header with double rules.
```typst
#masthead-block([THE DAILY], date: [May 24, 2026])
```

### `#news-grid(cols: 2, ..children)`
Single-row multi-column layout with ornamental column-rule separators. Pass exactly one child for each requested column.
```typst
#news-grid(cols: 3, [Col 1], [Col 2], [Col 3])
```

### `#classified-box(title, body)`
Dense bordered box like classified ads.
```typst
#classified-box([NOTICES], [Meeting at 3pm. All welcome.])
```

## Color Scheme

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary |
|--------|-----------|-----|--------|-----------|
| `broadsheet` | `#FBF9F1` | `#1A1A1A` | `#8B0000` | `#003366` |
| `tabloid` | `#FFFFFF` | `#000000` | `#FF0000` | `#FFD700` |
| `financial` | `#FFF5F0` | `#1A1A1A` | `#1A1A1A` | `#8B4513` |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Page background |
| `palette.ink` | Primary text and rules |
| `palette.accent` | Editorial accent |
| `palette.secondary` | Secondary elements |
| `palette.ink-light` | 30% transparent ink |
| `palette.ink-muted` | 55% transparent ink |
| `palette.ink-faint` | 80% transparent ink |
| `palette.ink-ghost` | 93% transparent (ghost text) |
| `palette.rule-color` | 65% transparent (main rules) |
| `palette.rule-thin` | 50% transparent (thin rules) |
| `palette.card-bg` | 3% darkened background |
| `palette.meta-color` | 45% transparent (metadata) |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.ink,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (presets, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (news reporting topic)

## Demo

See `demo.typ` for a compilable example.
