# Morning Dew Theme — API Reference

## Overview

A fresh academic theme inspired by morning dew drops on leaves and petals at dawn. Soft watercolor wash backgrounds, translucent dewdrop shapes, and a gentle dawn color palette. Light, fresh, and contemplative — perfect for academic research presentations.

**Touying Version**: 0.7.4
**Complexity Level**: Rich
**Best For**: Academic research, scientific presentations, biology/ecology conferences, dissertation defense, seminar talks

---

## Theme Entry Point

```typst
#show: morning-dew-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: [Footer Text],   // Content for footer area
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/none | `none` | Footer content displayed on content slides |

---

## Color Palette

Access via `palette.<name>`:

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#F9F7F4` | Main background (warm white) |
| `dewdrop` | `#5B8FA8` | Primary accent (water blue) |
| `petal` | `#D4899A` | Secondary accent (soft rose) |
| `leaf` | `#7CAA82` | Tertiary accent (morning leaf) |
| `dark-text` | `#2B3640` | Heading text |
| `body-text` | `#4A5B66` | Body copy |
| `card-bg` | `#FFFFFF` | Card backgrounds |
| `mist` | `#EEF2F5` | Subtle fills (morning mist) |
| `border` | `#D8E0E6` | Borders |
| `gold` | `#C9A855` | Highlight accent (dawn light) |

---

## Slide Functions

### `title-slide()`

Full-bleed title slide with dewdrop cluster, leaf vein pattern, dawn rays, and watercolor wash. Displays title, subtitle, author, institution, and date from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, ..args)`

Standard content slide with dewdrop accent header, watercolor wash atmosphere, and petal scatter decoration. Supports multi-column layout.

```typst
// Single column
#slide(title: [Custom Title])[
  Content here.
]

// Two columns
#slide[
  Left column content.
][
  Right column content.
]
```

### `new-section-slide`

Automatically generated when using `= Section Title`. Features left panel with leaf vein pattern, section number in dewdrop circle, and section title on right.

```typst
= New Section Title
```

### `outline-slide(title: [Outline])`

Table of contents slide with dewdrop bullet markers.

```typst
#outline-slide()
#outline-slide(title: [Agenda])
```

### `focus-slide(body)`

Full-bleed dewdrop blue background with white text and petal scatter in corners.

```typst
#focus-slide[
  Key insight or quote to emphasize.
]
```

### `ending-slide(body)`

Bookend slide matching the title slide decorations (dewdrop cluster, leaf vein, dawn rays).

```typst
#ending-slide[Thank You]
```

---

## Components

### `dew-card(title, body, accent: palette.dewdrop)`

Card with dewdrop circle accent in top-left corner.

```typst
#dew-card([Card Title], [
  Card body content with details.
])

#dew-card([Green Card], [Body.], accent: palette.leaf)
```

### `mist-box(title, body, accent: palette.dewdrop)`

Callout box with soft mist fill and colored left border.

```typst
#mist-box([Important Note], [
  This content is highlighted with a mist background.
])
```

### `droplet-stat(value, label, accent: palette.dewdrop)`

KPI/statistic display with dewdrop shape above the number.

```typst
#droplet-stat([42%], [Recovery Rate])
#droplet-stat([3.7], [Shannon Index], accent: palette.leaf)
```

### `petal-quote(quote-text, author: none, accent: palette.petal)`

Quote block with petal-rose left border and italic styling.

```typst
#petal-quote(
  [The diversity of life forms is the key to ecosystem stability.],
  author: [Tilman, 1996],
)
```

### `leaf-card(title, body, accent: palette.leaf)`

Card with leaf icon and green top accent line.

```typst
#leaf-card([Findings], [
  Species richness increased 40% over the study period.
])
```

### `dawn-tag(content, color: palette.dewdrop)`

Rounded pill tag for inline labels.

```typst
#dawn-tag([Ecology]) #h(4pt) #dawn-tag([Open Access], color: palette.leaf)
```

### `branch-entry(step, title, body, accent: palette.leaf)`

Timeline entry with vine connector circle and step number.

```typst
#branch-entry([1], [Data Collection], [
  Field sampling across 47 sites over 20 months.
])
#branch-entry([2], [Analysis], [
  Bayesian hierarchical modeling with GAMMs.
], accent: palette.dewdrop)
```

### `specimen-table(headers, rows)`

Academic table with mist/white alternating rows.

```typst
#specimen-table(
  ([Species], [Count], [Status]),
  (
    ([G. lacustris], [234], [Stable]),
    ([R. hageni], [89], [Declining]),
    ([C. cognatus], [56], [Recovering]),
  ),
)
```

### `morning-divider(width: 80%)`

SVG separator with dewdrop dots along a vine line.

```typst
#morning-divider()
#morning-divider(width: 60%)
```

### `prism-card(title, body, accent: palette.gold)`

Card with subtle rainbow light refraction effect at the top edge.

```typst
#prism-card([Key Insight], [
  Multiple interacting thresholds govern recovery dynamics.
])
```

---

## Multi-Column Layouts

Use the `#slide[...][...]` syntax for two-column layouts or `#cols` for custom grids:

```typst
// Two equal columns
#slide[
  Left content.
][
  Right content.
]

// Custom proportions
#cols(columns: (2fr, 3fr))[
  Narrow left.
][
  Wider right.
]

// Grid within a slide
#cols(columns: (1fr, 1fr, 1fr), column-gutter: 12pt, lazy-layout: true,
  droplet-stat([47], [Sites]),
  droplet-stat([5], [Years]),
  droplet-stat([12], [Species]),
)
```

---

## Tips

- All card components support height equalization via `lazy-v(1fr)` when used in grid/cols layouts.
- Use `palette.<color>` to access theme colors for custom styling.
- The watercolor wash and petal scatter atmosphere is automatically applied to all content slides.
- Title and ending slides share the same bookending decorations (dewdrop cluster, leaf vein, dawn rays).
- Set `config-common(breakable: false)` to prevent slides from breaking across pages.
