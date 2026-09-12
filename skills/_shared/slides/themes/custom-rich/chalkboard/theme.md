# Chalkboard Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `chalkboard-theme`
**Style**: Academic, nostalgic, hand-drawn, organic / dark theme
**Primary color**: `#FFE066` (Chalk Yellow)
**Best For**: Academic lectures, university talks, math/science presentations, STEM education
**Style Objective**: Academic
**Complexity Level**: Rich

## Description

A classic green chalkboard presentation theme that evokes the familiar academic classroom atmosphere. Features chalk-white text on a dark green board, hand-drawn SVG elements including wavy underlines, dashed borders, wooden frame decorations, and chalk dust scatter effects. Optimized for mathematical content, definitions, theorems, and structured lecture material.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: chalkboard-theme.with(
  aspect-ratio: "16-9",
  align: horizon,
  footer: [MATH 301 -- Introduction to Graph Theory],
  config-common(breakable: false),
  config-info(
    title: [Title],
    subtitle: [Subtitle],
    author: [Author],
    date: datetime.today(),
    institution: [Institution],
  ),
)
#set text(font: ("Chalkboard SE", "Noto Sans SC"))
#show raw: set text(font: "Menlo")

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default vertical alignment for content slides |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Wooden frame border with green chalkboard background, faint ruled lines, chalk dust in corners, centered chalk title with yellow underline, subtitle, author, institution, and date.

### `#slide(title: auto, align: auto, ..args)`
Green chalkboard content slide with faint ruled lines, bold chalk-white title with yellow underline, muted footer with slide counter.

### `#new-section-slide[...]`
Section divider with large yellow chalk number, white chalk title, yellow underline, chalk dust decoration, and bottom chalk divider.

### `#focus-slide[...]`
Centered chalk statement on green chalkboard with ruled lines, dashed chalk emphasis frame, and yellow accent underline.

### `#ending-slide[...]`
Closing slide with wooden frame, chalk star decoration, centered text with cyan underline, and chalk divider.

## Reusable Components

### `#chalk-card(title, body, accent: palette.ink)`
Card with dashed chalk border and colored chalk header for definitions and structured content.
```typst
#chalk-card([Definition], [A *graph* $G = (V, E)$ consists of...], accent: palette.secondary)
```

### `#chalk-stat(label, value, color: palette.accent)`
Centered colored chalk value above a muted label, with chalk dust dots for decoration.
```typst
#chalk-stat([Min edges], [$n - 1$], color: palette.secondary)
```

### `#chalk-quote(quote, author: none)`
Quote with dashed cyan left border and hand-drawn chalk quotation marks.
```typst
#chalk-quote([The birth of graph theory...], author: [Biggs, 1976])
```

### `#eraser-box(title, body)`
Smudged-appearance box for historical notes or tangential content.
```typst
#eraser-box([Historical Note], [Graph theory originated in 1736...])
```

### `#lesson-tag(content, color: palette.accent)`
Capsule-shaped dashed chalk tag for categorization.
```typst
#lesson-tag([Acyclic], color: palette.accent)
```

### `#board-section(title, body)`
Section with colored chalk title and chalk divider line separator.
```typst
#board-section([Definitions], [- *Walk*: A sequence of vertices...])
```

### `#formula-box(body, color: palette.accent)`
Centered formula display box with thick dashed chalk border.
```typst
#formula-box[*Handshaking Lemma:* $ sum_(v in V) deg(v) = 2|E| $]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Board Green** | `#2D4A3E` | `palette.bg` | Chalkboard background |
| **Chalk White** | `#F0EDE5` | `palette.ink` | Main text, chalk content |
| **Chalk Yellow** | `#FFE066` | `palette.accent` | Titles, emphasis, section numbers |
| **Chalk Cyan** | `#7FDBDA` | `palette.secondary` | Quotes, secondary accents |
| **Chalk Pink** | `#FFB4B4` | `palette.chalk-pink` | Tertiary emphasis, card borders |
| **Chalk Orange** | `#FFB366` | `palette.chalk-orange` | Dates, warm tertiary accent |
| **Wood Frame** | `#5C3D2E` | `palette.wood-frame` | Wooden frame border |
| **Dust** | `#F0EDE5` (85% transparent) | `palette.dust` | Chalk dust scatter effects |
| **Ink Muted** | `#F0EDE5` (35% transparent) | `palette.ink-muted` | Footer text, stat labels, subtle elements |
| **Grid Faint** | `#F0EDE5` (90% transparent) | `palette.grid-faint` | Ruled line background |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.ink,
  neutral-darkest: palette.bg,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
