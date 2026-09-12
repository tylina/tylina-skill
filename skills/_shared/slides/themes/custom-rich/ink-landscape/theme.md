# Ink Landscape (水墨山水)

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `ink-landscape-theme`
**Style**: Chinese ink wash painting — Song dynasty landscape scroll with mountains, mist, seal stamps, bamboo
**Primary color**: `#2C2C2C` (Heavy Ink) / Accent: `#C23B22` (Vermillion Seal Red)
**Best For**: Chinese culture, literature, history, philosophy, calligraphy, traditional arts, academic presentations on Asian studies
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A stunning presentation theme that transports the viewer into a Song dynasty landscape scroll painting. Features persistent mountain atmosphere on EVERY content slide, brush-stroke SVG calligraphic underlines, rice paper warmth, vermillion seal stamps as punctuation, layered mountains with mist bands, bamboo silhouettes, and ink splashes. The title and ending slides "bookend" the presentation like opening and closing a painted scroll.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#show: ink-landscape-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Presentation Footer],
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

#focus-slide[Key Takeaway]

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Libertinus Serif", "Noto Serif SC"))
```

The theme entry sets only the base size and ink color, so the document owns its font choice. The demo uses `("Libertinus Serif", "Noto Serif SC")`; code blocks use `("Menlo", "Noto Sans SC")` on the review platform.

## Available Slide Types

### `#title-slide()`
Full scroll opening with mountain panorama. Features bamboo branch (top-right), seal stamp (top-left), ink splash (center background), and layered mountain range at bottom with enhanced opacity. Reads from `config-info()`. Bookends with ending-slide.

### `#slide(title: auto)`
Rice paper content slide with PERSISTENT mountain atmosphere at bottom and scattered ink dots in the upper corner, rendered in the page background layer so chrome stays readable. Header shows a semibold title with brush-stroke SVG underline (calligraphic, NOT a plain line). Footer has three-column grid: footer text | miniature seal stamp | page counter.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Large ink splash as focal background element. Shows section number in dilute ink (4em), section title (2.2em bold), brush stroke underline. Seal stamp in top-right corner, brush divider at bottom.

### `#focus-slide[...]`
Dramatic ink splash (320pt) centered behind text. Bamboo in bottom-right, seal stamp in bottom-left. Centered semibold italic text with red brush underline. The most dramatic visual departure from content slides.

### `#ending-slide[...]`
Bookends with title slide: same bamboo branch (top-right), seal stamp (top-left), and stronger mountain range. Centered farewell text with brush underline and brush divider below.

## Reusable Components

### `#scroll-card(title, body, accent: palette.primary)`
Content card shaped like an unrolled scroll with dark paper-roll edges at top and bottom (4pt strips). Aged rice paper fill, accent-colored title.

```typst
#scroll-card([Card Title], [
  Card content with bullet points and text.
], accent: palette.bamboo-green)
```

### `#seal-stat(label, value, color: palette.accent)`
Large statistic display with a faint seal stamp SVG (80% transparent) placed behind the number. Label above in light text, bold value below.

```typst
#seal-stat([Metric Name], [42], color: palette.accent)
```

### `#verse-quote(quote, author: none)`
Centered verse with vertical bar accents flanking the text and ink-splash SVG (140pt) behind at low opacity. Author in red below.

```typst
#verse-quote(
  [The wise man finds beauty in simplicity.],
  author: [Laozi]
)
```

### `#ink-box(title, body, accent: palette.primary)`
Card with brush-stroke SVG as top border (NOT a straight line). Calligraphic energy in the border. Three-sided straight border for sides and bottom.

```typst
#ink-box([Key Concept], [
  Detailed explanation of the concept here.
], accent: palette.primary)
```

### `#stamp-tag(content, color: palette.accent)`
Inline seal-shaped tag with tinted background and colored border. Small semibold text.

```typst
#stack(dir: ltr, spacing: 0.5em,
  stamp-tag([Tag One]),
  stamp-tag([Tag Two], color: palette.bamboo-green),
)
```

### `#ink-divider(color: palette.primary, width: 80%)`
SVG-based brush stroke divider (NOT a line()). Full-width calligraphic separator with pressure variation.

```typst
#ink-divider(color: palette.text-light, width: 50%)
```

### `#pavilion-highlight(title, body)`
Featured content area with bamboo branch SVG placed in top-right corner via `place()`. Card with brush underline below title in bamboo-green.

```typst
#pavilion-highlight([Feature Title], [
  Important content that deserves visual emphasis.
])
```

### `#mist-card(title, body)`
Transparent gradient card (mist-to-background) that feels like peering through mountain mist. Soft border, ethereal feel.

```typst
#mist-card([Misty Topic], [
  Content that emerges from the mist of contemplation.
])
```

### `#landscape-section(title, body)`
Borderless section header — just semibold title + brush SVG divider + content. No containing box. Pure typography with brush energy.

```typst
#landscape-section([Section Header], [
  Content below the brush divider, flowing naturally.
])
```

## SVG Decorative Elements

| Element | Function | Usage |
|---------|----------|-------|
| Mountain range | `_mountain-bg()` | Persistent on every content slide (bottom 35%) |
| Brush stroke | `brush-underline(color, width)` | Header decoration, component accents |
| Seal stamp | `seal-stamp(color, size)` | Footer marker, stat overlay, corner decoration |
| Bamboo branch | `bamboo-branch(color, height)` | Corner decoration on title/ending/pavilion |
| Ink splash | `ink-splash(color, size)` | Section/focus backgrounds, verse-quote atmosphere |
| Brush divider | `brush-divider(color, width)` | Full-width calligraphic separator |

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#2C2C2C` | `palette.primary` | Heavy ink, headers, mountains |
| **Dark** | `#1A1A1A` | `palette.dark` | Deepest ink |
| **Accent** | `#C23B22` | `palette.accent` | Vermillion seal red |
| **Background** | `#F8F4EF` | `palette.bg` | Rice paper |
| **Card** | `#F0EBE3` | `palette.card` | Aged rice paper |
| **Text Dark** | `#1A1A1A` | `palette.text-dark` | Headings |
| **Text Body** | `#3A3A3A` | `palette.text-body` | Body text |
| **Text Light** | `#8A8A7A` | `palette.text-light` | Captions, dilute ink |
| **Border** | `#D4CEC4` | `palette.border` | Scroll edges |
| **Seal Red** | `#C23B22` | `palette.seal-red` | Seal stamp elements |
| **Light Ink** | `#B8B0A4` | `palette.light-ink` | Background decorations |
| **Bamboo Green** | `#527052` | `palette.bamboo-green` | Accessible nature accents |
| **Mist** | `#E8E2D8` | `palette.mist` | Gradient cards |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,         // Heavy ink
  neutral-lightest: palette.bg,     // Rice paper background
  neutral-darkest: palette.text-dark, // Deep ink text
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (6 SVG motifs, 9 components)
- `demo.typ` -- Compilable usage example (20 slides, 15+ distinct layouts)
