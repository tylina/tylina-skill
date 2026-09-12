# Global AI Capital Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | global-ai-capital |
| **Best For** | Investment research, AI industry briefings, venture capital, financial data visualization |
| **Style Objective** | Dark Editorial / Financial |
| **Complexity Level** | Canvas |

A dark editorial presentation theme inspired by Bloomberg/Economist infographic style. Features near-black backgrounds with warm ivory text, red accent bars, dark card surfaces, and data-dense component layouts. Designed for AI industry briefings, capital market analysis, and financial data storytelling.

## Design Philosophy

- **Dark Editorial Aesthetic**: Near-black backgrounds with warm ivory/cream text create a premium financial publication feel
- **Red Accent System**: Scarlet red accent bars, hero numbers, and borders draw attention to key data points
- **Data-Dense Components**: KPI cards, chart bars, horizontal ranking bars, flow cards, and comparison tables present financial data at high density
- **Information Hierarchy**: Section labels, page titles with dual-colored text, and editorial cards create clear reading flow

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Near Black | `#0E1116` | Primary background |
| Card Dark | `#1A1F26` | Card surface background |
| Warm Ivory | `#E8E6E1` | Primary headings and key text |
| Scarlet Red | `#E63946` | Accent bars, hero numbers, alerts |
| Amber | `#F4A261` | Secondary accent, chart variant |
| Body Text | `#C9C5BE` | Standard body text |
| Gray | `#8A857E` | Subtitles, descriptions |
| Faint | `#5C5852` | Metadata, sources, section labels |
| Border | `#2A2F36` | Card borders, dividers |
| Green | `#52B788` | Positive indicators |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: ai-capital-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [AI Capital Markets 2026],
    subtitle: [Industry Briefing],
    author: [Research Team],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio |

## Slide Functions

### `cover-slide(bg-image: none, title: none, subtitle: none, info-left: none, info-right: none, source: none)`
Full-bleed dark cover with hero title (64pt bold), gradient scrims, INDUSTRY BRIEFING eyebrow, optional background image, bottom info blocks, and source/page counter footer.

### `slide(title: auto, ..args)`
Standard dark content slide with bold header title, red accent rule below, border-topped footer with page counter. Heading level 2 used for automatic title from `==` markup.

### `chapter-slide(bg-image: none, part-label: none, roman: none, cn-title: none, en-title: none, subtitle: none, bullets: ())`
Full-bleed chapter anchor with background image, scrim overlays, part label eyebrow, large roman numeral, dual-language title block, and bottom bullet summary.

### `ending-slide(body)`
Dark ending slide with subtle vertical editorial rules that echo the cover's grid and red hairline, with no automatic header/footer.

## Reusable Components

### `accent-rule(width: 60pt, thickness: 2.5pt)`
Horizontal red accent bar for visual anchoring.

```typst
#accent-rule(width: 80pt, thickness: 3pt)
```

### `section-label(body)`
Tracked uppercase small label in faint color for section identification.

```typst
#section-label[VALUATION OVERVIEW]
```

### `page-title(..args)`
Large page title with optional accent-colored portions. Alternates between primary and accent colors.

```typst
#page-title[Valuation Surge: From Q1 to ][Q2 Doubling]
```

### `page-subtitle(body)`
Italic gray subtitle line.

```typst
#page-subtitle[Three titans reshape the \$10T landscape]
```

### `hero-num(value, size: 48pt, variant: "accent")`
Large financial figure in accent/amber/primary/green color.

```typst
#hero-num([\$3.8T])
#hero-num([\$724M], variant: "amber")
```

### `kpi-card(label, value, desc, source?)`
Dark card with small label, large hero number, description, and optional source.

```typst
#kpi-card[Market Cap][\$3.8T][Combined AI Three valuation][Bloomberg 2026.05]
```

### `stat-card(label, value, desc, variant: "accent")`
Compact KPI with colored left bar.

```typst
#stat-card[COMPUTE SCALE][\$800B][Annual AI infrastructure spend]
```

### `editorial-card(body)`
Note card with red left accent bar for editorial commentary.

```typst
#editorial-card[Key insight: The concentration of capital...]
```

### `company-card(tag, name, body, variant: "accent")`
Comparison card with colored top bar and structured content.

```typst
#company-card[NVDA][NVIDIA][Revenue growth: 240% YoY...]
```

### `table-row(dim-label, dim-sub, us-val, us-sub, cn-val, cn-sub)`
Data comparison table row with dimension + two value columns.

```typst
#table-row[Compute][GPU clusters][18 万 H100][+340% YoY][8 万 A100][+220% YoY]
```

### `risk-card(label, title, subtitle, bullets, variant: "accent")`
Risk/opportunity quadrant card with colored top bar and bullet content.

```typst
#risk-card[RISK 01][Concentration Risk][Single-vendor dependency][- NVIDIA supply...]
```

### `closing-item(num, title, desc)`
Numbered closing/conclusion item with circled number and description.

```typst
#closing-item[1][Scale Is Moat][Capital intensity creates natural barriers]
```

### `flow-card(name, amount)`
Sankey-style flow card for capital movement visualization.

```typst
#flow-card[Microsoft AI Division][\$28B Capex]
```

### `hub-node(label, amount, sub)`
Central hub circle for hub-spoke diagrams.

```typst
#hub-node([CORE], [\$180B], [Total AI Capex 2026E])
```

### `spoke-node(name, detail, variant: "default")`
Peripheral spoke node for hub-spoke diagrams.

```typst
#spoke-node([Azure AI], [4 regions, 200K GPUs], variant: "active")
```

### `chart-bar(height-pct, label-top, label-bottom, sub-bottom, variant: "accent", max-height: 260pt)`
Vertical bar chart element with top value label and bottom category label.

```typst
#chart-bar(90, [\$3.8T], [NVIDIA], [GPU + AI Platform], variant: "accent")
```

### `hbar(label, sub-label, value-label, width-pct-str, variant: "accent")`
Horizontal ranking bar with label and value.

```typst
#hbar([NVIDIA], [GPU + Platform], [\$3.8T], "90%")
```

### `roman-num(n, variant: "accent")`
Large italic roman numeral for TOC/chapter numbering.

```typst
#roman-num[I.]
```

### `toc-entry(roman, cn-title, en-title, pages, desc)`
Table of contents entry with roman numeral, bilingual title, page range, and description.

```typst
#toc-entry[I.][估值跃迁][Valuation Leap][P.04-08][Three titans reshape...]
```

### `std-footer(source-text)`
In-flow footer with source text and page counter separated by a top border. Place it after `#v(1fr)` so dense body content cannot overlap it.

```typst
#std-footer[Source: Bloomberg Intelligence, May 2026]
```

## File Structure

```
global-ai-capital/
  template.typ   -- Theme definition (palette, components, slides)
  demo.typ       -- Full demonstration presentation
```
