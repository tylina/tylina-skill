# Solar Flare Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | solar-flare |
| **Best For** | Energy sector, space/astronomy talks, motivational presentations, bold product launches |
| **Style Objective** | Energetic / Powerful Warmth |
| **Complexity Level** | Rich |

A warm solar energy aesthetic with gold/amber radiating ray patterns and orange accents on cream/white backgrounds. Inspired by solar physics: corona loops, sunspots, magnetic field lines. Energetic, optimistic, and powerful.

## Design Philosophy

- **Radiating Energy**: Ray lines emanating from a corner point create dynamic directional movement
- **Corona Physics**: Curved arc loops reference solar corona eruptions for scientific beauty
- **Magnetic Topology**: Elegant curved field lines serve as dividers and decorative elements
- **Warm Power**: Gold, amber, and sunset orange combine for optimistic authority

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm White | `#FFFDF7` | Background |
| Solar Gold | `#F59E0B` | Primary accent |
| Deep Amber | `#B45309` | Dark accent / focus bg |
| Sunset Orange | `#EA580C` | Secondary accent |
| Cream | `#FEF3C7` | Title/ending bg |
| Dark Text | `#451A03` | Heading text |
| Muted Amber | `#92400E` | Body/muted text |
| Corona Yellow | `#FBBF24` | Corona ring decoration |
| Flare Orange | `#F97316` | Flare accents |

## Typography

- Body: 20pt, using the consuming deck's installed body face
- Headings: Bold with an optional consuming-deck serif display face, dark amber text
- Serif headings create warmth and authority

## SVG Decorations

- **Sun rays**: Full-page radiating lines from corner with concentric corona arcs
- **Corona arcs**: Curved loops suggesting solar eruptions (top + bottom)
- **Magnetic field**: Elegant nested curves for dividers (field line topology)
- **Circular halo**: Concentric rings with radial tick marks (sunspot-like)
- **Flare burst**: Radiating spikes from center with central glow circles
- **Sunspot cluster**: Small decorative dark circles with surrounding rings

## Slide Types

- `title-slide` -- Cream bg, sun rays, corona arcs, flare burst top-right, halo bottom-left
- `slide` -- Warm white bg, faint radiating rays, gold title accent bar, halo corner
- `new-section-slide` -- Left amber accent band, halo right, sunspot bottom-left
- `focus-slide` -- Deep amber background, centered flare burst, halo corners
- `ending-slide` -- Cream with sun rays and corona arcs bookend, centered flare burst

## Components

- `concept-card(title, body, accent)` -- Warm surface card
- `insight-box(title, body, accent)` -- Left-bordered panel with sunset/orange accent
- `stat-card(label, value, trend)` -- KPI metric with large solar gold number
- `energy-card(title, body)` -- Vibrant sunset card with inline sunspot decoration
- `radiance-box(title, body, accent)` -- Glowing box with halo rings for featured content
- `quote-card(quote, author)` -- Solar-themed quote with magnetic field line below
- `timeline-entry(date, title, description)` -- Chronological item with solar dot marker
- `callout-box(title, body, kind)` -- Attention box with icon circle (info/warning/success)
- `solar-tag(content, color)` -- Pill-shaped label
- `solar-divider(color)` -- Magnetic field line separator
