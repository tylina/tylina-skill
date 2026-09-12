# University Theme

**Type**: Touying Built-in
**Touying version**: 0.7.4
**Entry function**: `university-theme`
**Style**: Professional, branded, institutional
**Primary color**: `#04364A` (dark blue-green)
**Best For**: University lectures, institutional presentations, branded talks
**Style Objective**: Academic
**Complexity Level**: Plain

## Description

Professional theme with a branded header and 3-column footer. Good for university lectures and institutional presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [Research Briefing],
    subtitle: [Evidence for the Next Academic Year],
    author: [Academic Programs Office],
    date: datetime.today(),
    institution: [Open Presentation Lab],
    logo: emoji.school,
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `top` | Default content alignment |
| `progress-bar` | boolean | `true` | Show progress bar |
| `header` | content/function | current level-2 heading | Left side of header |
| `header-right` | content/function | current level-1 heading + logo | Right side of header |
| `footer-columns` | tuple | `(25%, 1fr, 25%)` | Footer column widths |
| `footer-a` | content/function | author | Left footer |
| `footer-b` | content/function | short title or title | Center footer |
| `footer-c` | content/function | date + slide counter | Right footer |

## Available Slide Types

### `#title-slide(config: (:), extra: none, ..args)`
Title page driven by `config-info`; named overrides such as `authors:` and `logo:` are accepted through `..args`.

### `#slide(config: (:), repeat: auto, setting: body => body, composer: auto, align: auto)[...]`
Standard content slide with progress/header/footer chrome. Ordinary `==` headings invoke it automatically; use `composer` only for deliberate slide-level composition.

### `#new-section-slide(config: (:), level: 1, numbered: true)[...]`
Section divider triggered automatically by a level-1 heading.

### `#focus-slide(config: (:), background-color: none, background-img: none)[...]`
Emphasis slide with optional background image or color.

### `#matrix-slide(config: (:), columns: none, rows: none)[...][...]`
Full-bleed checkerboard slide. This specialized theme wrapper accepts row/column counts or track sizes; use ordinary `cols` for non-checkerboard content columns.

## Color Scheme

### Touying Color Mapping

```typst
config-colors(
  primary: rgb("#04364A"),
  secondary: rgb("#176B87"),
  tertiary: rgb("#448C95"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#000000"),
)
```

> Builtin themes use Touying's `config-colors()` directly. Colors can be customized via the theme entry function or `config-colors()` in `#show: theme.with(...)`.

## Demo

See `demo.typ` for a compilable example.
