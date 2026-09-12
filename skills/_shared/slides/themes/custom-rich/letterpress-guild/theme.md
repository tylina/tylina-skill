# Letterpress Guild

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `letterpress-guild-theme`
**Style**: Movable type printing craft -- typographic guilds, printer's marks, fleurons
**Primary color**: `#9B2335` (Press Red)
**Best For**: Publishing, media, journalism, content strategy, brand agencies, editorial presentations
**Style Objective**: General Versatile (editorial/craft)
**Complexity Level**: Rich

## Description

A theme celebrating the craft heritage of the printing press. Evokes movable type, typographic guilds, printer's marks, and woodblock printing through thick/thin rule combinations, fleuron ornaments, type-case grid patterns, registration marks, and ink impression textures. Warm cream paper background with printer's black text and press red accents create a scholarly yet authoritative visual language.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("New Computer Modern", "Songti SC"), size: 20pt)

#show: letterpress-guild-theme.with(
  aspect-ratio: "16-9",
  footer: [LETTERPRESS GUILD],
  config-common(breakable: false),
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

## Fonts

Fonts are configured in `demo.typ` / `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("New Computer Modern", "Songti SC"), size: 20pt)
```

The reference stack is verified in the review environment and preserves the historical serif voice for Latin and CJK text. The reusable theme is font-agnostic: headings, labels, tags, and metadata inherit the deck's font, while size, tracking, case, and weight provide their hierarchy.

## Available Slide Types

### `#title-slide()`
Warm cream paper background with type-case grid texture, bookend frame (thick/thin rule border with corner ornaments), guild mark emblem upper-right, title in bold serif, thick-thin rule combo. No header/footer.

### `#slide(title: auto)`
Standard content slide. Type-case grid background, title in bold serif with thick-thin rule underline, page number in upper-right, footer with fleuron separator.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Faded section number, centered fleuron ornament, section title in bold serif with thick-thin rule. Bottom leading-style rule.

### `#focus-slide[...]`
Printer's black background with cream text, press red thick-thin rule accent at top-left corner, registration mark in bottom-right. For key statements.

### `#ending-slide[...]`
Bookend frame (matching title slide), guild mark, fleuron ornament, bold serif farewell text, thick-thin rule below. Shares visual frame with title slide.

### `#outline-slide(title: [Contents])`
Table of contents with type-case grid background, serif title, thick-thin rule, and clean TOC listing.

## Reusable Components

### `#type-card(title, body-content)`
Card with thick/thin rule border (printer's style). Thick top/bottom rules, thin side rules, uppercase tracked title in press red.

```typst
#type-card([Investment], [A printing press cost approximately 20 guilders.])
```

### `#impression-box(body-content, accent: palette.primary)`
Box with asymmetric ink-impression edge texture. Thicker left border with slightly mismatched stroke weights on other sides.

```typst
#impression-box[Before Gutenberg, books required months of hand-copying.]
```

### `#broadside-stat(value, label, accent: palette.primary)`
Metric in announcement/poster style frame. Large bold serif number centered with tracked uppercase label below.

The value and label are composed in one centered `stack(spacing:)`; the fixed poster height keeps short and long values aligned without lazy-layout behavior.

```typst
#broadside-stat([3,600], [pages per workday])
```

### `#pull-quote(body-content, cite: none)`
Quote with thick-thin rule borders top and bottom, large quotation mark, italic serif text, and optional uppercase citation.

```typst
#pull-quote([Type is a beautiful group of letters, not a group of beautiful letters.], cite: [Matthew Carter])
```

### `#colophon-tag(body-content)`
Printer's mark style inline tag. Thin border with compact tracked text inherited from the deck.

```typst
#colophon-tag[Impressum: Guild of Master Printers, Anno MMXXV]
```

### `#leading-divider(color: palette.primary)`
Thick-thin-thick rule separator (like a book section break).

```typst
#leading-divider()
```

### `#galley-card(title, body-content)`
Card with visible type-case grid background pattern. For featured content.

```typst
#galley-card([The Colophon], [The colophon appeared at the end of printed books.])
```

### `#press-box(body-content)`
Feature box with registration marks (+) in all four corners.

```typst
#press-box[Important content with registration mark framing.]
```

### `#compositor-list(body-content)`
Scoped printer's-mark styling for a native Typst list. Write ordinary `- item` markup inside the component.

```typst
#compositor-list[
  - Sort individual letters from the type case
  - Justify each line with lead spacers
  - Lock the forme into a chase
  - Pull the press lever
]
```

### `#fleuron-divider()`
Centered fleuron ornament SVG between two horizontal rules.

```typst
#fleuron-divider()
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Background** | `#FDF9F0` | `palette.bg` | Warm paper/cream page background |
| **Primary** | `#1C1C1C` | `palette.primary` | Printer's black (text, rules) |
| **Secondary** | `#9B2335` | `palette.secondary` | Press red (accents, titles) |
| **Accent** | `#1E40AF` | `palette.accent` | Typographer's blue (highlights) |
| **Text** | `#332E27` | `palette.text` | Aged paper text color |
| **Text Muted** | `#6B6358` | `palette.text-muted` | Muted aged text |
| **Rule** | `#A89F91` | `palette.rule` | Rule/line color (warm gray) |
| **Rule Light** | `#D4CEC4` | `palette.rule-light` | Light rule color |
| **Card BG** | `#FEFCF6` | `palette.card-bg` | Card background |
| **Ornament** | `#5C4A3A` | `palette.ornament` | Ornament/decoration color |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.secondary,        // Press red
  neutral-lightest: palette.bg,      // Warm cream
  neutral-darkest: palette.primary,  // Printer's black
)
```

## Design Rules

1. **Thick-thin rule combos** everywhere -- never a single plain line
2. **Printer's ornaments** (fleurons, registration marks) as decorative punctuation
3. **Type-case grid** as persistent background atmosphere
4. **Deck-owned serif typography** with tracked uppercase labels and compact metadata
5. **Warm cream** palette -- never pure white
6. **Bookend framing** -- title and ending slides share the same visual frame

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example: "The Art of the Printed Word"

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with typography and publishing history content.
