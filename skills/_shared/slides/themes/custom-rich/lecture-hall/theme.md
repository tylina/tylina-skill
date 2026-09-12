# Lecture Hall Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `lecture-hall-theme`
**Style**: Academic, modern, clean, frosted glass
**Primary color**: `#1B2D50` (Deep Navy)
**Best For**: Course lectures (30-70 pages), definition/theorem/proof structures, mathematics, STEM education
**Style Objective**: Academic
**Complexity Level**: Rich

## Description

A modern lecture hall presentation theme evoking frosted glass whiteboards on a light background. Features a persistent dot-grid pattern (like graph paper) on every content slide, deep navy text, academic blue accents, and muted gold theorem highlighting. Optimized for mathematical content with definition/theorem/proof recurring structure, complete with SVG corner marks, glass dividers, and frosted panel effects.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lecture-hall-theme.with(
  aspect-ratio: "16-9",
  footer: [MATH 425 -- Linear Algebra II],
  config-info(
    title: [Eigenvalues and Eigenvectors],
    subtitle: [Spectral Theory],
    author: [Prof. Harrington],
    date: datetime.today(),
    institution: [Department of Mathematics],
  ),
)

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

Set any presentation-specific font in `demo.typ` or `main.typ`, after the theme show rule. The theme intentionally does not own the document font.

## Available Slide Types

### `#title-slide()`
Frosted border frame with corner marks, centered title with glass divider, subtitle, author, institution, and date. Shares frosted border frame with ending slide (bookending).

### `#slide(title: auto)`
Content slide with persistent dot-grid background pattern, bold navy title with blue accent underline, and muted footer with slide counter.

### `#new-section-slide[...]`
Section divider with large gold section number, navy title, glass divider, and dot-grid background.

### `#focus-slide[...]`
Centered statement on frosted glass panel with width-constrained text and glass divider decoration.

### `#ending-slide[...]`
Closing slide with frosted border frame (bookending with title), corner marks, centered text between glass dividers.

## Reusable Components

### `#definition-block(title, body)`
Left colored border + title, no full border (borderless pattern). For mathematical definitions.
```typst
#definition-block([Eigenvalue], [A scalar $lambda$ is an eigenvalue of $A$ if...])
```

### `#theorem-box(title, body)`
Full dashed border with golden accent and SVG corner marks. For theorems and major results.
```typst
#theorem-box([Spectral Theorem], [Every symmetric matrix is diagonalizable...])
```

### `#proof-block(body)`
Italic text with "Proof." prefix and tombstone symbol, no border at all (typography-only).
```typst
#proof-block[By induction on the dimension...]
```

### `#example-panel(title, body)`
Frosted glass fill (semi-transparent blue-gray) + subtle stroke. For examples and applications.
```typst
#example-panel([Example], [Consider the matrix $A = mat(2, 1; 1, 2)$...])
```

### `#lecture-tag(content, color: palette.accent)`
Inline pill/badge element for topic categorization.
```typst
#lecture-tag([Linear Algebra], color: palette.accent)
```

### `#glass-divider(width: 70%)`
SVG-based horizontal divider with frosted line effect.
```typst
#glass-divider(width: 80%)
```

### `#corollary-note(title, body)`
Indented with left margin mark (dotted) + muted background for corollaries and remarks.
```typst
#corollary-note([Corollary], [It follows that...])
```

### `#formula-display(body)`
Centered equation box with accent top border for key formulas.
```typst
#formula-display[$ A bold(v) = lambda bold(v) $]
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Light Background** | `#F7F9FC` | `palette.bg` | Slide background |
| **Deep Navy** | `#1B2D50` | `palette.ink` | Main text |
| **Academic Blue** | `#3B6FA0` | `palette.accent` | Accent, titles, definition borders |
| **Muted Gold** | `#755B00` | `palette.gold` | Theorem highlighting, section numbers |
| **Muted Ink** | `#1B2D50` (30% transparent) | `palette.muted-ink` | Footer, subtle text |
| **Frost** | `#3B6FA0` (88% transparent) | `palette.frost` | Panel fills |
| **Frost Stroke** | `#3B6FA0` (60% transparent) | `palette.frost-stroke` | Panel strokes |
| **Panel Fill** | `#E8EDF4` (30% transparent) | `palette.panel-fill` | Example panel fill |
| **Dot Grid** | `#1B2D50` (85% transparent) | `palette.dot-grid` | Background dots |
| **Light Gold** | `#755B00` (85% transparent) | `palette.light-gold` | Theorem box fill |
| **Corollary BG** | `#F0F4F8` | `palette.corollary-bg` | Corollary note background |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.bg,
  neutral-darkest: palette.ink,
)
```

## Files

- `template.typ` -- Theme definition (colors, slides, components)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
