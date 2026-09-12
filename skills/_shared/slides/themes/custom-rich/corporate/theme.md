# Corporate Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `corporate-theme`
**Style**: Polished, professional corporate — steel blue and gray tones
**Primary color**: `#1565C0` (strong blue)
**Best For**: Business reports, strategy decks, investor presentations
**Style Objective**: Consulting
**Complexity Level**: Rich

## Description

A polished, professional corporate theme inspired by McKinsey/BCG consulting slide decks. Steel blue and gray tones with structured layouts, KPI cards, data tables, pillar cards, and insight boxes. Perfect for business reports, strategy presentations, investor decks, and quarterly reviews.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: corporate-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Q4 Strategic Review],
    subtitle: [Annual Performance & Outlook],
    author: [Sarah Chen, CSO],
    date: datetime.today(),
    institution: [Apex Global Consulting],
  ),
)

#set text(font: ("Arial", "Noto Sans SC"))

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for ordinary content slides; override with `#slide(align: ...)` when needed |
| `footer` | content/function | `none` | Footer content (left-aligned; page numbers are automatic on the right) |

## Available Slide Types

### `#title-slide()`
Corporate cover page with a dark blue left sidebar (~35% width) displaying the title and subtitle in white, and a white right panel showing author, institution, and date.

### `#slide(title: auto)`
Standard content slide with a dark title, two-segment blue rule, subtle report-index ticks in the body area, and a three-part footer with institution, brand rule, and page counter.

### `#new-section-slide[...]`
Section divider with blue accent bands at top and bottom, a "Section" label, and large semibold heading. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Full-screen emphasis slide with dark blue (`#0D47A1`) background and semibold white text constrained to the safe content width.

### `#ending-slide[...]`
Closing slide with blue background, decorative lines, and bold centered text.

## Reusable Components

### `#kpi-card(label, value, trend: none, trend-color: none)`
Height-equalizable KPI metric card. Value, label, and optional trend are centered in one precisely spaced vertical stack. Place one card directly in each `#cols(lazy-layout: true)` column.

```typst
#kpi-card(
  [Revenue],
  [\$142M],
  trend: [#sym.arrow.t 12%],
  trend-color: palette.success,
)
```

### `#insight-box(title, body)`
Blue-accented insight/takeaway box with a left border. Ideal for executive summaries and key findings.

```typst
#insight-box([Key Takeaway])[
  Revenue exceeded forecast by 4%, driven by enterprise expansion.
]
```

### `#series-key(label, color: palette.primary)`
Compact chart-legend key with a rounded color swatch and secondary label text.

```typst
#series-key([Revenue], color: palette.primary)
```

### `#data-table(align: center + horizon, headers, rows)`
Styled table with blue header row and alternating row backgrounds. `headers` is an array of content values, `rows` is an array of arrays, and `align` can override cell alignment.

```typst
#data-table(
  align: left + horizon,
  ([Metric], [Q3], [Q4], [YoY]),
  (
    ([Revenue], [\$128M], [\$142M], [+12%]),
    ([EBITDA], [\$34M], [\$40M], [+18%]),
  ),
)
```

### `#pillar-card(number, title, description)`
Numbered pillar/step card with a blue circular number badge. Use for strategic pillars, process steps, or phased roadmaps. For equal heights, place one card directly in each `#cols(lazy-layout: true)` column.

```typst
#pillar-card(1, [Market Expansion], [
  Enter 3 new geographic markets in APAC.
])
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#1565C0` | `palette.primary` | Strong blue — header rules, accents |
| **Secondary** | `#1E88E5` | `palette.secondary` | Medium blue — secondary elements |
| **Accent** | `#0D47A1` | `palette.accent` | Dark blue — title slide sidebar, focus slide bg |
| **Background** | `#FAFAFA` | `palette.bg` | Off-white page background |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Card/panel background |
| **Gray Light** | `#F5F5F5` | `palette.gray-light` | Light gray — alternating table rows |
| **Gray Medium** | `#BDBDBD` | `palette.gray-medium` | Medium gray — borders |
| **Text Dark** | `#212121` | `palette.text-dark` | Near black — primary body text |
| **Text Light** | `#616161` | `palette.text-light` | Dark gray — secondary text, labels |
| **Success** | `#2E7D32` | `palette.success` | Green — positive KPI trends |
| **Danger** | `#C62828` | `palette.danger` | Red — negative KPI trends |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Typography and Font Ownership

The reusable theme sets only text size and colors; it intentionally does not choose a font family. Set a verified font stack in the deck entry file. The demo uses installed `Arial` for Latin text and `Noto Sans SC` for CJK fallback.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Full usage example (compilable)
- `theme.md` — This documentation

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
