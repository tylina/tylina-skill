# Emerald Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | emerald |
| **Best For** | Business consulting, strategy reviews, professional reports |
| **Style Objective** | Consulting |
| **Complexity Level** | Plain |

## Design Philosophy

A restrained, premium visual identity inspired by fine jewelry and high-end finance. The theme pairs deep emerald greens with warm amber gold accents to evoke wealth, trust, and sophistication. Typography, whitespace, short gold rules, and small diamond ornaments carry the identity without turning ordinary content slides into decorated panels.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟢 | Primary | `#1B5E20` | `palette.primary` | Dark emerald — header fills, title text on light backgrounds |
| 🟢 | Secondary | `#2E7D32` | `palette.secondary` | Forest green — secondary elements, Touying `secondary` role |
| 🟢 | Accent | `#43A047` | `palette.accent` | Medium green — checkmarks, subtle borders, accent strokes |
| 🟠 | Gold | `#FFB300` | `palette.gold` | Amber gold — decorative lines, diamond ornaments, dividers |
| 🟡 | Gold Light | `#FFD54F` | `palette.gold-light` | Light gold — subtitle text, subtle highlights |
| 🟢 | Background | `#F1F8E9` | `palette.bg` | Very light green — card backgrounds, gem-card fill |
| ⬜ | Card BG | `#FFFFFF` | `palette.card-bg` | Pure white — value-display backgrounds |
| 🟢 | Deep | `#0D3B0E` | `palette.deep` | Very dark green — title/focus/ending slide backgrounds |
| ⬛ | Text Dark | `#1B2631` | `palette.text-dark` | Near black — body text |
| 🔵 | Text Light | `#546E7A` | `palette.text-light` | Blue-gray — footer text, secondary labels |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#1B5E20`) | Theme accent, `alert()` text, header fills |
| `secondary` | `palette.secondary` (`#2E7D32`) | Secondary accent elements |
| `neutral-lightest` | `white` | Light text on dark backgrounds (title/focus slides) |
| `neutral-darkest` | `palette.text-dark` (`#1B2631`) | Body text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | `palette.text-dark` (`#1B2631`) |
| **Font** | Set in `main.typ`, not in template |
| **Header Section Label** | 0.65em, medium, `palette.text-light` |
| **Header Title** | 1.35em, semibold, `palette.primary` |
| **Footer** | 0.8em, `palette.text-light` |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Solid `palette.deep` (`#0D3B0E` — very dark green), margin 2em.
**Layout:** Centered vertically and horizontally.
**Decorations:** A small gold diamond ornament (8pt rotated square) placed at top-center (12% from top). A gold horizontal line (40% width, 2pt stroke) separates the title from metadata.
**Title:** 2.4em, white, semibold.
**Subtitle:** 1.2em, `palette.gold-light`.
**Author/Institution/Date:** White with 15% transparency, stacked vertically in decreasing font sizes (1em / 0.9em / 0.85em).
**Header/Footer:** None.

### Section Slide (`new-section-slide`)

**Background:** Default (inherited light background).
**Layout:** Centered vertically and horizontally.
**Decorations:** Two gold horizontal lines (20% width, 2pt stroke) — one above and one below the section title.
**Title:** 2em, `palette.primary`, medium. Displays current level-1 heading.
**Spacing:** 0.6em between lines and title.

### Content Slide (`slide`)

**Header:** Open white field aligned to the content margin. Section name in `palette.text-light` at 0.65em medium, slide title in `palette.primary` at 1.35em semibold, followed by a 54pt × 2pt gold rule.
**Footer:** Three-part grid padded 0.4em. Left side: custom footer content in `palette.text-light` at 0.8em. Right side: page counter in a pill-shaped box with `palette.gold` lightened 70% fill, `palette.deep` text, 0.85em medium weight, 3pt radius.
**Content area:** White/default background, margin top 4em, bottom 2em, x 2em. Content aligned per `align` parameter (default: horizon).

### Focus Slide (`focus-slide`)

**Background:** Solid `palette.deep` (`#0D3B0E`), margin 2em.
**Text:** `palette.gold` (`#FFB300`), 2em, semibold. Centered horizontally and vertically inside a width-constrained block.
**Header/Footer:** None.
**Purpose:** Key quotes, pivotal statements, dramatic emphasis.

### Ending Slide (`ending-slide`)

**Background:** Solid `palette.deep` (`#0D3B0E`), margin 2em.
**Layout:** Centered vertically and horizontally.
**Text:** White, 2em, semibold.
**Decorations:** A gold horizontal line (25% width, 1.5pt stroke) below the text, followed by a small gold diamond ornament (6pt rotated square).
**Header/Footer:** None.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Gem Card | `gem-card(title, body, accent: none)` | Card with a 3pt gold (or custom accent) top border, light green (`palette.bg`) fill, thin green side/bottom borders (0.5pt, `palette.accent` lightened 60%), 4pt bottom radius. Title in bold `palette.primary` at 1.05em. |
| Value Display | `value-display(label, value)` | White card (`palette.card-bg`) with thin green border (0.5pt, `palette.accent` lightened 50%), 4pt radius. Label is centered, uppercase, 0.8em medium `palette.text-light`. Value is centered, 1.8em bold `palette.primary`. |
| Gold Divider | `gold-divider()` | Three-column horizontal divider: two gold lines (1pt, lightened 30%) flanking a small centered gold diamond (5pt rotated square). Vertical padding 0.3em above and below. |
| Checklist styling | Native `- [x]` / `- [ ]` syntax | Cheq list markers use a green checkmark (`palette.accent`, bold, 1.1em). No custom checklist wrapper is exposed. |

## Best Use Cases

- Premium finance reports and investor presentations
- Luxury brand pitches and high-end corporate events
- Executive-level communications and board meetings
- Award ceremonies and gala event slide decks

## Recommended Complexity

**Plain** — The theme relies on typography, whitespace, disciplined emerald-and-gold color, and a restrained component set. Title, focus, and ending slides carry the strongest ornament; ordinary content slides stay open and projection-safe.
