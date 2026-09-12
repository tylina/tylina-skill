# Greenhouse Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `greenhouse-theme`
**Style**: Victorian botanical greenhouse — iron-frame architecture, verdant greens, light and airy with botanical illustration elegance
**Primary color**: `#2D6A4F` (Deep Fern Green)
**Best For**: Sustainability, science, education, nature topics, environmental reports, botanical research, ecology presentations
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A light, airy presentation theme inspired by Victorian-era botanical greenhouses. Features iron-frame architectural SVG decorations, rich verdant green palette, and botanical illustration styling. Designed to feel like standing in the Palm House at Kew Gardens on a sunny morning — structural elegance from iron geometry, organic warmth from terracotta accents, and generous white space with green as accent rather than dominant color.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: greenhouse-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Organization Name],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("Avenir Next", "Arial"))

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
| `align` | alignment | `horizon` | Default vertical alignment for slide content |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Avenir Next", "Arial"))
```

For raw code blocks, use `#show raw: set text(font: ("Menlo", "DejaVu Sans Mono"))` in the demo or project entry.

## Available Slide Types

### `#title-slide()`
Greenhouse entrance cover with soft green-tinted gradient background, centered card with green top border, iron arch SVG decoration above, botanical corner SVGs, and leaf vein decoration at bottom. Reads from `config-info()`.

### `#slide(title: auto)`
Content slide with iron-grey top bar (3pt), bold dark title with green accent underline, and three-column footer grid (text | green dot | page number). Clean and spacious.

### `#new-section-slide[...]`
Dark forest gradient divider with terracotta accent bar on left, ghosted iron arch top-right, leaf vein bottom-left. White title with orange underline. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Dark gradient background with ghosted iron arch SVG centered. Large white bold text, width-constrained to prevent overflow. For key messages and takeaways.

### `#ending-slide[...]`
Light greenhouse gradient closing slide with botanical corner decorations, centered card with green top border, and leaf vein at bottom. For farewell and thank-you messages.

## Reusable Components

### `#pane-card(title, body, accent: palette.primary)`
Glass pane-styled content card with colored top border and thin iron-grey side borders. White background, rounded bottom corners. Use for general content blocks.

```typst
#pane-card([Research Findings], [
  - Key finding one
  - Key finding two
  - *Important:* highlighted detail
], accent: palette.primary)
```

### `#growth-stat(label, value, trend: none, accent: palette.primary, compact: false)`
Statistic display with large number, optional trend text. Left-bordered on leaf-tinted background. Use `compact: true` only when several complete stats are stacked in one bounded column; the internal value/label rhythm remains `.8em`.

```typst
#growth-stat([Species Count], [4,217], trend: [+340 new], accent: palette.primary)
```

### `#specimen-quote(body, attribution: none)`
Pull quote styled like a botanical specimen label. Glass-green background with left terracotta accent border. Italic text with optional attribution.

```typst
#specimen-quote(
  [Biodiversity is the library of life.],
  attribution: [E.O. Wilson],
)
```

### `#propagation-box(title, body, accent: palette.primary, compact: false)`
Information box styled like a planting tray with segmented top strip effect. Lightened accent fill color. `compact: true` reduces only the container inset for a bounded dense slide; it does not reduce the internal `.8em` stack spacing.

```typst
#propagation-box([Key Insight], [
  Important information presented in a distinctive box format.
], accent: palette.primary)
```

### `#seed-tag(label, accent: palette.primary)`
Small pill-shaped tag like a plant label stake. Use for categories, tags, and status indicators.

```typst
#seed-tag([Verified], accent: palette.primary)
#seed-tag([In Progress], accent: palette.accent)
```

### `#trellis-divider(color: palette.border)`
Horizontal divider with lattice/trellis pattern (three parallel lines at varying opacities). Use to separate content sections within a slide.

```typst
#trellis-divider()
```

### `#conservatory-highlight(title, body, accent: palette.primary)`
Featured content area with arched-top header (filled accent color, rounded top corners) and content body below. Like a greenhouse entrance frame.

```typst
#conservatory-highlight([Featured Programme], [
  Description of highlighted content with details.
], accent: palette.primary)
```

### `#botanical-table(headers, rows)`
Styled data table with dark green header row and alternating white/glass-green body rows.

```typst
#botanical-table(
  ([Species], [Status], [Population]),
  (
    ([_Wollemia nobilis_], [Recovering], [+340%]),
    ([_Nymphaea thermarum_], [Stable], [6 populations]),
  ),
)
```

### `#bloom-box(title, body)`
Warning/attention callout with rose bloom accent color. Alias of `propagation-box` with `palette.bloom`.

```typst
#bloom-box([Warning], [Critical information requiring attention.])
```

### `#terracotta-box(title, body)`
Alert/emphasis callout with terracotta orange accent. Alias of `propagation-box` with `palette.accent`.

```typst
#terracotta-box([Alert], [Time-sensitive information.])
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#2D6A4F` | `palette.primary` | Headers, accent bars, main branding |
| **Dark** | `#1B3A2E` | `palette.dark` | Dark backgrounds, section slides |
| **Accent** | `#E07A3A` | `palette.accent` | Terracotta warmth, emphasis elements |
| **Background** | `#F8FAF7` | `palette.bg` | Page background (green-tinted white) |
| **Card** | `#EFF5ED` | `palette.card` | Content cards, stat backgrounds |
| **Text Dark** | `#1B3A2E` | `palette.text-dark` | Headings, primary text |
| **Text Body** | `#3A5A4A` | `palette.text-body` | Body text |
| **Text Light** | `#7A9A8A` | `palette.text-light` | Captions, secondary text |
| **Border** | `#C8DCC4` | `palette.border` | Card borders, dividers |
| **Iron** | `#4A5C56` | `palette.iron` | Iron frame structural elements |
| **Glass** | `#E8F2E8` | `palette.glass` | Glass-tinted light surfaces |
| **Bloom** | `#D4577A` | `palette.bloom` | Rose bloom warnings/attention |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,        // Theme accent, alert() text, focus-slide backgrounds
  neutral-lightest: white,         // Light text on dark backgrounds
  neutral-darkest: palette.dark,   // Dark text on light backgrounds
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components.
