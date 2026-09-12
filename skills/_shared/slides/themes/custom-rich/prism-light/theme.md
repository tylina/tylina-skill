# Prism Light Theme -- API Reference

## Overview

A light theme inspired by white light refracting through a crystal prism, producing rainbow spectrum accents on clean white backgrounds. Scientific beauty made visible through physics.

**Best for:** Optics, physics, data visualization, creative technology, scientific presentations, algorithm showcases.

**Touying version:** 0.7.4

---

## Theme Entry Point

```typst
#show: prism-light-theme.with(
  aspect-ratio: "16-9",       // "16-9" or "4-3"
  footer: [Custom Footer],    // Content for slide footer (or none)
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Page aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/none | `none` | Footer content for slides |
| `..args` | any | -- | Passed through to touying-slides |

---

## Slide Functions

### `title-slide()`

Full-page title slide with deep violet background, prism refraction SVG, rainbow corner accents, and spectrum frame border.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with persistent light ray background atmosphere, spectrum bar at top, and spectral title underline.

```typst
== Slide Title    // auto title from heading

#slide(title: [Custom Title])[
  Content here...
]
```

### `new-section-slide`

Auto-generated section divider (triggered by `= Section Heading`). Deep violet background with lens convergence decoration and wavelength wave.

### `outline-slide(title: [Contents])`

Table of contents slide with prism decoration.

```typst
#outline-slide()
#outline-slide(title: [Agenda])
```

### `focus-slide`

Full-violet background for impactful quotes or key statements.

```typst
#focus-slide[
  _"Quote text here."_
]
```

### `ending-slide`

Closing slide with prism decoration (mirrored from title), rainbow corner accents (bookend), and centered card.

```typst
#ending-slide[Thank You]
```

---

## Components (11 total)

### `spectrum-card[title][body]`

Card with rainbow gradient top border and natural-height content flow.

```typst
#spectrum-card([Title], [Body content])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |

### `lens-box[title][body]`

Box with converging ray SVG decoration and blue left accent.

```typst
#lens-box([Title], [Body content])
```

### `wavelength-tag[label]`

Small inline pill tag with spectral color dot.

```typst
#wavelength-tag([Label], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `label` | content | required | Tag text |
| `color` | color | `palette.primary` | Tag accent color |

### `refraction-divider()`

SVG wavelength/sine wave horizontal separator.

```typst
#refraction-divider()
```

### `stat-card[value][label]`

Centered diamond → value → label metric stack with a colored bottom border.

```typst
#stat-card([42.7%], [Efficiency], color: palette.tertiary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | content | required | Large metric value |
| `label` | content | required | Description label |
| `color` | color | `palette.primary` | Accent color |

### `code-card[title][body]`

Code container with dark header (terminal-style dots) and spectrum accent. Use with raw code blocks.

```typst
#code-card([filename.py], [
  ```python
  def hello():
      return "world"
  ```
])
```

### `beam-card[title][body]`

Card with emerald green left beam accent border.

```typst
#beam-card([Title], [Body content])
```

### `insight-box[title][body]`

Borderless callout with diamond/prism icon. Light violet background fill.

```typst
#insight-box([Key Insight], [Explanation...])
```

### `comparison-table(headers, rows, columns: auto, text-size: 0.8em, align: center + horizon)`

Clean scientific data table with violet header and alternating row fills. Equal-width columns are the default; pass explicit ratios and a smaller text size for demanding tables.

```typst
#comparison-table(
  ([Column A], [Column B], [Column C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
  columns: (1.2fr, 0.8fr, 1fr),
)
```

### `photon-note[body]`

Borderless inline note with light particle (photon) icon. Italic styling.

```typst
#photon-note([Additional context or footnote.])
```

### `focus-card[value][label]`

Large centered lens → value → label metric stack with a colored border.

```typst
#focus-card([2.4M], [Rays per second], color: palette.primary)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | content | required | Large metric value |
| `label` | content | required | Description label |
| `color` | color | `palette.primary` | Accent color |

---

## Color Palette

Access via `palette.key`:

| Key | Hex | Description |
|-----|-----|-------------|
| `bg` | `#FCFCFE` | Pure white with cool tint |
| `primary` | `#4A3FA8` | Violet (short wavelength) |
| `secondary` | `#D4543B` | Red-orange (long wavelength) |
| `tertiary` | `#1B8A6E` | Emerald green (mid spectrum) |
| `accent-blue` | `#3B7DD8` | Blue spectrum |
| `accent-amber` | `#D4890B` | Amber/yellow spectrum |
| `text-dark` | `#1E1E3C` | Deep violet-black |
| `text-body` | `#3D3D5C` | Dark violet-gray |
| `text-muted` | `#686887` | WCAG-AA muted violet-gray |
| `card-bg` | `#FFFFFF` | Pure white |
| `border` | `#E5E3F0` | Faint violet border |
| `spectrum` | `#F5F3FA` | Very light violet fill |
| `blue-text` | `#245EAA` | Accessible blue text on light surfaces |
| `cyan-text` | `#087785` | Accessible cyan text on light surfaces |
| `green-text` | `#0D755B` | Accessible green text on light surfaces |
| `amber-text` | `#805100` | Accessible amber text on light surfaces |
| `orange-text` | `#A54124` | Accessible orange text on light surfaces |
| `red-text` | `#A83B29` | Accessible red text on light surfaces |

### Spectral Colors (for cycling)

`spectrum-colors`: violet, indigo, blue, cyan, green, yellow, orange, red

Access individual: `palette.violet`, `palette.indigo`, `palette.blue`, `palette.cyan`, `palette.green`, `palette.yellow`, `palette.orange`, `palette.red`

Text-bearing components map bright accents to darker semantic tokens: `palette.blue-text`, `palette.cyan-text`, `palette.green-text`, `palette.amber-text`, `palette.orange-text`, and `palette.red-text`. Bright spectral tokens remain available for decorative rules, dots, and fills.

---

## SVG Decorations

Standalone SVG rendering helpers:

| Function | Description |
|----------|-------------|
| `prism-refraction(width: 180pt)` | Prism with dispersed rainbow beams |
| `spectrum-bar(width: 100%)` | Full rainbow gradient horizontal bar |
| `wavelength-wave(width: 100%)` | Sine wave overlay (multiple wavelengths) |
| `lens-convergence(width: 140pt)` | Converging/diverging rays through lens |
| `diamond-icon(size: 18pt)` | Small crystal/diamond icon |
| `photon-icon(size: 14pt)` | Light particle with radiating lines |

---

## Utility Functions

| Function | Description |
|----------|-------------|
| `spectrum-color(index)` | Returns color from 8-color spectral cycle |
| `spectrum-text-color(color)` | Maps bright spectral accents to accessible text variants |

---

## Layout Tips

- Use `#cols(columns: (1fr, 1fr), gutter: 1.2em, ...)` for semantic narrative columns
- Components retain terminal `lazy-v(1fr)` markers as an optional equal-height capability; the markers are inert in natural-height flow
- Enable `cols(lazy-layout: true)` only when every column contains exactly one direct stretchable component; use ordinary `cols` for composite columns
- Use `grid(columns: N, gutter: ...)` for regular KPI/stat matrices
- Combine `wavelength-tag` inline with `#stack(dir: ltr, spacing: 0.5em, ...)` for tag rows
- Use `refraction-divider()` between content sections
- `photon-note` works well as supplementary context below main content

---

## Speaker Notes

Add speaker notes to any slide:

```typst
#speaker-note[Notes for the presenter about this slide.]
```
