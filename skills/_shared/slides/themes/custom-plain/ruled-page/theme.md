# Ruled-Page Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `ruled-page-theme`
**Style**: Minimalist notebook-page design with warm off-white and terracotta accent
**Primary color**: `#C75C2A` (terracotta)
**Best For**: Academic lab meetings, paper readings, research presentations
**Style Objective**: Academic Minimalism
**Complexity Level**: Plain

## Description

A minimalist notebook-page theme evoking the clarity of a freshly opened ruled notebook. Warm off-white paper background, pencil-gray text, and a single terracotta accent used sparingly. Designed for academic settings where content clarity is paramount — lab meetings, paper reading groups, and research presentations.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: ruled-page-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Optional left footer content; accepts content or `self => content` |

## Available Slide Types

### `#title-slide()`
Clean cover with left-aligned title, short terracotta rule, and author info on warm paper background.

### `#slide(title: auto)`
Content slide with section label, medium-weight heading, and terracotta underline. Optional footer content appears at left and the page counter at right.

### `#new-section-slide[...]`
Section divider with short terracotta rule above large semibold text (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Width-constrained bold text centered on paper background for key insights.

### `#ending-slide[...]`
Large semibold text centered beneath a short terracotta rule for a restrained closing bookend.

## Reusable Components

### `#ruled-card(title, body)`
Card with terracotta left border and opaque warm-paper fill. For grouping key concepts. Use one card per column with `#cols(lazy-layout: true)` when equal heights are desired.

```typst
#ruled-card([Title])[Content here.]
```

### `#margin-note(body)`
Italic aside with gray left border. For commentary and supplementary notes.

```typst
#margin-note[This is an aside or commentary.]
```

### `#divider()`
Faint horizontal rule mimicking notebook ruled lines.

### Numbered Lists (via `set enum`)

Styled with large terracotta-colored numbers. Use standard `+` syntax:

```typst
+ First item
+ Second item
+ Third item
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Paper** | `#FFFEF9` | `palette.paper` | Slide background (warm off-white) |
| **Text** | `#4B4B4B` | `palette.text` | Body text (pencil gray) |
| **Dark** | `#333333` | `palette.dark` | Titles, headings |
| **Muted** | `#707070` | `palette.muted` | Metadata, footers, section labels; 4.90:1 contrast on paper |
| **Rule Line** | `#E8E4DF` | `palette.rule-line` | Divider lines |
| **Accent** | `#C75C2A` | `palette.accent` | Terracotta — emphasis rules, card borders, numbers |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.paper,
  neutral-darkest: palette.dark,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)

## Demo

See `demo.typ` for a compilable example featuring an "Attention Is All You Need" paper reading presentation with math formulas, citations, and multiple layout patterns.
