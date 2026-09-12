# Hologram Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `hologram-theme`
**Style**: Futuristic glass-morphism — iridescent gradients, frosted glass cards, AR interface aesthetics
**Primary color**: `#7C3AED` (Holo Violet)
**Best For**: Tech keynotes, futurism talks, AR/VR presentations, innovation showcases, product launches
**Style Objective**: Cutting-Edge / Futuristic
**Complexity Level**: Rich

## Description

A futuristic presentation theme inspired by holographic materials and augmented reality interfaces. Features iridescent gradient strips (violet-to-teal-to-gold), frosted glass card effects, subtle rainbow edge glows, holographic grid backgrounds, and AR-style corner brackets. Uses a deep violet cover/section design paired with ice-white content slides. The glass-morphism aesthetic creates a premium, cutting-edge feeling perfect for technology presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: hologram-theme.with(
  aspect-ratio: "16-9",
  footer: [Company Name | Event],
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
Deep violet background with holographic orb, AR frame overlay, refraction pattern, iridescent strip, and white centered title/subtitle/author.

### `#slide(title: auto)`
Ice-white background content slide with iridescent gradient strip top bar, violet-teal-gold underline accent, holographic grid atmosphere, frosted circle decorations, and iridescent dot footer.

### `#new-section-slide[...]`
Deep violet background with AR bracket frame, holographic orb, frosted circle, bold white section title, and iridescent strip underline.

### `#focus-slide[...]`
Full violet background with AR frame, frosted glass panel containing large white centered text, and iridescent strip accent.

### `#ending-slide[...]`
Light ice-white background with holographic grid, AR frame (bookending title slide), centered white card with iridescent strip, holographic orb, and iridescent underline dots.

## Reusable Components

### `#concept-card(title, body, index: 0)`
Frosted glass card with iridescent left border. Color cycles through 7 iridescent colors based on index.
```typst
#concept-card([Feature], [Description of the feature.], index: 0)
```

### `#insight-box(title, body)`
Violet-accented callout box with lightbulb icon and light violet background. For key insights and takeaways.
```typst
#insight-box([Key Insight], [Important observation here.])
```

### `#stat-card(label, value, unit: none, color: palette.primary)`
Large metric display with colored bottom border for KPI data visualization.
```typst
#stat-card([Revenue], [$2.4M], unit: [annual], color: palette.teal)
```

### `#holo-card(title, body, index: 0)`
Card with iridescent top gradient strip and colored dot indicator. For feature descriptions and grouped info.
```typst
#holo-card([Feature Name], [Feature description here.], index: 0)
```

### `#projection-box(title, body)`
Teal-emphasized frosted panel for projections, forecasts, and forward-looking statements.
```typst
#projection-box([Forecast], [Market will reach $X by 2030.])
```

### `#quote-card(quote-text, attribution: none)`
Holographic quote block with gold left border and decorative quote marks.
```typst
#quote-card([The future is spatial.], attribution: [CEO Name])
```

### `#interface-card(title, body, status: "active")`
AR-style card with status indicator dot (active=green, pending=gold, inactive=gray) and corner accent.
```typst
#interface-card([System Module], [Description.], status: "active")
```

### `#callout-box(title, body, variant: "info")`
Iridescent gradient border alert box. Variants: `"info"` (teal), `"warning"` (gold), `"success"` (emerald), default (violet).
```typst
#callout-box([Note], [Important information.], variant: "info")
```

### `#holo-divider(width: 100%)`
Iridescent gradient horizontal separator (violet-to-teal-to-gold).
```typst
#holo-divider(width: 80%)
```

### `#holo-tag(content, color: palette.primary)`
Small iridescent-colored chip/tag with transparent background for labels and categories.
```typst
#holo-tag([AI/ML], color: palette.teal)
```

### `#holo-table(headers, rows)`
Styled table with violet header row and alternating ice-white/frosted row colors.
```typst
#holo-table(([Name], [Value]), (([Item A], [100]),))
```

## SVG Decorations

| Name | Function | Description |
|------|----------|-------------|
| Iridescent Strip | `iridescent-strip()` | Horizontal gradient bar (violet → teal → gold) |
| Holographic Grid | `holo-grid()` | Perspective grid with AR corner markers |
| Frosted Circle | `frosted-circle()` | Soft radial gradient circle for glass-morphism |
| Refraction Pattern | `refraction-pattern()` | Prismatic light beams diverging through a prism |
| AR Frame | `ar-frame()` | HUD-style corner brackets with scan lines |
| Holographic Orb | `holo-orb()` | Floating iridescent sphere with orbital rings |

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Background** | `#F8FAFF` | `palette.bg` | Ice white slide background |
| **Primary** | `#7C3AED` | `palette.primary` | Holo violet, cover backgrounds, main accent |
| **Secondary** | `#0EA5E9` | `palette.secondary` | Holo teal, emphasis and highlights |
| **Accent** | `#EAB308` | `palette.accent` | Holo gold, warm contrast |
| **Frosted BG** | `#F1F5F9` | `palette.frosted-bg` | Frosted glass background |
| **Text Dark** | `#1E1B4B` | `palette.text-dark` | Deep indigo headings |
| **Text Body** | `#334155` | `palette.text-body` | Slate body text |
| **Text Muted** | `#94A3B8` | `palette.text-muted` | Captions, footers |
| **Card Background** | `#FFFFFF` | `palette.card-bg` | Pure white card surfaces |
| **Border** | `#E2E8F0` | `palette.border` | Light card borders |
| **Violet** | `#7C3AED` | `palette.violet` | Iridescent progression |
| **Indigo** | `#6366F1` | `palette.indigo` | Iridescent progression |
| **Teal** | `#0EA5E9` | `palette.teal` | Iridescent progression |
| **Cyan** | `#06B6D4` | `palette.cyan` | Iridescent progression |
| **Emerald** | `#10B981` | `palette.emerald` | Iridescent progression |
| **Gold** | `#EAB308` | `palette.gold` | Iridescent progression |
| **Rose** | `#F43F5E` | `palette.rose` | Iridescent progression end |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: white,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a complete compilable example showcasing all slide types and components.
