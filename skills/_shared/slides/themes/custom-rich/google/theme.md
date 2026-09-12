# Google Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `google-theme`
**Style**: Vibrant, data-driven — Google brand design system
**Primary color**: `#4285F4` (Google Blue)
**Best For**: Tech reports, annual reviews, product launches, data-heavy presentations
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A vibrant, data-driven theme inspired by Google's brand design system. Features the signature four-color palette (Blue, Red, Yellow, Green), gradient top bar, color-coded number badges, and KPI data cards. Perfect for tech reports, annual reviews, product launches, and data-heavy presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: google-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Light gradient cover with centered white card, left four-color vertical bar, Google-style colorful title letters, and four-color underline.

### `#slide(title: auto)`
Content slide with four-color gradient top bar, deep-blue title with blue underline, and footer with centered four-color dots and page numbers.

### `#new-section-slide[...]`
Dark navy gradient divider with left four-color vertical bar, large section number, white title, and bottom colored dots (auto-triggered by `= Heading`).

### `#outline-slide(title: [Contents], items)`
Table of contents with color-coded circular number badges cycling blue→red→yellow→green.

### `#focus-slide[...]`
Full-screen deep blue gradient slide with bold white centered text.

### `#ending-slide[...]`
Light gradient closing slide with centered white card, blue title text, and four-color line decoration.

## Reusable Components

### `#kpi-card(label, value, trend: none, trend-color: none, accent: palette.blue)`
Metric card with large value, colored left accent border, and optional trend indicator.

```typst
#kpi-card([Revenue], [\$33.1B], trend: [#sym.arrow.t 26%], trend-color: palette.success)
```

### `#insight-box(title, body)`
Blue-accented insight box with left border for key takeaways and highlights.

### `#alert-box(title, body)`
Red-accented alert/warning box for risks and challenges.

### `#success-box(title, body)`
Green-accented success box for achievements and positive outcomes.

### `#data-table(headers, rows)`
Styled table with deep-blue header row and alternating backgrounds.

```typst
#data-table(
  ([Metric], [Q3], [Q4], [YoY]),
  (([Revenue], [\$26B], [\$33B], [+26%]),),
)
```

### `#feature-card(number, title, description, accent: auto)`
Card with color-coded circular number badge (auto-cycles through brand colors).

```typst
#feature-card(1, [Compute Engine], [Next-gen instances with custom processors.])
```

### `#stat-row(..items)`
Horizontal row of large stat numbers with auto-cycling brand colors.

```typst
#stat-row(
  (value: [40], label: [Regions]),
  (value: [99.99%], label: [Uptime]),
)
```

### `#phase-card(phase, title, items, accent: auto)`
Timeline/roadmap card with colored top border.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Blue** | `#4285F4` | `palette.blue` | Google Blue — primary brand color |
| **Red** | `#EA4335` | `palette.red` | Google Red — alert boxes, brand accent |
| **Yellow** | `#FBBC04` | `palette.yellow` | Google Yellow — brand accent |
| **Green** | `#34A853` | `palette.green` | Google Green — success boxes, brand accent |
| **Deep Blue** | `#1A237E` | `palette.deep-blue` | Deep navy — section slide bg, title text |
| **Medium Blue** | `#1A73E8` | `palette.medium-blue` | Medium blue — ending slide text |
| **Dark Blue** | `#0D47A1` | `palette.dark-blue` | Dark blue — section slide gradient |
| **Background** | `#FFFFFF` | `palette.bg` | White page background |
| **Background Light** | `#F8F9FA` | `palette.bg-light` | Light gray — alternating rows |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | White card surfaces |
| **Border** | `#E8EAED` | `palette.border` | Light border color |
| **Text Primary** | `#1A237E` | `palette.text-primary` | Deep navy — headings |
| **Text Body** | `#5F6368` | `palette.text-body` | Gray — body text |
| **Text Secondary** | `#9AA0A6` | `palette.text-secondary` | Muted gray — footers, labels |
| **Success** | `#34A853` | `palette.success` | Green — positive indicators |
| **Danger** | `#EA4335` | `palette.danger` | Red — negative indicators |
| **Warning** | `#FBBC04` | `palette.warning` | Yellow — warning indicators |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.blue,
  neutral-lightest: white,
  neutral-darkest: palette.deep-blue,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
