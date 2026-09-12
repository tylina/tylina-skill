# Lavender Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | lavender |
| **Best For** | Wellness, lifestyle, creative presentations |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A soft, calming visual identity built around purple and lilac tones, evoking serenity, creativity, and thoughtfulness. Inspired by wellness aesthetics and gentle floral motifs, the theme uses translucent decorative circles, rounded forms, and generous whitespace to create an inviting, approachable atmosphere. Every element feels organic and unhurried.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟣 | Primary | `#7E57C2` | `palette.primary` | Medium purple — headers, step badges, card accents |
| 🟣 | Secondary | `#AB47BC` | `palette.secondary` | Orchid purple — alternate accent, Touying `secondary` |
| 🟣 | Accent | `#CE93D8` | `palette.accent` | Light purple — decorative lines, translucent circles |
| 🟣 | Background | `#F3E5F5` | `palette.bg` | Very light lavender — slide fill, card backgrounds |
| ⬜ | Card BG | `#FFFFFF` | `palette.card-bg` | White — card backgrounds |
| 🟣 | Deep | `#4527A0` | `palette.deep` | Deep purple — title text, focus/ending slide backgrounds |
| 🟣 | Text Dark | `#311B92` | `palette.text-dark` | Dark indigo — body text |
| 🟣 | Text Light | `#7E57C2` | `palette.text-light` | Medium purple — secondary text, footer, page counter |
| 🟣 | Soft | `#E1BEE7` | `palette.soft` | Soft lilac — decorative circle fills, soft-box background base |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#7E57C2`) | Theme accent, `alert()` text, header fills |
| `secondary` | `palette.secondary` (`#AB47BC`) | Secondary accent elements |
| `neutral-lightest` | `white` | Light text on dark backgrounds (focus/ending slides) |
| `neutral-darkest` | `palette.text-dark` (`#311B92`) | Body text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | Inherited (not explicitly set in theme entry) |
| **Font** | Set in `main.typ`, not in template |
| **Header Section Label** | 0.65em, medium, `palette.text-light` |
| **Header Title** | 1.35em, medium, `palette.deep` |
| **Footer** | 0.7em, `palette.text-light` |
| **Block Code** | 0.72em in a white panel with a 0.5pt `palette.accent` border |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Solid `palette.bg` (`#F3E5F5` — light lavender), margin 2em.
**Layout:** Centered vertically and horizontally.
**Decorations:** Five translucent decorative circles placed in corners and edges:
- Top-left: large (60pt radius) soft lilac circle at 40% transparency, plus a smaller (25pt) accent circle at 50% transparency slightly offset.
- Bottom-right: large (70pt) soft lilac circle at 40% transparency, plus a smaller (30pt) accent circle at 60% transparency.
- Top-right: medium (40pt) accent circle at 55% transparency.
**Title:** 2.2em, `palette.deep`, semibold.
**Subtitle:** 1.2em, `palette.text-light`.
**Divider:** A decorative line (30% width, 2pt, `palette.accent`) separates title from metadata.
**Author:** 0.9em, medium weight, `palette.text-dark`.
**Institution:** 0.9em, `palette.text-dark`.
**Date:** 0.9em, italic, `palette.text-dark`.
**Contact:** 0.9em, `palette.text-light`.
**Header/Footer:** None.

### Section Slide (`new-section-slide`)

**Background:** Solid `palette.bg` (`#F3E5F5`), margin 2em.
**Layout:** Centered vertically and horizontally.
**Decorations:** Two accent lines (20% width, 3pt stroke, `palette.accent`) — one above and one below the heading.
**Title:** 2em, `palette.deep`, medium. Displays current level-1 heading.
**Spacing:** 14pt between lines and title.

### Content Slide (`slide`)

**Header:** Open white field aligned to the content margin. Section name uses `palette.text-light` at 0.65em medium, the title uses `palette.deep` at 1.35em medium, and a 54pt × 2pt `palette.accent` rule anchors the group.
**Footer:** Three-part grid padded 0.4em. Left side: custom footer content in `palette.text-light` at 0.7em. Right side: page counter ("N / M") in `palette.primary`.
**Content area:** Default background, margin top 4em, bottom 2em, x 2em. Content aligned per `align` parameter (default: horizon).

### Focus Slide (`focus-slide`)

**Background:** Solid `palette.deep` (`#4527A0`), margin 2em.
**Text:** White, 2em. Centered horizontally and vertically inside a width-constrained block.
**Header/Footer:** None.
**Purpose:** Key messages, dramatic pauses, impactful quotes.

### Ending Slide (`ending-slide`)

**Background:** Solid `palette.deep` (`#4527A0`), margin 2em.
**Layout:** Centered vertically and horizontally. A full-size `palette.deep` rectangle is placed as a base layer.
**Decorations:** Three translucent circles layered on the background:
- Bottom-left: large (80pt radius) `palette.primary` at 50% transparency.
- Top-right: medium (60pt) `palette.secondary` at 50% transparency.
- Bottom-right: smaller (45pt) `palette.accent` at 60% transparency.
**Text:** White, 2em, semibold.
**Header/Footer:** None.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Petal Card | `petal-card(title, body, accent: none)` | Card with lavender fill (`palette.bg`), a 3.5pt colored left border (defaults to `palette.primary`), 6pt radius on all corners. Title in semibold accent color at 1.05em. No top/right/bottom border. |
| Enum Styling | `set enum(numbering: ...)` | Numbered list via native `+` syntax. Each number rendered as 26pt circular badge filled with `palette.primary` containing bold white number. Configured globally via `set enum` in theme entry. |
| Soft Box | `soft-box(body)` | Rounded container (10pt radius) filled with `palette.soft` lightened 30%, 14pt inset, no border. Ideal for gentle visual grouping of content. |

## Best Use Cases

- Wellness and mindfulness workshops
- Educational lectures and training materials
- Psychology and counseling presentations
- Design portfolio reviews and creative briefs
- Non-profit and community event slide decks

## Recommended Complexity

**Plain** — The theme relies on typography, whitespace, a disciplined purple palette, native list styling, and two restrained content components. Layered circles are reserved for the cover and ending bookend rather than ordinary content slides.
