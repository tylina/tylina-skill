# Navy Formal Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `navy-formal-theme`
**Style**: Professional, rigorous, research-oriented — light theme with clear hierarchy
**Primary color**: `#003366` (dark blue)
**Best For**: Thesis defense, academic presentations, research reports, grant applications
**Style Objective**: Academic
**Complexity Level**: Rich

## Description

A professional, research-oriented theme designed for thesis defense presentations, academic talks, and research progress reports. Features a dark blue header bar on content slides, restrained research-register marks in the body area, a red vertical accent bar on section dividers, semi-transparent background chapter numbers, blue card borders, and decorative dot dividers. The design conveys academic rigor while maintaining visual clarity.

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
Cover page with dark blue top banner, centered white card overlapping the banner, thesis title, subtitle, author, institution, date, and decorative dot dividers.

### `#slide(title: auto, align: auto)`
Standard content slide with dark blue header bar, white title text, thin blue accent line beneath, subtle research-register marks in the body, and footer with tri-color decorative dots and page numbers. `align` overrides the theme-level vertical alignment for explicit special-slide calls.

### `#new-section-slide[...]`
Chapter divider with left red vertical bar (6px), semi-transparent large chapter number in background, "CHAPTER" label in red, section heading in dark blue, and blue accent underline (auto-triggered by `= Heading`).

### `#outline-slide(title: [Outline])`
Table of contents slide with progressive outline display, dark blue top bar, red accent line, and decorative elements.

### `#focus-slide[...]`
Full-screen emphasis slide with dark blue background, red top accent line, and bold white centered text.

### `#ending-slide[...]`
Closing slide with light blue-gray background, centered white card, large dark blue text, and dot divider decoration.

## Reusable Components

### `#theorem-box(title, body, accent: palette.accent-blue, icon: sym.diamond.filled)`
Blue-accented box for theorems, definitions, and lemmas. Features a blue left border, diamond icon prefix, and light tinted background.

```typst
#theorem-box([Theorem 1: Convergence])[
  The proposed algorithm converges in $O(n log n)$ time.
]
```

### `#highlight-box(title, body)`
Red-accented box for key findings and important results. Features a red left border and star icon prefix.

```typst
#highlight-box([Key Result])[
  Our method achieves 96.2% AUC on the benchmark dataset.
]
```

### `#source-footer(content)`
Subtle citation/source footer in small italic text for referencing data sources.

```typst
#source-footer[WHO Global Report on Medical Imaging, 2023]
```

### `#comparison-table(columns: auto, align: center + horizon, compact: false, headers, rows)`
Styled academic table with a dark blue header row and alternating white/light backgrounds. `columns` accepts a native Typst table column specification, `align` is passed through to the table, and `compact: true` reduces cell type and inset for dense research tables.

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
Numbered methodology card with colored top border and circular number badge. Colors alternate between accent blue and dark blue.

```typst
#method-card(1, [Data Collection], [
  Collected 50,000 annotated medical images.
])
```

For equal-height rows, place exactly one `method-card` in each direct child of `cols(lazy-layout: true)`. Do not mix a flexible method card with unrelated content in the same lazy column.

## Typography Boundary

The reusable theme sets type size, color, and hierarchy but does not select a document font. Set an installed Latin/CJK stack in the deck entry after the theme show rule; the demo uses IBM Plex Serif with Noto Serif SC.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#003366` | `palette.primary` | Dark blue — header bars, section headings |
| **Accent Blue** | `#0066CC` | `palette.accent-blue` | Medium blue — underlines, theorem boxes, dot dividers |
| **Accent Red** | `#CC0000` | `palette.accent-red` | Red — section slide vertical bar, chapter labels |
| **Background Light** | `#E8F4FC` | `palette.bg-light` | Light blue — title/ending slide backgrounds |
| **White** | `#FFFFFF` | `palette.white` | White — card backgrounds, page fill |
| **Text Dark** | `#1A1A2E` | `palette.text-dark` | Near black — titles, emphasis text |
| **Text Body** | `#333333` | `palette.text-body` | Dark gray — body text |
| **Text Secondary** | `#666666` | `palette.text-secondary` | Medium gray — institution, page numbers |
| **Text Muted** | `#6B7280` | `palette.text-muted` | Contrast-safe muted gray — source footers |
| **Border** | `#C8D8E8` | `palette.border` | Light blue-gray — card borders |
| **Card Background** | `#F5F9FD` | `palette.bg-card` | Pale blue — alternating table rows |
| **Success** | `#2E7D32` | `palette.success` | Green — positive indicators |
| **Warning** | `#E65100` | `palette.warning` | Orange — warning indicators |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent-blue,
  neutral-lightest: palette.white,
  neutral-darkest: palette.primary,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
