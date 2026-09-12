# McKinsey Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | mckinsey |
| **Best For** | Strategy consulting, executive briefings, board presentations |
| **Style Objective** | MBB Consulting |
| **Complexity Level** | Rich |

A premium, data-driven presentation theme inspired by McKinsey & Company's structured, analytical consulting style. Designed for executive briefings, strategic recommendations, and investment analysis with clean whitespace, action titles, and MECE framework support.

## Preview

See `output/` folder for rendered slide images after compilation.

## Design Philosophy

- **Structured Thinking**: Every slide follows the "action title + evidence" pattern used in top-tier consulting
- **Data-Driven**: KPI cards, data tables, and financial frameworks put numbers front and center
- **Professional Whitespace**: Content coverage kept under 65% for readability and executive scanning
- **Minimalist Premium**: Light theme with restrained use of color — blue for authority, amber for emphasis
- **MECE Frameworks**: Components designed to present mutually exclusive, collectively exhaustive analysis

## Color Palette

| Token | Hex | Usage |
|---|---|---|
| `palette.blue` | `#005587` | Primary brand, headers, top bar, key accents |
| `palette.teal` | `#004D5C` | Secondary accent, framework boxes |
| `palette.amber` | `#F5A623` | Highlight, takeaway boxes, section divider accents |
| `palette.bg` | `#FFFFFF` | Slide background |
| `palette.bg-light` | `#ECF0F1` | Alternating table rows, framework box fills |
| `palette.card-bg` | `#FFFFFF` | Card backgrounds |
| `palette.text-dark` | `#333333` | Titles, headings |
| `palette.text-body` | `#5A5A5A` | Body text |
| `palette.text-light` | `#737373` | Footer, captions, secondary text |
| `palette.border` | `#D5D8DC` | Card borders, table lines |
| `palette.success` | `#27AE60` | Positive trends, on-track status |
| `palette.success-text` | `#1E7F46` | Accessible positive foreground on light cards |
| `palette.danger` | `#E74C3C` | Negative trends, risk indicators |
| `palette.danger-text` | `#C83C30` | Accessible negative foreground on light cards |
| `palette.amber-text` | `#A96500` | Accessible amber foreground on light cards |

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.blue` | Theme accent, `alert()` text, focus-slide backgrounds |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` | Dark text on light backgrounds |

## Fonts

Fonts are not set in `template.typ`. Configure your preferred fonts in your main document (e.g., `main.typ` or `demo.typ`) using Typst's `set text(font: ...)` rule. Recommended system sans-serif stack: Arial, Helvetica Neue, Roboto, Noto Sans SC.

## Quick Start

```typst
#import "template.typ": *

#show: mckinsey-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Company Name | Confidential],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle or Engagement Context],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
)

#set text(font: ("Arial", "Helvetica"))

#title-slide()

= Section Title

== Action Title That States the Key Finding

Your content here...
```

## Slide Functions

### `title-slide(..args)`
White cover slide with subtle geometric decorations, left accent bar, and clean typography. Displays title, subtitle, author, institution, and date from `config-info`.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with:
- 4pt blue top bar
- Bold title with subtle 2pt underline
- Footer with custom text and page numbers
- Set `title: none` to hide the title, or `title: [Custom Title]` to override

### `new-section-slide(self: none, body)`
Blue background section divider with amber accent bar. Automatically triggered by `= Section Heading` syntax.

### `focus-slide(body)`
Full blue background with large centered white text. Used for key recommendations, decisions, or calls to action.

### `ending-slide(body)`
Clean white ending slide with centered text, blue underline, and subtle geometric decorations.

## Reusable Components

### `takeaway-box(content)`
Amber left-border box for slide-level key takeaways or action messages. Place at the top of content slides to state the "so what" before presenting evidence.

```typst
#takeaway-box[Revenue growth has stalled at 3% due to declining customer retention]
```

### `kpi-card(label, value, trend: none, accent: palette.blue)`
Clean metric card with left accent bar. Ideal for dashboards and KPI summaries. Its label and value/trend row share one `stack(spacing:)`; the card deliberately uses a left-aligned consulting layout rather than the centered icon → value → label pattern. One terminal `lazy-v(1fr)` supports one-card-per-column `cols(lazy-layout: true)` layouts and is inert in ordinary vertical stacks.

```typst
#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  kpi-card([Revenue], [\$2.4B], trend: [▲ 12% YoY], accent: palette.success),
  kpi-card([EBITDA Margin], [18.5%], trend: [▼ 2pp], accent: palette.danger),
  kpi-card([Customer NPS], [+42], trend: [stable], accent: palette.blue),
)
```

### `insight-box(title, body)`
Blue left-border box for key insights, findings, or analytical observations. Its terminal `lazy-v(1fr)` is inert when combined with another component in an ordinary column.

```typst
#insight-box([Market Analysis], [
  The addressable market is growing at 8% CAGR, driven by digital-native consumers
  who expect personalized experiences across all touchpoints.
])
```

### `data-table(align: center + horizon, headers, rows)`
Clean styled table with blue header row and alternating row backgrounds.

```typst
#data-table(
  ([Metric], [Q1], [Q2], [Q3], [Q4]),
  (
    ([Revenue], [\$580M], [\$620M], [\$695M], [\$740M]),
    ([Growth], [8%], [12%], [15%], [11%]),
  ),
)
```

### `pillar-card(number, title, description)`
Numbered strategic pillar with blue top accent and circular number badge. Perfect for presenting strategic frameworks, workstreams, or initiative portfolios. Use it in a lazy layout only when each column contains exactly one direct pillar card.

```typst
#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pillar-card(1, [Digital Transformation], [Modernize core platforms and enable data-driven decisions]),
  pillar-card(2, [Operational Excellence], [Streamline processes and reduce cost-to-serve by 20%]),
  pillar-card(3, [Talent & Culture], [Build capabilities in analytics, agile, and customer-centricity]),
)
```

### `framework-box(title, body)`
Teal left-border box for structured framework displays (MECE decompositions, SCQA narratives, process flows). Its terminal `lazy-v(1fr)` is inert in an ordinary vertical stack.

```typst
#framework-box([SCQA Framework], [
  *Situation:* Market share has grown 5% over 3 years\
  *Complication:* Two new entrants are disrupting pricing\
  *Question:* How should we defend and grow share?\
  *Answer:* Invest in differentiation through loyalty and experience
])
```

### `status-badge(label, color: palette.success)`
Small colored badge for status indicators in tables and milestone trackers.

```typst
#status-badge([On Track])
#status-badge([At Risk], color: palette.amber)
#status-badge([Delayed], color: palette.danger)
```

### `progress-bar(percentage, color: palette.blue, height: 8pt)`
Horizontal progress indicator for project tracking.

```typst
#progress-bar(75, color: palette.success)
```

## Theme Configuration

### `mckinsey-theme(aspect-ratio: "16-9", footer: none, ..args, body)`

| Parameter | Default | Description |
|---|---|---|
| `aspect-ratio` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `none` | Footer text content (left-aligned) |
| `..args` | — | Additional Touying config (e.g., `config-info(...)`) |

## Best Practices

1. **Action Titles**: Every slide title should state the key finding or recommendation, not just a topic label
   - Bad: "Financial Overview"
   - Good: "Revenue growth has stalled at 3% due to declining customer retention"

2. **Takeaway First**: Use `takeaway-box` at the top of each content slide to state the "so what"

3. **MECE Structure**: Use `framework-box` to present mutually exclusive, collectively exhaustive breakdowns

4. **Data Density**: Combine `kpi-card` grids with `insight-box` to balance quantitative and qualitative evidence

5. **Pyramid Principle**: Structure content top-down — lead with the answer, then provide supporting evidence

## Best For

- Strategic consulting presentations
- Executive briefings and board materials
- Investment analysis and business cases
- Business proposals and transformation roadmaps
- Due diligence reports
- Operational improvement recommendations

## Recommended Complexity

**Rich** — This theme supports rich component composition with multiple KPI cards, data tables, framework boxes, and pillar cards per slide for data-intensive consulting presentations.

## Compilation

```bash
typst compile demo.typ output/demo.pdf
```

## File Structure

```
mckinsey/
├── template.typ    # Theme definition (colors, slides, components)
├── demo.typ        # 21-slide demo with realistic consulting content
├── theme.md        # Concise API reference
├── theme_design_spec.md
└── output/         # Rendered slide images (after compilation)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
