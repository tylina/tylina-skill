# {Theme Display Name}

> **Purpose**: This is the reference template for generating `theme.md` files. Every theme (builtin, universe, custom, user) should have a `theme.md` following this structure. It serves as the **API summary** that downstream roles (Strategist, Executor) read to understand what the theme offers.
>
> Replace all `{placeholders}` with actual values. Remove sections that don't apply (e.g., Reusable Components for builtin themes without custom components).

**Type**: {Custom (local template) / Touying Built-in / Universe (Typst package)}
**Touying version**: 0.7.4
**Entry function**: `{name}-theme`
**Style**: {Brief style description, e.g., "Modern, dark with gradient accents"}
**Primary color**: `{#hex}` ({color name})
**Best For**: {Target use cases, e.g., "Business reports, investor presentations, quarterly reviews"}
**Style Objective**: {General Versatile / Consulting / MBB Consulting / Academic}
**Complexity Level**: {Plain / Rich / Canvas}

## Contents

- [Description](#description)
- [Quick Start](#quick-start)
- [Theme Parameters](#theme-parameters)
- [Fonts](#fonts)
- [Available Slide Types](#available-slide-types)
- [Reusable Components](#reusable-components)
- [Color Scheme](#color-scheme)
- [Canvas Layout Patterns](#layout-patterns-canvas-themes)
- [Compatibility](#compatibility)
- [Files](#files)
- [Demo](#demo)

## Description

{2-3 sentence description of the theme's visual identity, design philosophy, and best use cases.}

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *          // custom themes
// #import themes.{name}: *        // builtin themes
// #import "@preview/{package}:{version}": *  // universe themes

#show: {name}-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |
| {additional params} | {type} | {default} | {description} |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("{primary-font}", "{CJK-font}"), size: {base}pt)
```

The theme internally uses:
- `"{mono-font}"` for kickers, metadata, counters
- {List other internal font usages}

## Available Slide Types

### Standard Types (all themes)

### `#title-slide()`
{Description of cover slide appearance and behavior.}

### `#slide(title: auto)`
{Description of standard content slide. Include header/footer details.}

### `#new-section-slide[...]`
{Description of section divider. Note: auto-triggered by `= Heading`.}

### `#focus-slide[...]`
{Description of emphasis/quote slide.}

### `#ending-slide[...]`
{Description of closing slide.}

### `#outline-slide()` (if available)
{Description of table-of-contents slide.}

### Additional Slide Types (Canvas themes)

> Canvas themes provide specialized slide functions beyond the 5 standard types. Document each with a parameter table.

### `#{name}-slide(title:, ...)`

{Description.}

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/none | `auto` | Slide title |
| {param} | {type} | {default} | {description} |

```typst
// Usage example
#{name}-slide(title: [Example])[
  Content here.
]
```

> Repeat for each additional slide type (e.g., `dark-slide`, `stat-slide`, `compare-slide`, `thesis-slide`, `kpi-slide`, `plain-slide`, `ticker-slide`, `impact-slide`).

## Reusable Components

> _Include this section for custom themes. Omit for builtin/universe themes that have no custom components._

### `#component-name(param1, param2, accent: auto)`
{Description and usage example.}

```typst
#component-name([Title], [
  Body content here.
])
```

{Repeat for each component...}

## Color Scheme

### Palette Dictionary (Rich themes)

> Rich themes define all colors in a single `palette` dictionary in `template.typ`.

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `{#hex}` | `palette.primary` | Headers, accent bars, main branding |
| **Dark** | `{#hex}` | `palette.dark` | Dark backgrounds, section slides |
| **Accent** | `{#hex}` | `palette.accent` | Data highlights, emphasis elements |
| **Background** | `{#hex}` | `palette.bg` | Page background |
| **Card** | `{#hex}` | `palette.card` | Content cards, boxes |
| **Text Dark** | `{#hex}` | `palette.text-dark` | Headings, primary text |
| **Text Body** | `{#hex}` | `palette.text-body` | Body text |
| **Text Light** | `{#hex}` | `palette.text-light` | Captions, secondary text |
| **Border** | `{#hex}` | `palette.border` | Card borders, dividers |

### Palette System (Canvas themes)

> Canvas themes use a **palette factory function** that generates full palettes from presets.

**Factory function**: `{build-palette / make-palette}(preset-name)`
**Variable name**: `{pal / palette}` (exported for use in main.typ)

#### Presets

| Preset | Ink | Paper | Accent | Best For |
|--------|-----|-------|--------|----------|
| {default} | `{#hex}` | `{#hex}` | `{#hex}` | {use case} |
| {preset2} | `{#hex}` | `{#hex}` | `{#hex}` | {use case} |

#### Derived Palette Keys

> All derived from base `ink` and `paper` values via `transparentize()`:

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `{pal}.ink` | Base ink color | Primary text, dark backgrounds |
| `{pal}.paper` | Base paper color | Light backgrounds, inverted text |
| `{pal}.accent` | Accent color | Highlights, emphasis |
| `{pal}.ink-light` | ink @ 40% transparent | Secondary text |
| `{pal}.ink-faint` | ink @ 70% transparent | Borders, rules |
| `{pal}.ink-muted` | ink @ 50% transparent | Metadata text |
| `{pal}.ink-ghost` | ink @ 94% transparent | Ghost background elements |
| `{pal}.card-dark` | ink @ 8% transparent | Dark card fills |
| {additional keys...} | | |

### Typography Constants (Canvas themes, if applicable)

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | {size}pt | Hero titles, giant numbers |
| `typo.h1` | {size}pt | Main slide titles |
| `typo.h2` | {size}pt | Card headings |
| `typo.body` | {size}pt | Body text |
| `typo.small` | {size}pt | Captions, metadata |
| `typo.kicker-size` | {size}pt | Kicker labels |

### Inverse Weight Hierarchy (Swiss/editorial themes, if applicable)

| Size Range | Weight | Usage |
|---|---|---|
| >= 36pt | 200 | Display, hero titles |
| 24-35pt | 200-300 | Slide titles |
| 16-23pt | 300-400 | Card titles |
| 12-15pt | 400-500 | Body |
| 8-11pt | 500-600 | Kickers, metadata |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.{xxx},        // Theme accent, alert() text, focus-slide backgrounds
  neutral-lightest: {color},     // Light text on dark backgrounds
  neutral-darkest: palette.{xxx},// Dark text on light backgrounds
)
```

## Layout Patterns (Canvas themes)

> Show 3-5 common layout compositions using this theme's components.

### {Pattern Name, e.g., "Two-Column with Kicker"}

```typst
// Usage example
{code}
```

### {Pattern Name}

```typst
// Usage example
{code}
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
