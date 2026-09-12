# Monochrome Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `monochrome-theme`
**Style**: Swiss/International design, black-and-white minimalism
**Primary color**: `#212121` (near black)
**Best For**: Formal business, design portfolios, architecture
**Style Objective**: General Versatile
**Complexity Level**: Plain

## Description

A sophisticated black-and-white minimalist theme inspired by Swiss/International design style. Features strong typographic hierarchy, clean geometric forms, and maximum contrast. Perfect for formal business presentations, design portfolios, and architecture showcases.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: monochrome-theme.with(
  aspect-ratio: "16-9",
  footer: [Optional footer],
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)
#set text(font: ("Helvetica Neue", "Arial"), size: 20pt)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Minimalist cover with a light-weight left-aligned title, thick horizontal rule, and author info.

### `#slide(title: auto)`
Content slide with a medium-weight heading, thick underline, optional footer label, and page counter.

### `#new-section-slide[...]`
Section divider with a vertical black bar and large light-weight text (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Inverted slide: black background with white text for maximum emphasis.

### `#ending-slide[...]`
Black background with large light-weight white text for closing.

## Reusable Components

### `#mono-card(title, body)`
Card with thin black border, no fill, sharp corners (radius 0).

```typst
#mono-card[Title][Content here.]
```

### `#quote-block(body, author: none)`
Styled quote with thick left black border and italic text.

```typst
#quote-block(author: [Author Name])[Quote text here.]
```

### `#divider()`
Simple horizontal rule (thin gray line).

### Code Blocks

Fenced code blocks automatically receive a sharp-cornered light-gray panel, black rule, and monochrome syntax treatment.

### Numbered Lists (via `set enum`)

Styled with large bold dark numbers. Use standard `+` syntax:

```typst
+ First item
+ Second item
+ Third item
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Black** | `#212121` | `palette.black` | Primary text, headings, card borders |
| **Dark** | `#424242` | `palette.dark` | Subtitle text, numbered list numbers |
| **Medium** | `#616161` | `palette.medium` | Section labels, footer text, metadata |
| **Light** | `#E0E0E0` | `palette.light` | Divider lines |
| **Lighter** | `#F5F5F5` | `palette.lighter` | Light background fills |
| **White** | `#FAFAFA` | `palette.white` | Slide background |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.black,
  neutral-lightest: palette.white,
  neutral-darkest: pure-black,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)

## Demo

See `demo.typ` for a compilable example.
