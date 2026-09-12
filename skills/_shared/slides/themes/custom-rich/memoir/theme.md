# Memoir Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `memoir-theme`
**Style**: Elegant, bookish, ornamental, typographic / light theme
**Primary color**: `#7B2D3B` (Burgundy)
**Best For**: Humanities lectures, literary presentations, book launches, typography conferences, cultural talks
**Style Objective**: Elegant
**Complexity Level**: Rich

## Description

A luxury book/memoir design aesthetic inspired by Penguin Classics and Taschen fine press publishing. Features ornamental SVG flourishes, corner decorations, elegant serif typography with generous leading, pull quotes with decorative quotation marks, and a rich cream paper background with deep black ink and burgundy jewel-tone accent. Content hierarchy is achieved through typographic size and weight rather than color, embodying the principle that good typography is invisible yet powerful.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)

#show: memoir-theme.with(
  aspect-ratio: "16-9",
  footer: [The History of Typography],
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Book cover style with corner ornaments in all four corners, centered flourish, large serif title, italic subtitle, ornamental rule, author, and publisher-style institution/date line.

### `#slide(title: auto)`
Cream background content slide with serif header, gold ornament line below title, folio-style footer with italic text and page number.

### `#new-section-slide[...]`
Chapter opening with subtle border frame, "CHAPTER" in tracked small caps, Roman numeral in burgundy, ornamental flourish, and large serif title.

### `#focus-slide[...]`
Large centered italic quote with oversized gold ornamental quotation marks and trailing flourish.

### `#ending-slide[...]`
Colophon-style closing with corner ornaments, italic "Finis", ornamental flourish, and body text.

## Reusable Components

### `#chapter-card(title, body-text)`
Card with gold top border for presenting people, concepts, or periods.
```typst
#chapter-card([Nicolas Jenson], [Venice, 1470. Created the first true roman typeface.])
```

### `#folio-stat(number, description)`
Large burgundy number with small italic description for key statistics.
```typst
#folio-stat([1455], [Year of the Gutenberg Bible])
```

### `#memoir-quote(quote-text, attribution: none)`
Elegant centered pull quote with ornamental quotation marks.
```typst
#memoir-quote([Typography is the craft of endowing human language with a durable visual form.], attribution: [Robert Bringhurst])
```

### `#fleuron-divider()`
Centered ornamental flourish divider between content blocks.
```typst
#fleuron-divider()
```

### `#sidenote(body)`
Small italic marginalia annotation for supplementary notes.
```typst
#sidenote[The Gutenberg Bible required approximately 300 individual letter molds.]
```

### `#binding-tag(label-text)`
Small rectangular tag with tracked uppercase text for section markers.
```typst
#binding-tag[Transitional Period]
```

### `#colophon-box(..items)`
Book colophon-style box with "COLOPHON" header and listed statements.
```typst
#colophon-box([*Readability* remains the supreme measure.], [*Contrast* creates hierarchy.])
```

### `#chapter-opener(number, title)`
Decorative chapter opening with label, number, flourish, and title.
```typst
#chapter-opener([III], [The Modern Era])
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Cream Paper** | `#FFFEF7` | `palette.bg` | Warm off-white background |
| **Deep Ink** | `#1C1714` | `palette.ink` | Primary text, rich near-black |
| **Burgundy** | `#7B2D3B` | `palette.accent` | Chapter numbers, primary accent |
| **Forest Green** | `#2E5A4C` | `palette.secondary` | Secondary emphasis |
| **Antique Gold** | `#88704F` | `palette.ornament` | Flourishes, decorative elements |
| **Ink Light** | `#1C1714` (40% transparent) | `palette.ink-light` | Footer, captions, muted text |
| **Ink Muted** | `#1C1714` (35% transparent) | `palette.ink-muted` | Body text in cards, secondary |
| **Ink Faint** | `#1C1714` (75% transparent) | `palette.ink-faint` | Hairline rules and subtle frames |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
