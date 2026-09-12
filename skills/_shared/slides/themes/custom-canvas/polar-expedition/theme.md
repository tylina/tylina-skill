# Polar Expedition Theme — API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: polar-expedition-theme.with(
  aspect-ratio: "16-9",
  footer: [ROSS SEA EXPEDITION 1914],
  preset: "expedition",
  config-info(
    title: [Into the White Silence],
    subtitle: [Antarctic Expeditions 1901--1917],
    author: [Royal Geographical Society],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#set text(font: ("IBM Plex Serif", "Noto Serif SC"), size: 18pt)
```

## Theme Parameters

| Parameter | Default | Options | Description |
|-----------|---------|---------|-------------|
| `aspect-ratio` | `"16-9"` | `"16-9"`, `"4-3"` | Page aspect ratio |
| `footer` | `none` | Content | Footer left text |
| `preset` | `"expedition"` | `"expedition"`, `"ice-shelf"`, `"midnight-sun"` | Color preset |

## Presets

| Preset | Background | Ink | Accent | Character |
|--------|-----------|-----|--------|-----------|
| `expedition` | Warm parchment | Navy | Signal orange | Classic journal |
| `ice-shelf` | Cool blue-white | Deep navy | Rust orange | Icy field notes |
| `midnight-sun` | Dark navy | Parchment | Warm orange | Night observation |

## Fonts

`template.typ` does not set a font family. Choose installed families in the presentation entry file; the demo uses `("IBM Plex Serif", "Noto Serif SC")` for the base text and `"IBM Plex Mono"` for selected coordinate annotations.

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual | Compass rose + chart frame cover |
| `new-section-slide` | `= Heading` | Compass bearing section divider |
| `slide` | `== Heading` | Content slide with latitude lines |
| `dark-slide` | Manual | Navy background, parchment text |
| `focus-slide` | Manual | Navy + orange corner brackets |
| `ending-slide` | Manual | Compass rose + "FINIS" farewell |

### dark-slide Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `title` | `auto` | Override slide title |
| `header-left` | `none` | Custom left header content |
| `header-right` | `none` | Custom right header content |
| `ghost` | `none` | Large faded background text |
| `ghost-size` | `160pt` | Size of ghost text |

## Components

### chart-card(title, body, accent: palette.ink)
Parchment card with navy border and compass corner decoration.
```typst
#chart-card([Navigation], [Celestial positioning using sextant observations.])
#chart-card([Transport], [Dog teams were most efficient.], accent: palette.secondary)
#chart-card([Danger], [Crevasse fields ahead.], accent: palette.accent)
```

### bearing-stat(label, value, description: none)
Large coordinate-style number for navigation coordinates or key metrics.
```typst
#bearing-stat([Latitude], [77\u{00B0}51'S])
#bearing-stat([Duration], [497], description: [days on ice])
```

### glacier-divider(total-width: 100%)
Jagged ice-shelf line separator.
```typst
#glacier-divider()
```

### bearing-tag(body)
Small compass-style tag for labeling.
```typst
#bearing-tag[Cape Evans]  #bearing-tag[Ross Island]
```

### journal-quote(body, date: none, author: none)
Italic diary-style quotation with attribution.
```typst
#journal-quote(
  [Get down on your knees and pray for Shackleton.],
  author: [Raymond Priestley],
  date: [c. 1950],
)
```

### expedition-panel(title, body)
Framed panel with dark header bar (like a chart section).
```typst
#expedition-panel([Navigation Methods])[
  - Sextant observations
  - Chronometer readings
  - Magnetic compass corrections
]
```

### coordinate-table(headers, ..rows)
Navigation log table with navy header.
```typst
#coordinate-table(
  ([Month], [Temp], [Wind]),
  ([March], [-18], [25 kn]),
  ([June], [-34], [38 kn]),
)
```

### route-card(title, body, accent: palette.accent)
Journey segment with flag marker decoration.
```typst
#route-card([Discovery 1901--04], [Scott's first Antarctic expedition.])
```

### signal-box(title, body)
High-emphasis alert box with orange accent.
```typst
#signal-box([Critical Decision], [Abandon ship ordered 27 October 1915.])
```

### ice-stat(label, value, unit: none)
Ice-blue metric display for environmental data.
```typst
#ice-stat([Mean Temp], [-28.4], unit: [\u{00B0}C])
#ice-stat([Wind Speed], [42], unit: [kn])
```

## SVG Decorations (for custom layouts)

| Function | Parameters | Description |
|----------|-----------|-------------|
| `compass-rose(color:, size:)` | color, size (80pt) | Detailed compass rose |
| `ice-shelf-line(color:, width:)` | color, width (100%) | Jagged glacial coastline |
| `sextant(color:, size:)` | color, size (60pt) | Sextant instrument silhouette |
| `latitude-lines(color:, width:, height:)` | color, dimensions | Map projection arcs |
| `expedition-flag(color:, size:)` | color, size (20pt) | Small pennant marker |

## Small Helpers

| Function | Description |
|----------|-------------|
| `compass-dot(color:, size:)` | Small bearing point dot |
| `bearing-mark(color:, size:)` | Crosshair coordinate marker |

## Color Palette Access

All colors available via `palette.xxx`:
```typst
palette.bg, palette.ink, palette.accent, palette.secondary, palette.surface
palette.accent-text, palette.focus-accent
palette.ink-light, palette.ink-muted, palette.ink-faint, palette.ink-ghost
palette.accent-dim, palette.accent-muted, palette.accent-faint, palette.accent-ghost
palette.secondary-dim, palette.secondary-muted, palette.secondary-faint
palette.meta-color, palette.rule-color
```

## Layout Examples

### Three-column cards
```typst
#block(height: 100pt)[
  #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 16pt,
    chart-card([Topic A], [Content...]),
    chart-card([Topic B], [Content...], accent: palette.secondary),
    chart-card([Topic C], [Content...], accent: palette.accent),
  )
]
```

### Stats row
```typst
#cols(columns: (1fr, 1fr, 1fr, 1fr))[
  #ice-stat([Temp], [-28], unit: [\u{00B0}C])
][
  #ice-stat([Wind], [42], unit: [kn])
][
  #ice-stat([Depth], [2.8], unit: [m])
][
  #ice-stat([Vis], [0.3], unit: [km])
]
```

### Two-column with panels
```typst
#cols(columns: (1fr, 1fr))[
  #expedition-panel([Geology])[- Fossils found]
][
  #expedition-panel([Weather])[- Records kept]
]
```
