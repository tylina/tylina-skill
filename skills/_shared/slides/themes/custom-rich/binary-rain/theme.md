# Binary Rain Theme — API Reference

## Overview

A digital cascading data streams theme with light backgrounds. Matrix-like vertical character streams reinterpreted as a modern, professional design. Thin columns of fading digits, binary 0/1 patterns as texture, cascading data waterfall patterns, terminal cursor blinks, and digital rain drops.

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `binary-rain-theme`
**Demo fonts**: Avenir Next with Noto Sans SC fallback (base 18pt); IBM Plex Mono for raw/code. The theme itself does not force a font.

---

## Theme Entry

```typst
#show: binary-rain-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [My Footer Text],   // Optional footer content
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)

#set text(font: ("Avenir Next", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")
```

---

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `palette.bg` | `#F8FAF9` | Page background (very light gray-green) |
| `palette.card-bg` | `#FFFFFF` | Card/panel background |
| `palette.text` | `#1A1D1B` | Primary text (dark charcoal) |
| `palette.text-muted` | `#5C6360` | Secondary/muted text |
| `palette.primary` | `#00C853` | Matrix green (primary accent) |
| `palette.primary-dark` | `#009624` | Darker green variant |
| `palette.primary-ink` | `#006E2E` | Contrast-safe green for semantic text on light surfaces |
| `palette.secondary` | `#00695C` | Dark teal |
| `palette.highlight` | `#00E5FF` | Cyan highlight |
| `palette.border` | `#C8E6C9` | Card borders |
| `palette.light-green` | `#E8F5E9` | Light green backgrounds |
| `palette.code-bg` | `#F1F8F2` | Code block backgrounds |
| `palette.dim-green` | `#A5D6A7` | Dimmed green for subtle elements |

---

## Slide Functions

### `title-slide()`

Full-page title slide with rain frame bookend and data stream background.

```typst
#title-slide()
```

Uses info from `config-info(...)`.

### `slide(title: auto, ..args)`

Standard content slide with data stream atmosphere, header, and footer.

```typst
== Slide Title

Content here...
```

Or with explicit title:

```typst
#slide(title: [Custom Title])[
  Content here...
]
```

Multi-column:

```typst
#slide[Column 1][Column 2]
```

### `new-section-slide`

Auto-generated when using `= Section Name`. Shows section number with hex decoration.

### `focus-slide(body)`

Dark background slide for impactful quotes or key statements.

```typst
#focus-slide[
  _"Important statement here"_
]
```

### `ending-slide(body)`

Closing slide with rain frame bookend (matches title slide).

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `stream-card(title, body, accent: palette.primary)`

Content card with data cascade left-side decoration and cursor indicator.

```typst
#stream-card([Card Title], [
  Card content goes here with *formatting* support.
], accent: palette.primary)
```

### `cascade-box(title, body)`

Highlighted content box with hex-line decoration and green left border.

```typst
#cascade-box([Insight Title], [
  Important insight or highlighted information.
])
```

### `bit-tag(content, color: palette.primary)`

Binary status capsule label (inline tag/chip).

```typst
#bit-tag([Active], color: palette.primary)
#bit-tag([Pending], color: palette.secondary)
```

### `packet-card(label, value, description, color: palette.primary)`

Data/metric display panel with top accent border and hex decoration. Its centered internal stack is always `hex decoration -> value -> label -> description`, so mixed value lengths and wrapped labels do not drift vertically.

```typst
#packet-card([Metric Name], [42M/s], [Description text], color: palette.primary)
```

### `byte-stat(label, value, color: palette.primary)`

KPI with digital readout style. Its centered internal stack is always `cursor -> value -> label`; use it as the single child of each `cols(lazy-layout: true)` column.

```typst
#byte-stat([Throughput], [12M/s], color: palette.primary)
```

### `buffer-card(title, body, accent: palette.secondary)`

Queue/pipeline card with data flow indicator prefix.

```typst
#buffer-card([Pipeline Stage], [
  - Step one
  - Step two
  - Step three
], accent: palette.secondary)
```

### `matrix-grid(items, columns: 2)`

Themed multi-row matrix with a clipped outer frame and opaque code-style cells. Use it only when the content is a genuine row/column matrix; use Touying `cols()` for ordinary columns. `items` is an array of content and `columns` sets the matrix column count.

```typst
#matrix-grid(columns: 2, (
  [*Item 1*: Description],
  [*Item 2*: Description],
  [*Item 3*: Description],
  [*Item 4*: Description],
))
```

### `terminal-box(title, body, accent: palette.secondary)`

Code/command content box with terminal window header (colored dots).

```typst
#terminal-box([Command Output], [
  ```bash
  $ command --flag value
  Output here...
  ```
], accent: palette.secondary)
```

### `debug-note(title, body, accent: palette.highlight)`

Annotation/log entry style callout with cyan accent.

```typst
#debug-note([Note Title], [
  Important annotation or aside information.
], accent: palette.highlight)
```

---

## SVG Helpers (Advanced)

These are available for custom compositions:

| Function | Description |
|----------|-------------|
| `data-stream-bg()` | Full-page binary digit columns background |
| `rain-frame()` | Bookend frame with hex addresses and digit cascades |
| `cascade-divider(width: 100%)` | Horizontal binary pattern separator |
| `cursor-blink(color: palette.primary)` | Terminal cursor block |
| `hex-line(width: 140pt)` | Hexadecimal address line decoration |

---

## Layout Utilities

Use Touying's built-in `cols()` for multi-column layouts:

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  stream-card([Left], [Content]),
  stream-card([Right], [Content]),
)
```

Use `lazy-layout: true` only when every column contains exactly one lazy-capable component (`stream-card`, `packet-card`, `byte-stat`, or `buffer-card`). For multiple complete components in a column, use default `cols()` and keep the components in direct natural flow. Use `grid()` for genuine multi-row matrices whose children do not contain `lazy-v`.

Use `stack(spacing: ...)` only when several elements form one designed visual group whose internal rhythm must be controlled. Do not add a fixed `v()` or wrapper stack merely to separate complete caller-side components. The SVG helper `cascade-divider(width: ...)` can be centered directly when a themed separator is needed.

---

## Best Practices

1. Use `stream-card` as the primary content container
2. Use `byte-stat` and `packet-card` for metrics and KPIs
3. Use `terminal-box` for code/command examples
4. Use `cascade-box` for key insights or callouts
5. Use `bit-tag` for inline status/category labels
6. Use `cascade-divider` to separate logical regions within a slide
7. Use `debug-note` for asides, annotations, or advisory notes
8. Use `buffer-card` for sequential/pipeline content
9. Use `matrix-grid` only for genuine multi-row structured comparisons
10. Pair title and ending slides for consistent bookend framing
