# Lattice Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | lattice |
| **Best For** | Tech presentations, engineering talks, system architecture discussions, infrastructure reviews |
| **Style Objective** | Precision Engineering |
| **Complexity Level** | Rich |

A crystalline lattice / molecular structure aesthetic featuring cool white backgrounds with structured grid patterns, hexagonal motifs, and node-connection SVG decorations. The design evokes precision engineering -- structured, interconnected, modern. Think material science, crystal geometry, interconnected nodes.

## Design Philosophy

- **Structured & Precise**: Hexagonal grid patterns and geometric layouts convey engineering rigor
- **Interconnected**: Molecular node connectors and bond-style decorations emphasize systems thinking
- **Modern & Clean**: Cool white background with cobalt blue accents provides professional clarity
- **Technical Focus**: Optimized for architecture diagrams, metrics, protocol comparisons, and system documentation

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Cool White | `#F5F7FA` | Primary background (clean, structured) |
| Cobalt Blue | `#2558A6` | Primary -- titles, emphasis, main accents |
| Emerald | `#0D9488` | Accent -- secondary highlights, availability |
| Violet | `#6D55A3` | Secondary -- tertiary emphasis, contrast |
| Cool Gray | `#D1D8E3` | Border -- dividers, grid lines, subtle separators |
| Charcoal | `#1E293B` | Text -- main body text color |
| Slate | `#64748B` | Muted text -- footers, captions, labels |

## Typography

- **Theme boundary**: `lattice-theme` sets the 18pt base size and semantic text color but deliberately does not select a font family.
- **Demo base font**: Arial with Noto Sans SC as the CJK fallback.
- **Demo code font**: IBM Plex Mono. Codly and both font choices belong to `demo.typ`, so importing `template.typ` does not impose those dependencies on downstream decks.

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lattice-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | `alignment` | `horizon` | Default vertical alignment for content-slide bodies |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Cover slide with crystal facet border frame, hexagonal lattice background, centered title in cobalt blue with molecular node connector decoration, subtitle in emerald, author info, institution, and date.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with:
- Cool white background with faint hexagonal grid
- Bold cobalt blue title with node connector underline
- Three-column footer with text, centered accent dot, and slide counter

### `new-section-slide(self: none, body)`
Section divider slide (auto-triggered by `= Section Title`). Features a cool white background with hexagonal grid, left cobalt accent bar, large emerald section number, bold section title, node connector decoration, and bottom border line.

### `focus-slide(body)`
Statement slide with deep cobalt blue background, crystal facet frame overlay, centered white text, and node connector decoration below.

### `ending-slide(body)`
Closing slide with cobalt background, hexagonal grid, crystal facet frame, node connector above centered white text, and emerald accent line below.

## Reusable Components

### `node-card(title, body, accent: palette.primary)`
Card with colored left border and node-dot indicator. Ideal for structured information, protocol descriptions, and system properties.

```typst
#node-card([Consistency], [
  Every read receives the most recent write or an error.
], accent: palette.primary)
```

### `bond-stat(label, value, color: palette.primary)`
Metric card whose full vertical bond-node → value → label sequence is a single centered `stack(spacing: 0.8em, ...)`, followed by `lazy-v(1fr)` in that same stack. Use each `bond-stat` as the sole component in a `cols(lazy-layout: true)` column to equalize cards with varied label/value lengths.

```typst
#bond-stat([p99 Latency], [2.3ms], color: palette.accent)
```

### `crystal-box(title, body, accent: palette.accent)`
Highlighted content box with full accent border and tinted background for key insights, strategies, and important lists.

```typst
#crystal-box([Delivery Guarantees], [
  - *At-most-once*: fire and forget
  - *At-least-once*: retry until acknowledged
  - *Exactly-once*: idempotent consumers + deduplication
], accent: palette.secondary)
```

### `lattice-divider(color: palette.border, width: 80%)`
Horizontal separator with node dots at endpoints and center for visual section breaks.

```typst
#lattice-divider(color: palette.border, width: 70%)
```

### `atom-tag(content, color: palette.primary)`
Capsule-shaped tag with dot indicator for categorization and technology labels.

```typst
#atom-tag([Kafka], color: palette.accent)
#atom-tag([CQRS], color: palette.primary)
```

### `structure-highlight(title, body)`
Key insight box with cobalt left border and light blue background for important observations and principles.

```typst
#structure-highlight([Key Insight], [
  All consensus protocols trade latency for safety.
])
```

### `facet-grid(align: center + horizon, headers, rows)`
Bare native `table()` with a cobalt `table.header`, alternating row backgrounds through a `fill` callback, and caller-configurable cell alignment.

```typst
#facet-grid(
  ([Engine], [Write], [Read], [Use Case]),
  (
    ([LSM-Tree], [Sequential], [Merge], [Write-heavy]),
    ([B-Tree], [Random I/O], [Single seek], [Read-heavy]),
  ),
)
```

## Helper Functions

### `hex-lattice-bg()`
Renders the faint hexagonal lattice background overlay used on content slides.

### `node-connector(width: 100%)`
Renders a molecular node connector line with colored dots at intervals.

### `crystal-facet-frame()`
Renders the angular geometric border frame with node dots at vertices.

### `hex-grid-bg()`
Places the hexagonal grid as a full-size out-of-flow background element. Call it once per slide layer; its `height: 100%` is safe because the helper owns the surrounding `place()`.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.primary)[Cobalt blue text]
#text(fill: palette.accent)[Emerald text]
#text(fill: palette.secondary)[Violet text]
#text(fill: palette.text)[Main body text]
#text(fill: palette.text-muted)[Muted caption text]
```

- `palette.bg`, `palette.primary`, `palette.accent`, `palette.secondary`
- `palette.border`, `palette.text`, `palette.text-muted`
- `palette.card-bg`, `palette.primary-light`, `palette.accent-light`, `palette.secondary-light`
- `palette.grid-faint`

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` | Theme accent (cobalt), `alert()` text |
| `neutral-lightest` | `palette.card-bg` | Light backgrounds (white cards) |
| `neutral-darkest` | `palette.text` | Dark text (charcoal) |

## Best Use Cases

- Distributed systems architecture presentations
- Infrastructure and platform engineering talks
- Technical design reviews and RFCs
- DevOps and SRE operational reviews
- System performance and metrics presentations
- Technology strategy and roadmap decks
- Engineering summit keynotes

## Recommended Complexity

**Rich** -- This theme uses multiple SVG decorations (hexagonal lattice grids, crystal facet borders, molecular node connectors) and structured component layouts. Use `node-card`, `crystal-box`, and `facet-grid` for structured technical content that maintains the crystalline lattice metaphor.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (crystal facet frame, lattice background)
2. Foundations (CAP theorem, consensus protocols)
3. Architecture Patterns (event-driven, service mesh)
4. Data Infrastructure (storage engines, replication)
5. Observability (three pillars, incident response)
6. Production Lessons (failure modes, scaling strategies)
7. Focus slide and ending slide

## File Structure

```
lattice/
  template.typ         -- Theme definition (colors, slides, components)
  demo.typ             -- Full demonstration presentation
  theme_design_spec.md -- Detailed design specification
  theme.md             -- Quick reference documentation
```
