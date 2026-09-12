# Guizang Magazine Theme

**Type**: Custom Canvas theme
**Touying version**: 0.7.4
**Entry function**: `magazine-theme`
**Style**: Editorial magazine / E-ink
**Best for**: Editorial presentations, research briefings, cultural reports, design critiques, and thought leadership

## Description

Guizang Magazine builds an editorial world from a two-tone ink/paper system. Five presets derive every surface, text tone, rule, and decoration from one ink/paper pair. Ordinary content pages retain a faint registration-grid atmosphere; title and ending pages share a separate hairline frame for clear bookending.

The reusable template is font-agnostic. The document chooses an installed stack; the demo uses a light serif display stack plus explicit sans and mono roles for Canvas-level text treatments. Large editorial text uses light weight rather than uniform bold.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#let display-font = ("Libertinus Serif", "Noto Serif SC", "Songti SC")
#let pal = build-palette("monocle")

#show: magazine-theme.with(
  aspect-ratio: "16-9",
  preset: "monocle",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [A concise subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#set text(font: display-font, size: 18pt)

#title-slide()
#speaker-note[Introduce the editorial question and stakes.]

== Slide Title

Your content goes here.
#speaker-note[Explain the slide's main claim.]
```

Verify fonts with `typst fonts` on the target system and replace the demo stack when necessary. The theme itself never sets a font family.

## Theme Parameters

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Presentation paper suffix, such as `"16-9"` or `"4-3"` |
| `preset` | string | `"monocle"` | Ink/paper preset name |
| `footer` | content/function | `none` | Left-side metadata source used by content headers |
| `align` | alignment | `horizon` | Default body alignment; special slides may override it |

Always pass `config-common(breakable: false)` in the theme show rule and visually verify the physical page count.

## Slide Functions

### Standard content slide

Use a level-two heading. The standard slide supplies a stacked metadata/title/rule header, a measured three-part footer, and the persistent registration-grid atmosphere.

```typst
== A takeaway-style title

Body content.
```

The underlying API is `slide(title: auto, align: auto, ..args)`. Prefer heading syntax over calling `slide` directly.

### `dark-slide`

```typst
#dark-slide(
  title: none,
  ghost: [47],
  ghost-size: 220pt,
  header-left: [TOPIC],
  header-right: [ISSUE 2025],
)[
  #text(size: 42pt, weight: 300)[A bold editorial claim.]
]
```

Parameters: `title`, `align`, `ghost`, `ghost-dx`, `ghost-dy`, `ghost-size`, `header-left`, and `header-right`. The slide inverts text/chrome automatically and keeps the grid atmosphere below content.

### `stat-slide`

Dark data page with a light-weight 38pt title, optional kicker, optional ghost mark, and inverted chrome. Use `cols(lazy-layout: true)` only when every column contains exactly one `stat-block`, and keep those flexible columns as the final body region.

```typst
#stat-slide(title: [Key metrics], kicker: "DATA")[]
```

It supports the same `align`, ghost, and header parameters as `dark-slide`.

### `title-slide(bg-image: none, ..args)`

Cover page built from `config-info`: institution, title, subtitle, author, and date. With `bg-image`, it adds a full-bleed crop and dark scrim. The cover and ending page share a 96% × 94% hairline frame.

```typst
#title-slide()
// Or: #title-slide(bg-image: "cover.jpg")
```

### Section divider

Write `= Section Title`. Touying automatically invokes `new-section-slide(self: none, body)`, which renders the numbered editorial divider. Do not call it manually.

### `focus-slide(body)`

Centered editorial synthesis with a ghost quotation mark, grid atmosphere, and an 80%-width text constraint.

```typst
#focus-slide[One memorable synthesis sentence.]
```

### `ending-slide(body)`

Closing page with the same frame used on the cover, ghost `FIN`, centered rules, and the magazine label.

```typst
#ending-slide[Thank You]
```

## Reusable Components

All color-aware components accept `pal: palette`. Their default is the exported monocle palette. When the deck selects another preset, create the matching palette with `build-palette` and pass it to each component.

### `editorial-num(n, size: 48pt, opacity: 50%, pal: palette)`

Large light-weight italic number used by editorial sequences.

```typst
#editorial-num(4, size: 64pt, opacity: 30%, pal: pal)
```

### `kicker(body, pal: palette)`

Small tracked uppercase label.

```typst
#kicker(pal: pal)[EDITORIAL NOTE]
```

### `gold-rule(width: 40pt, pal: palette)`

Two-point ink rule used as an editorial separator.

```typst
#gold-rule(width: 60pt, pal: pal)
```

### `pull-quote(body, cite: none, inverted: false, pal: palette)`

Italic quotation with a left rule. Set `inverted: true` on dark slides.

```typst
#pull-quote(cite: [V. Woolf], pal: pal)[To read is to inhabit another mind.]
```

### `stat-block(label, value, description: none, number-size: 52pt, inverted: false, pal: palette)`

Editorial label → value → description metric. Its internals are one direct `stack(spacing: .8em, ...)` ending in `lazy-v(1fr)`; there are no paragraph-flow spacers. The component is intentionally left-aligned because it is a magazine data column, not an icon → value → label KPI tile.

```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #stat-block([LONG LABEL], [512,000], description: [Long annotation], pal: pal)
][
  #stat-block([SHORT], [3], description: [Short annotation], pal: pal)
][
  #stat-block([RATIO], [0%], description: [Mixed Latin / CJK annotation], pal: pal)
]
```

Each lazy column above contains exactly one flexible component. Do not place unrelated content after this height-hungry group.

### `pillar-card(number, title, body, pal: palette)`

Top-rule editorial column with a pale sequence number, compact title, body, and trailing `lazy-v(1fr)`. Use it as one direct child per lazy column.

```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #pillar-card(1, [Typography], [Reading order comes from hierarchy.], pal: pal)
][
  #pillar-card(2, [Whitespace], [Margins are structural.], pal: pal)
][
  #pillar-card(3, [Ink Economy], [Every mark earns its place.], pal: pal)
]
```

### `comparison-column(label: none, strong: false, pal: palette, body)`

A decorative editorial lane with an optional tracked label and a strong or faint left rule. It deliberately does not implement column layout; compose two or more lanes with Touying's `cols`.

```typst
#cols(columns: (1fr, 1fr))[
  #comparison-column(label: "HUMAN", strong: true, pal: pal)[Judgment and taste]
][
  #comparison-column(label: "AUTOMATION", pal: pal)[Repeatable execution]
]
```

## Palette System

`build-palette(preset-name)` returns:

- `ink`, `paper`
- `ink-light`, `ink-faint`, `ink-muted`, `meta-color`

| Preset | Ink | Paper | Character |
|---|---|---|---|
| `monocle` | `#0A0A0B` | `#F1EFEA` | Classic black editorial |
| `indigo` | `#0A1F3D` | `#F1F3F5` | Cool research blue |
| `forest` | `#1A2E1F` | `#F5F1E8` | Botanical green |
| `kraft` | `#2A1E13` | `#EEDFC7` | Artisanal brown |
| `dune` | `#1F1A14` | `#F0E6D2` | Warm literary neutral |

Small metadata uses text-safe derived tones; very faint tokens are reserved for decoration.

## Layout Semantics

- Use `stack(spacing:)` for headers and component internals.
- Use `cols` for semantic side-by-side content.
- Use `grid` only for regular matrices such as the three observation cells in the demo.
- Enable `lazy-layout` only for one direct `stat-block` or `pillar-card` per column.
- The removed generic `compare-slide` API is replaced by `comparison-column` plus native `cols`.
- Full-height decoration appears only inside `place()`, so it cannot consume flow height.

See `demo.typ` for all retained slide types and components, varied metric lengths, intentional page rhythm, and speaker notes on every page.
