# CMB Bank Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `cmb-bank-theme`
**Style**: Brand-consistent financial, red brand identity with clean white content slides
**Primary color**: `#C8152D` (CMB red)
**Best For**: Banking product introductions, financial solution reports, customer case studies
**Style Objective**: Consulting
**Complexity Level**: Rich

## Description

A brand-consistent financial presentation theme inspired by China Merchants Bank (招商银行). Uses a hybrid approach with brand-red gradient backgrounds for high-impact slides (cover, chapter dividers, ending) and clean white content slides. Finance blue accents drive data storytelling and case studies, while structured card layouts and process flows convey banking professionalism.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: cmb-bank-theme.with(
  aspect-ratio: "16-9",
  footer: [招商银行 · 交易银行部],
  config-info(
    title: [交易银行综合金融服务方案],
    subtitle: [Transaction Banking Financial Services],
    author: [招商银行交易银行部],
    date: datetime.today(),
    institution: [China Merchants Bank],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content |
| `..args` | arguments | — | Additional Touying configuration such as `config-info(...)` |

## Available Slide Types

### `#title-slide()`
Red gradient cover with centered white card containing title in deep red, subtitle, red-signal-blue triple accent line, author, institution, date, and decorative translucent circles.

### `#slide(title: auto)`
White content slide with a 4pt red brand bar at top, bold dark title with red underline accent, and a measured three-part footer with decorative accent and page numbers.

### `#new-section-slide[...]`
Red gradient section divider with large semi-transparent section number (auto-counted), white section title with accent bar, and decorative circles (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Full-page red gradient slide with large centered bold white text constrained to 80% width for key messages or quotes.

### `#ending-slide[...]`
Red gradient closing slide with large centered white text, decorative tapered accent lines, and translucent circles.

## Reusable Components

### `#product-card(title, body, accent: palette.red)`
Financial product card with colored left border accent for product features and service descriptions.

```typst
#product-card([Cash Management], [
  Full-service cash management with real-time pooling
  and intelligent payment routing.
])
```

### `#metric-card(label, value, trend: none, accent: palette.blue)`
Financial metric display card with a colored top border and a centered value → label stack. The optional `trend` appears beside the value in green.

```typst
#metric-card([Revenue Growth], [12.5%], trend: [+2.3%])
```

### `#case-card(title, body)`
Customer case study card with blue left border and light blue background for presenting client scenarios.

```typst
#case-card([Client Background], [
  A Fortune 500 manufacturer with *180+* subsidiaries.
])
```

### `#process-flow(steps)`
Horizontal process flow diagram with numbered red step circles connected by arrows. It is best suited to two through six concise steps on a 16:9 slide.

```typst
#process-flow(("Application", "Review", "Approval", "Disbursement"))
```

### `#fin-table(align: center + horizon, headers, rows)`
Financial data table with red header row and alternating white/light gray row backgrounds.

```typst
#fin-table(
  ([Product], [Rate], [Term]),
  (
    ([Working Capital], [3.8%], [12 months]),
    ([Trade Finance], [3.2%], [6 months]),
  ),
)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Red** | `#C8152D` | `palette.red` | Brand red, primary accent, header bar, process flow circles |
| **Deep Red** | `#8F0F1B` | `palette.deep-red` | Title slide gradient endpoint, dark text on light backgrounds |
| **Signal** | `#E26A74` | `palette.signal` | Red-pink signal accent, triple accent line, process arrows |
| **Blue** | `#2175D9` | `palette.blue` | Finance blue, metric cards, case study cards |
| **Background** | `#FFFFFF` | `palette.bg` | White slide background |
| **Light Background** | `#F5F5F5` | `palette.bg-light` | Alternating table rows, metric card fills |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Product card fill |
| **Text Dark** | `#1F1F1F` | `palette.text-dark` | Primary heading and label text |
| **Text Body** | `#4A4A4A` | `palette.text-body` | Body text, descriptions |
| **Text Light** | `#6F6F6F` | `palette.text-light` | Footer text, metadata (5.02:1 on white) |
| **Border** | `#E9E9E9` | `palette.border` | Card and table borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.red,
  neutral-lightest: white,
  neutral-darkest: palette.deep-red,
)
```

## Layout Guidance

- Use `grid()` for intrinsic KPI matrices built from `metric-card`.
- Use `cols(lazy-layout: true)` only for a single row where every column contains exactly one `product-card` or `case-card`.
- Use ordinary `cols` when a column contains multiple narrative components.

## Fonts

The template is font-agnostic. The demo uses the installed `("Arial", "Noto Sans SC")` stack for Latin and Simplified Chinese text; downstream decks may set another verified font stack before the theme show rule.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — 16-page compilable usage example covering every public slide type and component
- `theme.md` — Concise API reference
- `theme_design_spec.md` — Visual and implementation specification

## Demo

See `demo.typ` for a compilable example, including trend-present and trend-absent KPIs, red/blue accent variants, short and long Chinese labels, a corrected Lilaq chart, and the focus-slide width guard.
