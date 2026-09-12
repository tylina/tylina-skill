# Lecture Hall Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | lecture-hall |
| **Best For** | Course lectures (30-70 pages) with definition/theorem/proof structure |
| **Style Objective** | Academic |
| **Complexity Level** | Rich |

A modern lecture hall aesthetic featuring frosted glass whiteboards on a light background. Deep navy text with academic blue accents and muted gold theorem highlighting. Persistent dot-grid pattern evokes graph paper. Optimized for mathematical content with structured definition/theorem/proof blocks.

## Design Philosophy

- **Modern Academic**: Clean light background with professional navy and blue tones
- **Frosted Glass**: Semi-transparent panels and SVG dividers create depth without clutter
- **Structured Knowledge**: Components designed for definition/theorem/proof/example patterns
- **Persistent Atmosphere**: Dot-grid background on every content slide creates cohesion
- **Bookending**: Title and ending slides share a frosted border frame element

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Light Background | `#F7F9FC` | Primary background |
| Deep Navy | `#1B2D50` | Main text, primary content color |
| Academic Blue | `#3B6FA0` | Accent, definition borders, panel strokes |
| Muted Gold | `#755B00` | Theorem highlighting, section numbers |
| Panel Fill | `#E8EDF4` | Frosted glass panel backgrounds |
| Corollary BG | `#F0F4F8` | Muted background for corollaries |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lecture-hall-theme.with(
  aspect-ratio: "16-9",
  footer: [MATH 425 -- Linear Algebra II],
  config-info(
    title: [Eigenvalues and Eigenvectors],
    subtitle: [Spectral Theory and Diagonalization],
    author: [Prof. Harrington],
    institution: [Department of Mathematics],
    date: datetime.today(),
  ),
)

```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

Typography is selected by the deck, not the theme entry point; the reference demo intentionally inherits Typst's available document default.

## Slide Functions

### `title-slide(..args)`
Cover slide with frosted border frame (bookending element), corner mark decorations, centered title with glass divider, subtitle, author, institution, and date.

### `slide(title: auto, ..args)`
Standard content slide with:
- Persistent dot-grid background pattern (like graph paper)
- Bold navy title with academic blue accent line
- Footer with muted text and slide counter

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features dot-grid background, large gold section number, navy section title, and glass divider.

### `focus-slide(body)`
Centered statement on frosted glass panel with width-constrained text and glass divider decoration below.

### `ending-slide(body)`
Closing slide with frosted border frame (bookending with title slide), corner marks, centered text framed by glass dividers above and below.

## Reusable Components

### `definition-block(title, body)`
Left colored border (3.5pt academic blue) + diamond-prefixed title, no full border. Borderless pattern for clean definitions.

### `theorem-box(title, body)`
Full dashed border with golden accent (1.5pt), light gold fill, and SVG corner marks at all four corners.

### `proof-block(body)`
Typography-only component: italic text with bold "Proof." prefix and tombstone symbol at end. No border or background.

### `example-panel(title, body)`
Frosted glass fill (semi-transparent blue-gray panel) with subtle 1pt stroke and rounded corners.

### `lecture-tag(content, color: palette.accent)`
Inline pill/badge element with transparent fill and 1pt border, fully rounded (radius: 99pt).

### `glass-divider(width: 70%)`
SVG-based horizontal divider with frosted gradient effect (fades from transparent at edges to semi-opaque at center).

### `corollary-note(title, body)`
Indented block with dotted left margin mark (2pt, muted ink) and muted background fill.

### `formula-display(body)`
Centered equation display with frost fill and 2.5pt accent top border.

## SVG Elements

### Dot-Grid Background
- 9 dots in a 60x60pt tile at varying opacities (0.12-0.40)
- Tiled across every content slide via the `setting` function
- Creates persistent graph-paper atmosphere

### Corner Marks
- Geometric L-shaped angle marks (2pt stroke, gold color)
- Used in theorem-box corners and title/ending slide frames
- 4 orientations: TL, TR, BL, BR (achieved via scale transforms)

### Glass Divider
- Horizontal gradient separator using SVG linearGradient
- Fades from transparent edges to semi-opaque center
- Double-line effect (main line + thinner echo below)

## Component Structural Diversity

| # | Component | Pattern |
|---|-----------|---------|
| 1 | `definition-block` | Left colored border + title, NO full border |
| 2 | `theorem-box` | Full dashed border + golden fill + SVG corner marks |
| 3 | `proof-block` | Typography-only: italic + "Proof." + tombstone |
| 4 | `example-panel` | Frosted glass fill + subtle stroke |
| 5 | `lecture-tag` | Inline pill/badge (rounded) |
| 6 | `glass-divider` | SVG-based horizontal separator |
| 7 | `corollary-note` | Dotted left margin + muted background |

## Best Use Cases

- Linear algebra and abstract algebra courses
- Analysis and topology lectures
- Mathematical physics presentations
- Computer science theory courses
- Any STEM course with definition/theorem/proof structure
- Long-form lecture decks (30-70 slides)

## Recommended Complexity

**Rich** -- This theme uses 3 SVG elements (dot-grid, corner marks, glass divider) and 7 structurally distinct components. The persistent dot-grid background and frosted panel effects create a cohesive modern lecture hall atmosphere.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (frosted frame, corner marks)
2. Definitions (eigenvalue, eigenspace, characteristic polynomial)
3. Properties (trace/determinant theorems, spectral properties, diagonalization)
4. Computation (QR algorithm with pseudocode, numerical methods)
5. Applications (PCA, differential equations, quantum mechanics)
6. Focus slide and ending slide

## File Structure

```
lecture-hall/
  template.typ   -- Theme definition (colors, slides, components, SVGs)
  demo.typ       -- Full demonstration presentation
```
