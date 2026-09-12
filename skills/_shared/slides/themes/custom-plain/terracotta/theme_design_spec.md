# Terracotta Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | terracotta |
| **Best For** | Architecture, interior design, earth-toned presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A warm, inviting theme inspired by Mediterranean terracotta pottery and architecture. Burnt orange, clay, olive green, and sandy tones evoke sun-baked landscapes, artisan craftsmanship, and rustic elegance. The design uses soft circular decorations and earth-toned accents to create an organic, approachable feel that balances warmth with clarity.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟠 | Burnt Orange | `#BF5B21` | `palette.primary` | Bright decorative accent lines, card borders, arch-divider dot |
| 🟠 | Clay Pink | `#D4845A` | `palette.secondary` | Decorative circles |
| 🟢 | Olive Green | `#6B7F3B` | `palette.accent` | Decorative circles |
| 🟢 | Deep Olive | `#5D7132` | `palette.accent-deep` | Contrast-safe tag/badge backgrounds |
| ⬜ | Parchment | `#FDF6ED` | `palette.bg` | Slide background, ending-slide text |
| ⬜ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| 🟤 | Deep Terracotta | `#8B3A0F` | `palette.deep` | Accessible text accent, focus background, title text, section headings |
| ⬛ | Dark Earth | `#3B2316` | `palette.text-dark` | Primary body text |
| 🟫 | Warm Gray-Brown | `#795548` | `palette.text-light` | Contrast-safe secondary text, footer text, metadata |
| 🟡 | Sand | `#E8D5B7` | `palette.sand` | Decorative circles, arch-divider lines, card backgrounds (lightened) |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.deep` (`#8B3A0F`) | Accessible theme accent and `alert()` text |
| `neutral-lightest` | `palette.bg` (`#FDF6ED`) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (`#3B2316`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Font** | Set in `main.typ`, not in template |
| **Header Section Label** | 0.6em, medium, warm brown on parchment |
| **Header Slide Title** | 1.25em, semibold, dark earth on parchment |
| **Heading Color** | Deep terracotta for section dividers and Touying primary emphasis |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Parchment (`palette.bg`), zero margin, no header/footer
- **Decorations**: Three translucent circles — large sand circle (120pt radius, 50% transparent) at top center, smaller clay-pink circle (60pt, 80% transparent) at top-left, and olive-green circle (80pt, 85% transparent) at bottom-right — evoking terracotta pottery forms and arched architecture
- **Title**: Deep terracotta, 42pt, bold, centered with 80pt horizontal padding
- **Accent Line**: Burnt-orange line (100pt wide, 2.5pt)
- **Subtitle**: Deep terracotta, 18pt, for reliable contrast
- **Author/Institution/Date**: Contrast-safe warm gray-brown text-light, 14pt, stacked with explicit spacing

### Section Slide (`new-section-slide`)

- **Background**: Inherits slide background (parchment)
- **Layout**: Centered vertically and horizontally
- **Accent Lines**: Two burnt-orange lines (60pt wide, 2pt) above and below the section heading — symmetrical framing
- **Text**: Deep terracotta, 2em, semibold

### Content Slide (`slide`)

- **Background**: Parchment (`palette.bg`)
- **Header**: Open typographic stack on parchment: warm-brown section label, dark-earth semibold slide title, and a short burnt-orange/sand rule
- **Footer**: Three-part grid with footer content on the left, a terracotta dot in the center, and page counter on the right ("N / M")
- **Content Area**: Parchment background, configurable alignment

### Focus Slide (`focus-slide`)

- **Background**: Deep terracotta (`palette.deep`)
- **Text**: Sand-colored, 2em, bold, centered
- **Feel**: Warm, intense — like being inside a terracotta kiln

### Ending Slide (`ending-slide`)

- **Background**: Burnt orange (`palette.primary`)
- **Text**: Parchment (`palette.bg`), 2.5em, bold, centered
- **Feel**: Vibrant, warm close

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Clay Card | `clay-card(title, body, accent: none)` | Card with a 3pt top border (burnt orange by default; optionally caller-accented) and 0.5pt sand-colored borders on other sides. Very light sand background (lightened 40%). The bold title stays deep terracotta for contrast, followed by body text with no unbounded flexible spacer. 6pt rounded corners |
| Olive Tag | `olive-tag(label)` | Small inline pill badge (10pt radius) with deep-olive fill. White bold text at 0.8em. Use for categories, tags, or labels |
| Arch Divider | `arch-divider()` | Centered decorative divider: two sand-colored lines (80pt each, 0.8pt) flanking a boxed inline circle (4pt radius) in burnt orange. Uses block inset for predictable vertical padding. Evokes Mediterranean arch motifs |

## Best Use Cases

- Travel and tourism presentations (Mediterranean, Middle Eastern, North African destinations)
- Food and culinary arts showcases
- Architecture and interior design (rustic, Mediterranean styles)
- Cultural heritage and art history
- Wine, olive oil, and artisanal craft storytelling
- Real estate presentations for warm-climate properties

## Recommended Complexity

**Plain** — The terracotta theme is warm and inviting but intentionally restrained in its component set. Use `clay-card` for key points, `olive-tag` for inline labels and categories, and `arch-divider` to separate content sections. Ordinary headings, lists, and `cols` remain the default authoring pattern; let typography, whitespace, and earth tones do the storytelling.
