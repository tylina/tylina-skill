# Slate Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | slate |
| **Best For** | Tech presentations, product updates, developer talks |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A sleek, dark-mode professional theme with charcoal/slate gray tones and warm amber accents. Inspired by premium tech product launches, developer keynotes, and sophisticated dark-UI design systems. Every element is designed for high contrast on dark backgrounds — from custom-styled code blocks to amber accent lines — making content pop while maintaining visual elegance.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🩶 | Slate Gray | `#37474F` | `palette.primary` | Touying primary base (dark gray reference) |
| ⬛ | Dark Navy | `#1a1a2e` | `palette.bg` | Slide background, badge text, focus-slide text |
| 🟣 | Dark Purple | `#252540` | `palette.card-bg` | Card backgrounds, code block context |
| 🟠 | Amber | `#FFB74D` | `palette.accent` | Accent lines, page counter, badges, card borders, focus-slide background |
| 🩵 | Cyan | `#4DD0E1` | `palette.accent2` | Inline code text, secondary card accent |
| 🟣 | Dark Violet | `#3a3a5c` | `palette.border` | Card borders, code block borders |
| ⬜ | Light Gray | `#ECEFF1` | `palette.text` | Primary text on dark backgrounds |
| 🩶 | Blue Gray | `#90A4AE` | `palette.text-sec` | Secondary text, section labels, footer |
| ⬛ | Code Black | `#0D1117` | `palette.code-bg` | Block and inline code background |
| 🩶 | Code Gray | `#C9D1D9` | `palette.code-text` | Block code foreground |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` (`#FFB74D`) | Theme accent, `alert()` text — note: maps to amber, not `palette.primary` |
| `neutral-lightest` | `palette.text` (`#ECEFF1`) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.bg` (`#1a1a2e`) | Dark background color reference |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Font** | Set in `main.typ`, not in template; demo uses verified `IBM Plex Sans` + `Noto Sans SC` |
| **H2 Heading** | 28pt, medium, light gray (styled via show rule in `config-methods.init`) |
| **Code Block (block)** | `palette.code-bg`, `palette.code-text`, 0.5pt border, 4pt radius |
| **Code Inline** | `palette.code-bg`, cyan text (`palette.accent2`), 2pt radius |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Dark navy (`palette.bg`), zero margin, no header/footer
- **Layout**: Left-aligned, vertically centered, padded 80pt horizontal / 60pt vertical
- **Title**: 44pt, bold, light gray text — prominent and dramatic
- **Accent Line**: Short amber bar (100pt wide, 3pt tall, rounded) below title
- **Subtitle**: 18pt, secondary blue-gray text
- **Author/Institution/Date**: 13pt, secondary text, stacked with 6pt spacing
- **Overall feel**: Cinematic, left-anchored, Apple-keynote-inspired

### Section Slide (`new-section-slide`)

- **Background**: Dark navy (`palette.bg`), no header/footer
- **Layout**: Left-aligned, vertically centered, padded 40pt from left
- **Accent Element**: Short amber bar (40pt wide, 3pt tall, rounded) above heading
- **Text**: Section heading in light gray, 2em, semibold

### Content Slide (`slide`)

- **Background**: Dark navy (`palette.bg`)
- **Header**: Custom block (not a cell fill) with 2em horizontal inset. Section label in secondary gray at 0.65em, slide title in light gray at 1.4em medium, and a full-width amber line (1.5pt) underneath — creating a clean typographic hierarchy with an accent underline
- **Footer**: Three-column semantic grid. Optional configured footer content appears in secondary gray at left; the amber-colored page counter appears at right ("N / M")
- **Content Area**: Dark background, light text by default

### Focus Slide (`focus-slide`)

- **Background**: Amber (`palette.accent`) — inverted accent slide
- **Text**: Dark navy, 2em, bold, centered within an 80% width safety bound
- **Feel**: Eye-catching contrast reversal — amber overwhelms, dark text pops

### Ending Slide (`ending-slide`)

- **Background**: Dark navy (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Accent Elements**: Two short amber bars (60pt wide, 2pt tall, rounded) above and below the body text in one centered stack
- **Text**: Light gray, 2.5em, semibold

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Slate Card | `slate-card(title, body, accent: none)` | Dark purple card (`palette.card-bg`) with 3pt colored left border (default: amber) and 0.5pt dark violet border on other sides. Semibold amber title, light gray body text, 4pt rounded corners, and terminal `lazy-v(1fr)` for one-card-per-column height equalization |
| Badge | `badge(label, color: none)` | Small rounded pill (10pt radius) with colored fill (default: amber). Text is dark navy, 0.75em, bold. Inline element (`box`) for use within text flow |
| Accent Line | `accent-line()` | Full-width thin divider line (0.8pt) in amber at 60% transparency, wrapped in a block with 6pt vertical inset |

## Best Use Cases

- Tech product launches and developer keynotes
- Startup pitch decks with a modern, premium feel
- Software engineering and DevOps presentations
- Dark-mode-friendly environments (conference stages, dim rooms)
- Design system and UI/UX showcases
- Cybersecurity and data science presentations

## Recommended Complexity

**Plain** — The dark palette does the heavy lifting visually. Use `slate-card` for key points and `badge` for inline labels or tags. Avoid over-decorating — the amber-on-dark contrast is inherently dramatic. Code blocks are automatically styled for dark backgrounds, making this theme particularly effective for technical content with live code examples.
