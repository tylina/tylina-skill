# Aqua Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `aqua-theme`
**Style**: Beautiful, decorative backgrounds
**Primary color**: `#003F88` (deep blue)
**Best For**: General presentations, visually appealing talks
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Beautiful theme with decorative backgrounds made with Typst's visualization capabilities. Good for general presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.aqua: *

#show: aqua-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Title],
    author: [Author],
    date: datetime.today(),
  ),
)

#title-slide(extra: [Subtitle or institution])
#outline-slide(config: config-common(detect-overflow: false))
```

The per-slide `detect-overflow: false` override avoids Touying 0.7.4's false empty-slide diagnostic for Aqua's visibly populated, placement-based outline page. Overflow detection remains enabled for the rest of the deck.

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `header` | content/function | current heading | Header content |
| `footer` | content/function | slide counter | Footer content |
| `..args` | configuration | none | Touying configuration such as `config-common`, `config-colors`, or `config-info` |

## Available Slide Types

### `#title-slide(extra: none)`
Decorative title page. Aqua displays `title`, `author`, and `date` from `config-info`; use `extra` for a subtitle or institution line.

### `#outline-slide(config: (:), leading: 50pt)`
Table of contents slide. `leading` controls outline spacing; `config` accepts a per-slide Touying configuration override.

### `== Heading` / `#slide(...)`
Level-two headings create standard content slides automatically. Call `slide` directly only for explicit composers or callback-style content supported by Touying.

### `#focus-slide[...]`
Full-screen emphasis slide.

### `= Heading`
Level-one headings automatically trigger Aqua's section divider through `new-section-slide`.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: rgb("#003F88"),
  primary-light: rgb("#2159A5"),
  primary-lightest: rgb("#F2F4F8"),
  neutral-lightest: rgb("#ffffff"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Demo

See `demo.typ` for a compilable example.
