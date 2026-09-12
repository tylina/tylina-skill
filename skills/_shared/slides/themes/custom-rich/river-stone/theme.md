# River Stone Theme — API Reference

A Touying 0.7.4 business presentation theme inspired by smooth river stones, zen rock gardens, and natural mineral textures. Warm cream/stone background with earth-tone palette conveying stability, groundedness, and quiet confidence.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 20pt)

#show: river-stone-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Company],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle Here],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
#outline-slide()

= Section Title

== Slide Title

Content here...
```

## Theme Entry Point

### `river-stone-theme`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text shown on content slides |
| `..args` | any | — | Additional config passed to touying-slides |
| `body` | content | — | Document body |

## Color Palette

Access colors via `palette.{name}`:

| Name | Hex | Role |
|------|-----|------|
| `stone-bg` | `#F8F6F3` | Main background (warm stone) |
| `slate` | `#5B6770` | Primary accent (river slate) |
| `moss` | `#7A8B6F` | Secondary accent (moss green) |
| `clay` | `#B8856C` | Tertiary accent (terracotta clay) |
| `dark-text` | `#2C3338` | Heading text |
| `body-text` | `#4A5259` | Body copy |
| `pebble` | `#E8E4DF` | Card/pebble fill |
| `sand` | `#EDE9E3` | Subtle fills |
| `border` | `#D4CFC8` | Borders |
| `water` | `#8FAAB4` | Water/highlight accent |

## Slide Types

### `title-slide(..args)`

Zen garden composition with pebble cluster, raked sand lines, and water ripple corner. No header/footer. Bookending element (shared with ending-slide).

### `slide(title: auto, ..args)`

Standard content slide with stone texture atmosphere, slate header accent, and corner pebble motifs. Supports multi-column layouts via `#cols(columns: (1fr, 1fr))[...][...]`.

### `new-section-slide`

Auto-generated when `= Section Title` is used. Left panel with large pebble silhouette, section title on right with zen rake lines.

### `outline-slide(title: [Contents])`

Clean table of contents with moss accent decoration and corner pebble motif.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `[Contents]` | TOC heading |

### `focus-slide(body)`

Slate background with cream text, water ripple corners. Content auto-wrapped to prevent overflow.

### `ending-slide(body)`

Bookend with title-slide — shares pebble cluster and raked zen lines motifs. Centered farewell text.

## Components

### `stone-card(title, body, accent: palette.slate)`

Rounded card with pebble-shaped organic top border curve. Primary card component.

```typst
#stone-card([Card Title], [Card body content goes here.])
#stone-card([Moss Card], [With custom accent.], accent: palette.moss)
```

### `ripple-box(title, body, accent: palette.water)`

Callout box with concentric ripple accent in the top-right corner. Left border accent.

```typst
#ripple-box([Important Note], [Key information with water ripple decoration.])
```

### `mineral-stat(value, label, accent: palette.slate)`

KPI/statistic card with cairn (stacked stones) icon above the value. Centered layout.

```typst
#mineral-stat([24%], [Revenue Growth\ YoY])
#mineral-stat([89%], [Client Retention], accent: palette.moss)
```

### `moss-quote(quote-text, author: none, accent: palette.moss)`

Blockquote with moss-colored left bar and organic moss shape accent.

```typst
#moss-quote(
  [Strategy is choosing what not to do.],
  author: [Michael Porter],
)
```

### `zen-card(title, body, accent: palette.slate)`

Minimal card with raked zen-sand line decoration at the bottom.

```typst
#zen-card([Zen Principles], [Simplicity, patience, and clarity.])
```

### `pebble-tag(content, color: palette.slate)`

Rounded pill tag in earth tones. Inline element.

```typst
#pebble-tag[Strategy] #pebble-tag(color: palette.moss)[ESG]
```

### `stream-entry(step, title, body, accent: palette.water)`

Timeline/process step with water-flow connector line between steps.

```typst
#stream-entry([Q1], [Assessment Phase], [Audit and evaluate current state.])
#stream-entry([Q2], [Design Phase], [Architect the solution.], accent: palette.moss)
```

### `bedrock-table(headers, rows)`

Clean data table with sand/stone alternating row backgrounds.

```typst
#bedrock-table(
  ([Column A], [Column B], [Column C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
)
```

### `sediment-divider(width: 80%, color: palette.slate)`

SVG separator with layered horizontal stone lines and mineral dots.

```typst
#sediment-divider()
#sediment-divider(width: 60%, color: palette.moss)
```

### `cairn-card(title, body, accent: palette.slate)`

Card with stacked-stone (cairn) icon on the left side plus content.

```typst
#cairn-card([Strategic Pillar], [Build organizational resilience through diversification.])
```

## Layout Patterns

### Multi-column with composer

```typst
#cols(columns: (1fr, 1fr))[
  Left column content
][
  Right column content
]
```

### Multi-column with cols

```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #mineral-stat([24%], [Metric A])
][
  #mineral-stat([89%], [Metric B])
][
  #mineral-stat([3.2x], [Metric C])
]
```

### Cards in grid

```typst
#cols(columns: (1fr, 1fr))[
  #stone-card([Title A], [Body A])
  #v(0.5em)
  #stone-card([Title B], [Body B], accent: palette.moss)
][
  #zen-card([Title C], [Body C])
  #v(0.5em)
  #ripple-box([Title D], [Body D])
]
```

### Timeline sequence

```typst
#stream-entry([1], [First Step], [Description...], accent: palette.slate)
#stream-entry([2], [Second Step], [Description...], accent: palette.moss)
#stream-entry([3], [Third Step], [Description...], accent: palette.water)
#stream-entry([4], [Final Step], [Description...], accent: palette.clay)
```

## Design Notes

- All content slides have persistent stone texture atmosphere and corner pebble motifs
- Title and ending slides share pebble cluster + zen raked lines (bookending)
- Cards use opaque fills (pebble/sand) for readability over background atmosphere
- Components include `lazy-v(1fr)` for height equalization in multi-column layouts
- No fonts set in template — only size; set font in your document
- Color accents can be customized per-component using the `accent` parameter
