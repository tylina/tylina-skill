# Zen Garden

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `zen-garden-theme`
**Style**: Minimalist zen, raked sand, natural stone, serene emptiness
**Primary color**: `#4A4A4A` (warm stone grey)
**Best For**: Mindfulness, philosophy, design thinking, minimalist presentations, Japanese culture
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A minimalist theme inspired by Japanese karesansui (dry landscape) zen rock gardens. Embraces negative space as its primary design element -- raked sand patterns flow across slide backgrounds, smooth stone shapes punctuate the emptiness, and a restrained palette of warm greys and earth tones creates a contemplative atmosphere. Best for presentations where restraint and intentionality matter more than spectacle.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(size: 18pt)

#show: zen-garden-theme.with(
  aspect-ratio: "16-9",
  footer: [Zen Garden],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
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
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

The theme entry is font-agnostic. Configure an installed Latin/CJK stack in `main.typ`; the checked demo uses this environment-verified pair:

```typst
#set text(font: ("Helvetica Neue", "Hiragino Sans GB"), size: 18pt)
```

Replace those families when they are unavailable on the target system.

## Available Slide Types

### `#title-slide()`
Spacious cover slide with centered title, thin accent line, and decorative stone arrangement at bottom-right. Raked sand pattern (stronger opacity) at bottom. Uses `self.info` for title, subtitle, author, date, institution.

### `#slide(title: auto)`
Standard content slide with medium-weight title header, thin accent underline (50pt), and persistent zen garden atmosphere (raked sand at bottom, tiny stone dots in corner). Footer shows custom content, stone dot, and page counter.

### `= Heading` (new-section-slide)
Auto-triggered section divider. Large faint section number (light weight) with medium-weight title and minimal accent line. Sand pattern at bottom, small stone dots at bottom-right.

### `#focus-slide[...]`
Maximum emptiness. Centered medium-weight text on slightly warmer background with subtle sand lines. Single stone dot beneath text as contemplative punctuation.

### `#ending-slide[...]`
Bookends with title slide -- same stones arrangement and stronger sand pattern. Centered farewell text with thin accent line.

## Reusable Components

### `#stone-card(title, body, accent: palette.primary)`
Primary content card with rounded organic shape (12pt radius), very subtle shadow via `@preview/shadowed:0.3.0`, and an opaque surface over the sand atmosphere. Its terminal `lazy-v(1fr)` is inert outside lazy layout; use it as the sole component in one `cols(lazy-layout: true)` column.

```typst
#stone-card([Card Title], [
  Body content goes here with generous spacing.
])
```

### `#sand-divider(color: palette.accent, width: 80%)`
SVG-based separator rendered as two parallel wavy lines suggesting raked sand furrows. Not a plain geometric line.

```typst
#sand-divider()
#sand-divider(color: palette.primary, width: 60%)
```

### `#moss-highlight(title, body)`
Accent callout with a subtle green left border and opaque moss-tinted fill. Its terminal `lazy-v(1fr)` supports one-callout-per-column lazy height equalization.

```typst
#moss-highlight([Insight], [
  Key observation or insight text.
])
```

### `#pebble-stat(label, value, accent: palette.primary)`
Adaptive pebble display. The value and label form one centered `stack(spacing:)`; the 72pt-wide pebble safely supports short and long values such as `15` and `3-5-7`, while labels may wrap for mixed Latin/CJK text.

```typst
#pebble-stat([Total Users], [2.4M])
```

### `#garden-verse(quote, author: none)`
Contemplative quote block with generous whitespace. Centered italic text, optional author attribution.

```typst
#garden-verse(
  [The obstacle is the path.],
  author: [Zen Proverb],
)
```

### `#stone-tag(content, color: palette.accent)`
Small pill-shaped inline tag with an opaque pale fill, subtle border, rounded ends, and contrast-safe darkened foreground.

```typst
#stone-tag([Mindfulness]) #h(4pt) #stone-tag([Focus])
```

### `#rock-grouping(title, body)`
Borderless section with title + SVG sand divider + content. Typography and spacing only -- no visible container.

```typst
#rock-grouping([Key Principle], [
  Explanatory content beneath the divider.
])
```

### `#zen-box(title, body)`
Minimal card with NO visible border. It uses a subtle opaque background and generous inset; its terminal `lazy-v(1fr)` is inert in normal flow and must be the sole component when used in a lazy-layout column.

```typst
#zen-box([Concept], [
  Brief explanation.
])
```

## Layout Semantics

- Keep complete sequential visual regions in direct natural flow. Use `stack(spacing:)` for deliberately grouped internals such as metric value-and-label compositions.
- Use ordinary `cols` for semantic columns that contain multiple elements.
- Use `cols(lazy-layout: true)` only for one `stone-card`, `moss-highlight`, or `zen-box` per column.
- Use native `grid` for multi-row matrices; terminal `lazy-v(1fr)` markers are inert there.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#4A4A4A` | `palette.primary` | Headers, stone elements |
| **Dark** | `#2D2D2D` | `palette.dark` | Deep shadows |
| **Accent** | `#8B7355` | `palette.accent` | Sand/earth tones, highlights |
| **Moss** | `#6B7F5E` | `palette.moss` | Green accent (moss highlight) |
| **Background** | `#FAF8F5` | `palette.bg` | Page background |
| **Card** | `#F5F2ED` | `palette.card` | Card surfaces |
| **Moss Card** | `#F2F4EF` | `palette.moss-card` | Opaque moss callout surface |
| **Text Dark** | `#2D2D2D` | `palette.text-dark` | Headings |
| **Text Body** | `#4A4A4A` | `palette.text-body` | Body text |
| **Text Light** | `#706B64` | `palette.text-light` | Contrast-safe captions and footer text |
| **Accent Text** | `#765F45` | `palette.accent-text` | Contrast-safe earth-tone foreground |
| **Border** | `#E5E0D8` | `palette.border` | Card borders |
| **Sand** | `#D4CDB8` | `palette.sand` | Sand pattern |
| **Stone Light** | `#C8C2B8` | `palette.stone-light` | Decorative dots |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.text-dark,
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
- **Dependencies**: `@preview/shadowed:0.3.0`

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
