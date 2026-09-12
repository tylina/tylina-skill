# Citrus Grove Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | citrus-grove |
| **Best For** | Marketing, product launches, creative pitches, food & beverage, lifestyle brands |
| **Style Objective** | Fresh / Energetic |
| **Complexity Level** | Rich |

A fresh, energetic citrus palette with orange, lemon yellow, and lime green on clean white backgrounds. Features citrus slice cross-sections, leaf sprigs, dotted zest spray, and branch curves for an organic, vibrant feel.

## Design Philosophy

- **Natural Energy**: Citrus slice cross-sections and zest spray create organic vibrancy
- **Three-Tone Harmony**: Orange, lemon, and lime cycle through components for visual variety
- **Botanical Detail**: Leaf sprigs and branch curves add natural sophistication
- **Playful Precision**: Dotted borders and rounded corners keep the mood light yet professional

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| White | `#FFFFFE` | Background |
| Orange | `#F97316` | Primary accent |
| Lemon | `#EAB308` | Secondary accent |
| Lime | `#65A30D` | Tertiary accent |
| Light Yellow | `#FEF9C3` | Section backgrounds |
| Dark Text | `#1C1917` | Heading text |
| Muted Text | `#78716C` | Body/caption text |

## Typography

- Body: 20pt; choose an installed sans-serif stack in the consuming deck (the demo uses `IBM Plex Sans`)
- Headings: Bold, dark text with orange underline accent

## SVG Decorations

- **Citrus slice**: Circular cross-section with radial segments (orange)
- **Lemon slice**: Slightly different style circular cross-section (yellow)
- **Leaf sprig**: Small decorative leaf with stem and branches
- **Zest spray**: Scattered dots simulating citrus peel spray
- **Branch curve**: Decorative curved vine with leaves and fruit dots
- **Citrus background**: Full-page composition with slices, leaves, and dots
- **Corner citrus**: Subtle corner motif for content slides

## Slide Types

- `title-slide` -- Full citrus background, centered title card with gradient underline
- `slide` -- White bg, citrus gradient top bar, orange header accent, corner decoration
- `new-section-slide` -- Light yellow bg with citrus slice, leaf sprig, section number
- `focus-slide` -- Bold orange gradient background with white text, lemon decorations
- `ending-slide` -- White with citrus background pattern, bookend with title

## Components

- `concept-card(title, body, accent)` -- Orange-bordered card with rounded corners
- `insight-box(title, body)` -- Lime-accented insight with leaf SVG marker
- `stat-card(label, value, trend, accent)` -- Large number with citrus color accent
- `zest-card(title, body, accent)` -- Playful card with dotted zest spray at top
- `grove-box(title, body)` -- Garden frame card with dashed lime border and branch curve
- `quote-card(quote, author)` -- Citrus-themed quote with orange accent
- `harvest-card(number, title, body, accent)` -- Numbered card with cycling citrus colors
- `callout-box(title, body, accent, icon)` -- Generic accented callout
- `citrus-table(headers, rows)` -- Data table with citrus-themed orange header
- `juice-meter(label, value, max, color)` -- Visual progress/rating bar component
