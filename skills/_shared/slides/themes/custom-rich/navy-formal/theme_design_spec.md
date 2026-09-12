# Navy Formal Theme

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | navy-formal |
| **Best For** | Thesis defense, academic presentations, research reports |
| **Style Objective** | Academic |
| **Complexity Level** | Rich |

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `navy-formal-theme`
**Style**: Professional, rigorous, research-oriented — light theme with clear hierarchy
**Primary color**: `#003366` (Dark Blue)

## Description

A professional, research-oriented theme designed for thesis defense presentations, academic talks, and research progress reports. Features a dark blue header bar and restrained research-register marks on content slides, a red vertical accent bar on section dividers, semi-transparent background chapter numbers, blue card borders, and decorative dot dividers. The design conveys academic rigor while maintaining visual clarity.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: navy-formal-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [My Thesis Title],
    subtitle: [Doctoral Thesis Defense],
    author: [Author Name],
    date: datetime.today(),
    institution: [University Name],
  ),
)

#set text(font: ("IBM Plex Serif", "Noto Serif SC"))

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
Cover page with a dark blue top banner, centered white card overlapping the banner, thesis title, subtitle, author, institution, date, and decorative dot dividers. The card has a blue-gray border and the banner features subtle decorative circles.

### `#slide(title: auto, align: auto)`
Standard content slide with a dark blue header bar displaying the slide title in white, a thin blue accent line beneath, subtle research-register marks in the body area, and a footer with decorative tri-color dots (dark blue, accent blue, red) and page numbers. The optional `align` value overrides the stored theme alignment for an explicit special-slide call.

### `#new-section-slide[...]`
Chapter divider slide with a left red vertical bar (6px), semi-transparent large chapter number in the background, "CHAPTER" label in red, section heading in dark blue, and a blue accent underline. Auto-triggered by `= Heading`.

### `#outline-slide(title: [Outline])`
Table of contents slide with a standard level-one Typst outline, dark blue top bar, red accent line, and decorative elements.

```typst
#outline-slide(title: [Presentation Outline])
```

### `#focus-slide[...]`
Full-screen emphasis slide with dark blue background, red top accent line, and bold white centered text. Ideal for key findings or impactful quotes.

### `#ending-slide[...]`
Closing slide with light blue-gray background, centered white card, large dark blue text, dot divider decoration, and top/bottom accent bars.

## Reusable Components

### `#theorem-box(title, body)`
Blue-accented box for theorems, definitions, lemmas, and formal statements. Features a blue left border, diamond icon prefix, and light blue-gray background.

```typst
#theorem-box([Theorem 1: Convergence])[
  The proposed algorithm converges in $O(n log n)$ time
  under standard assumptions.
]
```

### `#highlight-box(title, body)`
Red-accented box for key findings and important results. Features a red left border, star icon prefix, and pale red background.

```typst
#highlight-box([Key Result])[
  Our method achieves *state-of-the-art* performance
  with 96.2% AUC on the benchmark dataset.
]
```

### `#source-footer(content)`
Subtle citation/source footer in small italic text. Use at the bottom of slides to reference data sources.

```typst
#source-footer[WHO Global Report on Medical Imaging, 2023]
```

### `#comparison-table(columns: auto, align: center + horizon, compact: false, headers, rows)`
Styled academic table with a dark blue header row and alternating white/light backgrounds. `columns` accepts a native Typst column specification, `align` passes through to the table, and `compact: true` reduces type and inset for dense publication or benchmark tables.

```typst
#comparison-table(
  columns: (1.4fr, 1fr, 1fr),
  ([Method], [Accuracy], [F1 Score]),
  (
    ([Baseline], [0.85], [0.82]),
    ([*Ours*], [*0.96*], [*0.94*]),
  ),
)
```

### `#method-card(number, title, description)`
Numbered methodology card with a colored top border and circular number badge. Colors alternate between accent blue and dark blue. Ideal for research steps, contributions, and process descriptions.

```typst
#method-card(1, [Data Collection], [
  Collected 50,000 annotated medical images
  from three clinical institutions.
])
```

For equal-height rows, use exactly one `method-card` as each direct child of `cols(lazy-layout: true)`. A lazy column must not mix a method card with unrelated content.

## Typography

The reusable theme is font-agnostic and owns only size, weight, and color hierarchy. The deck entry selects installed document fonts after the theme show rule; the demo uses `("IBM Plex Serif", "Noto Serif SC")`.

## Helper Functions

### `#dot-divider(color: palette.accent-blue, dot-size: 4pt, spacing: 10pt)`
Decorative divider with three dots and flanking lines. Used as visual separator.

### `#title-accent-line(width: 60pt, color: palette.accent-blue)`
Blue underline accent for section titles.

### `#red-vertical-bar(height: 100%, width: 6pt)`
Red vertical bar element used on section divider slides.

## Color Scheme

```typst
#let palette = (
  // Primary palette
  primary:        rgb("#003366"),   // Dark Blue — headers, titles
  accent-blue:    rgb("#0066CC"),   // Accent Blue — links, highlights
  accent-red:     rgb("#CC0000"),   // Accent Red — emphasis, section bars
  bg-light:       rgb("#E8F4FC"),   // Light Blue-Gray — background tint
  white:          rgb("#FFFFFF"),   // White — card/slide backgrounds
  // Extended palette
  text-dark:      rgb("#1A1A2E"),   // Near-black for body text
  text-body:      rgb("#333333"),   // Body text
  text-secondary: rgb("#666666"),   // Secondary text
  text-muted:     rgb("#6B7280"),   // Contrast-safe muted / captions
  border:         rgb("#C8D8E8"),   // Card borders
  bg-card:        rgb("#F5F9FD"),   // Card background
  success:        rgb("#2E7D32"),   // Green for positive
  warning:        rgb("#E65100"),   // Orange for warnings
)
```

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent-blue` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `palette.white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.primary` | Dark text on light backgrounds |

## Best For

- Thesis defense presentations
- Academic conference talks
- Research progress reports
- Scientific seminars
- Lab group presentations

## Recommended Complexity

**Rich** — Use native `cols`, `grid`, and `stack` with the theme's cards and tables. Avoid ad-hoc layout wrappers and overly complex nesting; let the academic typography, register marks, and restrained component system guide the viewer.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Full usage example with 19 slides (compilable)
- `theme.md` — Concise API reference
