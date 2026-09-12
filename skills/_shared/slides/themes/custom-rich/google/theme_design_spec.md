# Google Style Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | google |
| **Best For** | Tech companies, product launches, developer conferences |
| **Style Objective** | General Versatile |
| **Complexity Level** | Rich |

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `google-theme`
**Style**: Vibrant, data-driven — Google brand design system
**Primary color**: `#4285F4` (Google Blue)

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
    title: [Annual Report 2024],
    subtitle: [Innovation & Growth],
    author: [Alex Chen],
    date: datetime.today(),
    institution: [Google Cloud],
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
Cover page with light gradient background, centered white card, left four-color vertical bar, title with four-color underline, author/date info, and decorative dots.

### `#slide(title: auto)`
Standard content slide with four-color gradient top bar (6px), bold deep-blue title with blue underline, footer with centered four-color dots and page numbers.

### `#new-section-slide[...]`
Dark blue/navy gradient background with left four-color vertical bar, large section title in white, decorative circles, and bottom colored lines. Auto-triggered by `= Heading`.

### `#outline-slide(title: [Contents], items)`
Table of contents with color-coded number badges (cycling blue→red→yellow→green), chapter titles, and decorative circles. Pass an array of content items.

```typst
#outline-slide(
  title: [Contents],
  ([Chapter One], [Chapter Two], [Chapter Three]),
)
```

### `#focus-slide[...]`
Full-screen emphasis slide with deep blue gradient background and bold white centered text.

### `#ending-slide[...]`
Closing slide with light gradient background, centered white card, large thank-you text in blue, and four-color line decoration.

## Reusable Components

### `#kpi-card(label, value, trend: none, trend-color: none, accent: palette.blue)`
KPI metric card with large value number, colored left accent border, and optional trend indicator.

```typst
#kpi-card(
  [Revenue],
  [\$33.1B],
  trend: [#sym.arrow.t 26%],
  trend-color: palette.success,
  accent: palette.blue,
)
```

### `#insight-box(title, body)`
Blue-accented insight box with left border. For key takeaways and highlights.

### `#alert-box(title, body)`
Red-accented alert/warning box. For risks and challenges.

### `#success-box(title, body)`
Green-accented success box. For achievements and positive outcomes.

### `#data-table(headers, rows)`
Styled table with deep-blue header row and alternating backgrounds.

```typst
#data-table(
  ([Metric], [Q3], [Q4], [YoY]),
  (
    ([Revenue], [\$26B], [\$33B], [+26%]),
    ([Profit], [\$14B], [\$19B], [+32%]),
  ),
)
```

### `#feature-card(number, title, description, accent: auto)`
Card with color-coded circular number badge (auto-cycles through brand colors). For feature lists, pillars, case studies.

```typst
#feature-card(1, [Compute Engine], [
  Next-gen instances with custom Axion processors.
])
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

```typst
#phase-card([Q1], [Foundation], [
  - Team hiring
  - Architecture design
], accent: palette.blue)
```

## Helper Functions

### `#brand-color(index)`
Returns Google brand color by index (cycles: blue→red→yellow→green).

### `#four-color-bar(height: 6pt)`
Full-width gradient bar in four Google colors.

### `#four-color-dots(size: 6pt, spacing: 12pt)`
Centered row of five brand-colored dots.

### `#four-color-underline(width: 240pt)`
Four-segment colored line decoration.

### `#title-underline(width: 80pt)`
Blue underline accent for titles.

## Color Scheme

```typst
#let palette = (
  // Google brand colors
  blue:           rgb("#4285F4"),
  red:            rgb("#EA4335"),
  yellow:         rgb("#FBBC04"),
  green:          rgb("#34A853"),
  // Professional palette
  deep-blue:      rgb("#1A237E"),
  medium-blue:    rgb("#1A73E8"),
  dark-blue:      rgb("#0D47A1"),
  // Surface & text
  bg:             rgb("#FFFFFF"),
  bg-light:       rgb("#F8F9FA"),
  card-bg:        rgb("#FFFFFF"),
  border:         rgb("#E8EAED"),
  text-primary:   rgb("#1A237E"),
  text-body:      rgb("#5F6368"),
  text-secondary: rgb("#9AA0A6"),
  // Status
  success:        rgb("#34A853"),
  danger:         rgb("#EA4335"),
  warning:        rgb("#FBBC04"),
)
```

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.blue` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.deep-blue` | Dark text on light backgrounds |

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Full usage example (compilable)
- `README.md` — This documentation
