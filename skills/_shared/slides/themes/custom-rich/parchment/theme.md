# Parchment Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `parchment-theme`
**Style**: Scholarly, warm, refined, illuminated manuscript / light theme
**Primary color**: `#6B2737` (Deep Burgundy)
**Best For**: Humanities presentations, literary discussions, historical research, classical studies
**Style Objective**: Scholarly, refined, warm
**Complexity Level**: Rich

## Description

An aged parchment/vellum presentation theme evoking the atmosphere of illuminated manuscripts and old libraries. Features warm cream backgrounds, rich burgundy titles, antique gold ornaments, and calligraphic SVG flourishes. Includes scroll corner ornaments, decorative dividers, and margin rosettes. Optimized for humanities content, literary analysis, historical research, and any presentation seeking scholarly elegance.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Serif", "Noto Serif SC"))
#show raw: set text(font: "IBM Plex Mono")

#show: parchment-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [The Art of the Medieval Manuscript],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= First Section
```

The theme entry is font-agnostic. Choose installed fonts in the presentation source; the demo uses the verified `IBM Plex Serif`, `Noto Serif SC`, and `IBM Plex Mono` families.

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Warm cream background with double border frame, scroll corner ornaments in all four corners, centered burgundy title with gold flourish divider, subtitle, author, institution, and date.

### `#slide(title: auto)`
Content slide with warm cream background, burgundy title with gold accent line, footer with rosette decoration and slide counter.

### `= Section Title`
Automatically creates a section divider with gold section number, burgundy title, left accent bar, flourish divider, and bottom rosette. Do not call `new-section-slide` manually.

### `#focus-slide[...]`
Centered statement on parchment with ornamental burgundy border, corner rosettes, and gold flourish below.

### `#ending-slide[...]`
Closing slide with scroll corner ornaments, central rosette, burgundy text, gold flourish, and double rule.

## Reusable Components

### `#manuscript-card(title, body, accent: palette.primary)`
Card with colored top border for structured content blocks and definitions.
```typst
#manuscript-card([The Ancient Scroll], [Content here...], accent: palette.secondary)
```

### `#folio-stat(label, value, color: palette.accent)`
Centered value-then-label stack with a left accent bar for statistics.
```typst
#folio-stat([Calves per Bible], [250+], color: palette.primary)
```

### `#marginalia-note(body, accent: palette.secondary)`
Side-note style italic annotation with left rule for contextual notes.
```typst
#marginalia-note([_Note:_ The word "codex" derives from Latin _caudex_.])
```

### `#illuminated-box(title, body, color: palette.accent)`
Highlighted box with border and rosette icon for key insights.
```typst
#illuminated-box([Key Insight], [Important content here...], color: palette.primary)
```

### `#flourish-divider(color: palette.accent, width: 60%)`
Decorative calligraphic SVG separator between content blocks.
```typst
#flourish-divider(color: palette.accent, width: 40%)
```

### `#colophon-tag(content, color: palette.primary)`
Capsule-shaped label for categorization and metadata tags.
```typst
#colophon-tag([Benedictine], color: palette.primary)
```

Use native Typst `+` enum syntax inside a themed card instead of an array-based custom list wrapper.
```typst
#manuscript-card([Five Foundational Scripts], [
  + Uncial
  + Carolingian minuscule
  + Gothic textura
])
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Warm Cream** | `#FAF7F0` | `palette.bg` | Parchment background |
| **Deep Burgundy** | `#6B2737` | `palette.primary` | Titles, headings, key accents |
| **Antique Gold** | `#9B7B3C` | `palette.accent` | Ornaments, flourishes, numbers |
| **Sage Green** | `#5B7B6B` | `palette.secondary` | Marginalia, supplementary |
| **Dark Walnut** | `#3B2820` | `palette.text-dark` | Deepest text color |
| **Warm Brown** | `#4A3828` | `palette.text-body` | Main content text |
| **Muted Tan** | `#8B7B6B` | `palette.text-muted` | Footer, subtle labels |
| **Ivory** | `#FFFDF8` | `palette.card-bg` | Card backgrounds |
| **Warm Border** | `#D4C4A8` | `palette.border` | Border lines, frames |
| **Light Border** | `#E8DCC8` | `palette.border-light` | Subtle card borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.text-dark,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example
- `theme_design_spec.md` -- Detailed design specification
- `theme.md` -- This quick reference

## Demo

See `demo.typ` for a compilable example.
