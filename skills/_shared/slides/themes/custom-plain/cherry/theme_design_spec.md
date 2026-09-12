# Cherry Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | cherry |
| **Best For** | Cultural events, seasonal presentations, East Asian design |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

Inspired by Japanese cherry blossoms (sakura), this theme evokes an elegant, poetic atmosphere through soft pinks, warm reds, and gentle petal-like decorative elements. The design balances boldness (deep cherry-red headers and accents) with delicacy (scattered blossom circles, pastel petal backgrounds, and fine accent lines). It creates a presentation mood that is artistic, culturally rich, and visually warm — perfect for humanities, arts, and aesthetic-driven topics.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🔴 | Deep Cherry Red | `#C62828` | `palette.primary` | Header fill, focus-slide background, title text, accent lines |
| 🩷 | Cherry Pink | `#E91E63` | `palette.secondary` | Card accent borders, decorative circles, default sakura-card accent |
| 🩷 | Light Pink | `#F8BBD0` | `palette.accent` | Decorative circles, petal-divider elements, line strokes |
| 🩷 | Blush Background | `#FFF0F0` | `palette.bg` | Page background — very light blush pink |
| ⚪ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| 🩷 | Petal Pink | `#FCE4EC` | `palette.petal` | Ending-slide background, sakura-card fill, decorative circles |
| 🟤 | Dark Brown | `#3E2723` | `palette.text-dark` | Primary body text |
| 🟤 | Warm Brown | `#806158` | `palette.text-light` | Contrast-safe subtitles, secondary text, footer |
| 🟠 | Gold | `#9C5600` | `palette.gold` | Text-safe optional accent for cards |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#C62828`) | Theme accent, `alert()` text, header fill |
| `neutral-lightest` | `white` | Light text on cherry-red backgrounds |
| `neutral-darkest` | `palette.text-dark` (`#3E2723`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Text Color** | `palette.text-dark` (`#3E2723`) — warm dark brown |
| **Font** | Not set in template; demo uses verified `New Computer Modern` → `Hiragino Mincho ProN` → `Libertinus Serif` fallbacks |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Blush pink (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Decorative Elements**: 11 scattered circles using `place()` in corners — varying sizes (5pt–14pt radius), filled with `palette.accent`, `palette.petal`, and lightened `palette.secondary`. Creates a soft "falling petals" effect around the edges
- **Title Block**: 85% width, text at 2.2em, bold, in deep cherry red (`palette.primary`)
- **Subtitle**: 0.5em size relative to title, warm brown italic (`palette.text-light`)
- **Divider**: Horizontal line (30% width, 1.5pt stroke in `palette.accent`)
- **Author**: Medium weight, `palette.text-dark`
- **Institution & Date**: `palette.text-light`, 0.85em

### Section Slide (`new-section-slide`)

- **Background**: Blush pink (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Decorative Elements**: 4 small petal circles scattered around center using `place()` — in `palette.petal` and `palette.accent` tones
- **Section Title**: 2em, semibold, deep cherry red
- **Accent Lines**: Two red lines (15% width, 2.5pt stroke in `palette.primary`) — one above and one below the heading
- **Mood**: Poetic section divider with floating petal accents

### Content Slide (`slide`)

- **Background**: Blush pink (`palette.bg`)
- **Header**: Open field aligned to the content margin. A 1.35em medium cherry-red title is anchored by a 54pt × 2pt blush rule.
- **Footer**: Measured three-track grid, padded 0.4em, contrast-safe warm brown (`palette.text-light`) at 0.8em for custom footer (left), current slide number (right)
- **Content Area**: Margins top 4em / bottom 2em / x 2em

### Focus Slide (`focus-slide`)

- **Background**: Deep cherry red (`palette.primary`) — full page fill
- **Text**: White, 2em, centered vertically and horizontally in a width-constrained block
- **Margin**: 2em all sides
- **Purpose**: Bold, immersive emphasis — white text on deep red

### Ending Slide (`ending-slide`)

- **Background**: Petal pink (`palette.petal`) — soft, warm closing
- **Text**: Deep cherry red (`palette.primary`), 2em, semibold, centered in a width-constrained block
- **Margin**: 2em all sides
- **Mood**: Gentle conclusion — inverts the focus-slide palette. Red text on soft pink creates a warm, appreciative close

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Sakura Card | `sakura-card(title, body, accent: none)` | Definite 30em card filled with petal pink (`palette.petal`), 3pt left border in accent color (defaults to `palette.secondary` cherry pink). Medium title in accent color. Rounded corners (4pt); ordinary-flow component with no lazy vertical glue. |
| Haiku Box | `haiku-box(line1, line2, line3)` | A definite 30em three-line display block on blush background with 0.5pt `palette.accent` border stroke. Lines are centered in one vertical stack, italic, and separated by 6em accent rules. Rounded corners (6pt). |
| Accent Tag | `accent-tag(label)` | Inline rounded badge (10pt radius) filled with cherry red (`palette.primary`). White bold text at 0.8em. Used for category labels or keywords. |
| Petal Divider | `petal-divider()` | Definite 30em decorative divider: two 10em accent rules flank five boxed inline circles (3–4pt radius) in alternating petal colors. |

## Layout Semantics

- Sequential title, section, haiku, card, and header regions use `stack(spacing:)`.
- Semantic side-by-side content uses Touying `cols`; footer chrome uses `grid` because it is a measured three-track matrix.
- No component is eligible for lazy layout: the reusable components are demonstrated in ordinary flow and contain no `lazy-v`.
- No generic layout wrapper or stat/KPI component is exported. `sakura-card`, `haiku-box`, `accent-tag`, and `petal-divider` retain only theme-specific visual semantics.
- The 30em component width is a deliberate bounded-layout exception: baseline percentage widths caused contextual header/footer loss on full-resolution pages.

## Best Use Cases

- Art, literature, and poetry presentations
- Japanese culture, history, and aesthetics topics
- Wedding, event, and celebration presentations
- Humanities and liberal arts lectures
- Brand presentations for beauty, wellness, or lifestyle products

## Recommended Complexity

**Plain** — The Cherry theme remains content-driven, with a small vocabulary of sakura-specific decorative components. Use sakura cards, haiku boxes, tags, and petal dividers sparingly; use native `cols`, `grid`, and `stack` for generic layout.
