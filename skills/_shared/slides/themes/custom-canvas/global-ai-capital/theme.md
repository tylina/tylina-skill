# Global AI Capital Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `ai-capital-theme`
**Style**: Dark editorial / Bloomberg infographic -- financial data visualization on dark backgrounds
**Primary color**: `#E63946` (Scarlet Red)
**Best For**: Investment research, AI industry briefings, venture capital, financial data visualization
**Style Objective**: Dark Editorial / Financial
**Complexity Level**: Canvas

## Description

A dark editorial presentation theme inspired by Bloomberg/Economist infographic style. Features near-black backgrounds with warm ivory text, scarlet red accent bars, dark card surfaces, and data-dense component layouts including KPI cards, chart bars, horizontal ranking bars, hub-spoke diagrams, flow cards, and comparison tables. Designed for AI industry briefings, capital market analysis, and financial data storytelling.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "PingFang SC"), size: 11pt)

#show: ai-capital-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [AI Capital Markets 2026],
    subtitle: [Industry Briefing],
    author: [Research Team],
    date: datetime.today(),
  ),
)

#cover-slide(
  title: [Global AI Capital],
  subtitle: [Capital, Compute, and the Closed Loop],
)

== Market Overview

Your data-dense content here.
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |

## Available Slide Types

### `#cover-slide(bg-image: none, title: none, subtitle: none, info-left: none, info-right: none, source: none)`
Full-bleed dark cover with 64pt hero title, gradient scrims, INDUSTRY BRIEFING eyebrow, and optional background image.

### `#slide(title: auto)`
Standard dark content slide with bold title, red accent rule, and footer with page counter.

### `#chapter-slide(bg-image: none, part-label: none, roman: none, cn-title: none, en-title: none, subtitle: none, bullets: ())`
Full-bleed chapter anchor with background image, scrim, large roman numeral, bilingual title, and bullet summary.

### `#ending-slide[...]`
Dark ending slide with subtle vertical editorial rules that echo the cover's grid and red hairline. It has no automatic header/footer.

## Reusable Components

### `#accent-rule(width: 60pt, thickness: 2.5pt)`
Horizontal red accent bar.
```typst
#accent-rule(width: 80pt)
```

### `#section-label(body)`
Tracked uppercase label in faint color.
```typst
#section-label[VALUATION OVERVIEW]
```

### `#page-title(..args)`
Large title with optional accent-colored portions.
```typst
#page-title[Surge: ][Red Text][White Text]
```

### `#hero-num(value, size: 48pt, variant: "accent")`
Large financial figure. Variants: `"accent"`, `"amber"`, `"primary"`, `"green"`.
```typst
#hero-num([\$3.8T])
#hero-num([\$724M], variant: "amber")
```

### `#kpi-card(label, value, desc, source?)`
Dark card with label, large number, description, optional source.
```typst
#kpi-card[Market Cap][\$3.8T][Combined valuation][Bloomberg 2026]
```

### `#stat-card(label, value, desc, variant: "accent")`
Compact KPI with colored left bar.
```typst
#stat-card[COMPUTE][\$800B][Annual AI spend]
```

### `#company-card(tag, name, body, variant: "accent")`
Company comparison card with colored top bar.
```typst
#company-card[NVDA][NVIDIA][Revenue +240% YoY...]
```

### `#risk-card(label, title, subtitle, bullets, variant: "accent")`
Risk/opportunity card with colored top border.
```typst
#risk-card[RISK 01][Concentration][Single-vendor risk][- Supply chain...]
```

### `#chart-bar(height-pct, label-top, label-bottom, sub-bottom, variant: "accent", max-height: 260pt)`
Vertical bar chart element.
```typst
#chart-bar(90, [\$3.8T], [NVIDIA], [GPU Platform])
```

### `#hbar(label, sub-label, value-label, width-pct-str, variant: "accent")`
Horizontal ranking bar.
```typst
#hbar([NVIDIA], [GPU], [\$3.8T], "90%")
```

### `#hub-node(label, amount, sub)` / `#spoke-node(name, detail, variant: "default")`
Hub-spoke diagram components.
```typst
#hub-node([CORE], [\$180B], [Total AI Capex])
#spoke-node([Azure AI], [200K GPUs], variant: "active")
```

### `#toc-entry(roman, cn-title, en-title, pages, desc)`
Table of contents entry row.
```typst
#toc-entry[I.][Valuation][估值][P.04-08][Overview of market cap...]
```

### `#std-footer(source-text)`
In-flow footer with source and page counter. Put it after `#v(1fr)` so dense slide content cannot collide with it.
```typst
#std-footer[Source: Bloomberg, May 2026]
```

## Color Scheme

| Color | Hex | Role |
|-------|-----|------|
| Near Black | `#0E1116` | Page background |
| Card Dark | `#1A1F26` | Card surfaces |
| Warm Ivory | `#E8E6E1` | Primary headings |
| Scarlet Red | `#E63946` | Accent bars, key numbers |
| Amber | `#F4A261` | Secondary accent |
| Body Text | `#C9C5BE` | Standard body text |
| Gray | `#8A857E` | Subtitles, descriptions |
| Faint | `#5C5852` | Metadata, sources |
| Border | `#2A2F36` | Card borders, dividers |
| Green | `#52B788` | Positive indicators |

### Touying Color Mapping

Touying's primary color maps to Scarlet Red, `neutral-lightest` maps to Warm Ivory, and `neutral-darkest` maps to Near Black.

## Files

- `template.typ` -- Theme definition (palette, components, slides, entry point)
- `demo.typ` -- Compilable showcase (AI capital markets topic)

## Demo

See `demo.typ` for a compilable example.
