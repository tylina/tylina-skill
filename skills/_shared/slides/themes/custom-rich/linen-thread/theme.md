# Linen Thread Theme -- API Reference

**Touying Version:** 0.7.4
**Category:** Custom Rich
**Style:** Handwoven textile/fabric aesthetic, light theme with indigo/terracotta/sage palette

## Installation

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *
```

## Theme Entry Point

### `linen-thread-theme`

Main theme function. Apply via `#show:` rule.

```typst
#show: linen-thread-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: [Organization],  // Footer text (left side)
  config-common(breakable: false),
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)
```

**Parameters:**
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `align` | alignment | `horizon` | Default content alignment |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `body` | content | required | Document body |

## Slide Functions

### `title-slide(..args)`

Opening slide with embroidery frame border (bookend element), woven texture background, cross-stitch corner patterns, and shuttle motifs. Displays title, subtitle, author, institution, and date from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with woven texture background, stitch accent header underline, and persistent atmospheric decorations.

```typst
== Slide Title

Content goes here.

// Or with explicit title:
#slide(title: [Custom Title])[
  Content here.
]

// Multi-column:
#cols(columns: (1fr, 1fr))[
  Left column content.
][
  Right column content.
]
```

### `new-section-slide`

Auto-generated section divider with indigo left panel, vertical terracotta thread line, shuttle motif, and stitch accent. Triggered by level-1 headings (`= Section`).

### `outline-slide(title: [Contents])`

Table of contents slide with structured outline.

```typst
#outline-slide()
#outline-slide(title: [Agenda])
```

### `focus-slide(body)`

Full-screen emphasis slide with indigo background, woven texture overlay, stitch accents at corners, shuttle motifs flanking, and centered cream text.

```typst
#focus-slide[
  Your key message here.
]
```

### `ending-slide(body)`

Closing slide with embroidery frame border (bookending with title slide), shuttle motifs, and thread divider.

```typst
#ending-slide[Thank You]
```

## Components (9 total)

### `weave-card[title][body]`

Card with crosshatch-pattern linen header strip and white body. Uses `stack(spacing: 0pt)` for adjacent colored blocks.

```typst
#weave-card([Card Title], [
  Card body content here.
])
#weave-card([Custom Accent], [Body], accent: palette.secondary)
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.primary`)

---

### `thread-box[title][body]`

Insight/highlight box with thread-pull left border accent and tinted fill.

```typst
#thread-box([Insight Title], [
  Important information here.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.secondary`)

---

### `sampler-stat[value][label]`

Metric display with embroidery-frame stitch accent above the value.

```typst
#sampler-stat([95%], [Customer\ Satisfaction])
#sampler-stat([\$4.2M], [Revenue], accent: palette.accent)
```

**Parameters:** `value` (content), `label` (content), `accent` (color, default: `palette.secondary`)

---

### `loom-quote[body][source]`

Quotation block with woven texture background, indigo left border, and decorative Unicode quote mark.

```typst
#loom-quote[
  The quoted text goes here in italic style.
][--- Attribution Name, Title]
```

**Parameters:** `body` (content), `source` (content)

---

### `stitch-tag[label]`

Small inline tag with cross-stitch border styling (rounded pill).

```typst
#stitch-tag[Ethnography]
#stitch-tag[Custom Color, color: palette.secondary]
```

**Parameters:** `label` (content), `color` (color, default: `palette.accent`)

---

### `fiber-divider(width: 60%)`

Thread-based decorative separator with pulled-thread appearance and fraying ends.

```typst
#fiber-divider()
#fiber-divider(width: 40%)
```

**Parameters:** `width` (relative, default: `60%`)

---

### `tapestry-box[title][body]`

Large feature box with all-around woven border (top and bottom accent stripes) and shuttle motif header decoration.

```typst
#tapestry-box([Feature Title], [
  Detailed content here.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.primary`)

---

### `bobbin-list(items)`

Numbered list with bobbin/spool circular indicators and vertical thread connectors.

```typst
#bobbin-list((
  [First item description.],
  [Second item description.],
  [Third item description.],
))
```

**Parameters:** `items` (array of content), `accent` (color, default: `palette.primary`)

---

### `pattern-card[title][body]`

Card with repeating weave motif header (square bullet + colored top border).

```typst
#pattern-card([Strategy Pillar], [
  Framework content with bullet points.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.accent`)

## Color Palette

Access colors via `palette.color-name`:

| Name | Hex | Usage |
|------|-----|-------|
| `cream` | `#FDFBF7` | Slide background (natural off-white) |
| `primary` | `#2C4F7C` | Indigo blue, headers, key accents |
| `secondary` | `#B85C3C` | Terracotta/rust, highlight accents |
| `accent` | `#6B8E6B` | Sage green, tertiary accents |
| `text-dark` | `#2E2B26` | Headings, titles |
| `text-body` | `#4A4540` | Body text |
| `text-muted` | `#8A8279` | Captions, metadata |
| `card` | `#FFFFFF` | Card backgrounds |
| `border` | `#E2DAD0` | Borders, dividers |
| `linen` | `#F4EFE7` | Linen fill for layering |

## SVG Decorative Elements

The theme includes these module-level SVG definitions rendered via `image(bytes(...))`:

- **Woven texture** -- full-page background with interlocking horizontal warp and vertical weft thread lines (33 paths)
- **Embroidery frame** -- rectangular border with cross-stitch corner ornaments and running-stitch edge patterns
- **Thread divider** -- horizontal pulled thread with fraying ends and stitch marks
- **Stitch accent** -- running-stitch decoration for headers (dashed line with dots)
- **Shuttle motif** -- weaving shuttle/bobbin icon with thread extensions

## Layout Patterns

### Multi-column with `cols`:
```typst
#cols(columns: (1fr, 1fr, 1fr))[
  #sampler-stat([42%], [Metric A])
][
  #sampler-stat([78%], [Metric B])
][
  #sampler-stat([93%], [Metric C])
]
```

### Lazy multi-column layouts
For `#cols(lazy-layout: true, ...)`, put exactly one stretchable card component directly in each column. `weave-card` and `pattern-card` include a terminal `#lazy-v(1fr)`; it has no effect outside a lazy layout.

## Speaker Notes

```typst
#speaker-note[Notes for the presenter, not visible on slides.]
```

## Technical Notes

- Text size set to `20pt` in theme entry (fonts set in demo.typ)
- Uses `std.align` inside slide functions to avoid shadowing
- SVG decorations use `image(bytes(svg-string), ...)` pattern
- Background atmosphere (`_bg-atmosphere`) renders on every content slide via `setting` function
- Title and ending slides share embroidery frame + shuttle motifs (bookending)
- Headers use `stack(spacing: .8em)` -- never `v()` between header elements
