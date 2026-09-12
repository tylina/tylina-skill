# Gauge Panel Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | gauge-panel |
| **Best For** | Project reviews, experiment reports, quarterly performance reviews, data dashboards |
| **Style Objective** | Technical / Scientific |
| **Complexity Level** | Rich |

An analog instrument control panel aesthetic for data-focused dashboard presentations. Light warm gray background with deep graphite text, steel blue accents, and warm copper highlights. Features measurement-grid SVG atmosphere (oscilloscope-style), gauge-dial SVG decorations, and ruler-tick dividers. Think: beautifully designed scientific instrument dashboard.

## Design Philosophy

- **Instrument Precision**: Measurement-grid background evokes oscilloscope/lab equipment precision
- **Data-First**: Components designed to showcase metrics, KPIs, and performance data prominently
- **Warm Technical**: Copper accents add warmth to the technical aesthetic without sacrificing professionalism
- **Clean Hierarchy**: White cards on warm gray background create clear visual layers

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm Gray | `#F5F4F2` | Primary background (panel surface) |
| Deep Graphite | `#2D2D2D` | Main text, primary content color |
| Steel Blue | `#4A6FA5` | Accent -- charts, primary metrics, section numbers |
| Warm Copper | `#B87333` | Highlights -- gauge elements, borders, quotes |
| Success Green | `#4A8C5C` | Positive indicators, on-track status |
| Warning Gold | `#D4A943` | Warning indicators, attention items |
| Danger Red | `#C0504D` | Negative indicators, critical items |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Arial Unicode MS"))

#show: gauge-panel-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with panel frame border, measurement-grid atmosphere, gauge-dial SVG decorations in top corners and bottom center, centered title with copper accent line. Displays title, subtitle, author, institution, and date.

### `slide(title: auto, ..args)`
Standard content slide with:
- Warm gray background with measurement-grid SVG atmosphere
- Bold graphite title with copper accent underline
- Footer with muted ink text, copper dot separator, and slide counter

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features measurement-grid background, large steel blue section number, graphite section title, copper ruler-tick divider, and gauge-dial decoration at bottom-right.

### `focus-slide(body)`
Width-constrained centered statement on warm gray background with measurement-grid, copper rectangular frame accent, gauge-dial at top center, and copper accent line below text.

### `ending-slide(body)`
Closing slide with panel frame border, measurement-grid background, gauge-dial decorations (top corners and bottom center), centered text with copper accent line and ruler-tick decoration.

## Reusable Components

### `gauge-card(label, value, unit: none, color: palette.accent)`
Metric card with small arc/dial SVG indicator at top. Displays large monospace value with optional unit, and label below. White card with light border.

```typst
#gauge-card([Accuracy (Top-1)], [91.2%], color: palette.accent)
```

### `reading-block(label, value, delta: none, color: palette.ink)`
Data readout with monospace number and label. NO border -- purely typographic styling. Optional delta shows change with color-coded indicator (green for positive, red for negative).

```typst
#reading-block([Throughput], [2.4K rps], delta: [+18%])
```

### `panel-section(title)`
Section header with horizontal gauge-mark SVG (ruler tick marks). Used to divide content areas within a slide.

```typst
#panel-section([Training Configuration])
```

### `meter-tag(content, color: palette.accent)`
Inline status badge with colored dot indicator. Used for status labels, categories, and tags.

```typst
#meter-tag([On Track], color: palette.success)
#meter-tag([P0], color: palette.danger)
```

### `dial-divider(color: palette.copper, width: 80%)`
SVG measurement-tick divider line (ruler marks) for separating content sections. Center-aligned.

```typst
#dial-divider(width: 60%)
```

### `instrument-quote(quote, author: none)`
Blockquote with copper left border (not a full box). Italic text with optional bold copper author attribution.

```typst
#instrument-quote(
  [Key insight from training analysis.],
  author: [Training Log, Week 6]
)
```

### `data-table-wrap(body, accent: palette.accent)`
Styled table wrapper with colored top accent line, white background, and light border. Designed for data tables.

```typst
#data-table-wrap(accent: palette.copper)[
  #table(columns: (1fr, 1fr), [Header], [Value])
]
```

## Helper Functions

### `measurement-grid()`
Renders the full-page measurement-grid SVG background (oscilloscope-style grid with edge tick marks).

### `gauge-dial(color: palette.copper, width: 80pt)`
Renders a semi-circular gauge dial SVG with tick marks and center pivot.

### `ruler-tick(color: palette.copper, width: 100%)`
Renders a horizontal ruler-tick SVG line.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Graphite text]
#text(fill: palette.accent)[Steel blue text]
#text(fill: palette.copper)[Copper text]
#text(fill: palette.success)[Success text]
#text(fill: palette.warning)[Warning text]
#text(fill: palette.danger)[Danger text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.copper`
- `palette.ink-muted`, `palette.bg-card`, `palette.grid-faint`, `palette.border-light`
- `palette.success`, `palette.warning`, `palette.danger`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (steel blue), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds (warm gray) |
| `neutral-darkest` | `palette.ink` | Dark text (deep graphite) |

## Best Use Cases

- Quarterly model performance reports
- Machine learning experiment reviews
- Technical project status dashboards
- Data-heavy research presentations
- Engineering metrics reviews
- Scientific experiment summaries

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (measurement-grid atmosphere, gauge-dial arcs, ruler-tick dividers) and provides 7 specialized data-presentation components. Best used with lilaq charts, native Typst tables, and data-driven layouts.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (panel frame, gauge-dial decorations)
2. Executive Summary (KPI gauge cards, reading blocks, risk table)
3. Method Overview (architecture table, training config)
4. Results by Dataset (bar chart, line chart, per-dataset table)
5. Latency & Throughput (benchmark chart, throughput readings)
6. Next Steps (roadmap, resource table, success criteria gauges)
7. Focus slide and ending slide

## File Structure

```
gauge-panel/
  template.typ   -- Theme definition (colors, SVGs, slides, components)
  demo.typ       -- Full demonstration presentation
```
