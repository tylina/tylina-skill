# Reading Lamp Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `reading-lamp-theme`
**Style**: Warm, intimate, text-focused — like reading under a desk lamp
**Primary color**: `#C67A1B` (warm amber)
**Best For**: Reading groups, seminar talks, paper discussions
**Style Objective**: Academic Intimate
**Complexity Level**: Plain

## Description

A warm, intimate theme designed for reading groups and seminar talks. Warm cream background with dark brown-black text and a single warm amber accent line. The beauty lies in generous whitespace and warm typography, not decoration. Like a beautifully typeset book page.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: reading-lamp-theme.with(
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
#set text(font: ("Charter", "Iowan Old Style", "Georgia"), size: 20pt)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content-slide alignment; may be overridden per slide |
| `footer` | content/function | `none` | Optional left footer content or function |

## Available Slide Types

### `#title-slide()`
Warm minimal cover with a semibold left-aligned title, amber underline accent, and accessible author metadata.

### `#slide(title: auto, align: auto)`
Content slide with a small section label, independently sized semibold title, warm amber accent line, optional left footer, and right page counter.

### `#new-section-slide[...]`
Section divider with an amber vertical bar and medium-weight section title in a stable two-cell grid (auto-triggered by `= Heading`).

### `#focus-slide[...]`
Width-constrained centered text on cream background for key takeaways.

### `#ending-slide[...]`
Centered medium-weight text with an amber accent rule for closing.

## Reusable Components

### `#lamp-card(title, body)`
Warm card with amber left border and faint surrounding rule.

```typst
#lamp-card([Title])[Content here.]
```

For equal-height columns, use `#cols(lazy-layout: true)` with exactly one direct `lamp-card` in each column. Use ordinary `#cols` when a column contains multiple elements.

### `#margin-quote(body, author: none)`
Blockquote with amber left bar and italic text.

```typst
#margin-quote(author: [Author])[Quote text here.]
```

### `#paper-divider()`
Subtle warm horizontal rule with measured vertical inset for separating content sections.

### Numbered Lists (via `set enum`)

Styled with amber-colored numbers. Use standard `+` syntax:

```typst
+ First paper
+ Second paper
+ Third paper
```

### `#annotation(body)`
Small aside/note block with muted styling for supplementary comments.

```typst
#annotation[A side note or clarification.]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Cream** | `#FBF7F0` | `palette.cream` | Slide background |
| **Ink** | `#2C2417` | `palette.ink` | Primary text, headings |
| **Amber** | `#C67A1B` | `palette.amber` | Accent color (the lamp) |
| **Ink Light** | `#5C4A35` | `palette.ink-light` | Subtitles, card body text |
| **Ink Muted** | `#80684C` | `palette.ink-muted` | Accessible metadata, footer, annotations |
| **Rule Faint** | `#E8DFD2` | `palette.rule-faint` | Divider lines, card borders |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.amber,
  neutral-lightest: palette.cream,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` — Theme definition (copy to your project)
- `demo.typ` — Usage example (compilable)

## Demo

See `demo.typ` for a compilable example demonstrating a PEFT survey seminar talk.
