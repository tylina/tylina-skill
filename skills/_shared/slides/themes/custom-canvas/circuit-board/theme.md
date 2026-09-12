# Circuit Board Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `circuit-board-theme`
**Style**: PCB / Printed Circuit Board aesthetic -- copper traces on solder mask green
**Primary color**: `#F59E0B` (Copper Gold, default pcb preset)
**Best For**: Electronics, FPGA design, embedded systems, hardware engineering, PCB manufacturing
**Style Objective**: Technical / Hardware Engineering
**Complexity Level**: Canvas

## Description

A printed circuit board (PCB) aesthetic presentation theme with dark green solder-mask backgrounds, copper-gold trace patterns, IC chip decorations, via elements, and solder-point bullets. SVG circuit trace patterns provide the background texture. IC cards have pin marks, register boxes display data like chip registers, and LED stats show metrics with indicator dots. Ships with 3 presets (pcb, breadboard, flex).

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Heiti SC"), size: 20pt)

#show: circuit-board-theme.with(
  aspect-ratio: "16-9",
  preset: "pcb",
  footer: [FPGA DESIGN],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio |
| `preset` | string | `"pcb"` | Color preset: `"pcb"`, `"breadboard"`, `"flex"` |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#title-slide()`
IC chip-framed cover with circuit trace background, IC decoration, via elements, pin marks, MODULE kicker, and trace divider accents.

### `#slide(title: auto, align: auto)`
Standard PCB green slide with faint circuit trace background, bold title, copper accent bar, and solder-point footer.

### `#dark-slide(title: auto)`
Darker variant with LED-cyan highlights, circuit trace background, and cyan-colored title.

### `#new-section-slide[...]`
Module-numbered section divider with ghosted number, IC chip decoration, and trace divider. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`
Single message in IC package frame with pin marks on top and bottom edges.

### `#ending-slide[...]`
Circuit fading out with ghost "END" text, via decorations, and "END OF TRANSMISSION" label.

## Reusable Components

### `#ic-card(title, body, color: palette.accent)`
IC package-styled card with pin marks on left/right edges and monospace title.
```typst
#ic-card([DSP48E2 STAGE A])[Input registers: A1/A2, B1/B2...]
```

### `#led-stat(value, label, color: palette.secondary)`
Large monospace stat with LED indicator dot and tracked label.
```typst
#led-stat([500], [MHz FMAX], color: palette.secondary)
```

### `#register-box(pairs, title: none, bg-color: none, text-color: none)`
Chip register-styled data display with address/value pairs.
```typst
#register-box(title: "Config", (("0x00", "VALUE = 0xACE1"), ("0x02", "CTRL = 0x03")))
```

### `#signal-tag(body, color: palette.secondary)`
Pill-shaped signal label.
```typst
#signal-tag([VERIFIED]) #signal-tag([CLK])
```

### `#bus-layout(columns-content, color: palette.accent)`
Multi-column layout with bus trace line and connection pads.
```typst
#bus-layout(([Col 1], [Col 2], [Col 3]))
```

### `#trace-divider(color: palette.accent, width: 100%)`
Copper trace with endpoint pads.
```typst
#trace-divider(color: palette.accent, width: 80pt)
```

### `#solder-point(color: palette.accent, size: 7pt)`
Decorative PCB solder pad bullet point.
```typst
- #solder-point() *Feature name*
```

### `#circuit-kicker(body, color: palette.ink)`
Tracked uppercase monospace label.
```typst
#circuit-kicker([SPECIFICATIONS])
```

## Color Scheme

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary |
|--------|-----------|-----|--------|-----------|
| `pcb` | `#064E3B` | `#ECFDF5` | `#F59E0B` | `#22D3EE` |
| `breadboard` | `#FAFAF9` | `#1C1917` | `#DC2626` | `#2563EB` |
| `flex` | `#292524` | `#FDE68A` | `#FB923C` | `#A78BFA` |

### Derived Palette Keys

| Key | Purpose |
|-----|---------|
| `palette.bg` | Solder mask background |
| `palette.ink` | Primary text |
| `palette.accent` | Copper traces, pads, accents |
| `palette.secondary` | LED indicators, cyan highlights |
| `palette.ink-light` | 15% transparent text |
| `palette.ink-muted` | 45% transparent text |
| `palette.ink-faint` | 70% transparent text |
| `palette.ink-ghost` | 88% transparent (ghost text) |
| `palette.surface` | Card backgrounds (a preset-safe contrast surface) |
| `palette.surface-border` | Card borders (60% transparent accent) |
| `palette.dark-bg` | Darker background for dark-slide |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.ink,
  neutral-darkest: palette.bg,
)
```

## Files

- `template.typ` -- Theme definition (palette, SVGs, components, slides, entry point)
- `demo.typ` -- Compilable showcase (FPGA architecture topic)

## Demo

See `demo.typ` for a compilable example.
