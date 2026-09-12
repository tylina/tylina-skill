# Executor Consultant — Consulting Style

## Contents

- [Role and references](#role-definition)
- [Complexity level](#complexity-level)
- [Data visualization techniques](#consultant-specific-data-visualization-techniques)
- [Layout patterns](#consulting-specific-layout-patterns)
- [Speaker notes](#speaker-notes-style)
- [Common use cases](#common-use-cases)
- [Package reference](#package-version-reference)
- [Quality checklist](#quality-checklist)

## Role Definition
Data-driven consulting style Typst design executor, specializing in business reviews, performance reports, market analysis, and professional presentations.

> **Scope**: This file owns data-heavy consulting execution. Use `consultant-top.md` only for board-level, investment, or MBB-style recommendation decks; shared workflow and technical rules remain in `base.md` and `shared-standards.md`.

## References
- `base.md` — Common execution guidelines
- `shared-standards.md` — Typst/Touying technical constraints (versions, layout, TCS)
- `template-designer.md` — Theme design patterns and component architecture

---

## Complexity Level

> See `shared-standards.md` §1c for the full Plain/Rich/Canvas comparison table.

Consulting style **defaults to Rich** — KPI dashboards, chart visualizations, data tables with professional formatting.

| Complexity | When to Use |
|------------|-------------|
| **Rich (default)** | Business reviews, performance reports, market analysis with full data visualization |
| **Canvas** | Premium consulting deliverables where every page has unique visual composition |
| **Plain (override)** | Informal project updates, quick status reports, internal team briefings |

---

## Consultant-Specific Data Visualization Techniques

### 1. KPI Dashboard Design

> **Component implementation**: See `template-designer.md` for the `kpi-card` component definition. Define it in `template.typ`, call from `main.typ`.

**Usage pattern in main.typ**:

```typst
== Key Performance Indicators

// Option A: grid for multi-row KPIs
#grid(columns: (1fr, 1fr), gutter: 12pt,
  kpi-card([Revenue], [$12.5M], change: [+15% YoY]),
  kpi-card([Market Share], [28.5%], change: [+3.2 pts]),
  kpi-card([Customer Satisfaction], [92.3%], change: [+5.1 pts]),
  kpi-card([Operating Margin], [18.7%], change: [+2.3 pts]),
)

// Option B: cols for single-row
#cols[
  #kpi-card([Revenue], [$12.5M], change: [+15% YoY])
][
  #kpi-card([Market Share], [28.5%], change: [+3.2 pts])
]
```

**Best Practices**: Use consistent accent color, show both absolute value and change, include comparison context (YoY, QoQ, vs target), use `lazy-v(1fr)` for height equalization.

### 2. Chart Color Conventions

Use a **single-color depth gradient**: `(primary, primary.lighten(20%), primary.lighten(40%), primary.lighten(60%))`. Apply varying lightness for bars/pies, consistent stroke for lines, varying size for scatter. Professional appearance, prints well in grayscale.

> **Chart code**: See `${TYLINA_SKILLS_ROOT}/_shared/charts/README.md` for lilaq, gribouille, cetz-plot, and other chart package APIs. NEVER write chart code from memory.

### 3. Data Annotation Principles

- **Direct labeling** — labels on data points, not in legend
- **Contextual notes** — brief explanations for key insights
- **Threshold lines** — dashed lines for targets/benchmarks

> Use `draw.content()` for labels and `draw.line(stroke: (dash: "dashed"))` for thresholds. See `charts/README.md` for cetz API details.

### 4. Table Design

```typst
#table(
  columns: 4,
  stroke: 0.5pt + gray,
  align: (left, center, right, right),
  fill: (x, y) => if y == 0 { primary.lighten(90%) } else { white },
  table.header([*Metric*], [*2023*], [*2024*], [*Change*]),
  [Revenue], [$10.2M], [$12.5M], [+22.5%],
  [Gross Margin], [42.3%], [45.1%], [+2.8 pts],
  [Net Income], [$1.5M], [$2.3M], [+53.3%],
)
```

> Each cell is a separate content argument — do NOT use `|` separators. Use `table.header(...)` for header row.

### 5. Callout Components

Define `insight-box(title, body)` and `finding-box(title, body, accent)` in template.typ (see `template-designer.md`). Call cleanly from main.typ: `#finding-box([Key Insight], [Body text])`.

> **showybox**: API is `showybox(title: ..., frame: (...))[content]`. No `.box()` or `.warning-box()` methods exist.

---

## Consulting-Specific Layout Patterns

> **Chart/diagram code**: See `${TYLINA_SKILLS_ROOT}/_shared/charts/README.md` for fletcher, cetz, and other package APIs. Read the matching chart template before writing code. Below describes *when* to use each pattern.

| Pattern | Tool | Use Case | Key Principle |
|---------|------|----------|---------------|
| **MECE Decomposition Tree** | fletcher | Market segmentation, org breakdown | Mutually exclusive, collectively exhaustive, balanced depth |
| **Driver Tree** | cetz | Revenue/cost cause-and-effect | Root metric → drivers → sub-drivers |
| **Matrix / Quadrant** | cetz | BCG matrix, priority mapping | 2x2 with colored quadrant backgrounds, data circles |
| **Process Flow** | fletcher | Customer journey, pipeline stages | Linear `node→edge→node` with gradient lightness |

---

## Speaker Notes Style

### Analyst Tone

- Objective and factual
- Data-driven explanations
- Professional and measured
- Focus on insights and implications

### Data Presentation Guidelines

When presenting data: (1) State the number clearly, (2) Provide context (vs target/benchmark/prior), (3) Explain drivers, (4) Highlight implications. Use precise language (avoid "about", "around").

### Key Terminology

| Term | Meaning | Usage |
|------|---------|-------|
| **YoY** | Year-over-Year | "Revenue increased 15% YoY" |
| **QoQ** | Quarter-over-Quarter | "Margin improved 2 pts QoQ" |
| **pts** | Percentage points | "Market share grew 3 pts" |
| **CAGR** | Compound Annual Growth Rate | "5-year CAGR of 12%" |

---

## Common Use Cases

- **Business Review**: KPI dashboard → Financial tables → Operational drivers → Market matrix → MECE challenges → Action plan
- **Market Analysis**: Overview → Segmentation (MECE) → Competition (matrix) → Trends (charts) → Opportunity → Recommendations
- **Performance Report**: KPI cards → Metrics tables → Variance → Root cause (drivers) → Outlook → Next steps

---

## Package Version Reference

> See `shared-standards.md` §5 and `base.md` §5 for the full content enhancement package table. Key additions for consulting: **lilaq** (existing/direct chart templates), **gribouille** (layered analytical plots), **mitex** (financial formulas), **cheq** (roadmap checklists), and **merman** (Mermaid process diagrams).

---

## Quality Checklist

> **Common checks**: See `base.md` §8 for the full shared checklist.

**Consultant-specific checks**:
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] Chart colors follow single-color depth gradient
- [ ] Tables use cell-per-argument syntax with `table.header(...)`
- [ ] KPI cards are template-defined components, not inline code
- [ ] MECE principles applied to frameworks
- [ ] Data annotations provide context
- [ ] Speaker notes use analyst tone
- [ ] Insights are data-driven, recommendations actionable
