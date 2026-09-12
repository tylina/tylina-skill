# McKinsey Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `mckinsey-theme`
**Style**: Premium, minimalist consulting with structured analytical design
**Primary color**: `#005587` (McKinsey Blue)
**Best For**: Strategic consulting, executive briefings, investment analysis, business proposals
**Style Objective**: MBB Consulting
**Complexity Level**: Rich

## Description

A premium, data-driven consulting theme inspired by McKinsey & Company's structured, analytical presentation style. Features clean whitespace, action titles, MECE framework support, and amber takeaway boxes. Designed for executive briefings, strategic consulting, investment analysis, and business proposals.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: mckinsey-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("Arial", "Helvetica"))

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content |
| `..args` | Touying config | — | Additional configuration such as `config-info(...)` or `config-common(...)` |

## Available Slide Types

### `#title-slide()`
Clean white cover with left blue accent bar, subtle geometric rectangle decorations, blue underline, and bottom amber accent line.

### `#slide(title: auto, align: auto, ..args)`
Content slide with thin 4pt blue top bar, bold title with subtle 2pt underline, and footer with page numbers.

### Automatic section divider
`= Section Heading` creates a blue divider with a left amber accent bar, white title, and bottom amber line. Do not call `new-section-slide` directly.

### `#focus-slide[...]`
Full blue background with large centered white text and subtle geometric decorations.

### `#ending-slide[...]`
Clean white closing slide with centered text, blue underline, and subtle geometric decorations.

## Reusable Components

### `#takeaway-box(content)`
Amber left-border box for slide-level key takeaways. Place at top of slides to state the "so what."

```typst
#takeaway-box[Revenue growth has stalled at 3% due to declining customer retention]
```

### `#kpi-card(label, value, trend: none, accent: palette.blue)`
Clean metric card with left accent bar and optional trend indicator. It ends with one `lazy-v(1fr)`, which is active only when the card is the sole component in a `cols(lazy-layout: true)` column.

```typst
#kpi-card([Revenue], [\$2.4B], trend: [▲ 12% YoY], accent: palette.success)
```

### `#insight-box(title, body)`
Blue left-border box for key insights and analytical observations. Its terminal `lazy-v(1fr)` is inert in ordinary vertical stacks.

```typst
#insight-box([Market Analysis])[The addressable market is growing at 8% CAGR.]
```

### `#framework-box(title, body)`
Teal left-border box for structured framework displays (MECE, SCQA, process flows). Its terminal `lazy-v(1fr)` is inert in ordinary vertical stacks.

```typst
#framework-box([SCQA Framework])[
  *Situation:* Market share has grown 5%\
  *Complication:* Two new entrants disrupting pricing\
  *Question:* How should we defend share?\
  *Answer:* Invest in differentiation
]
```

### `#pillar-card(number, title, description)`
Numbered strategic pillar with blue top accent and circular number badge. Its terminal `lazy-v(1fr)` is used only in one-card-per-column lazy layouts.

```typst
#pillar-card(1, [Digital Transformation], [Modernize core platforms.])
```

### `#data-table(align: center + horizon, headers, rows)`
Clean styled table with blue header row and alternating row backgrounds.

```typst
#data-table(
  ([Metric], [Q1], [Q2], [Q3]),
  (([Revenue], [\$580M], [\$620M], [\$695M]),),
)
```

### `#status-badge(label, color: palette.success)`
Small colored badge for status indicators in tables and trackers.

```typst
#status-badge([On Track])
#status-badge([At Risk], color: palette.amber)
```

### `#progress-bar(percentage, color: palette.blue, height: 8pt)`
Horizontal progress indicator for project tracking.

```typst
#progress-bar(75, color: palette.success)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Blue** | `#005587` | `palette.blue` | McKinsey Blue — primary accent, headers |
| **Teal** | `#004D5C` | `palette.teal` | Dark teal — framework box accent |
| **Amber** | `#F5A623` | `palette.amber` | Amber gold — takeaway boxes, section accents |
| **Background** | `#FFFFFF` | `palette.bg` | White page background |
| **Background Light** | `#ECF0F1` | `palette.bg-light` | Light gray — alternating rows |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card surfaces |
| **Border** | `#D5D8DC` | `palette.border` | Light border color |
| **Text Dark** | `#333333` | `palette.text-dark` | Dark text — titles, headings |
| **Text Body** | `#5A5A5A` | `palette.text-body` | Body text color |
| **Text Light** | `#737373` | `palette.text-light` | Muted text — footers, labels |
| **Success** | `#27AE60` | `palette.success` | Green — positive indicators |
| **Success Text** | `#1E7F46` | `palette.success-text` | Accessible green foreground on light cards |
| **Danger** | `#E74C3C` | `palette.danger` | Red — negative indicators |
| **Danger Text** | `#C83C30` | `palette.danger-text` | Accessible red foreground on light cards |
| **Amber Text** | `#A96500` | `palette.amber-text` | Accessible amber foreground on light cards |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.blue,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
