# Carnival Rio

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `carnival-rio-theme`
**Style**: Explosive tropical color, samba rhythm, feathered exuberance
**Primary color**: `#FF2D55` (hot carnival pink)
**Best For**: Entertainment, events, festivals, marketing campaigns, Latin culture, party planning
**Style Objective**: General Versatile
**Complexity Level**: Canvas

## Description

A maximalist Canvas-tier theme inspired by Brazilian Carnival, Rio de Janeiro, samba energy, feathers, sequins, and explosive color. Every slide lives in a world of confetti scatter, feather plumes, and golden sequin sparkles on a warm white background. The theme is joyful, colorful, and energetic -- the opposite of minimalism. Best for entertainment, festival, and celebration content.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: carnival-rio-theme.with(
  aspect-ratio: "16-9",
  footer: [Festival Name],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
  config-common(breakable: false),
)

#set text(font: ("Arial", "Heiti SC"), size: 20pt)

#title-slide()

= First Section

== First Slide

Content goes here.

#ending-slide[Thank You!]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |
| `preset` | string | `"rio"` | Color preset: `"rio"`, `"copacabana"`, or `"samba"` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Arial", "Heiti SC"), size: 20pt)
```

The theme internally uses:
- `("Menlo", "Courier New")` for kickers, metadata, counters, footer chrome

## Available Slide Types

### Standard Types

### `#title-slide()`
Maximalist carnival cover with all 5 SVG decorative elements at full intensity. Center title card with gradient stripe (pink-gold-green), rhythm wave divider, confetti explosion, feather plumes, tropical leaves, and sequin sparkles surrounding. Reads from `config-info()`.

### `#slide(title: auto)`
Standard content slide with persistent carnival atmosphere (confetti scatter, tropical leaf corner, rhythm wave at bottom). Header shows slide title with rhythm wave underline. Footer shows "CARNIVAL RIO" | floral dingbat | page counter.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Vibrant section break with confetti burst, feather plume (right side), tropical leaf (bottom-left), and section number in circle badge with sequin sparkle accent.

### `#focus-slide[...]`
Bold statement on hot pink (#FF2D55) background with white confetti, feather plumes, and sequin sparkles. Width-constrained text prevents overflow.

### `#ending-slide[...]`
Carnival celebration farewell that bookends with title-slide (shares same confetti layers, feather plumes, tropical leaves, sequin sparkles, and rhythm waves). Center card with sequin sparkle ornament. Ghost text "SAMBA" in background.

### Additional Slide Types

### `#dark-slide(title:, header-left:, header-right:)`

Deep purple-black (#1A0A1E) slide with ghost feather plume, faint confetti, and sequin sparkles. Good for dramatic statistics or quotes.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content/auto | `auto` | Slide title |
| `header-left` | content/none | `none` | Custom left header content |
| `header-right` | content/none | `none` | Custom right header content |

```typst
#dark-slide(title: [Key Insight])[
  Large dramatic content here.
]
```

## Reusable Components

### `#samba-card(title, body, accent: palette.accent)`
Primary content card with drop shadow, vivid colored top stripe, and sequin sparkle in corner. The carnival's workhorse card component.

```typst
#samba-card([Card Title], [
  Body content here.
])
#samba-card([Green Card], [Content], accent: palette.tertiary)
```

### `#float-stat(label, value, description: none, accent: palette.accent)`
Large colorful number display on a carnival float-inspired pedestal. Features giant bold number, rhythm wave underline, and monospace kicker label.

```typst
#float-stat([Revenue], [\$2.5M], description: [Annual growth rate])
```

### `#rhythm-divider(color: palette.accent)`
Musical wave pattern divider. NOT a straight line -- uses the rhythmic wave SVG pattern.

```typst
#rhythm-divider(color: palette.secondary)
```

### `#plume-highlight(body, accent: palette.accent)`
Feathered accent highlight box with plume decoration on the left side and colored left border.

```typst
#plume-highlight([
  Important highlighted content with feather accent.
])
```

### `#confetti-box(title, body, accent: palette.secondary)`
Celebration callout with confetti burst accent in the corner. Shadowed card with colored fill.

```typst
#confetti-box([Celebration!], [
  Something worth celebrating.
])
```

### `#sparkle-tag(body, color: palette.accent)`
Inline sequin-accented tag/badge. Pill-shaped with sequin sparkle icon.

```typst
#sparkle-tag([Hot Topic])
#sparkle-tag([Gold], color: palette.secondary)
```

### `#carnival-quote(body, cite: none)`
Vibrant quote block with large decorative quote mark and feather ornament on right.

```typst
#carnival-quote([
  A memorable quote about celebration.
], cite: [Famous Person])
```

### `#parade-grid(..items)`
Multi-item grid with alternating colored backgrounds (pink, gold, green) cycling through the carnival palette.

```typst
#parade-grid(
  [First item content],
  [Second item content],
  [Third item content],
)
```

### `#tropical-banner(body, accent: palette.tertiary)`
Full-width banner with tropical leaf silhouette in background.

```typst
#tropical-banner([
  Important announcement or summary text.
])
```

### `#sequin-stat(value, label, accent: palette.secondary)`
Compact stat card with sequin sparkle decoration and bold number.

```typst
#sequin-stat([42], [Total events])
```

## Color Scheme

### Palette System (Canvas)

**Factory function**: `build-palette(preset-name)`
**Variable name**: `palette` (exported for use in main.typ)

#### Presets

| Preset | BG | Ink | Accent | Secondary | Tertiary | Best For |
|--------|-----|-----|--------|-----------|----------|----------|
| rio (default) | `#FFFCF5` | `#2D1B0E` | `#FF2D55` | `#FFD700` | `#00C853` | Standard carnival |
| copacabana | `#FFFDF7` | `#1A1A2E` | `#FF6B00` | `#E91E63` | `#00BCD4` | Beach/ocean |
| samba | `#FFF8F0` | `#3E2723` | `#9C27B0` | `#FF2D55` | `#FFD700` | Purple royalty |

#### Derived Palette Keys

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `palette.bg` | Base warm white | Page background |
| `palette.ink` | Base dark brown | Primary text |
| `palette.accent` | Hot carnival pink | Primary accent |
| `palette.secondary` | Golden sequin | Secondary accent |
| `palette.tertiary` | Tropical green | Tertiary accent |
| `palette.ink-dim` | ink @ 30% transparent | Secondary text |
| `palette.ink-muted` | ink @ 50% transparent | Metadata text |
| `palette.ink-faint` | ink @ 75% transparent | Borders |
| `palette.ink-ghost` | ink @ 92% transparent | Ghost elements |
| `palette.accent-dim` | accent @ 25% transparent | Light accent |
| `palette.accent-muted` | accent @ 50% transparent | Muted accent |
| `palette.secondary-dim` | secondary @ 30% transparent | Light gold |
| `palette.tertiary-dim` | tertiary @ 30% transparent | Light green |
| `palette.card` | `#FFFFFF` | Card fills |
| `palette.card-warm` | bg.darken(2%) | Warm card fill |
| `palette.dark-bg` | `#1A0A1E` | Dark slide bg |
| `palette.dark-ink` | `#FFF8F0` | Dark slide text |
| `palette.meta-color` | ink @ 55% transparent | Footer chrome |

### Typography Constants

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 42pt | Hero titles |
| `typo.h1` | 28pt | Main slide titles |
| `typo.h2` | 20pt | Card headings |
| `typo.body` | 15pt | Body text |
| `typo.small` | 12pt | Captions |
| `typo.tiny` | 9pt | Kickers, metadata |
| `typo.meta` | 8pt | Footer chrome |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,          // #FF2D55 -- hot pink
  neutral-lightest: palette.bg,     // #FFFCF5 -- warm white
  neutral-darkest: palette.ink,     // #2D1B0E -- dark brown
)
```

## SVG Decorative Elements

| SVG | Elements | Purpose |
|-----|----------|---------|
| Confetti Scatter | 30+ rects/circles/triangles | Random confetti particles across slides |
| Feather Plume | 18+ curved paths | Samba headdress feather decoration |
| Rhythm Wave | 14+ paths/circles | Musical samba beat pattern |
| Tropical Leaf | 14+ paths | Palm/banana leaf silhouette |
| Sequin Sparkle | 13+ polygons/circles | Starburst glitter pattern |

## Layout Patterns

### Three-Column Stats

```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #float-stat([Label], [Value])
][
  #float-stat([Label], [Value], accent: palette.secondary)
][
  #float-stat([Label], [Value], accent: palette.tertiary)
]
```

### Two-Column with Cards

```typst
#cols[
  #samba-card([Left Title], [Content])
  #v(0.5em)
  #plume-highlight([Important note.])
][
  #confetti-box([Right Title], [Content])
  #v(0.5em)
  #samba-card([Another Card], [More content], accent: palette.tertiary)
]
```

### Dark Slide with Stats Grid

```typst
#dark-slide(title: [Key Metrics])[
  #grid(columns: (1fr, 1fr), column-gutter: 20pt,
    sequin-stat([42], [Metric A]),
    sequin-stat([98%], [Metric B], accent: palette.accent),
  )
]
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
- **Package**: `@preview/shadowed:0.3.0`

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with content about Brazilian Carnival history, samba schools, and parade culture.
