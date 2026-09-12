# Circuit Board Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | circuit-board |
| **Best For** | Electronics, FPGA design, embedded systems, hardware engineering, PCB manufacturing |
| **Style Objective** | Technical / Hardware Engineering |
| **Complexity Level** | Canvas |

A printed circuit board (PCB) aesthetic presentation theme with dark green solder-mask backgrounds, copper-gold trace patterns, IC chip decorations, via elements, and solder-point bullets. Features SVG circuit trace patterns, pin marks, and LED indicators. Ships with 3 presets (pcb, breadboard, flex).

## Design Philosophy

- **PCB Visual Language**: Circuit traces, vias, solder pads, and IC packages form the decorative vocabulary
- **Copper-on-Green**: Classic PCB color scheme with green solder mask and gold copper traces
- **Hardware Data Displays**: Register boxes, LED stats, and signal tags present information like hardware datasheets
- **Modular Architecture**: IC cards with pin marks, bus layouts with connection pads, and trace dividers connect content blocks

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| PCB Green (pcb bg) | `#064E3B` | Primary background (solder mask) |
| Mint White (pcb ink) | `#ECFDF5` | Primary text |
| Copper Gold (pcb accent) | `#F59E0B` | Traces, pads, accent elements |
| LED Cyan (pcb secondary) | `#22D3EE` | LED indicators, dark-slide highlights |
| Breadboard White (breadboard bg) | `#FAFAF9` | Breadboard preset background |
| Breadboard Red (breadboard accent) | `#DC2626` | Breadboard preset accent |
| Flex Dark (flex bg) | `#292524` | Flex preset background |
| Flex Amber (flex ink) | `#FDE68A` | Flex preset text |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

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
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"pcb"` | Color preset: `"pcb"`, `"breadboard"`, `"flex"` |
| `footer` | `content/function` | `none` | Footer content or function |
| `align` | `alignment` | `horizon` | Default content alignment |

## Slide Functions

### `title-slide(..args)`
Large IC chip frame containing the title. Features circuit trace background, IC chip decoration (top-right), via decorations, IC frame border with pin marks on the left edge, MODULE kicker label, trace divider accents, and bottom copper trace line.

### `slide(title: auto, align: auto, ..args)`
Standard dark green PCB slide with faint circuit trace pattern background, via decorations in corners, metadata header with page counter, bold title with copper accent bar below, and solder-point footer separator.

### `dark-slide(title: auto, ..args)`
Even darker PCB variant with LED-cyan highlights. Circuit trace background, cyan-colored title and accent bar, secondary-muted header/footer text. Uses `dark-bg` (PCB green darkened 40%).

### `new-section-slide(self: none, body)`
Section as "module" number. Features circuit background, large ghosted module number (top-right, 130pt, 80% transparent), IC chip decoration (bottom-right), MODULE kicker with section number, trace divider underline, and PCB REV.A footer label. Auto-triggered by `= Section Title`.

### `focus-slide(body)`
Single message in IC package frame. Full PCB green background with circuit traces, centered 96%x94% IC package frame border with pin marks on top and bottom edges (6 pins each), and large bold centered text.

### `ending-slide(body)`
Circuit board fading out. Features faded circuit pattern, ghost "END" text (100pt, 90% transparent), scattered via decorations, "END OF TRANSMISSION" kicker label, trace dividers, and "CIRCUIT BOARD" meta label.

## Reusable Components

### `ic-card(title, body, color: palette.accent)`
Card styled as IC package with pin marks along left and right edges (4 pins each), pin-1 indicator circle, monospace tracked uppercase title header, and body content.

```typst
#ic-card([DSP48E2 STAGE A])[
  *Input registers:*\
  A1/A2 cascade pipeline\
  B1/B2 cascade pipeline
]
```

### `led-stat(value, label, color: palette.secondary)`
Large monospace stat number with LED indicator dot (colored circle). Tracked uppercase label below.

```typst
#led-stat([500], [MHz FMAX], color: palette.secondary)
```

### `register-box(pairs, title: none, bg-color: none, text-color: none)`
Monospace data display styled like a chip register. Pairs of address/value entries with optional title header.

```typst
#register-box(
  title: "LUT Configuration",
  (
    ("0x00", "LUT_INIT[15:0]  = 0xACE1"),
    ("0x02", "LUT_INIT[31:16] = 0x7F3B"),
  ),
)
```

### `signal-tag(body, color: palette.secondary)`
Small pill-shaped signal label with colored fill and border. Monospace bold uppercase text.

```typst
#signal-tag([VERIFIED]) #signal-tag([CLK]) #signal-tag([RST])
```

### `bus-layout(columns-content, color: palette.accent)`
Multi-column layout with a bus trace line above its columns, separated by a calibrated `.8em` stack gap. Connection pads sit at left, right, and center of the bus; the child regions are an ordinary `cols` row and do not opt into lazy equalization.

```typst
#bus-layout((
  [Column 1 content],
  [Column 2 content],
  [Column 3 content],
))
```

### `trace-divider(color: palette.accent, width: 100%)`
Horizontal copper trace line with connection pads (filled circles) at both endpoints.

```typst
#trace-divider(color: palette.accent, width: 100%)
```

### `solder-point(color: palette.accent, size: 7pt)`
Decorative bullet point styled as a PCB solder pad (filled circle with concentric ring).

```typst
- #solder-point() *Feature description*
```

### `circuit-kicker(body, color: palette.ink)`
Small tracked uppercase monospace label for section labeling.

```typst
#circuit-kicker([FILTER SPECIFICATIONS])
```

## Helper Functions

### `circuit-trace-pattern(width, height)`
Renders the full circuit trace SVG pattern.

### `ic-chip-decoration(size: 80pt)`
Renders an 8-pin DIP IC chip package SVG decoration.

### `via-element(size: 30pt)`
Renders a via/pad concentric circles SVG element.

### `circuit-background(color, opacity)`
Places the full circuit trace background with additional via decorations in corners.

## Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `pcb` | `#064E3B` | `#ECFDF5` | `#F59E0B` | `#22D3EE` | Classic PCB, FPGA, hardware |
| `breadboard` | `#FAFAF9` | `#1C1917` | `#DC2626` | `#2563EB` | Prototyping, education |
| `flex` | `#292524` | `#FDE68A` | `#FB923C` | `#A78BFA` | Flex PCB, wearables |

## Demo

See `demo.typ` for a complete demonstration covering FPGA architecture, signal processing, memory subsystems, and high-speed I/O.

## File Structure

```
circuit-board/
  template.typ   -- Theme definition (palette, SVGs, components, slides)
  demo.typ       -- Full demonstration presentation
```
