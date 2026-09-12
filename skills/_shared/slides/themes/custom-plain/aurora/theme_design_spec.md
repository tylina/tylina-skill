# Aurora Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | aurora |
| **Best For** | Creative presentations, product launches, design showcases |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A dramatic dark theme inspired by the Aurora Borealis (Northern Lights), featuring vibrant green-to-purple-to-cyan gradient accents against a deep near-black background. The interplay of luminous gradients on darkness evokes the ethereal glow of polar skies, creating a modern, high-impact visual style. Ideal for tech conferences, creative showcases, and any presentation that demands a bold, futuristic atmosphere.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟢 | Aurora Green | `#00E676` | `palette.green` | Primary accent — headings, section text, card titles, page counter |
| 🟣 | Aurora Purple | `#7C4DFF` | `palette.purple` | Secondary accent — gradient midpoint, card border gradients |
| 🔵 | Aurora Cyan | `#00BCD4` | `palette.cyan` | Tertiary accent — gradient endpoint, inline code text |
| ⚫ | Deep Space | `#0a0e17` | `palette.bg` | Page background — near-black base |
| 🔵 | Card Background | `#141b2d` | `palette.card-bg` | Card/component fill — dark navy |
| 🔵 | Border | `#1e2a3a` | `palette.border` | Card borders, code block stroke |
| ⚪ | Text Primary | `#E8EAF6` | `palette.text-primary` | Main body text — off-white lavender |
| 🩶 | Text Secondary | `#78909C` | `palette.text-secondary` | Subtitles, footer text, descriptions |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.green` (`#00E676`) | Theme accent, `alert()` text, headings |
| `secondary` | `palette.purple` (`#7C4DFF`) | Gradient midpoints |
| `tertiary` | `palette.cyan` (`#00BCD4`) | Gradient endpoints |
| `neutral-lightest` | `palette.text-primary` (`#E8EAF6`) | Light text on dark backgrounds |
| `neutral-darkest` | `palette.bg` (`#0a0e17`) | Dark base for backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Font** | `New Computer Modern` with `Libertinus Serif` fallback (set in `demo.typ` / consuming deck) |
| **Headings** | Green (`palette.green`), with medium/semibold hierarchy and bold reserved for the cover |
| **Code Blocks** | Dark fill (`#0d1117`), border `palette.border`, text `#c9d1d9` |
| **Inline Code** | Dark fill (`#0d1117`), text in cyan (`palette.cyan`) |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Deep space (`palette.bg`) — the default page fill
- **Layout**: Centered vertically and horizontally, 90% width
- **Title**: Large (2.4em), bold, rendered with a `gradient.linear(green → purple → cyan)` fill — the text itself glows with aurora colors
- **Decoration**: A horizontal gradient line (green → purple → cyan, 50% width, 2pt) below the title
- **Subtitle**: Displayed in `text-secondary` at 1.2em
- **Author**: `text-primary`, standard size
- **Institution**: `text-secondary`, 0.9em
- **Date**: `text-secondary`, 0.85em

### Section Slide (`new-section-slide`)

- **Background**: Default deep space
- **Layout**: Centered vertically and horizontally
- **Decoration**: Two green accent lines (30% width, 2pt) — one above and one below the heading
- **Section Title**: 2em, semibold, green (`palette.green`)
- **Mood**: Clean break with glowing green accents framing the section name

### Content Slide (`slide`)

- **Background**: Deep space (`palette.bg`)
- **Header**: Block with section name (0.65em, `text-primary`) on first line, slide title (1.6em, medium) on second line. Below the header, a full-width gradient accent line (green → purple → cyan, 2pt)
- **Footer**: Padded 0.5em, `text-secondary` at 0.7em for custom footer content (left), green current-slide number (right)
- **Content Area**: Vertically centered light text (`text-primary`) on dark background, margins top 4.5em / bottom 2em / x 2em

### Focus Slide (`focus-slide`)

- **Background**: `palette.bg.darken(30%)` — even darker than the standard background
- **Text**: Green (`palette.green`), 2em, semibold, centered
- **Margin**: 2em all sides
- **Purpose**: Maximum emphasis — glowing green text on an ultra-dark void

### Ending Slide (`ending-slide`)

- **Background**: `palette.bg` (standard deep space)
- **Layout**: Centered vertically and horizontally
- **Decoration**: Gradient line above (green → purple → cyan, 40% width) and gradient line below (cyan → purple → green, 40% width) — a mirrored gradient pair
- **Text**: `text-primary`, 2em, semibold
- **Spacing**: 1em between decorative lines and text

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Aurora Card | `aurora-card(title, body, accent: none)` | Dark card (`palette.card-bg`) with a gradient left border (accent → purple, 3pt, 90deg) and thin borders on other sides. Accent-colored medium title, off-white body text. Rounded corners (4pt). |
| Feature Grid | `feature-grid(items)` | 2-column grid of cards. Each card has a gradient top border (green → purple, 2pt), dark fill (`palette.card-bg`), thin side/bottom borders. Green bold title, `text-secondary` description. Items are dicts with `title` and `desc` keys. |
| Gradient Line | `gradient-line(width: 100%)` | Decorative horizontal line (2pt) filled with `gradient.linear(green, purple, cyan)`. Configurable width. |

## Best Use Cases

- Technology conference keynotes and product launches
- Developer and engineering team presentations
- Creative showcases and portfolio reviews
- Startup pitch decks with a futuristic edge
- Data science and AI research presentations

## Recommended Complexity

**Plain** — Aurora relies on a strong dark palette, clear typography, and restrained gradient rules. Use the card and feature-grid helpers selectively; ordinary headings, lists, and columns should remain the default content language.
