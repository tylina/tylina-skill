# Canvas Weave Theme — API Reference

**Touying Version:** 0.7.4
**Category:** Custom Rich
**Style:** Artisanal business, light theme with warm earth tones

## Installation

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *
```

## Theme Entry Point

### `canvas-weave-theme`

Main theme function. Apply via `#show:` rule.

```typst
#show: canvas-weave-theme.with(
  aspect-ratio: "16-9",    // "16-9" or "4-3"
  footer: [Company Name],  // Footer text (left side)
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

Opening slide with loom frame border, woven corner threads, and knot motifs. Displays title, subtitle, author, institution, and date from `config-info`.

```typst
#title-slide()
```

### `slide(title: auto, align: auto, ..args)`

Standard content slide with crosshatch weave texture background, golden thread header accent, and thread corner decorations.

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

Auto-generated section divider with taupe left panel, vertical golden thread line, and knot motif. Triggered by level-1 headings (`= Section`).

### `outline-slide(title: [Contents])`

Table of contents slide with structured outline.

```typst
#outline-slide()
#outline-slide(title: [Agenda])
```

### `focus-slide(body)`

Full-screen emphasis slide with taupe background, crosshatch texture overlay, and centered white text.

```typst
#focus-slide[
  Your key message here.
]
```

### `ending-slide(body)`

Closing slide with loom frame border (bookending with title slide), woven corner threads, and knot motif decorations.

```typst
#ending-slide[Thank You]
```

## Components (11 total)

### `woven-card[title][body]`

Card with woven-pattern fill header strip and white body. Uses `stack(spacing: 0pt)` for adjacent colored blocks.

```typst
#woven-card([Card Title], [
  Card body content here.
])
#woven-card([Custom Accent], [Body], accent: palette.secondary)
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.primary`)

---

### `thread-box[title][body]`

Left-bordered callout box with golden thread accent and warm fill.

```typst
#thread-box([Insight Title], [
  Important information here.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.secondary`)

---

### `loom-divider(width: 60%)`

SVG woven pattern horizontal divider.

```typst
#loom-divider()
#loom-divider(width: 40%)
```

**Parameters:** `width` (relative, default: `60%`)

---

### `fiber-tag[label]`

Small inline tag/pill with fabric swatch icon.

```typst
#fiber-tag[Sustainability]
#fiber-tag[Custom Color, color: palette.secondary]
```

**Parameters:** `label` (content), `color` (color, default: `palette.tertiary`)

---

### `metric-card[value][label]`

KPI/statistic card with woven knot SVG decoration above the value.

```typst
#metric-card([95%], [Customer\ Satisfaction])
#metric-card([\$4.2M], [Revenue], accent: palette.tertiary)
```

**Parameters:** `value` (content), `label` (content), `accent` (color, default: `palette.secondary`)

---

### `framework-card[title][body]`

Strategic framework container with colored top border and square bullet.

```typst
#framework-card([Strategy Pillar], [
  Framework content with bullet points.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.tertiary`)

---

### `insight-box[title][body]`

Callout with double left border pattern (woven side effect).

```typst
#insight-box([Key Finding], [
  Research insight content.
])
```

**Parameters:** `title` (content), `body` (content), `accent` (color, default: `palette.tertiary`)

---

### `comparison-table(headers, rows)`

Business data table with woven header accent and alternating row fills.

```typst
#comparison-table(
  ([Column A], [Column B], [Column C]),
  (
    ([Row 1A], [Row 1B], [Row 1C]),
    ([Row 2A], [Row 2B], [Row 2C]),
  ),
)
```

**Parameters:** `headers` (array of content), `rows` (array of arrays of content)

---

### `timeline-card[period][body]`

Timeline entry with circular thread marker and vertical connector line.

```typst
#timeline-card([Q1], [First quarter activities and milestones.])
#timeline-card([Q2], [Second quarter plans.], accent: palette.tertiary)
```

**Parameters:** `period` (content), `body` (content), `accent` (color, default: `palette.primary`)

---

### `quote-weave[body][source]`

Quotation block with decorative quote mark and woven side accent.

```typst
#quote-weave[
  The quoted text goes here in italic style.
][--- Attribution Name, Title]
```

**Parameters:** `body` (content), `source` (content)

---

### `swatch-note[body]`

Borderless inline note with fabric swatch icon. No fill, no border — purely typographic with icon accent.

```typst
#swatch-note[A contextual note with fabric swatch decoration.]
```

**Parameters:** `body` (content)

## Color Palette

Access colors via `palette.color-name`:

| Name | Hex | Usage |
|------|-----|-------|
| `canvas-white` | `#FBF9F5` | Slide background |
| `primary` | `#6B5B4E` | Warm taupe/brown, headers |
| `secondary` | `#A0784C` | Golden thread, accents |
| `tertiary` | `#5B7B6B` | Forest weave green |
| `text-dark` | `#2D2922` | Headings, titles |
| `text-body` | `#4A443B` | Body text |
| `text-muted` | `#726860` | Captions, metadata |
| `card` | `#FFFFFF` | Card backgrounds |
| `border` | `#DDD5C8` | Borders, dividers |
| `weave` | `#F2EDE5` | Canvas fill, headers |

## SVG Decorative Elements

The theme includes these module-level SVG definitions rendered via `image(bytes(...))`:

- **Crosshatch weave** — full-page background texture (warp + weft threads)
- **Thread corner** — flowing fiber lines for corner decorations
- **Loom frame** — rectangular border with corner joints (title/ending)
- **Knot motif** — decorative interlocking knot for accents
- **Loom divider** — horizontal woven separator line
- **Swatch icon** — small grid fabric swatch

## Layout Patterns

### Multi-column with `composer`:
```typst
#cols(columns: (1fr, 1fr, 1fr))[
  #metric-card([42%], [Metric A])
][
  #metric-card([78%], [Metric B])
][
  #metric-card([93%], [Metric C])
]
```

### Multi-column with `cols`:
```typst
#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #woven-card([Left], [Content])
][
  #woven-card([Right], [Content])
]
```

### Height equalization:
All card components use `#lazy-v(1fr)` internally for automatic height equalization when placed in multi-column layouts.

## Speaker Notes

```typst
#speaker-note[Notes for the presenter, not visible on slides.]
```

## Technical Notes

- Text size set to `20pt` in theme entry (fonts set in demo.typ)
- Uses `std.align` inside slide functions to avoid shadowing
- No `height: 100%` in flow containers — uses `lazy-v(1fr)` instead
- SVG decorations use `image(bytes(svg-string), ...)` pattern
- Background atmosphere (`_bg-atmosphere`) renders on every content slide
- Title and ending slides share loom frame + woven corners (bookending)
