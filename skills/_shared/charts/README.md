# Chart Component Templates

Reusable Typst chart components for Touying slides. Built with Typst packages such as lilaq, gribouille, primaviz, merman, fletcher, and cetz.

Use [`index.json`](./index.json) as the source of truth for the current inventory, package mapping, categories, and programmatic lookup. The examples below use the Touying 0.7.4 simple theme in 16:9.

## Contents

- [Standard Template Structure](#standard-template-structure)
- [Quick Selection](#quick-selection)
- [Full Chart Index](#full-chart-index)
- [Package Selection Priority](#package-selection-priority)
- [Package Usage Notes](#package-usage-notes)
- [Layout Best Practices](#layout-best-practices)
- [Font Size and Dimension Standards](#font-size-and-dimension-standards)
- [Troubleshooting](#troubleshooting)

---

## Standard Template Structure

All chart slides must follow this standard structure (using `area_chart.typ` as reference):

```typst
#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lilaq:0.6.0" as lq  // import chart package as needed

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Slide Title

// Data definitions go after the title
#let color-blue = rgb("#2196F3")
#let data = (320, 280, 350, 420)

#figure[
  // Chart body
  #lq.diagram(...)

  // Legend (closely related to chart, inside figure)
  #align(right)[
    #stack(dir: ltr, spacing: 20pt,
      stack(dir: ltr, spacing: 4pt,
        rect(width: 20pt, height: 14pt, fill: color-blue, radius: 1pt),
        [Series A],
      ),
    )
  ]

  // Data source/notes (closely related to chart, inside figure)
  #align(right)[2024 · Source: xxx]
]

// Standalone introductory paragraphs go outside figure
```

### Key Rules

1. **`#set text(size: 18pt)`** goes **after** `#show: simple-theme.with(...)`
2. **Data definitions** (colors, data arrays, etc.) go **after** `== Title`
3. **Wrap charts in `#figure[]`** for centering + semantic markup
4. **Legends and notes** closely related to the chart go **inside** `#figure[]`, right-aligned with `#align(right)[]`
5. **Standalone introductory paragraphs** go **outside** `#figure[]`
6. **Remove unnecessary nesting**: don't wrap titles in `#block()` or `#text(size:..., weight: "bold")`, just use `== Title`
7. **Always use `themes.simple`**, not `themes.default`
8. **Helper function definitions** go after `== Title`, before `#figure[]`

---

## Quick Selection

| I want to show... | Recommended Chart | File |
|-------------------|------------------|------|
| Key metrics | KPI Cards | `kpi_cards.typ` |
| Category comparison | Bar Chart | `bar_chart.typ` |
| Long-label ranking | Horizontal Bar Chart | `horizontal_bar_chart.typ` |
| Multi-series comparison | Grouped Bar Chart | `grouped_bar_chart.typ` |
| Time trend | Line Chart | `line_chart.typ` |
| Cumulative trend | Area Chart | `area_chart.typ` |
| Proportional composition | Pie / Donut Chart | `pie_chart.typ` / `donut_chart.typ` |
| Goal completion rate | Progress Bar / Gauge | `progress_bar_chart.typ` / `gauge_chart.typ` |
| Conversion funnel | Funnel Chart | `funnel_chart.typ` |
| Project schedule | Gantt Chart | `gantt_chart.typ` |
| Milestone events | Timeline | `timeline.typ` |
| Multi-dimensional evaluation | Radar Chart | `radar_chart.typ` |
| Bidirectional comparison | Butterfly Chart | `butterfly_chart.typ` |
| Incremental breakdown | Waterfall Chart | `waterfall_chart.typ` |
| Flow / allocation | Sankey Chart | `sankey_chart.typ` |
| Strategic analysis | SWOT / Porter's Five Forces | `swot_analysis.typ` / `porter_five_forces.typ` |
| Quadrant analysis | 2x2 Matrix | `matrix_2x2.typ` |
| Option comparison | Comparison Table / Columns | `comparison_table.typ` / `comparison_columns.typ` |
| Process steps | Chevron Process / Numbered Steps | `chevron_process.typ` / `numbered_steps.typ` |
| Customer journey | Snake Flow | `snake_flow.typ` |
| Hierarchy | Pyramid / Org Chart | `pyramid_chart.typ` / `org_chart.typ` |
| Brainstorming | Mind Map / Word Cloud | `mind_map.typ` / `word_cloud.typ` |

---

## Full Chart Index

### Comparison (8)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `bar_chart.typ` | lilaq | Vertical bar comparison (3-8 items) | Sales comparison, regional ranking |
| `horizontal_bar_chart.typ` | lilaq | Horizontal bar ranking (5-12 items) | Brand ranking, satisfaction scores |
| `grouped_bar_chart.typ` | lilaq | Multi-series grouped comparison | Quarterly product line comparison, YoY/QoQ |
| `stacked_bar_chart.typ` | lilaq | Stacked composition comparison | Revenue composition, market share changes |
| `butterfly_chart.typ` | lilaq | Bidirectional mirror comparison | Population pyramid, A/B testing, income vs expense |
| `bullet_chart.typ` | primaviz | Actual vs target | KPI achievement, performance evaluation |
| `dumbbell_chart.typ` | lilaq | Multi-dimensional score comparison | Competitor analysis, composite index |
| `waterfall_chart.typ` | primaviz | Incremental change breakdown | Profit breakdown, budget variance |

### Trend (4)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `line_chart.typ` | lilaq | Line trend (multi-line support) | Time series, growth trends |
| `area_chart.typ` | lilaq | Area cumulative trend | Traffic trends, user growth |
| `stacked_area_chart.typ` | lilaq | Multi-series stacked trend | Revenue sources, traffic source changes |
| `dual_axis_line_chart.typ` | lilaq | Dual Y-axis different units | Revenue vs margin, traffic vs conversion |

### Composition (3)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `pie_chart.typ` | primaviz | Basic proportions (3-6 slices) | Market share, budget allocation |
| `donut_chart.typ` | primaviz | Ring proportions (center data) | Structure ratios, category composition |
| `treemap_chart.typ` | primaviz | Hierarchical area proportions | Budget allocation, market share breakdown |

### Metrics (3)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `kpi_cards.typ` | native | Key metric cards (2x2 / 1x4) | Financial overview, data dashboard |
| `gauge_chart.typ` | primaviz | Gauge completion rate | KPI completion, performance monitoring |
| `progress_bar_chart.typ` | native | Multi-item progress bars | OKR progress, project completion |

### Analysis (8)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `radar_chart.typ` | primaviz | Multi-dimensional evaluation (4-8 axes) | Capability assessment, competitor comparison |
| `scatter_chart.typ` | lilaq | Correlation / distribution | ROI analysis, price-demand |
| `funnel_chart.typ` | cetz | Conversion funnel (3-5 stages) | Sales funnel, user conversion |
| `matrix_2x2.typ` | cetz | Four-quadrant analysis | BCG matrix, priority analysis |
| `bubble_chart.typ` | lilaq | 3D bubble (X/Y/Size) | Market size vs growth vs share |
| `heatmap_chart.typ` | primaviz | Matrix heatmap | User activity by time, correlation matrix |
| `pareto_chart.typ` | lilaq | 80/20 Pareto analysis | Quality attribution, sales contribution |
| `box_plot_chart.typ` | lilaq | Box plot distribution | Salary distribution, quality control |

### Process / Relationship (5)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `gantt_chart.typ` | merman | Gantt schedule (6-12 tasks) | Project management, product roadmap |
| `timeline.typ` | native | Timeline events (3-8 nodes) | Milestones, historical timeline |
| `process_flow.typ` | merman | Process steps | Business process, operation guide |
| `org_chart.typ` | tdtr | Organization chart (2-4 levels) | Company structure, reporting lines |
| `sankey_chart.typ` | primaviz | Data flow (three layers) | Budget flow, user conversion paths |

### Strategy (2)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `swot_analysis.typ` | native | SWOT four-quadrant analysis | Strategic planning, competitive analysis |
| `porter_five_forces.typ` | cetz | Porter's Five Forces model | Industry analysis, market entry assessment |

### Infographics (19)

| File | Package | Purpose | Use Cases |
|------|---------|---------|-----------|
| `pyramid_chart.typ` | cetz | Pyramid hierarchy (3-6 layers) | Maslow's hierarchy, maturity model |
| `venn_diagram.typ` | cetz | Set relationships (2-3 domains) | Intersection analysis, synergy |
| `pros_cons_chart.typ` | native | Pros/cons dual-column (2-5 items/side) | Option evaluation, decision analysis |
| `cycle_diagram.typ` | cetz | Circular process (4-6 stages) | PDCA, iterative cycles |
| `numbered_steps.typ` | cetz | Numbered step process (3-6 steps) | Methodology, implementation path |
| `icon_grid.typ` | native | Icon grid cards (4-9 items) | Feature showcase, capability display |
| `comparison_table.typ` | native | Multi-dimension feature comparison (2-4 options) | Option evaluation, product selection, scoring |
| `comparison_columns.typ` | native | Multi-column pricing/service comparison (2-4 tiers) | Pricing plans, membership tiers, subscriptions |
| `chevron_process.typ` | fletcher | Arrow chain stage process (3-6 stages) | Methodology, implementation phases, deliverables |
| `fishbone_diagram.typ` | cetz | Cause-effect fishbone (4-6 branches) | Root cause analysis, 6M analysis |
| `hub_spoke.typ` | cetz | Hub-and-spoke diagram (1 core + 4-8 spokes) | Platform architecture, ecosystem |
| `mind_map.typ` | pintorita | Central divergent topic breakdown (1 core + 3-6 branches) | Brainstorming, knowledge structure |
| `snake_flow.typ` | fletcher | S-shaped snake flow (6-10 steps) | Customer journey, lifecycle |
| `roadmap_vertical.typ` | primaviz | Vertical roadmap (4-8 nodes) | Annual plan, progress tracking |
| `sector_diagram.typ` | cetz | Semi-circle sector layout (4-8 areas) | Service architecture, ecosystem |
| `concentric_circles.typ` | primaviz | Concentric circle hierarchy (3-5 layers) | Priority levels, bullseye chart |
| `isometric_stairs.typ` | cetz | Staircase progression (4-7 stages) | Growth stages, maturity model |
| `vertical_list.typ` | native | Numbered vertical list (3-6 points) | Advantage list, key takeaways |
| `word_cloud.typ` | primaviz | Keyword weight cloud (20-30 words) | Hot topics, tag cloud |

---

## Package Selection Priority

| Priority | Package | Version | Best For |
|----------|---------|---------|----------|
| 1 | `lilaq` | 0.6.0 | Existing SeaSlides line, bar, scatter, area, distribution, and scientific chart templates |
| Alt | `gribouille` | 0.6.0 | Layered Grammar-of-Graphics plots with mapped aesthetics and statistical transforms; API still evolving |
| 2 | `primaviz` | 0.8.0 | Pie, donut, radar, heatmap, gauge, bullet, waterfall, sankey, treemap (50+ charts, declarative) |
| 3 | `merman` | 0.1.0 | Mermaid Gantt, sequence, flowchart, class, and state diagrams rendered to SVG |
| 4 | `pintorita` | 0.1.4 | Diagrams not available in the selected Mermaid family, such as specialized activity, ER, mind-map, or component layouts |
| 5 | `tdtr` | 0.6.1 | Tree hierarchy: org charts, classification trees, decision trees |
| 6 | `fletcher` | 0.5.8 | Custom node-edge diagrams: chevron process, snake flow, state machines |
| 7 | `cetz` | 0.5.2 | Last resort: custom geometric drawing |
| - | `showybox` | 2.0.4 | Decorative boxes: KPI cards, callout boxes |
| Alt | `echarm` | 0.4.0 | ECharts charts (via CtxJS, use when LLM is more familiar with ECharts syntax) |

> **Principle**: Route by visual grammar rather than treating this table as a universal quality ranking. Use Lilaq for existing/direct statistical templates, Gribouille when mappings plus layers simplify the analysis, Primaviz for its specialized chart families, Merman for Mermaid source, and lower-level drawing packages only when the higher-level model does not fit.
>
> **Alternative**: The `echarm` package runs [Apache ECharts](https://echarts.apache.org/) in Typst via CtxJS, supporting nearly all ECharts chart types (line, bar, pie, radar, scatter, gauge, candlestick, etc.). Use when the LLM is more familiar with ECharts config syntax, or for complex charts difficult to achieve with native packages. Note: no animation support, first compilation requires WASM plugin download.

### Priority Decision Tree

```
What do you need to draw?
├── Existing/direct standard stats (line/bar/scatter/area/stacked bar) → lilaq
├── Layered analytical plot with mapped aesthetics/statistics → gribouille
├── Pie/donut/radar/heatmap/gauge/bullet/waterfall/sankey/treemap → primaviz
├── Gantt/sequence/flowchart/class/state diagram → merman (standard Mermaid syntax)
├── Specialized activity/ER/mind-map/component diagram → pintorita when needed
├── Custom node-edge diagrams (chevron/snake flow/state machine) → fletcher
├── Tree hierarchy (org chart/classification tree/decision tree) → tdtr
├── Pure layout (SWOT/matrix/KPI cards/timeline) → native Typst (grid/rect)
└── None of the above / LLM more familiar with ECharts → echarm (alternative)
```

---

## Package Usage Notes

### lilaq

```typst
#import "@preview/lilaq:0.6.0" as lq

// Line chart
lq.diagram(
  width: 560pt, height: 240pt,
  xaxis: (label: "X Axis"),
  yaxis: (label: "Y Axis"),
  lq.plot(x-data, y-data, stroke: color + 1.5pt, label: "Series Name"),
)

// Bar chart
lq.bar(x-positions, values, fill: colors, width: 60%, label: "Series Name")

// Scatter chart
lq.scatter(x-data, y-data, color: color, mark: "o")

// Stacked bar chart: use base parameter
lq.bar(x, values, fill: color, base: base-values, width: 60%)
```

**Notes**:
- `lq.hbar`'s `width` parameter doesn't work well on small canvases, not suitable for bullet charts
- Stacked area charts require manual cumulative value calculation
- Trend lines use `lq.plot` two-point connection with `mark: none`

**Axis configuration pitfalls**:
- **Do NOT** put `min`/`max` inside `xaxis` or `yaxis` dicts — this causes `assertion failed: Unexpected named argument "min"`. Use `xlim` / `ylim` at the `lq.diagram()` level instead:
  ```typst
  // ❌ WRONG — min/max inside axis dict
  lq.diagram(yaxis: (label: "Score", min: 0, max: 100), ...)

  // ✅ CORRECT — ylim at diagram level
  lq.diagram(ylim: (0, 100), yaxis: (label: "Score"), ...)
  ```
- `xaxis` and `yaxis` dicts accept: `label`, `ticks`, `subticks`, `tick-step`, `minor-tick-step`
- For custom tick labels, use: `ticks: ((0, "Label A"), (1, "Label B"), ...)`

### gribouille (Grammar of Graphics alternative)

```typst
#import "@preview/gribouille:0.6.0": *

#plot(
  data: penguins,
  mapping: aes(x: "flipper-len", y: "body-mass", colour: "species"),
  layers: (
    geom-point(size: 2pt, alpha: 0.35),
    geom-smooth(method: "lm", se: true, alpha: 0.15),
  ),
  scales: scales(
    x: scale-continuous(),
    y: scale-continuous(),
    colour: scale-discrete(),
  ),
  labels: labels(x: "Flipper Length", y: "Body Mass", colour: "Species"),
  theme: theme-minimal(text: element-text(size: 16pt)),
  width: 20cm,
  height: 10cm,
)
```

Use Gribouille when the analytical structure is naturally expressed through
data mappings, layers, statistics, scales, and themes. Keep Lilaq for the
existing SeaSlides chart-template path or when direct mark/axis control is
simpler. Gribouille is in active development: pin `0.6.0`, read the current
documentation, and compile a small probe before building a dense slide.

### primaviz (50+ chart types)

```typst
#import "@preview/primaviz:0.8.0": treemap, radar-chart, heatmap, sankey-chart,
  gauge-chart, bullet-chart, funnel-chart, waffle-chart, sunburst-chart, themes
```

**Templates using primaviz**: `treemap_chart`, `heatmap_chart`, `radar_chart`, `gauge_chart`, `bullet_chart`, `sankey_chart`, `waterfall_chart`, `pie_chart`, `donut_chart`

**Key parameters**:
- **size**: Controls chart size, e.g. `size: 320pt`
- **show-values**: Display value labels
- **title: none**: Hide title (use Touying heading instead)
- **theme: (background: none, border-color: none)**: Remove default background to blend with slide
- **themes.presentation**: Presentation preset (larger font sizes)
- **with-theme()**: Set global theme

**Common data formats**:

```typst
// Simple data (treemap/funnel/waffle/pie, etc.)
(labels: ("A", "B", "C"), values: (100, 200, 300))

// Multi-series data (radar/line/bar, etc.)
(labels: ("Dim 1", "Dim 2"), series: ((name: "Series A", values: (90, 85)),))

// Heatmap data
(rows: ("Row 1", "Row 2"), cols: ("Col 1", "Col 2"), values: ((1, 2), (3, 4)))

// Sankey data
(nodes: ("A", "B", "C"), flows: ((from: 0, to: 2, value: 50),))

// Gauge
gauge-chart(85, title: "Completion Rate")

// Bullet chart
bullet-chart(92, 100, (60, 80, 120), title: "Sales")
```

### merman (standard Mermaid syntax)

```typst
#import "@preview/merman:0.1.0": show-mermaid-blocks

// Use fenced Mermaid blocks through the package-provided handler.
#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)
```

**Supported chart types**: Flowchart (`graph TD/LR`), Sequence diagram (`sequenceDiagram`), Gantt chart (`gantt`), Class diagram (`classDiagram`), State diagram (`stateDiagram-v2`)

Merman embeds export-safe SVG rather than Typst-native shapes. Keep its default
panic-on-error behavior for delivery builds, and inspect label size in the PNG.
Use Pintorita only when its own supported diagram model fits better.

### pintorita (specialized declarative diagrams)

```typst
#import "@preview/pintorita:0.1.4"

// Mind map (pintorita's most typical use case)
#pintorita.render(
  style: "default",
  ```
  mindmap
  + Product Strategy
  ++ Technology
  +++ Architecture Upgrade
  +++ AI Integration
  -- Market
  --- Brand Positioning
  --- Channel Expansion
  ```.text,
  factor: .8,
)
```

**Additional support**: Activity diagram (`activityDiagram`), Component diagram (`componentDiagram`), ER diagram (`erDiagram`), Mind map (`mindmap`)

**render parameters**:
- `style`: `"default"` / `"dark"` / `"larkLight"` / `"larkDark"`
- `factor`: Scale factor, e.g. `.8` scales to 80%
- `font`: Font, default `Source Code Pro, sans-serif`
- Other parameters passed to `image` (e.g. `width`, `height`)

**Note**: WASM plugin first compilation takes ~30 seconds, subsequent runs are faster.

### tdtr (tree diagrams)

```typst
#import "@preview/tdtr:0.6.1": *

#tidy-tree-graph(
  draw-node: (shape: rect),
  draw-edge: (marks: "-", stroke: 0.8pt + gray),
  spacing: (16pt, 24pt),
  compact: true,
)[
  - Root
    - Child 1
      - Leaf A
    - Child 2
]
```

**Notes**:
- Outer `#set text(size: ...)` does not penetrate into nodes; must explicitly set `label: text(size: ...)[#label]` in `draw-node`
- Use `pt` not `em` for node dimensions (`em` scales with font causing overflow)
- On 16:9 slides with many nodes, keep width <= 64pt, spacing <= 16pt

### fletcher (node-edge diagrams)

```typst
#import "@preview/fletcher:0.5.8": diagram, node, edge

#diagram(
  node((0, 0), [Start]),
  edge("->"),
  node((1, 0), [End]),
)
```

### cetz (custom drawing, last resort)

```typst
#import "@preview/cetz:0.5.2"

#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas.with(length: 38pt),
  cover: cetz.draw.hide.with(bounds: true),
)

#cetz-canvas({
  import cetz.draw: *
  rect((0, 0), (5, 3), fill: blue, stroke: none)
  content((2.5, 1.5), text(size: 12pt)[Label], anchor: "center")
})
```

### echarm (alternative: ECharts charts)

Runs [Apache ECharts](https://echarts.apache.org/) in Typst via CtxJS. Use when the LLM is more familiar with ECharts config, or for complex charts (e.g. candlestick, composite charts) difficult to achieve with native packages.

```typst
#import "@preview/echarm:0.4.0"

// options is the standard ECharts configuration object
#echarm.render(width: 100%, height: 100%, options: (
  xAxis: (type: "category", data: ("Mon", "Tue", "Wed", "Thu", "Fri")),
  yAxis: (type: "value"),
  series: ((type: "bar", data: (120, 200, 150, 80, 70)),),
))
```

**Notes**:
- `options` parameter is standard ECharts config, see https://echarts.apache.org/en/option.html
- No animation support
- For JavaScript callbacks use `echarm.eval-later("js code")`
- Based on CtxJS WASM plugin, first compilation is slower

---

## Layout Best Practices

### Avoid Using place

`place` is absolute positioning — it easily causes overflow, overlap, and is hard to maintain. Prefer alternatives:

```typst
// ❌ place with manual positioning
#box(width: 800pt, height: 400pt)[
  #place(top + left, dx: 0pt, dy: 0pt, rect(...))
  #place(top + left, dx: 200pt, dy: 0pt, rect(...))
]

// ✅ grid for automatic layout
#grid(columns: (1fr, 1fr), gutter: 8pt,
  rect(...),
  rect(...),
)

// ✅ stack for simple arrangement
#stack(dir: ltr, spacing: 8pt,
  rect(...),
  rect(...),
)
```

**When place is still needed**: Special layouts like alternating above/below positioning on timelines.

### Data-Driven Pattern

Avoid repetitive code — use data arrays + loops/map to generate chart elements:

```typst
#let kpis = (
  ("Sales Revenue", "$92M", 92, color-green),
  ("New Customers", "485",  97, color-green),
)

#grid(columns: (170pt, 1fr, 70pt), gutter: 12pt,
  ..kpis.map(kpi => {
    let (name, actual, pct, bar-color) = kpi
    (
      align(right + horizon)[*#name*],
      align(horizon)[#draw-chart(pct, bar-color)],
      align(left + horizon)[*#text(fill: bar-color)[#pct%]*],
    )
  }).flatten()
)
```

---

## Font Size and Dimension Standards

| Element | Size | Notes |
|---------|------|-------|
| Title | 20pt | `text(size: 20pt, weight: "bold")` |
| Subtitle | 11-12pt | `text(size: 11pt, fill: rgb("#888888"))` |
| Body / Legend | 16pt | Default body size |
| Chart labels | 14pt | Axis labels, data labels |
| Auxiliary notes | 11-12pt | Data source, annotations |
| Legend color block | 20pt x 16pt | `rect(width: 20pt, height: 16pt)` |
| Chart dimensions | 560pt x 240pt | Standard lilaq diagram size |

---

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|---------|
| Content overflows to multiple pages | Chart/text too large | Reduce font size, spacing, chart dimensions |
| cetz canvas overflows grid column | `length` too large | Decrease `length` value |
| Font warning | Font not installed on system | Does not affect output, can be ignored |
| lilaq chart is blank | Data format error | Check that x/y data are arrays |
| place content overlaps | Coordinate calculation error | Switch to grid/stack/cetz |
| Stacked chart layering error | base value calculation error | Use fold for cumulative base calculation |
