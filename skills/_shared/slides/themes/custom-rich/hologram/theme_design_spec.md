# Hologram Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | hologram |
| **Best For** | Tech keynotes, futurism talks, AR/VR presentations, innovation showcases |
| **Style Objective** | Futuristic / Glass-Morphism |
| **Complexity Level** | Rich |

A futuristic glass-morphism/iridescent aesthetic with light backgrounds, iridescent gradient accent strips (violet-to-teal-to-gold), frosted glass card effects, subtle rainbow edge glows, and holographic grid patterns. Inspired by holographic materials and AR interfaces.

## Design Philosophy

- **Iridescent Spectrum**: Seven-color progression (violet, indigo, teal, cyan, emerald, gold, rose) creates holographic shimmer
- **Glass Morphism**: Frosted circle overlays and translucent panels simulate depth layers
- **AR Interface**: HUD-style corner brackets and scan lines evoke augmented reality
- **Light Refraction**: Prismatic beam patterns and gradient strips suggest light splitting through glass

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Ice White | `#F8FAFF` | Background |
| Holo Violet | `#7C3AED` | Primary accent |
| Holo Teal | `#0EA5E9` | Secondary accent |
| Holo Gold | `#EAB308` | Tertiary accent |
| Deep Indigo | `#1E1B4B` | Heading text |
| Slate Body | `#334155` | Body text |
| Frosted BG | `#F1F5F9` | Frosted card fill |

## Typography

- Body: 20pt default
- Headings: Bold, deep indigo-black

## SVG Decorations

- **Iridescent strip**: Horizontal gradient bar cycling through all spectrum colors
- **Holographic grid**: Subtle perspective grid with AR-style corner reticle markers
- **Frosted circle**: Radial gradient blurred circles for glass-morphism depth
- **Refraction pattern**: Prismatic light beams diverging through a prism shape
- **AR frame**: HUD-style corner brackets with scan lines and intersection dots
- **Holographic orb**: Floating iridescent sphere with orbital rings

## Slide Types

- `title-slide` -- Deep violet bg, AR frame, holographic orb, refraction pattern
- `slide` -- Ice white bg, holographic grid atmosphere, iridescent header strip
- `new-section-slide` -- Deep violet-indigo bg, AR frame, frosted circles, orb
- `focus-slide` -- Frosted glass panel on violet bg with AR frame overlay
- `ending-slide` -- Light bg, holographic grid, AR frame bookend, frosted card center

## Components

- `concept-card(title, body, index)` -- Frosted glass card with iridescent left border
- `insight-box(title, body)` -- Violet gradient accent callout for key insights
- `stat-card(label, value, unit, color)` -- Large metric with iridescent bottom accent
- `holo-card(title, body, index)` -- Card with iridescent top strip and dot marker
- `projection-box(title, body)` -- Frosted glass panel with teal emphasis
- `quote-card(quote-text, attribution)` -- Holographic quote with gold accent
- `interface-card(title, body, status)` -- AR-style card with status indicator dot
- `callout-box(title, body, variant)` -- Iridescent gradient border alert box
- `holo-divider(width)` -- Holographic gradient horizontal separator
- `holo-tag(content, color)` -- Small iridescent-colored chip/tag
- `holo-table(headers, rows)` -- Styled table with iridescent header
