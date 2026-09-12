# Blueprint Theme -- API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: "IBM Plex Sans", size: 20pt)

#show: blueprint-theme.with(
  aspect-ratio: "16-9",
  footer: [PROJECT NAME],
  preset: "classic",
  config-info(
    title: [Project Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
  config-common(breakable: false),
)

#title-slide()

= Section Title    // triggers new-section-slide (blueprint blue, grid, large number)
== Slide Title     // triggers slide (light bg, blue text)

- Content here

#dark-slide(title: [Drawing Title])[
  // Blueprint blue bg, white grid, white text
  Content on blueprint background
]

#focus-slide[Key Statement]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Options | Description |
|-----------|---------|---------|-------------|
| aspect-ratio | "16-9" | "16-9", "4-3" | Slide dimensions |
| align | horizon | top, horizon | Vertical content alignment |
| footer | none | content | Left footer text |
| preset | "classic" | "classic", "dark", "invert" | Color preset |

## Presets

| Preset | Background | Ink | Best For |
|--------|-----------|-----|----------|
| classic | Blueprint blue (#1E3F66) | White | Standard blueprint look |
| dark | Navy-black (#0D1B2A) | Cyan (#4FC3F7) | Dramatic presentations |
| invert | Light (#F0F4F8) | Blue (#1E3F66) | Maximum readability |

## Slide Types

| Function | Background | Usage |
|----------|-----------|-------|
| `title-slide()` | Blueprint blue + grid + compass | Opening slide |
| `slide()` | Light (#F0F4F8) | Default content (readable) |
| `dark-slide(title:)` | Blueprint blue + grid | "Drawing" mode slides |
| `new-section-slide` | Blueprint blue + grid | Auto on `= Heading` |
| `focus-slide[...]` | Blueprint blue + grid | Key statements |
| `ending-slide[...]` | Blueprint blue + grid | Closing slide |
| `hero-slide(background-image:)` | Full-bleed image | Image backgrounds |

### dark-slide Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| title | auto | Slide title (monospace) |
| show-grid | true | Show grid background |
| header-left | none | Custom left header |
| header-right | none | Custom right header |

## Components

### spec-card(title, body)
White card with thin blue border and monospace title. For technical specifications.

```typst
#spec-card([MATERIAL DATA])[
  Density: 500 kg/m3\
  Strength: C24
]
```

### drawing-note(body, color: white)
Annotation-style callout with left border, monospace text.

```typst
#drawing-note([NOTE: All dimensions in millimeters unless noted.])
```

### revision-mark(body)
Small red-bordered annotation box for emphasis.

```typst
#revision-mark([UPDATED REV.C])
```

### dimension-line(label, width: 80pt, color: white)
Decorative measurement line with end marks.

```typst
#dimension-line(width: 100pt)[12,000 mm]
```

### title-block(project, number:, date:, scale-text:)
Architectural title block with bordered fields.

```typst
#title-block(
  [PROJECT NAME],
  number: "A-101",
  date: "2026-01-15",
  scale-text: "1:200",
)
```

### grid-stat(value, label, icon: auto, color: white, background:)
Centered technical KPI with a target icon, large white number, and monospace
label. The component keeps this icon-to-value-to-label group as one compact
stack; use it on `dark-slide`.

```typst
#grid(columns: (1fr, 1fr, 1fr),
  grid-stat([40], [kWp PV]),
  grid-stat([4.2], [GSHP COP]),
  grid-stat([92%], [MVHR EFF.]),
)
```

### blueprint-kicker(body, color: white)
Small tracked uppercase monospace label.

```typst
#blueprint-kicker([PRIMARY STRUCTURE])
```

### compass-rose(size: 100pt)
SVG compass rose decoration.

```typst
#place(top + right, compass-rose(size: 120pt))
```

## Color Access

```typst
#let pal = build-palette("classic")
// pal.bg, pal.ink, pal.grid, pal.annotation
// pal.ink-light, pal.ink-muted, pal.ink-faint, pal.ink-ghost
// pal.grid-line, pal.grid-strong
// pal.light-bg, pal.light-ink, pal.light-muted, pal.light-faint
```
