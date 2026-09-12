# Newspaper Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | newspaper |
| **Best For** | Journalism, news reporting, media analysis, editorial commentary, data journalism |
| **Style Objective** | Classic Broadsheet Newspaper |
| **Complexity Level** | Canvas |

A classic broadsheet newspaper layout theme with multi-column typesetting, serif headlines, justified body text, rule lines, and "above the fold" prominence hierarchy. Masthead-style title slides with typographic ornaments. Ships with 3 presets (broadsheet/NYT, tabloid/red-top, financial/FT salmon) switchable via a single parameter. Features inline SVG ornamental assets.

## Design Philosophy

- **Broadsheet Typography**: Serif headlines (Libertinus Serif in the demo) with justified body text and dateline metadata
- **Column Rules**: Diamond-ornament vertical separators between columns replicate newspaper multi-column layout
- **"Above the Fold" Hierarchy**: Masthead rules, dateline positioning, and headline sizing create newspaper-like information architecture
- **Ink & Paper System**: Near-black ink on warm off-white paper, with accent color for editorial emphasis

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Off-white (broadsheet bg) | `#FBF9F1` | Page background (broadsheet) |
| Near Black (broadsheet ink) | `#1A1A1A` | Primary text and rules |
| Dark Red (broadsheet accent) | `#8B0000` | Editorial accent, pull-quote borders |
| Navy (broadsheet secondary) | `#003366` | Secondary elements |
| White (tabloid bg) | `#FFFFFF` | Tabloid background |
| Black (tabloid ink) | `#000000` | Tabloid text |
| Red (tabloid accent) | `#FF0000` | Tabloid accent (red-top) |
| Gold (tabloid secondary) | `#FFD700` | Tabloid secondary |
| Salmon (financial bg) | `#FFF5F0` | FT-style salmon background |
| Saddle Brown (financial secondary) | `#8B4513` | Financial secondary tone |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: newspaper-theme.with(
  aspect-ratio: "16-9",
  preset: "broadsheet",
  footer: [The Daily Report],
  config-info(
    title: [The Daily Report],
    subtitle: [Breaking News and Analysis],
    author: [Editorial Staff],
    date: datetime.today(),
    institution: [Press Corp],
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"broadsheet"` | Color preset: `"broadsheet"`, `"tabloid"`, `"financial"` |
| `footer` | `content/function` | `none` | Footer content or function |
| `align` | `alignment` | `horizon` | Default content alignment |

## Slide Functions

### `title-slide(..args)`
Full masthead layout with newspaper name in tracked uppercase serif (48pt), typographic ornament flourish, double rules (thick + thin) top and bottom, dateline left/right metadata, edition number, author byline with decorative rule, and subtitle in italic. Resembles a newspaper front page masthead.

### `slide(title: auto, align: auto, ..args)`
Standard newsprint slide with dateline header (monospace metadata, page counter, bold serif title, thin rule), bottom footer with "THE DAILY REPORT" label, diamond separator, and page number.

### `dark-slide(title: auto, ghost: none, ghost-size: 180pt, ghost-dx, ghost-dy, header-left: none, header-right: none, ..args)`
Inverted dark background slide (printing plate/negative style) with optional large ghost serif character, custom header labels, and all text in paper color.

### `new-section-slide(self: none, body)`
Section front styled like a newspaper section header. Double rules top/bottom, "SECTION" monospace label, large serif section title (56pt bold), short accent-colored rule. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Large editorial-style quotation. Top/bottom thick rules, giant ghost opening quote mark (120pt), centered italic serif text (1.6em). For impactful editorial statements.

### `ending-slide(body)`
Colophon-style ending with journalism "-- 30 --" tradition (180pt ghost text), masthead ornament, thick serif farewell title, decorative rules, and "END OF EDITION" label.

## Reusable Components

### `column-rule(height: 160pt)`
Vertical separator with center diamond ornament (inline SVG). For separating newspaper columns.

```typst
#column-rule(height: 120pt)
```

### `masthead-ornament()`
Decorative typographic flourish (inline SVG) with lines, dots, and diamond. For headers and section breaks.

```typst
#masthead-ornament()
```

### `edition-marker(vol: "I", no: "1")`
Decorative Vol./No. frame element with monospace text inside double-border SVG box.

```typst
#edition-marker(vol: "II", no: "4")
```

### `headline-card(title, body, accent-rule: true)`
Card with bold serif headline (16pt), optional thin rule below, and justified body text.

```typst
#headline-card([Market Rally Continues], [
  Stocks surged for the fifth consecutive day...
])
```

### `edition-stat(value, label, description: none)`
Large bold serif number (42pt) with small dateline label above and optional description below.

```typst
#edition-stat([3.2%], [GROWTH RATE], description: [Year-over-year GDP increase])
```

### `pull-quote(body, cite: none)`
Large italic serif quote with 2.5pt accent left border and optional monospace citation.

```typst
#pull-quote([The market is never wrong.], cite: "Jesse Livermore")
```

### `byline-tag(author, date: none)`
Small caps monospace author/date attribution tag.

```typst
#byline-tag([JOHN SMITH], date: [May 24, 2026])
```

### `masthead-block(name, date: none, edition: none, subtitle: none)`
Full-width newspaper masthead header with name, date, edition, subtitle, and double rules.

```typst
#masthead-block([THE DAILY], date: [May 24, 2026], subtitle: [All the News That Fits])
```

### `news-grid(cols: 2, ..children)`
Single-row multi-column layout with ornamental column-rule separators between children. The number of children must match `cols`.

```typst
#news-grid(cols: 3,
  headline-card([Story 1], [Content...]),
  headline-card([Story 2], [Content...]),
  headline-card([Story 3], [Content...]),
)
```

### `classified-box(title, body)`
Dense small-text bordered box styled like classified ads.

```typst
#classified-box([NOTICES], [Meeting at 3pm. All members welcome. Refreshments provided.])
```

## Helper Functions

### `build-palette(preset-name)`
Constructs full palette from preset name. Derives: ink-light, ink-muted, ink-faint, ink-ghost, rule-color, rule-thin, card-bg, meta-color.

## Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `broadsheet` | `#FBF9F1` | `#1A1A1A` | `#8B0000` | `#003366` | NYT, quality press |
| `tabloid` | `#FFFFFF` | `#000000` | `#FF0000` | `#FFD700` | Red-top, sensational |
| `financial` | `#FFF5F0` | `#1A1A1A` | `#1A1A1A` | `#8B4513` | FT, business/finance |

## Typography Constants

| Name | Size | Usage |
|------|------|-------|
| masthead | 48pt | Newspaper name |
| headline | 32pt | Section headlines |
| subhead | 22pt | Sub-headlines |
| lead | 16pt | Card titles, leads |
| body | 13pt | Body text |
| caption | 10pt | Captions |
| dateline | 8pt | Metadata, bylines |
| classified | 9pt | Small classified text |

## File Structure

```
newspaper/
  template.typ   -- Theme definition (presets, SVGs, components, slides)
  demo.typ       -- Full demonstration presentation
```
