# Frost Glass Theme -- API Reference

## Overview

Frosted glass morphism theme with depth layers. Translucent panels floating over subtle gradient backgrounds, frosted blur effects simulated through layered SVG patterns, rounded cards with glass edges, and soft depth shadows. Inspired by Apple iOS design language and modern dashboard interfaces.

**Tier**: custom-rich
**Touying Version**: 0.7.4
**Entry Function**: `frost-glass-theme`

---

## Theme Entry

```typst
#show: frost-glass-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
  config-common(breakable: false),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer text shown on content slides |
| `..args` | Touying configuration | -- | Forwarded to Touying, including `config-info` and `config-common` |

---

## Slide Functions

### `title-slide(..args)`

Full-bleed title slide with glass frame bookend, gradient mesh background, and refraction arc decoration.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with frosted glass atmosphere (gradient mesh + floating orbs) and glass-edge title decoration.

```typst
== My Slide Title
Content goes here.
```

Use the `==` heading as the slide title. `title` and `align` are available for theme-internal or advanced Touying compositions.

### `new-section-slide`

Automatically generated when using `= Section Title`. Features depth layers decoration and frosted left accent bar.

```typst
= New Section
```

### `focus-slide(body)`

Centered frosted panel for impactful single statements or quotes.

```typst
#focus-slide[
  Your powerful statement here.
]
```

### `ending-slide(body)`

Closing slide with glass frame bookend (matching title slide) and refraction decorations.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `pane-card(title, body, accent: palette.primary)`

Frosted glass panel with translucent fill and colored left border. Primary content container.

```typst
#pane-card([Card Title], [
  Card body content goes here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header text |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Left border and indicator color |

---

### `frost-box(title, body, accent: palette.primary)`

Highlighted content with full glass edge border. For emphasis blocks and key insights.

```typst
#frost-box([Key Insight], [
  Important information highlighted here.
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box header text |
| `body` | content | required | Box content |
| `accent` | color | `palette.primary` | Border and title color |

---

### `blur-tag(content, color: palette.primary)`

Rounded capsule tag with gradient background. Inline label element.

```typst
#blur-tag([Label], color: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag text |
| `color` | color | `palette.primary` | Gradient and text color |

---

### `depth-card(title, body, accent: palette.primary)`

Layered card with top accent border creating depth effect.

```typst
#depth-card([Feature Name], [
  Description of the feature.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Top border color |

---

### `refraction-separator(width: 80%)`

Rainbow-gradient thin separator line with light refraction effect.

```typst
#refraction-separator(width: 60%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length | `80%` | Width of the divider |

---

### `crystal-stat(label, value, color: palette.primary)`

KPI metric display with glass panel styling. Large value with subtle glow indicator.

```typst
#crystal-stat([Revenue], [$4.2M], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label (small text) |
| `value` | content | required | Metric value (large text) |
| `color` | color | `palette.primary` | Value text and glow color |

---

### `layer-card(title, body, accent: palette.secondary)`

Stacked content card with left accent bar and gradient underline. For sequential/timeline content.

```typst
#layer-card([Timeline Entry], [
  Description of this layer/phase.
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.secondary` | Left border and accent color |

---

### `glass-tile-grid(items, columns: 2, gutter: 0.8em)`

Multi-item glass tile layout. Takes an array of content blocks and arranges them in a grid of frosted tiles.

```typst
#glass-tile-grid(
  (
    [Item 1 content],
    [Item 2 content],
    [Item 3 content],
    [Item 4 content],
  ),
  columns: 2,
  gutter: 0.8em,
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | array | required | Array of content blocks |
| `columns` | int | `2` | Number of grid columns |
| `gutter` | length | `0.8em` | Spacing between tiles |

---

### `glow-box(title, body, color: palette.primary)`

Emphasis box with soft outer glow border. For highlighting critical information.

```typst
#glow-box([Important], [
  Critical information that needs attention.
], color: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box content |
| `color` | color | `palette.primary` | Glow border and title color |

---

### `notification-note(title, body, accent: palette.secondary)`

Floating alert/insight notification. For callouts, warnings, or supplementary information.

```typst
#notification-note([Note], [
  Additional context or insight here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Note title |
| `body` | content | required | Note content |
| `accent` | color | `palette.secondary` | Left border and indicator color |

---

## Color Palette

Access via `palette.<name>`:

| Token | Hex | Usage |
|-------|-----|-------|
| `bg-start` | `#F0F4FF` | Background gradient start (light blue-white) |
| `bg-end` | `#FFFFFF` | Background gradient end (white) |
| `text` | `#1A2744` | Primary text (deep navy) |
| `text-muted` | `#5A6B8A` | Secondary/muted text |
| `primary` | `#4A8FE7` | Primary accent (soft blue) |
| `primary-dark` | `#2B5EA3` | Darker primary variant |
| `secondary` | `#7C5CFC` | Secondary accent (violet/purple) |
| `secondary-light` | `#B8A4FF` | Lighter secondary variant |
| `card-bg` | `#FFFFFF` (75% opacity) | Card surface fill |
| `card-border` | `#FFFFFF` (60% opacity) | Card border color |
| `frost-white` | `#FFFFFF` (90% opacity) | Frosted surface fill |
| `glass-edge` | `#FFFFFF` | Glass edge highlight |
| `shadow` | `#1A2744` (8% opacity) | Shadow color |
| `glow-blue` | `#4A8FE7` (30% opacity) | Blue glow accent |
| `glow-violet` | `#7C5CFC` (30% opacity) | Violet glow accent |
| `surface` | `#F7F9FF` | Neutral surface color |

---

## SVG Decorative Helpers

These can be used directly for custom compositions:

| Function | Description |
|----------|-------------|
| `gradient-mesh-bg()` | Full-page gradient mesh with soft color blobs |
| `floating-orbs-bg()` | Subtle floating circle shapes |
| `glass-frame()` | Bookend glass frame with refraction arc |
| `depth-layers(size: 120pt)` | Concentric rounded rectangles decoration |
| `refraction-divider(width: 100%)` | Rainbow-gradient thin line |
| `glass-edge(width: 120pt)` | Frosted glass edge highlight line |

---

## Fonts

- The theme stays font-agnostic. Set a verified font stack in your deck entry; the demo uses `("Arial", "Helvetica")`.
- **Base size**: 18pt

---

## Layout Utilities

Use `cols()` from Touying for multi-column layouts:

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  pane-card([Left], [Content]),
  pane-card([Right], [Content]),
)
```

Use `stack(spacing: .8em, ..)` only when several elements form one deliberate vertical component group, and use `stack(dir: ltr, spacing: ...)` for inline tag rows. At caller level, compose complete components directly in natural flow; do not add a fixed `v()` or wrapper stack merely for routine separation. Do not use `v()` inside a KPI's icon/value/label sequence.
