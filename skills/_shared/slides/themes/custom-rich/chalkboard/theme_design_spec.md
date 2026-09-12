# Chalkboard Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | chalkboard |
| **Best For** | Academic lectures, university talks, math/science presentations, STEM education |
| **Style Objective** | Academic |
| **Complexity Level** | Rich |

A classic green chalkboard / blackboard academic aesthetic featuring chalk-white text on a dark green background. Includes hand-drawn style SVG elements such as chalk strokes, dashed borders, wooden frame decorations, and chalk dust effects. Evokes the familiar classroom atmosphere of traditional academic instruction.

## Design Philosophy

- **Nostalgic & Authentic**: Dark green chalkboard background with chalk-white text mimics the traditional classroom experience
- **Hand-Drawn Aesthetic**: SVG elements simulate imperfect chalk strokes, wavy underlines, and dashed borders for an organic feel
- **Academic Focus**: Optimized for mathematical formulas, definitions, and structured knowledge presentation
- **Warm Educational Tone**: Chalk colors (yellow, cyan, pink, orange) provide clear visual hierarchy while maintaining the chalkboard metaphor

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Board Green | `#2D4A3E` | Primary background (chalkboard surface) |
| Chalk White | `#F0EDE5` | Main text (chalk ink), primary content color |
| Chalk Yellow | `#FFE066` | Accent — titles, emphasis, section numbers |
| Chalk Cyan | `#7FDBDA` | Secondary — quotes, connectivity topics |
| Chalk Pink | `#FFB4B4` | Tertiary — cards, directed graphs, emphasis |
| Chalk Orange | `#FFB366` | Warm tertiary — dates, weighted topics |
| Wood Frame | `#5C3D2E` | Wooden frame border decoration |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: chalkboard-theme.with(
  aspect-ratio: "16-9",
  align: horizon,
  footer: [Your Footer Text],
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
#set text(font: ("Chalkboard SE", "Noto Sans SC"))
#show raw: set text(font: "Menlo")
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical alignment for content slides |
| `footer` | `content/function` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with wooden frame border, green chalkboard background, faint ruled lines, chalk dust effects in corners, and centered chalk-written title with yellow accent underline. Displays title, subtitle, author, institution, and date.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with:
- Green chalkboard background with faint ruled lines
- Bold chalk-white title with yellow chalk underline
- Footer with muted ink text, chalk dot separator, and slide counter

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features a green chalkboard background with faint ruled lines, large yellow chalk section number, white chalk section title, chalk underline, chalk dust decoration, and a chalk divider at the bottom.

### `focus-slide(body)`
Single centered chalk statement on green chalkboard with ruled lines, a dashed chalk border frame for emphasis, and a yellow accent underline below the text.

### `ending-slide(body)`
Closing slide with wooden frame border, green chalkboard, ruled lines, chalk dust scattered, a chalk star decoration above the text, cyan accent underline, and a chalk divider below.

## Reusable Components

### `chalk-card(title, body, accent: palette.ink)`
Card with dashed chalk border and colored chalk header. Ideal for definitions, key properties, and structured information blocks.

```typst
#chalk-card([Definition], [
  A *graph* $G = (V, E)$ consists of a set $V$ of vertices and a set $E$ of edges.
], accent: palette.secondary)
```

### `chalk-stat(label, value, color: palette.accent)`
Centered colored chalk value above a muted label, with chalk-dust dots for decoration. Used for displaying key statistics or mathematical values.

```typst
#chalk-stat([Min edges (connected)], [$n - 1$], color: palette.secondary)
```

### `chalk-quote(quote, author: none)`
Quote block with a dashed left border in cyan, large hand-drawn chalk quotation marks, and optional author attribution in yellow.

```typst
#chalk-quote(
  [The solution of the Konigsberg bridge problem is the birth of graph theory.],
  author: [Biggs, Lloyd & Wilson, 1976]
)
```

### `eraser-box(title, body)`
Content box with a slightly "smudged" appearance (lower opacity background) for historical notes or tangential content.

```typst
#eraser-box([Historical Note], [
  Graph theory originated in 1736 when Leonhard Euler solved the Konigsberg Bridge Problem.
])
```

### `lesson-tag(content, color: palette.accent)`
Small capsule-shaped tag with dashed chalk-circle border for categorization and labeling.

```typst
#lesson-tag([Acyclic], color: palette.accent)
#lesson-tag([Connected], color: palette.secondary)
```

### `board-section(title, body)`
Divided area with colored chalk title and hand-drawn chalk divider line separating content sections on a single slide.

```typst
#board-section([Definitions], [
  - *Walk*: A sequence of vertices where consecutive vertices are adjacent
  - *Path*: A walk with no repeated vertices
])
```

### `formula-box(body, color: palette.accent)`
Display box for equations and key formulas with thick dashed chalk border emphasis and centered content.

```typst
#formula-box[
  *Handshaking Lemma:* $ sum_(v in V) deg(v) = 2|E| $
]
```

## Helper Functions

### `chalk-underline(color: palette.ink, width: 100%)`
Renders a wavy imperfect SVG chalk underline.

### `chalk-divider(color: palette.ink, width: 60%)`
Renders an irregular horizontal chalk divider line.

### `chalk-star(color: palette.accent)`
Renders a hand-drawn chalk star decoration.

### `chalk-quote-mark(color: palette.ink)`
Renders hand-drawn chalk quotation marks.

### `wood-frame()`
Renders the wooden frame border overlay (used in title and ending slides).

### `ruled-lines-bg(line-count: 12)`
Renders faint dashed horizontal ruled lines across the slide background.

### `chalk-dust(count: 8, color: palette.dust)`
Renders scattered chalk dust dots as decorative accents.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Chalk white text]
#text(fill: palette.accent)[Yellow chalk text]
#text(fill: palette.secondary)[Cyan chalk text]
#text(fill: palette.chalk-pink)[Pink chalk text]
#text(fill: palette.chalk-orange)[Orange chalk text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.secondary`
- `palette.chalk-pink`, `palette.chalk-orange`, `palette.wood-frame`
- `palette.dust`, `palette.ink-muted`, `palette.grid-faint`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (yellow), `alert()` text |
| `neutral-lightest` | `palette.ink` | Light text (chalk white) |
| `neutral-darkest` | `palette.bg` | Dark backgrounds (board green) |

## Best Use Cases

- Mathematics lectures and proofs
- Computer science and algorithm presentations
- Physics and engineering courses
- University classroom-style talks
- STEM education and tutoring
- Academic conferences with formal content

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (chalk strokes, wood frames, dust effects) and hand-drawn aesthetics. Use `chalk-card`, `formula-box`, and `board-section` for structured content that maintains the chalkboard metaphor.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (wooden frame, chalk title)
2. Foundations (definitions, graph types, handshaking lemma)
3. Paths & Connectivity (Euler's theorem, bridges)
4. Trees (fundamentals, spanning trees, Cayley's formula)
5. Graph Coloring (chromatic number, four color theorem)
6. Real-World Applications (social networks, complexity)
7. Focus slide and ending slide

## File Structure

```
chalkboard/
  template.typ   -- Theme definition (colors, slides, components)
  demo.typ       -- Full demonstration presentation
```
