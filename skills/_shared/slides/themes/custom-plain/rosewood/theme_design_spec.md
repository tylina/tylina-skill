# Rosewood Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | rosewood |
| **Best For** | Luxury brands, premium products, high-end presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A warm, elegant theme inspired by the rich tones of rosewood furniture and classic interior design. Deep browns, warm reds, and cream tones create a timeless, sophisticated atmosphere that evokes craftsmanship and heritage. The design features subtle wood-grain texture effects and ornamental dividers, lending an artisanal quality that sets it apart from typical corporate themes.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟫 | Brown | `#5D4037` | `palette.primary` | Header bars, section titles, card accents |
| 🟫 | Medium Brown | `#795548` | `palette.secondary` | Secondary accents, Touying secondary role |
| 🩶 | Taupe | `#A1887F` | `palette.accent` | Decorative lines and subtle borders |
| 🩶 | Light Taupe | `#D7CCC8` | `palette.accent-light` | Accessible muted text on dark backgrounds |
| 🟥 | Warm Red | `#BF360C` | `palette.warm-red` | Emphasis accents, left bars, ornament diamonds, quote borders |
| ⬜ | Light Cream | `#EFEBE9` | `palette.bg` | Slide background, quote-block fill |
| ⬜ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| ⬛ | Dark Brown | `#3E2723` | `palette.deep` | Title/focus/ending slide background, darkest text |
| ⬛ | Dark Brown | `#3E2723` | `palette.text-dark` | Primary body text (same as `deep`) |
| 🟫 | Warm Brown | `#795548` | `palette.text-light` | Accessible secondary text and footer text on light backgrounds |
| 🟨 | Warm Cream | `#FFF8E1` | `palette.cream` | Text on dark backgrounds, header text |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#5D4037`) | Theme accent, `alert()` text |
| `secondary` | `palette.secondary` (`#795548`) | Secondary Touying role |
| `neutral-lightest` | `palette.cream` (`#FFF8E1`) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (`#3E2723`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Recommended Demo Font** | `Libertinus Serif`, with `Noto Serif SC` fallback (set by the deck, not the theme) |
| **Heading Color** | `palette.primary` (via show rule in entry point) |
| **Header Section Label** | 0.65em, cream on brown |
| **Header Slide Title** | 1.35em, medium weight, cream on brown |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Dark brown (`palette.deep`) with a subtle wood-grain texture effect — 30 semi-transparent horizontal lines of varying opacity (`palette.cream` at 5–45% visibility) placed at pseudo-random vertical positions, simulating natural wood grain
- **Layout**: Vertically centered
- **Title**: Cream-colored, 2.4em, bold
- **Subtitle**: Light taupe accent color, 1.2em
- **Divider**: Warm-red thin line (30% width, 1.5pt)
- **Author/Date**: Cream text, 0.9em
- **Institution**: Light taupe accent color, 0.9em

### Section Slide (`new-section-slide`)

- **Background**: Light cream (`palette.bg`)
- **Layout**: Zero margin, content centered
- **Left Accent Bar**: Full-height warm-red bar (6pt wide) on the left edge
- **Text**: "Section" label in accessible warm brown (1em), then section heading in primary brown, 2.2em, semibold, indented 2em from left

### Content Slide (`slide`)

- **Background**: Light cream (`palette.bg`)
- **Header**: Full-width primary brown bar with compact vertical inset. Section heading (level 1) in cream at 0.65em and slide title in cream at 1.35em, composed with an explicit 2pt stack rhythm
- **Footer**: Padded three-column grid, text-light footer content on left, page counter right-aligned ("N / M" format)
- **Content Area**: Cream background, alignment configurable

### Focus Slide (`focus-slide`)

- **Background**: Dark brown (`palette.deep`)
- **Text**: Warm cream, 2em, centered both horizontally and vertically inside a 90%-width safety block
- **Clean full-bleed**: No header or footer

### Ending Slide (`ending-slide`)

- **Background**: Dark brown (`palette.deep`) with decorative warm-red grain lines — 15 semi-transparent horizontal lines in warm-red at varying opacities, mirroring the title slide texture
- **Layout**: Vertically centered with warm-red decorative lines (20% width, 1pt) above and below the body text
- **Text**: Cream, 2em, bold, centered

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Wood Card | `wood-card(title, body, accent: none)` | Cream-filled card with 4pt colored left border (default: primary brown) and light taupe border on other sides. Bold title in accent color, dark text body. Rounded 3pt corners |
| Chapter Heading | `chapter-heading(number, title)` | Large chapter number (3em) in warm-red on the left, with a thin accent line and semibold primary-brown title on the right. Two-column grid layout |
| Ornament Divider | `ornament-divider()` | Centered decorative divider: two thin taupe lines flanking a small diamond (6pt square rotated 45°, warm-red fill). Adds 0.4em vertical spacing above and below |
| Quote Block | `quote-block(body, author: none)` | Left-bordered block (4pt warm-red border) on cream background. Italic text at 1.05em. Optional author attribution preceded by em-dash, in normal style at 0.9em in text-light color |

## Best Use Cases

- Architecture and interior design presentations
- Premium brand storytelling and luxury product launches
- History, heritage, and cultural topics
- Book launches and literary events
- Wine, craft, and artisanal product showcases
- Academic humanities presentations

## Recommended Complexity

**Plain** — Rosewood is typography-led and restrained, with a small optional component set for emphasis. Use `chapter-heading` for major transitions, `wood-card` for structured points, and `ornament-divider` sparingly to separate logical sections. The recommended serif font reinforces the editorial, book-like aesthetic without changing the theme's plain-tier authoring model.
