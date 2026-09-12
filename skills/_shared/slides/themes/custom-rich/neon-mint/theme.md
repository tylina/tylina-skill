# Neon Mint Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `neon-mint-theme`
**Style**: Fresh, modern, tech-forward / light theme
**Primary color**: `#00E5A0` (Neon Mint)
**Best For**: Startup pitches, tech product launches, innovation showcases, developer-focused presentations
**Style Objective**: Modern Startup
**Complexity Level**: Rich

## Description

A fresh, modern, tech-forward presentation theme with bright neon mint green as primary accent and electric blue as secondary. Clean white backgrounds with geometric circuit-board-inspired SVG line patterns create an energetic but polished look — perfect for startup pitch decks, tech product demos, and innovation presentations. Features circuit trace backgrounds, connection node decorations, dot-grid patterns, and signal pulse dividers.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: neon-mint-theme.with(
  aspect-ratio: "16-9",
  footer: [Company Name -- Event 2026],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Neon frame border with circuit-board trace background, centered charcoal title, circuit divider decoration, electric blue subtitle, author info, and date in mint green.

### `#slide(title: auto)`
Clean white content slide with persistent dot-grid atmosphere, bold charcoal title with circuit divider underline, mint dot separator in footer with page numbers.

### `#new-section-slide[...]`
Section divider with left neon mint accent bar, large mint section number, signal pulse decoration, bold section title, dot-grid background, and bottom accent line.

### `#focus-slide[...]`
Charcoal background with circuit trace overlay, corner connection nodes, centered neon mint text, and circuit divider below content.

### `#ending-slide[...]`
White background with circuit traces, neon frame (bookend with title slide), circuit divider above centered charcoal text, and mint accent pill below.

## Reusable Components

### `#concept-card(title, body, accent: palette.primary)`
Card with colored left border and connection node indicator for structured content.
```typst
#concept-card([Title], [Body content here.], accent: palette.primary)
```

### `#insight-box(title, body)`
Highlighted box with signal-pulse SVG decoration, light mint background, and left accent border.
```typst
#insight-box([Key Insight], [Important finding or observation.])
```

### `#stat-card(label, value, color: palette.primary)`
Metric card with large value display and neon accent node in corner.
```typst
#stat-card([Revenue], [\$8.2M], color: palette.primary)
```

### `#metric-card(label, value, description, color: palette.primary)`
Enhanced stat card with top color border, inline signal pulse, and subtitle description.
```typst
#metric-card([ARR], [\$8.2M], [142% YoY growth], color: palette.primary)
```

### `#code-card(title, body, accent: palette.secondary)`
Technical content box with monospace title styling and code-block-friendly design.
```typst
#code-card([API Endpoint], [```GET /api/v2/deploy``` ...], accent: palette.secondary)
```

### `#feature-card(icon-text, title, body, accent: palette.primary)`
Borderless card using gradient background, large icon text, and clean typography.
```typst
#feature-card([🚀], [Fast Deploys], [Sub-minute deployment times.], accent: palette.primary)
```

### `#comparison-box(left-title, left-body, right-title, right-body)`
Two-panel comparison layout with VS separator, mint-tinted left panel and blue-tinted right panel.
```typst
#comparison-box([Before], [Old approach...], [After], [New approach...])
```

### `#callout-box(title, body, accent: palette.secondary)`
Attention-grabbing box with full accent border, tinted background, and accent underline.
```typst
#callout-box([Important], [Critical information here.], accent: palette.secondary)
```

### `#trace-divider(color: palette.primary, width: 80%)`
SVG-based circuit trace divider with connection nodes for section separation.
```typst
#trace-divider(width: 60%)
```

### `#neon-tag(content, color: palette.primary)`
Small capsule tag with glowing dot indicator for categorization.
```typst
#neon-tag([Kubernetes], color: palette.secondary)
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **White** | `#FAFFFE` | `palette.bg` | Background |
| **Neon Mint** | `#00E5A0` | `palette.primary` | Primary accent, titles, key decorations |
| **Electric Blue** | `#3B82F6` | `palette.secondary` | Secondary highlights, code accents |
| **Light Mint** | `#E0FFF4` | `palette.light-mint` | Card tints, insight boxes |
| **Charcoal** | `#1F2937` | `palette.charcoal` | Main text, titles |
| **Warm Gray** | `#6B7280` | `palette.warm-gray` | Muted text, footers |
| **Card White** | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| **Mint Dark** | `#00B87A` | `palette.primary-dark` | Darker mint accent variant |
| **Blue Light** | `#DBEAFE` | `palette.secondary-light` | Light blue tint |
| **Mint Border** | `#D1FAE5` | `palette.border` | Subtle borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.card-bg,
  neutral-darkest: palette.text,
)
```

## SVG Decorations

| SVG | Description | Usage |
|-----|-------------|-------|
| Circuit Traces | Horizontal/vertical PCB traces with right-angle turns and connection nodes | Title, ending, focus backgrounds |
| Dot Grid | Evenly-spaced dot pattern with accent highlights | Content slide atmosphere |
| Neon Frame | Geometric border with circuit-trace corners (bookend element) | Title + ending slides |
| Circuit Divider | Inline trace with nodes for section separation | Headers, between content |
| Signal Pulse | ECG-like waveform for section headers | New-section slides, insight boxes |

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all components and slide types.
