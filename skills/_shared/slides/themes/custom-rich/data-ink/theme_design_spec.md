# Data-Ink Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | data-ink |
| **Best For** | Financial reports, economic dashboards, quantitative research, data-heavy presentations |
| **Style Objective** | Data-Driven |
| **Complexity Level** | Rich |

A Tufte-inspired presentation theme that maximizes the data-ink ratio while minimizing chart junk. Features inline SVG sparklines, margin annotations, hairline rules, and dense data presentation. Inspired by Edward Tufte's "The Visual Display of Quantitative Information" -- every element serves a purpose.

## Design Philosophy

- **Maximum Data-Ink Ratio**: Every pixel of ink should represent data; decorative elements are eliminated
- **Tufte's Principles**: Hairline rules, no gridlines, sparklines for inline context, sidenotes for annotations
- **Extreme Restraint**: Only five colors total -- off-white paper, near-black ink, gray for secondary info, light gray for rules, and red used sparingly for emphasis
- **Information Density**: Dense layouts with small multiples, stat rows, and data tables allow maximum information per slide

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Tufte Paper | `#FFFFF8` | Background -- signature off-white |
| Near Black Ink | `#111111` | Primary text, not pure black |
| Secondary Gray | `#5E5E5E` | Secondary information, labels |
| Light Gray | `#D0D0D0` | Grid lines, hairline rules, borders |
| Emphasis Red | `#BE2D26` | Used sparingly for critical emphasis |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: data-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
)

// Choose deck fonts after the show rule; the reusable theme owns no font family.
#set text(font: ("Libertinus Serif", "Songti SC"), size: 18pt)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical alignment of slide content |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Minimal title slide: large title in regular weight (not bold), hairline rule below, subtitle and author in gray. Top and bottom hairlines frame the slide. Left-aligned, vertically centered.

### `slide(title: auto, align: auto, ..args)`
Ultra-clean content slide with:
- Bold title text with a 0.5pt hairline rule below
- Three-column footer: left footer text, center hairline, right page number
- Off-white paper background
- No decorative elements

### `new-section-slide(self: none, body)`
Section divider with a left 40% gray panel containing a large white section number, and a right 60% area with "SECTION" label in tracked small caps, bold section title, and a short hairline rule. Top and bottom hairlines.

### `focus-slide(body)`
Centered text on paper background with a hairline rectangle frame inset from the edges. Regular weight, large text.

### `ending-slide(body)`
Minimal centered farewell with hairline rules above and below the text, framed by top and bottom page hairlines.

## Reusable Components

### `tufte-stat(value, label, trend: "up", accent: palette.ink)`
The signature component: large number, inline sparkline showing trend, and small label below. The quintessential Tufte element.

```typst
#tufte-stat([3.2%], [GDP Growth YoY], trend: "up")
```

### `sparkline(trend: "up", color: rgb("#111111"), width: 60pt)`
Inline SVG sparkline for trend visualization. Available trends: `"up"`, `"down"`, `"volatile"`, `"plateau"`, `"recovery"`.

```typst
#sparkline(trend: "volatile", color: palette.red, width: 80pt)
```

### `margin-note(body)`
Small italic gray text placed at the right margin, mimicking Tufte's sidenotes.

```typst
#margin-note[Non-farm payrolls revised upward by 42K for Oct.]
```

### `data-card(title, body)`
Ultra-clean card with 0.5pt hairline border, no background fill. Bold title with gray body text.

```typst
#data-card([Employment by Sector])[
  Healthcare: +58K, Technology: +42K, Construction: +31K
]
```

### `evidence-box(title, body)`
Callout with a thin 1.5pt red left line for emphasizing key findings or critical data.

```typst
#evidence-box([Key Finding])[
  Wage growth decelerated to 3.8% YoY, the lowest reading in 18 months.
]
```

### `small-multiple(..items)`
Grid of tiny stat blocks (Tufte's "small multiples" concept). Each item is a dictionary with `label`, `value`, and optional `trend`.

```typst
#small-multiple(
  (label: "ISM Mfg", value: "52.4", trend: "up"),
  (label: "PMI Svcs", value: "54.1", trend: "up"),
  (label: "Housing", value: "-8.2%", trend: "down"),
)
```

### `data-table(headers, rows)`
Clean Tufte-style table with no vertical rules, minimal horizontal hairlines. Header row has a 0.5pt ink bottom border; body rows have light gray separators.

```typst
#data-table(
  ([Sector], [Jobs (K)], [MoM]),
  (
    ([Healthcare], [+58], [+0.4%]),
    ([Technology], [+42], [+0.6%]),
  ),
)
```

### `stat-row(..items)`
Horizontal layout of `tufte-stat` blocks. Each item is a dictionary with `value`, `label`, optional `trend` and `accent`.

```typst
#stat-row(
  (value: "3.2%", label: "GDP", trend: "up"),
  (value: "2.1%", label: "CPI", trend: "down"),
)
```

### `hairline-divider()`
A 0.5pt thin gray horizontal line for subtle section separation.

```typst
#hairline-divider()
```

### `annotation(body)`
Small gray italic annotation text for source citations and footnotes.

```typst
#annotation[Source: Bureau of Economic Analysis. Seasonally adjusted.]
```

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Near-black text]
#text(fill: palette.gray)[Secondary gray text]
#text(fill: palette.red)[Emphasis red text]
```

- `palette.paper`, `palette.ink`, `palette.gray`, `palette.light-gray`, `palette.red`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.ink` | Theme accent, `alert()` text |
| `neutral-lightest` | `palette.paper` | Light backgrounds |
| `neutral-darkest` | `palette.ink` | Dark text |

## Best Use Cases

- Financial reports and quarterly reviews
- Economic research presentations
- Quantitative analysis dashboards
- Data journalism and evidence-based reporting
- Scientific research with numerical data
- Investment committee presentations

## Recommended Complexity

**Rich** -- This theme achieves richness through information density rather than decoration. Use `tufte-stat`, `small-multiple`, and `data-table` to pack maximum data into clean layouts. The sparklines and margin notes provide context without visual clutter.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide
2. Macro Overview (key indicators, small multiples)
3. Labor Market (data tables, evidence boxes)
4. Inflation Components (stat rows, disinflation thesis)
5. Financial Markets (yield curve, sector performance)
6. Global Comparison (data table with 6 economies)
7. Outlook (risk matrix, scenario probabilities)
8. Focus slide and ending slide

## File Structure

```
data-ink/
  template.typ   -- Theme definition (colors, slides, components)
  demo.typ       -- Full demonstration presentation
```
