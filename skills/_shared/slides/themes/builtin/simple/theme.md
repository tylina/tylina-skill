# Simple Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `simple-theme`
**Style**: Minimal, clean
**Primary color**: `aqua.darken(50%)` (teal)
**Best For**: Quick presentations, prototyping, simple talks
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

Minimal theme originally from Polylux. Good for quick, no-frills presentations and prototyping.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.simple: *

#show: simple-theme.with(
  aspect-ratio: "16-9",
  footer: [Simple slides],
  config-common(breakable: false),
)

#title-slide[
  = Presentation Title
  #v(2em)
  SeaSlides Team #h(1em) Typst Community
]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `header` | content/function | current heading | Header content |
| `header-right` | content/function | `self => self.info.logo` | Right side of header |
| `footer` | content/function | `none` | Footer content |
| `footer-right` | content/function | slide counter | Right side of footer |
| `primary` | color | `aqua.darken(50%)` | Primary accent color |
| `subslide-preamble` | content | current slide heading | Content before each subslide |

## Available Slide Types

### `#title-slide[...]`
Title page. Content is passed directly as body.

### `#slide[...]`
Standard content slide. Supports `config`, `repeat`, `setting`, and `composer` parameters. Ordinary `==` headings invoke this slide type automatically.

### `#centered-slide[...]`
Generic centered slide. Pass the slide body directly; optional page overrides belong in its `config` dictionary.

### `#new-section-slide[...]`
Centered section divider used automatically for level-one (`=`) headings.

### `#focus-slide[...]`
Full-screen emphasis slide with primary color background. Supports `background`, `foreground`, and `config` overrides.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: aqua.darken(50%),
  neutral-light: gray,
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#000000"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Demo

See `demo.typ` for a compilable example.
