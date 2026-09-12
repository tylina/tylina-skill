# Copper Circuit Theme -- API Reference

**Theme**: copper-circuit
**Touying Version**: 0.7.4
**Style**: Engineering Elegance / PCB Art
**Best For**: Engineering presentations, hardware product launches, IoT demos, electronics courses, maker presentations

---

## Setup

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "Arial", size: 20pt)

#show: copper-circuit-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Conference Name -- Track],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle Text],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)
```

---

## Theme Entry Point

### `copper-circuit-theme`

```typst
#let copper-circuit-theme(
  aspect-ratio: "16-9",
  footer: none,
  ..args,
  body,
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer content displayed on content slides |
| `..args` | any | -- | Additional Touying config arguments |

---

## Color Palette

Access via `palette.<name>`:

| Name | Hex | Role |
|------|-----|------|
| `substrate` | `#FDF8F0` | Main background (PCB cream) |
| `copper` | `#C87941` | Primary accent (copper trace) |
| `solder` | `#A8B5A0` | Secondary accent (solder mask green) |
| `gold-pin` | `#D4A843` | Tertiary accent (gold plating) |
| `dark-text` | `#2A2420` | Heading text |
| `body-text` | `#4D4540` | Body copy |
| `card-bg` | `#FFFEF9` | Card backgrounds |
| `pad-fill` | `#F5F0E5` | Subtle fills (component area) |
| `border` | `#E0D5C5` | PCB edge borders |
| `via` | `#7B6B5A` | Via/connector marks |

---

## Slide Functions

### `title-slide`

Full PCB board frame with mounting holes, circuit traces connecting to title, and component outlines.

```typst
#title-slide()
```

Uses info from `config-info(...)`. No parameters needed.

---

### `slide`

Standard content slide with substrate background, copper trace header accent, via pattern atmosphere, and corner solder pads.

```typst
#slide(title: auto)[
  Content here...
]
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content/none | `auto` | Slide title (`auto` uses heading) |

Supports multi-column layout:
```typst
#slide[Left column][Right column]
```

---

### `new-section-slide`

Automatically generated when using `= Section Title`. Left panel styled as PCB edge connector with section number in solder pad.

---

### `outline-slide`

Clean table of contents with via bullet markers.

```typst
#outline-slide(title: [Outline])
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `[Outline]` | Title text for the outline slide |

---

### `focus-slide`

Copper background with cream text and circuit trace border. For emphasis quotes or key messages.

```typst
#focus-slide[
  _"Important quote or key message here."_
]
```

---

### `ending-slide`

Bookend with PCB frame, traces, and component outlines. Mirrors title slide aesthetics.

```typst
#ending-slide[Thank You]
```

---

## Components

### `ic-card(title, body, accent)`

Card styled like an IC chip with pins on left/right edges.

```typst
#ic-card([Title], [Body content], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.copper` | Pin and accent color |

---

### `trace-box(title, body, accent)`

Left-bordered callout with copper trace styling.

```typst
#trace-box([Title], [Body content], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Box title |
| `body` | content | required | Box body |
| `accent` | color | `palette.copper` | Left border and trace color |

---

### `pad-stat(value, label, accent)`

KPI metric displayed in a circular solder pad shape.

```typst
#pad-stat([99.7%], [Yield Rate], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `value` | content | required | Large metric value |
| `label` | content | required | Description label (uppercased) |
| `accent` | color | `palette.copper` | Pad and value color |

---

### `signal-quote(quote-text, author, accent)`

Quote with oscilloscope-wave left border.

```typst
#signal-quote(
  [Quote text here...],
  [Author Name],
  accent: palette.copper,
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `quote-text` | content | required | The quotation |
| `author` | content/none | required | Attribution |
| `accent` | color | `palette.copper` | Border accent color |

---

### `component-card(title, body, accent)`

Card with component outline (resistor symbol) header.

```typst
#component-card([Title], [Body content], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.copper` | Header accent color |

---

### `solder-tag(content, color)`

Small tag shaped like a rounded solder pad.

```typst
#solder-tag([TAG TEXT], color: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `content` | content | required | Tag text |
| `color` | color | `palette.copper` | Tag color |

---

### `bus-entry(step, title, body, accent)`

Timeline entry with data bus lines as connector.

```typst
#bus-entry([1], [Step Title], [Description], accent: palette.copper)
```

For an equalized process row, place exactly one `bus-entry` in each
`cols(lazy-layout: true)` column. Treat a second process row as a separate
semantic group; do not bundle multiple entries into one lazy column.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `step` | content | required | Step number |
| `title` | content | required | Entry title |
| `body` | content | required | Entry description |
| `accent` | color | `palette.copper` | Connector accent color |

---

### `datasheet-table(headers, rows)`

Technical table with PCB-green header and alternating substrate rows.

```typst
#datasheet-table(
  ([Col 1], [Col 2], [Col 3]),
  (
    ([A], [B], [C]),
    ([D], [E], [F]),
  ),
)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `headers` | array | required | Array of header content |
| `rows` | array | required | Array of row arrays |

---

### `trace-divider(width)`

SVG separator mimicking copper trace with vias.

```typst
#trace-divider(width: 80%)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | length/ratio | `70%` | Divider width |

---

### `module-card(title, body, accent)`

Card with PCB module outline (rectangular with corner notches).

```typst
#module-card([Title], [Body content], accent: palette.copper)
```

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | required | Card title |
| `body` | content | required | Card body |
| `accent` | color | `palette.copper` | Corner notch and accent color |

---

## SVG Helpers

These render the decorative SVG assets directly:

| Function | Description |
|----------|-------------|
| `circuit-trace-bg()` | Full-page copper trace overlay |
| `via-pattern-bg()` | Full-page via hole pattern |
| `solder-pads-corner(width)` | Corner solder pad decoration |
| `component-outline(width)` | IC/DIP package silhouette |
| `pcb-frame()` | Board outline with mounting holes |
| `pcb-title-traces()` | Decorative copper traces for title areas |
| `edge-connector()` | Edge connector panel for section slides |
| `trace-divider(width)` | Inline copper trace separator |

---

## Layout Patterns

### Multi-column with `cols`

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  ic-card([Left], [Content]),
  ic-card([Right], [Content]),
)
```

### Two-column slide

```typst
#slide[
  Left column content...
][
  Right column content...
]
```

### Stat row (4-up)

```typst
#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  pad-stat([Value 1], [Label 1]),
  pad-stat([Value 2], [Label 2]),
  pad-stat([Value 3], [Label 3]),
  pad-stat([Value 4], [Label 4]),
)
```

### Tag row

```typst
#stack(dir: ltr, spacing: 0.5em,
  solder-tag([TAG-1], color: palette.copper),
  solder-tag([TAG-2], color: palette.solder),
  solder-tag([TAG-3], color: palette.gold-pin),
)
```
