# Carbon Console

**Tier**: RICH
**Category**: Technology / Engineering
**Touying Version**: 0.7.4

## Description

A premium dark terminal aesthetic theme designed for tech talks and internal engineering presentations. Deep charcoal background with phosphor green and amber accents creates the feeling of being inside a high-end server rack. Circuit trace SVG patterns provide subtle atmospheric depth, while server-panel frame borders on bookend slides reinforce the hardware engineering aesthetic.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: carbon-console-theme.with(
  aspect-ratio: "16-9",
  footer: [Platform Engineering],
  config-common(breakable: false),
  config-info(
    title: [System Review],
    subtitle: [Performance and reliability],
    author: [Engineering Team],
  ),
)

// The theme entry is font-agnostic; choose an installed body stack here.
#set text(font: ("IBM Plex Sans", "PingFang SC"))

#title-slide()
#speaker-note[Open with the system objective and the decision under review.]

= Architecture
#speaker-note[Introduce the architecture section.]

== Service Health
#cols(columns: (1fr, 1fr), lazy-layout: true,
  circuit-stat([P99 Latency], [1.8ms]),
  circuit-stat([Uptime], [99.99%]),
)
#speaker-note[Explain the two production health indicators.]

#ending-slide[Questions?]
#speaker-note[Invite questions.]
```

## Theme Parameters

| Parameter | Default | Purpose |
|-----------|---------|---------|
| `aspect-ratio` | `"16-9"` | Touying presentation paper ratio |
| `align` | `horizon` | Default vertical alignment for content slides |
| `footer` | `none` | Left footer content on standard slides |
| `..args` | — | Additional Touying configuration such as `config-info(...)` |

## Color Palette

| Role | Hex | Description |
|------|-----|-------------|
| Background | `#1A1B26` | Deep charcoal |
| Text | `#C9D1D9` | Soft white |
| Primary | `#3FB950` | Phosphor green |
| Secondary | `#D29922` | Amber warning |
| Error | `#F85149` | Alert red |
| Error text | `#FF7B72` | Text-safe red for small labels on tinted surfaces |
| Card BG | `#21222C` | Elevated surface |
| Border | `#30363D` | Subtle dividers |
| Muted | `#8B949E` | Secondary text |

## Components

1. `console-card(title, body, accent: palette.green)` — Dark card with a 3pt terminal-style top edge
2. `circuit-stat(label, value, color: palette.green)` — Centered circuit icon → value → label metric card
3. `stdout-block(body)` — Monospace content area with a `$>` prefix and no visible border
4. `wire-divider(color: palette.green, width: 80%)` — SVG circuit trace with bends and nodes
5. `status-tag(label, status: "healthy")` — Inline pill; status may be `"healthy"`, `"warning"`, or `"error"`
6. `rack-panel(title)` — Full-width rack-label section header
7. `perf-bar(label, value, max: 100, color: palette.green)` — Proportional performance bar with label and value

For height-equalized rows, pass exactly one `console-card` or `circuit-stat` per column to `cols(lazy-layout: true)`. Use ordinary `cols` when a column contains multiple components.

## Slide Types

- `title-slide` — Server panel frame, centered title with terminal init prompt
- `slide` — Standard content with circuit trace background atmosphere
- `new-section-slide` — Section number in monospace, wire divider decoration
- `focus-slide` — Width-constrained centered statement
- `ending-slide` — Server panel frame with terminal exit message

The demo exercises every slide type, all seven public components, every status variant, multiple performance-bar colors, and metric labels/values of varied lengths.

## Best For

- Internal engineering presentations
- Architecture reviews
- Performance benchmarking talks
- System design proposals
- Platform team updates
