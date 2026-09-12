# Neon Mint Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | neon-mint |
| **Best For** | Startup pitches, tech product launches, innovation showcases, developer talks |
| **Style Objective** | Fresh / Tech-Forward |
| **Complexity Level** | Rich |

A fresh, modern startup aesthetic with bright mint green primary accent and electric blue secondary. Clean white backgrounds with geometric circuit-board-inspired line patterns, connection nodes, and dot-grid patterns.

## Design Philosophy

- **Circuit Language**: Right-angle trace paths with connection nodes reference PCB design
- **Dot Grid Precision**: Evenly spaced dot matrix creates clean engineering-paper feel
- **Neon Glow**: Bright mint on white gives an energetic, fresh technology vibe
- **Node Connectivity**: Circular connection points at trace intersections suggest networked systems

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Mint White | `#FAFFFE` | Background |
| Emerald Mint | `#059669` | Primary accent |
| Electric Blue | `#3B82F6` | Secondary accent |
| Light Mint | `#D1FAE5` | Highlight fills |
| Charcoal | `#1F2937` | Dark text |
| Warm Gray | `#6B7280` | Muted text |
| Card White | `#FFFFFF` | Card surfaces |
| Mint Border | `#A7F3D0` | Borders |

## Typography

- Body: 18pt, `Noto Sans` / `Noto Sans Mono` for code
- Headings: Bold charcoal with circuit divider underline

## SVG Decorations

- **Circuit traces**: Horizontal/vertical paths with right-angle turns and connection node dots
- **Dot grid**: Evenly spaced dot pattern creating a subtle PCB layout grid
- **Neon frame**: Geometric border with circuit-trace corners and node dots (title/ending)
- **Circuit divider**: Horizontal trace with zigzag routing and endpoint nodes
- **Signal pulse**: Small inline EKG-style pulse waveform for section headers

## Slide Types

- `title-slide` -- Neon frame, circuit traces, centered branding
- `slide` -- White bg, dot-grid atmosphere, mint/blue corner nodes, circuit divider header
- `new-section-slide` -- Left mint accent bar, signal pulse, large section number
- `focus-slide` -- Charcoal background, circuit traces, neon mint text, corner nodes
- `ending-slide` -- White bg with neon frame bookend, circuit traces

## Components

- `concept-card(title, body, accent)` -- Card with left neon border and node indicator dot
- `insight-box(title, body)` -- Signal-pulse SVG decoration with light mint background
- `stat-card(label, value, color)` -- Metric display with neon accent node
- `metric-card(label, value, description, color)` -- Stat variant with inline signal pulse
- `code-card(title, body, accent)` -- Code/tech content box with monospace feel
- `feature-card(icon-text, title, body, accent)` -- Borderless gradient background card
- `comparison-box(left-title, left-body, right-title, right-body)` -- Two-panel VS comparison
- `callout-box(title, body, accent)` -- Attention-grabbing box with full accent border
- `trace-divider(color, width)` -- SVG-based circuit trace separator
- `neon-tag(content, color)` -- Small capsule tag with glowing dot
