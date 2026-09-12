# Paper Crane Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | paper-crane |
| **Best For** | Design studios, creative workshops, cultural presentations, mindfulness talks |
| **Style Objective** | Origami / Geometric Calm |
| **Complexity Level** | Rich |

An origami-inspired aesthetic with geometric fold lines, angular shapes, and crane silhouettes. Warm coral accents on paper-white backgrounds. Features persistent fold-line atmosphere on content slides, diamond patterns, and angular card components that evoke the craft of paper folding.

## Design Philosophy

- **Paper Craft**: Fold-line crease patterns and triangular corner decorations reference origami diagrams
- **Geometric Calm**: Diamond shapes and angular accents create quiet visual rhythm
- **Crane Motif**: The iconic paper crane silhouette appears as persistent corner ornament
- **Warm Minimalism**: Coral and cream-gold accents on warm white keep the mood inviting

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm White | `#FFF9F5` | Background (paper surface) |
| Coral | `#E8736A` | Primary accent |
| Indigo | `#3D5A80` | Headings / dark contrast |
| Cream Gold | `#D4A574` | Warm metallic highlights |
| Sage | `#7BA08C` | Natural complement |
| Dark Text | `#2C3040` | Body text |
| Fold Line | `#D4CCC4` | Crease decoration color |

## Typography

- Font family: IBM Plex Sans with Noto Sans SC fallback
- Body: 18pt, dark text
- Headings: Medium weight, indigo color
- Title: 2.4em semibold indigo

## SVG Decorations

- **Crane silhouette**: Geometric angular paper bird with fold-line creases
- **Fold lines**: Full-page diagonal/grid crease pattern (persistent atmosphere)
- **Diamond frame**: Corner diamonds and scattered triangles for title/ending bookend
- **Fold corner**: Small triangular fold in card corners

## Slide Types

- `title-slide` -- Diamond frame, crane silhouettes, centered title with angular accent
- `slide` -- Fold-line atmosphere, tiny crane in corner, angular header accent
- `new-section-slide` -- Fold lines, large section number in coral, small crane bottom-right
- `focus-slide` -- Deep indigo bg, large translucent crane, white centered text
- `ending-slide` -- Diamond frame bookend with cranes, angular accent line

## Components

- `concept-card(title, body, accent)` -- Angular card with fold-corner SVG decoration
- `insight-box(title, body)` -- Left-border accent with angular emphasis
- `stat-card(label, value, accent)` -- Diamond-shaped number display (origami motif)
- `quote-card(quote, author)` -- Quotation with SVG crane accent decoration
- `fold-card(title, body)` -- Borderless card with fold-corner (no visible border)
- `origami-box(title, body, accent)` -- Colorful card with angular header bar
- `timeline-entry(step, title, description)` -- Diamond step indicator with fold connector
- `comparison-card(left-title, left-body, right-title, right-body)` -- Two-panel angular divider
- `crane-divider(width)` -- SVG decorative separator with diamond crane motif
- `fold-tag(content, color)` -- Small inline angular tag
