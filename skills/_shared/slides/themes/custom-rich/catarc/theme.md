# CATARC Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `catarc-theme`
**Style**: Modern automotive industry, tech-forward — deep blue gradients with neon cyan accents
**Primary color**: `#003366` (deep blue)
**Best For**: Automotive industry presentations, product certification, technology promotion, EV reports
**Style Objective**: Consulting
**Complexity Level**: Rich

## Description

A modern, authoritative automotive industry theme inspired by CATARC (China Automotive Technology & Research Center). Features deep blue gradient backgrounds on covers and section dividers with clean white content slides, geometric tech line decorations, neon cyan accents, and card-based layouts for test results, metrics, and specifications. Perfect for automotive presentations, NEV certification reports, and technology promotion.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: catarc-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [CATARC],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#title-slide()`
Deep blue gradient cover with geometric tech line decorations, white title, cyan subtitle, red accent stripe at top-left corner, and subtle geometric circles.

### `#slide(title: auto)`
White content slide with blue gradient top bar (5pt), bold dark blue title with cyan gradient underline, footer with tech accent line and page numbers.

### `#new-section-slide[...]`
Deep blue radial gradient section divider with large semi-transparent section number on the right, "SECTION" label in cyan, white section title, red accent vertical bar, and tech line decorations (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Minimal dark slide with deep blue gradient background and centered bold white text.

### `#ending-slide[...]`
Blue gradient closing slide with large centered white text, cyan accent line, tech line decorations, and red accent dot.

## Reusable Components

### `#spec-card(number, title, description, accent: auto)`
Numbered specification card with colored left border and square number badge. For testing standards, product features, or technical specifications.

```typst
#spec-card(1, [Battery Safety Testing], [
  Covers thermal propagation, external fire, mechanical shock...
], accent: palette.tech)
```

### `#metric-card(label, value, unit: none, accent: palette.tech)`
Performance metric card with colored top border, large value display, and optional unit text.

```typst
#metric-card([Annual Production], [9.58M], unit: [units])
```

### `#test-result(title, status, body)`
Test/certification result card with pass/fail badge indicator. Left border color reflects status (green for pass, red for fail).

```typst
#test-result([Battery Safety Test], "pass")[
  - Thermal propagation: Warning time > 8 minutes
  - External fire: No ignition within 2 minutes
]
```

### `#highlight-box(title, body)`
Blue-accented information highlight box for key insights and summaries.

```typst
#highlight-box([Key Insight])[
  Market penetration exceeded 30% for the first time.
]
```

### `#data-table(headers, rows)`
Styled data table with deep blue header row and alternating white/cool gray rows.

```typst
#data-table(
  ([Standard], [Count], [New in 2024]),
  (([Safety], [28], [+5]), ([Performance], [22], [+3])),
)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Blue** | `#003366` | `palette.blue` | Deep blue, cover backgrounds, title text |
| **Tech** | `#0050B3` | `palette.tech` | Mid-blue, gradient bars, spec card default |
| **Bright** | `#007ACC` | `palette.bright` | Bright blue, primary Touying color |
| **Cyan** | `#00E5FF` | `palette.cyan` | Neon cyan accent, tech lines, dividers |
| **Red** | `#D32F2F` | `palette.red` | Red accent stripes, emphasis dots |
| **Background** | `#FFFFFF` | `palette.bg` | Slide background fill |
| **Background Cool** | `#F0F2F5` | `palette.bg-cool` | Alternating row backgrounds |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Component card surfaces |
| **Text Dark** | `#1A1A2E` | `palette.text-dark` | Dark heading/label text |
| **Text Body** | `#4A5568` | `palette.text-body` | Body text color |
| **Text Light** | `#718096` | `palette.text-light` | Footer, captions, muted text |
| **Border** | `#CBD5E0` | `palette.border` | Card and table borders |
| **Success** | `#2E7D32` | `palette.success` | Pass status badge color |
| **Fail** | `#C62828` | `palette.fail` | Fail status badge color |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.bright,
  neutral-lightest: white,
  neutral-darkest: palette.blue,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
