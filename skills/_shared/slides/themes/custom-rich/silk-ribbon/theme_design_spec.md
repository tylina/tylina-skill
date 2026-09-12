# Silk Ribbon Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | silk-ribbon |
| **Best For** | Luxury brand pitches, fashion presentations, beauty/wellness, premium events |
| **Style Objective** | Elegant / Luxury |
| **Complexity Level** | Rich |

Elegant flowing ribbon motifs with champagne and rose gold on ivory backgrounds. Luxury fashion branding inspired with flowing SVG ribbon curves, bow/knot accents, and decorative swirl flourishes for a premium, feminine elegance.

## Design Philosophy

- **Flowing Movement**: Multi-layered ribbon curves create graceful S-shaped motion across slides
- **Luxury Materials**: Champagne gold and rose evoke silk, satin, and precious metals
- **Bow Craftsmanship**: Ribbon bow/knot motifs serve as decorative anchors
- **Calligraphic Swirls**: Triple-loop flourishes add hand-crafted ornamental beauty

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Ivory | `#FFFDF5` | Background |
| Champagne | `#C9A96E` | Primary accent (gold) |
| Rose | `#D4848C` | Secondary accent |
| Mauve | `#9B7E8E` | Tertiary / focus bg |
| Cream | `#F5EDE3` | Card fills |
| Dark Text | `#3D2C2E` | Heading text |
| Body Text | `#4A3B3D` | Body copy |
| Muted Text | `#79686A` | Captions and metadata |

Decorative champagne, rose, and mauve retain their base values. Semantic text accents use darker derived variants so normal-size labels meet WCAG AA contrast on ivory, cream, and white.

## Typography

- Body: 20pt, warm body text
- Headings: Bold, dark text with champagne accent line
- `IBM Plex Mono` for code

## SVG Decorations

- **Ribbon curve**: Wide flowing S-curve with multiple depth layers and accent dots
- **Bow knot**: Decorative ribbon bow with loops and trailing tails
- **Swirl flourish**: Elegant calligraphic triple-loop ornament with connecting curves
- **Ribbon texture**: Full-page flowing ribbon pattern for subtle backgrounds
- **Ribbon frame**: Border with swirl corner decorations for title/ending slides

## Slide Types

- `title-slide` -- Ivory with ribbon frame, bow accent, flowing ribbon curves top/bottom
- `slide` -- Ivory bg, ribbon texture atmosphere, champagne header line, bow in footer
- `new-section-slide` -- Full-width ribbon curve, bow knot, large faint section number
- `focus-slide` -- Deep mauve background, ribbon curves, swirl decoration, centered text
- `ending-slide` -- Ivory with ribbon frame bookend, bow knot, swirl flourish

## Components

- `concept-card(title, body, accent)` -- Champagne top border card with bow decoration
- `insight-box(title, body, accent)` -- Left-accented box with swirl flourish header
- `stat-card(label, value, color)` -- Large statistic with rose/champagne number
- `ribbon-card(title, body, accent)` -- Card with flowing ribbon SVG header band
- `feature-box(title, items)` -- Borderless list with champagne diamond bullets
- `quote-card(quote, attribution)` -- Elegant quote with opening/closing swirl flourishes
- `showcase-card(title, body, accent)` -- Premium card with overlay bow in corner
- `callout-box(title, body, accent)` -- Highlighted attention box with rose/champagne tint
- `silk-tag(content, color)` -- Small inline pill tag with elegant shape
- `ribbon-divider(color, width)` -- SVG swirl-based decorative separator
