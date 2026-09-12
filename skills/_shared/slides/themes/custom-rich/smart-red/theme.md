# Smart-Red Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `smart-red-theme`
**Style**: Modern, energetic, geometric hybrid (dark cover + light content)
**Primary color**: `#DE3545` (Primary Red)
**Best For**: Company introductions, product launches, solution presentations, education courseware
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A modern, energetic presentation theme featuring geometric triangle motifs, multi-layer semi-transparent overlays, and bold red-black contrast. Uses a dark cover/section design paired with clean light content slides. Best suited for company introductions, product launches, solution presentations, and education courseware.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#show: smart-red-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |
| `align` | alignment | `horizon` | Default vertical alignment |

## Available Slide Types

### `#title-slide()`
Dark (#333) background with multi-layer red triangle overlays, white centered title, and red-orange dual-line decoration.

### `#slide(title: auto, align: auto)`
Light background content slide with red 4pt top bar, bold title with red+orange underline, and red dot footer.
Use `align: top` for dense analytical layouts that should flow directly below the header.

### `#new-section-slide[...]`
Dark background with large red triangular cutouts, bold white section title, red accent bar, and orange underline.

### `#focus-slide[...]`
Full red (#DE3545) background with large white centered text and subtle white triangle overlays.

### `#ending-slide[...]`
Light background with centered white card, red accent bar, dual-line decoration, and red-orange dot pattern.

## Reusable Components

### `#feature-card(number, title, description, accent: auto)`
Numbered card with colored top border and square badge; accent cycles between red and orange.
```typst
#feature-card(1, [AI Engine], [Description of the feature.])
```

### `#metric-card(label, value, trend: none, accent: palette.red)`
KPI display card with large colored value, left border, and optional trend indicator.
```typst
#metric-card([Revenue], [$2.4M], trend: [+32% YoY])
```

### `#highlight-box(title, body)`
Red-accented callout box with light red background for key insights or warnings.
```typst
#highlight-box([Important], [This is a key takeaway.])
```

### `#product-card(title, body)`
Clean showcase card with subtle border and red dot accent for product features.
```typst
#product-card([Product Name], [Description of features and benefits.])
```

### `#phase-card(phase, title, period, body, accent: palette.red)`
Compact milestone card for side-by-side rollout timelines.
```typst
#phase-card([PHASE 1], [Foundation], [Q3 2025], [- Infrastructure setup])
```

Cards include one terminal flexible spacer for `cols(lazy-layout: true)`; keep exactly one direct card component in each lazy-layout column. The spacer is inert in ordinary layouts.

### `#data-table(headers, rows, text-size: 0.82em, cell-inset: ...)`
Styled table with red header row and alternating row colors.
```typst
#figure[#data-table(([Name], [Value]), (([Item A], [100]),))]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Red** | `#DE3545` | `palette.red` | Primary red, top bars, accents, focus background |
| **Orange** | `#F0964D` | `palette.orange` | Secondary accent, underlines, alternating badges |
| **Semantic Red** | `#B52334` | `palette.red-text` | Accessible red text and table headers |
| **Semantic Orange** | `#91460D` | `palette.orange-text` | Accessible orange text and KPI values |
| **Dark** | `#333333` | `palette.dark` | Dark backgrounds for cover/section slides |
| **Background** | `#F5F5F7` | `palette.bg` | Light slide background fill |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Component card surfaces |
| **Text Dark** | `#222222` | `palette.text-dark` | Dark heading/label text |
| **Text Body** | `#555555` | `palette.text-body` | Body text color |
| **Text Light** | `#6B6B70` | `palette.text-light` | Accessible footer, captions, muted text |
| **Border** | `#E0E0E0` | `palette.border` | Card and table borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.red-text,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

Decorative red and orange retain their vivid values. Normal-size semantic text uses the darker companion colors so labels remain readable on light backgrounds. The theme entry point intentionally stays font-agnostic; the demo uses installed `IBM Plex Sans` with `Noto Sans SC` fallback.

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example.
