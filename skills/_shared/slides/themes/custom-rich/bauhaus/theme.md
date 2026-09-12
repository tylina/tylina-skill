# Bauhaus Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `bauhaus-theme`
**Style**: Bold geometric design inspired by the 1920s Bauhaus school -- primary colors, asymmetric compositions, large shapes
**Primary color**: `#E63946` (Bauhaus Red)
**Best For**: Design talks, art education, architecture presentations, creative pitches
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A bold geometric theme inspired by the Bauhaus school of design. Features primary colors (red, yellow, blue) on white/off-white backgrounds with persistent Mondrian-style grid structures, Kandinsky-inspired compositions, large corner shapes, and diagonal stripe accents. Every slide feels like a Bauhaus poster -- shapes DOMINATE the visual field.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: bauhaus-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  config-info(
    title: [Form Follows Function],
    subtitle: [A Bauhaus Retrospective],
    author: [Walter Gropius],
    date: datetime.today(),
    institution: [Bauhaus School],
  ),
)

#set text(font: ("Avenir Next", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

#title-slide()
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `footer` | content/function | `none` | Footer content |

## Available Slide Types

### `#title-slide()`
Dark background with bold Bauhaus composition: large red circle (top-right), yellow triangle (bottom-left), blue square (mid-right), Kandinsky composition (top-left), diagonal stripe accent (bottom-right). Title in white with thick red bar above, subtitle in yellow.

### `#slide(title: auto)`
Standard content slide with persistent grid background, large red circle corner shape (bottom-right), small blue square accent (top-left). Header has a thick red vertical bar beside the bold title. Footer features three geometric shapes (circle, square, triangle) as separator with page counter.

### `#new-section-slide[...]`
White background with grid, large red circle (top-right), bold red vertical bar on left edge, Kandinsky composition (bottom-right). Large section number in red, bold section title, and diagonal stripe accent below. Auto-triggered by `= Heading`.

### `#focus-slide[...]`
Dark background with grid overlay, large yellow circle (left), blue square (top-right), red triangle (bottom-right). Large bold white centered text.

### `#ending-slide[...]`
Dark background bookending with title slide: same large shapes, Kandinsky composition, and diagonal stripe. Three geometric shapes as decoration above large white centered text with red bar below.

## Reusable Components

### `#form-card(title, body, shape: "circle", accent: palette.primary)`
Card with a LARGE geometric shape overlapping the top-right corner. Left accent border (4pt); titles use an accessible darker derivative of the accent hue. Shape can be "circle", "triangle", or "square".

```typst
#form-card([Design Principles], [
  Less is more. Form follows function.
], shape: "triangle", accent: palette.bauhaus-blue)
```

### `#primary-stat(label, value, accent: palette.primary)`
Number display with overlapping circle behind the number and colored bottom border (3pt). The large value uses an accessible darker derivative of the accent hue.

```typst
#primary-stat([Founded], [1919], accent: palette.bauhaus-red)
```

### `#manifesto-quote(quote, author: none)`
Quote with THICK (8pt) colored left vertical bar and diagonal stripe accent in top-right corner. Italic text with an optional attributed author in accessible dark red.

```typst
#manifesto-quote([Architecture is the will of an epoch translated into space.], author: [Mies van der Rohe])
```

### `#grid-box(title, body, accent: palette.accent)`
Sharp framed box aligned to the slide's persistent Bauhaus grid. The colored header and content surface meet without an inserted flow gap.

```typst
#grid-box([Curriculum], [
  - Foundation Course
  - Workshop Practice
  - Architecture
])
```

### `#shape-tag(content, shape: "circle", color: palette.primary)`
Tag that IS a shape: "circle" (pill-rounded), "square" (sharp corners), or "triangle" (asymmetric radius). Bold, contrast-safe text preserves the supplied hue on a transparent fill.

```typst
#shape-tag([Weimar], shape: "circle", color: palette.bauhaus-red)
#shape-tag([Dessau], shape: "square", color: palette.bauhaus-blue)
```

### `#werkstatt-divider(count: 6)`
Decorative row of alternating large circles (red), triangles (yellow), and squares (blue) at 20pt each. Centered horizontal divider.

```typst
#werkstatt-divider(count: 9)
```

### `#module-highlight(title, body, accent: palette.primary)`
Content with BOLD geometric frame (thick 3pt borders). Colored square with diamond symbol in top-left corner and a contrast-safe title derived from the accent.

```typst
#module-highlight([Key Insight], [
  The Bauhaus unified art, craft, and technology.
], accent: palette.bauhaus-yellow)
```

### `#color-block(body, color: palette.primary)`
Full-width, darkened color band with white bold text -- Bauhaus poster style with accessible contrast.

```typst
#color-block([FORM FOLLOWS FUNCTION], color: palette.bauhaus-blue)
```

## SVG Rendering Helpers

### `#kandinsky(size: 150pt)`
Renders a Kandinsky-inspired abstract composition (overlapping circles, triangles, squares with intersecting lines).

### `#grid-bg()`
Renders the full-page Mondrian-style orthogonal grid as background (varying line weights).

### `#diagonal-stripe(color: palette.primary, width: 120pt, height: 30pt)`
Renders a 45-degree parallel lines bundle (8+ lines) as decorative accent.

### `#circle-dots(color: palette.primary, size: 60pt)`
Renders a 5x5 grid of circles at varying sizes.

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#E63946` | `palette.primary` | Bauhaus red -- headers, accent bars, main branding |
| **Dark** | `#1D1D2C` | `palette.dark` | Dark backgrounds for title/section/focus slides |
| **Accent** | `#457B9D` | `palette.accent` | Steel blue -- secondary accent |
| **Background** | `#FAFAFA` | `palette.bg` | Near-white content slide background |
| **Card** | `#F0F0F0` | `palette.card` | Card surfaces |
| **Text Dark** | `#1D1D2C` | `palette.text-dark` | Headings, primary text |
| **Text Body** | `#333333` | `palette.text-body` | Body text |
| **Text Light** | `#666666` | `palette.text-light` | Accessible captions and footers |
| **Border** | `#E0E0E0` | `palette.border` | Card borders, grid lines |
| **Bauhaus Yellow** | `#F4A261` | `palette.bauhaus-yellow` | Bauhaus yellow -- triangles, subtitles |
| **Bauhaus Red** | `#E63946` | `palette.bauhaus-red` | Bauhaus red -- circles |
| **Bauhaus Blue** | `#457B9D` | `palette.bauhaus-blue` | Bauhaus blue -- squares |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: palette.dark,
)
```

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example.
