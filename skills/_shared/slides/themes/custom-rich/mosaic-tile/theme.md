# Mosaic Tile Theme — API Reference

## Overview

A geometric tilework theme inspired by Islamic zellige, Portuguese azulejo, and Moorish architecture. Features interlocking 8-point stars, octagonal tessellations, arabesque interlace patterns, and glazed tile color palettes. Suitable for business presentations, strategy talks, and corporate keynotes.

**Touying version:** 0.7.4
**Entry function:** `mosaic-tile-theme`
**Fonts:** `("Avenir Next", "Arial", "PingFang SC")`, base size 18pt
**Monospace:** `("Menlo", "DejaVu Sans Mono")`

---

## Theme Entry Point

### `mosaic-tile-theme`

```typst
#show: mosaic-tile-theme.with(
  aspect-ratio: "16-9",
  footer: [Company Name],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 1, day: 1),
  ),
)

#set text(font: ("Avenir Next", "Arial", "PingFang SC"))
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | — | Additional Touying configuration arguments |

---

## Slide Functions

### `title-slide`

Full-page title slide with tile frame border (bookend element), zellige background pattern, and rosette decoration.

```typst
#title-slide()
```

Uses info from `config-info()`. No additional parameters needed.

---

### `slide`

Standard content slide with zellige pattern atmosphere, tessellation header divider, and geometric footer.

```typst
== Slide Title

Content here...
```

Or with explicit title:

```typst
#slide(title: [Custom Title])[
  #cols[Content column 1][Content column 2]
]
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/auto | `auto` | Slide title (auto uses heading) |
| `align` | alignment/auto | `auto` | Optional vertical alignment override |

---

### `new-section-slide`

Automatically generated when using `= Section Heading`. Shows section number, star divider, and section title with left accent bar.

```typst
= New Section Name
```

---

### `focus-slide`

Full-page emphasis slide with dark background and double geometric border.

```typst
#focus-slide[
  Important statement or quote here.
]
```

---

### `ending-slide`

Closing slide with tile frame (bookend matching title slide), rosette, and star divider.

```typst
#ending-slide[Thank You]
```

---

## Color Palette

Access via `palette.{name}`:

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#FDF8F0` | Warm cream background |
| `text` | `#1B2A4A` | Deep midnight blue text |
| `primary` | `#1E5AAF` | Cobalt blue primary accent |
| `secondary` | `#C75B2A` | Terracotta orange secondary |
| `highlight` | `#1A8A8A` | Teal/turquoise highlights |
| `card-bg` | `#FFFFFF` | White card backgrounds |
| `muted` | `#6B7B95` | Muted text/labels |
| `border` | `#D4C5B0` | Warm border color |
| `cream-light` | `#FFF9F0` | Light cream variant |
| `tile-blue` | `#2E6FC2` | Brighter blue for glazed elements |
| `tile-gold` | `#C6953A` | Gold accent for special elements |
| `tile-teal` | `#207878` | Deep teal variant |

---

## Reusable Components

### `tile-card`

Content card with geometric tile border on top.

```typst
#tile-card([Card Title], [
  Card body content here.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header text |
| `body` | content | required | Card body content |
| `accent` | color | `palette.primary` | Top border and title color |

---

### `zellige-box`

Highlighted information box with teal left border and diamond accent.

```typst
#zellige-box([Insight Title], [
  Important highlighted content.
])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box header |
| `body` | content | required | Box content |

---

### `tessera-tag`

Small geometric capsule label with rotated diamond indicator.

```typst
#tessera-tag([Label Text], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag text |
| `color` | color | `palette.primary` | Tag color |

---

### `rosette-card`

Important content card with radial rosette pattern accent in corner.

```typst
#rosette-card([Priority Items], [
  Card body with important data.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card header |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Border and title color |

---

### `interlace-divider`

Geometric woven separator element using star polygon SVG pattern.

```typst
#interlace-divider(color: palette.primary, width: 80%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `color` | color | `palette.primary` | Color of the hairline extensions around the multicolor star motif |
| `width` | length | `80%` | Divider width |

---

### `facet-stat`

KPI/metric display with large value and tile-inspired top border.

```typst
#facet-stat([Revenue], [$1.2B], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Metric label |
| `value` | content | required | Metric value (displayed large) |
| `color` | color | `palette.primary` | Accent color |

---

### `pattern-card`

Sequential/numbered card with circle number indicator and left border.

```typst
#pattern-card([1], [Step Title], [
  Step description content.
], accent: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `number` | content | required | Step number |
| `title` | content | required | Card title |
| `body` | content | required | Card content |
| `accent` | color | `palette.primary` | Accent color |

---

### `muqarnas-grid`

Multi-item grid layout for displaying multiple data points or features.

```typst
#muqarnas-grid(
  columns: 3,
  (
    (title: "Item 1", body: [Description 1]),
    (title: "Item 2", body: [Description 2]),
    (title: "Item 3", body: [Description 3]),
  ),
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `items` | array | required | Array of dictionaries with `title` and `body` keys |
| `columns` | int | `3` | Number of grid columns |

---

### `glazed-box`

Code/technical content box with ceramic-inspired styling and monospace title.

```typst
#glazed-box([Config File], [
  Technical content or code here.
], accent: palette.tile-blue)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title (rendered in monospace) |
| `body` | content | required | Box content |
| `accent` | color | `palette.tile-blue` | Left border and title color |

---

### `arabesque-note`

Annotation/note box with decorative diamond chain and italic styling.

```typst
#arabesque-note([
  Important annotation or contextual note.
], accent: palette.secondary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `body` | content | required | Note content |
| `accent` | color | `palette.secondary` | Border and decoration color |

---

## SVG Decorative Elements

These helper functions render SVG-based decorative elements:

| Function | Description | Parameters |
|----------|-------------|------------|
| `zellige-bg()` | Full-page 8-point star pattern | None |
| `tile-frame()` | Arabesque interlace border frame | None |
| `tessellation-strip(width)` | Octagon + square repeating border | `width: 100%` |
| `star-divider(width)` | Star polygon row separator | `width: 100%` |
| `rosette(size)` | Radial geometric rosette | `size: 40pt` |

---

## Layout Helpers

Use Touying's built-in `cols` for multi-column layouts:

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  tile-card([Left], [Content]),
  tile-card([Right], [Content]),
)
```

---

## Design Notes

- Title and ending slides share the tile frame as a "bookend" visual element
- Card components intended for `cols(lazy-layout: true)` end with `#lazy-v(1fr)`; `muqarnas-grid` uses top-aligned native grid cells instead
- Content slides have persistent zellige star pattern atmosphere
- The footer uses `grid(columns: (1fr, auto, 1fr))` for proper alignment
- SVGs contain no HTML comments to ensure Typst compilation compatibility
