# Anthropic Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `anthropic-theme`
**Style**: Tech-forward, professional — dark/light mixed design with orange accents
**Primary color**: `#D97757` (Anthropic orange)
**Best For**: AI tech talks, developer conferences, technical training, product launches
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A tech-forward, professional theme inspired by Anthropic's brand design. Features a mixed dark/light approach: dark gradient covers and chapter dividers with warm white content slides. Orange accent bars, subtle glow effects, card-based layouts, and orange-to-blue gradient lines create a modern aesthetic perfect for AI tech talks, developer conferences, and product launches.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: anthropic-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Claude: Next-Generation AI Assistant],
    subtitle: [Safe, Helpful & Honest],
    author: [Anthropic Research Team],
    date: datetime.today(),
    institution: [Anthropic],
  ),
)

#title-slide()
```

`config-common(breakable: false)` is part of the ordinary 16:9 deck setup when one source slide
must remain one physical page. It prevents automatic continuation pages; it does not make
overflow safe. Validate the physical page count and inspect every authored page.

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Dark gradient cover with decorative glow circles, left orange gradient bar, white title, orange-blue gradient line, author in orange, and subtle line decorations.

### `#slide(title: auto)`
Standard content slide with orange top bar (6px), bold dark title with orange underline, warm white background (`#F5F5F0`), footer with orange dot separator and page numbers.

### `#new-section-slide[...]`
Dark gradient chapter divider with left orange-to-blue gradient bar, large white section title, orange-blue underline, and decorative circles (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Full-screen dark gradient slide with centered orange glow effect circles and large bold white text.

### `#ending-slide[...]`
Warm white closing slide with centered white card (rounded corners), large orange thank-you text, and orange-blue gradient line.

## Reusable Components

### Normal-flow density

The content frame sits between the title chrome and footer. Plan combinations by rendered height,
not source-line count:

- one short lead, one formula block, and one two-column row of `feature-card` components is a
  dependable upper bound. Do not add another boxed callout to that pattern;
- `stat-row` plus a three-row `data-table` nearly fills the frame. Add an `insight-box` only when
  its body is one short line;
- a two-by-two grid of any card component should use compact vertical insets and two or three
  short rendered body lines per card. It leaves room for at most one short, unboxed concluding
  line; a boxed conclusion should replace one card or move to another slide;
- avoid stacking a table, two card rows, and a callout on the same page;
- use the component-owned compact parameters—`feature-card(..., inset-y: .6em)`,
  `metric-card(..., inset-y: .35em)`, or `callout-box(..., inset-y: 8pt)`—instead of shrinking all
  page text or using negative spacing to conceal overflow.

These are starting bounds, not layout guarantees. Chinese text, long formulas, font fallback,
and user content change wrapping. With `breakable: false`, clipped component borders or a footer
collision are real defects even when compilation succeeds.

### `#feature-card(number, title, description, accent: auto, inset-y: 1em)`
Card with colored top border and circular number badge. Auto-cycles through accent colors (orange→blue→green→red).
Use `inset-y: .6em` for a verified compact two-row grid; keep each body to a few short rendered
lines and still inspect the page.

```typst
#feature-card(1, [Foundation Model], [
  Custom transformer architecture with mixture-of-experts routing.
], inset-y: .6em)
```

### `#metric-card(label, value, trend: none, accent: palette.orange, inset-y: .8em)`
KPI-like metric display with large value, colored left accent border, and optional trend indicator.
`inset-y` controls vertical card padding when dense normal-flow content needs a
verified compact variant.

```typst
#metric-card([Model Parameters], [175B+], trend: [#sym.arrow.t Next-gen])
```

### `#insight-box(title, body, inset-y: 14pt)` /
`#callout-box(title, body, accent: palette.orange, inset-y: 14pt)`
Orange-accented insight callout with left border for key takeaways. Aliases: `warning-box` (red), `success-box` (green).
All variants accept `inset-y`; use `8pt` for a compact callout after verifying that its text remains
readable.

```typst
#insight-box([Key Insight], inset-y: 8pt)[
  Claude achieves state-of-the-art results across reasoning benchmarks.
]
```

### `#code-block(title, body)`
Styled code display area with dark header bar (title in orange) and dark code body.

```typst
#code-block([API Request])[
  ```
  POST /v1/messages
  {"model": "claude-sonnet-4"}
  ```
]
```

### `#data-table(headers, rows)`
Styled table with dark header row and alternating warm white/white backgrounds.

```typst
#data-table(
  ([Benchmark], [Score], [Delta]),
  (([MMLU], [92.0%], [+3.2%]), ([HumanEval], [92.4%], [+8.1%])),
)
```

### `#stat-row(..items)`
Horizontal row of large stat numbers with auto-cycling accent colors.

```typst
#stat-row(
  (value: [16], label: [Principles]),
  (value: [98.7%], label: [Compliance]),
)
```

### `#phase-card(phase, title, items, accent: auto)`
Timeline/roadmap card with colored top border for project phases and strategic planning.

```typst
#phase-card([Q1 2025], [Foundation], [
  - Model launch
  - Extended context
], accent: palette.orange)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Orange** | `#D97757` | `palette.orange` | Anthropic orange — primary accent, top bars |
| **Dark** | `#1A1A2E` | `palette.dark` | Dark navy — title/section slide backgrounds |
| **Blue** | `#4A90D9` | `palette.blue` | Medium blue — gradient lines, decorations |
| **Green** | `#10B981` | `palette.green` | Green — success boxes, trend indicators |
| **Red** | `#EF4444` | `palette.red` | Red — warning boxes |
| **Background** | `#F5F5F0` | `palette.bg` | Warm white — content slide background |
| **Card** | `#FFFFFF` | `palette.card` | White — card surfaces |
| **Border** | `#E5E5E0` | `palette.border` | Light border color |
| **Text Dark** | `#1A1A2E` | `palette.text-dark` | Dark navy — titles, headings |
| **Text Body** | `#4A4A5A` | `palette.text-body` | Gray — body text |
| **Text Light** | `#8A8A9A` | `palette.text-light` | Muted gray — footers, labels |
| **Dark Surface** | `#16213E` | `palette.dark-surface` | Dark surface — gradient backgrounds |
| **Dark Accent** | `#0F3460` | `palette.dark-accent` | Deep blue — gradient backgrounds |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.orange,
  neutral-lightest: white,
  neutral-darkest: palette.dark,
)
```

## Canvas-Level Usage

This theme supports Canvas-level composition in addition to Rich. When using Canvas mode:

- **Dark/light rhythm**: Use `config-page(fill: palette.primary-dark)` for dark pages. Set `header: none, footer: none` and manually render chrome with `palette.text-on-dark` colors.
- **Hero pages**: Full-bleed images with `place()` + scrim overlay using `gradient.linear(palette.primary-dark.transparentize(100%), palette.primary-dark.transparentize(20%))`.
- **Inline styling**: Canvas mode permits `block(fill: palette.card)`, `text(fill: palette.accent)` directly in main.typ.
- **Component density**: reserve the title and footer bands, then fit content by measured geometry.
  Use `grid()` for multi-column layouts and `place()` only for intentional overlays; source-line
  count is not a usable density measure.
- **Recommended patterns**: Asymmetric splits (60/40), stat dashboards, dark statement pages, full-bleed image heroes.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
