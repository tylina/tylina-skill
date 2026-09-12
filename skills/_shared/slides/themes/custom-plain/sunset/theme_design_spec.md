# Sunset Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | sunset |
| **Best For** | Creative presentations, warm-toned designs, storytelling |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A warm, gradient-rich theme inspired by the vibrant colors of a sunset sky — deep amber, orange, golden yellow, and deep purple. The design is energetic and expressive, using bold gradients and decorative sun motifs to create an emotional, storytelling-friendly atmosphere. It bridges warmth and drama, making it ideal for motivational talks, creative showcases, and presentations that need to inspire.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🟠 | Deep Amber | `#FF6F00` | `palette.primary` | Bright decorative orange, gradient starts, short rules, sun accents |
| 🟤 | Deep Burnt Orange | `#B54708` | `palette.primary-deep` | Accessible orange text, badges, Touying primary mapping, focus gradient endpoint |
| 🟠 | Amber | `#FF8F00` | `palette.secondary` | Gradient endpoints, ending-slide background |
| 🟣 | Deep Purple | `#6A1B9A` | `palette.tertiary` | Focus-slide gradient, decorative circles, purple card accent |
| 🟨 | Warm Cream | `#FFF8E1` | `palette.bg` | Slide background |
| ⬜ | White | `#FFFFFF` | `palette.card-bg` | Card backgrounds |
| 🟡 | Golden Yellow | `#FFD54F` | `palette.accent-warm` | Callout backgrounds/borders, decorative sun circles, section divider lines |
| ⬛ | Dark Brown | `#3E2723` | `palette.text-dark` | Primary body text, ending-slide text |
| 🟫 | Brown | `#795548` | `palette.text-light` | Secondary text, footer text, subtitle |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary-deep` (`#B54708`) | Accessible theme accent and `alert()` text |
| `secondary` | `palette.secondary` (`#FF8F00`) | Secondary Touying role |
| `tertiary` | `palette.tertiary` (`#6A1B9A`) | Tertiary Touying role |
| `neutral-lightest` | `white` | Light text on dark backgrounds |
| `neutral-darkest` | `palette.text-dark` (`#3E2723`) | Dark text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Font** | Set in `main.typ`, not in template |
| **Header Section Label** | 0.6em, medium, warm brown on cream |
| **Header Slide Title** | 1.25em, semibold, dark brown on cream |
| **Section Slide Text** | 2em, semibold, italic, deep burnt orange |

## Slide Type Designs

### Cover Slide (`title-slide`)

- **Background**: Warm cream (`palette.bg`)
- **Decorations**: Three translucent circles evoking a sun and sky — large golden-yellow circle (3.5em radius, 70% transparent) and smaller amber circle (2em, 80% transparent) at top-right, plus a small purple circle (1.5em, 85% transparent) at bottom-left
- **Title Block**: Wide rounded rectangle (85% width, 8pt radius) filled with a horizontal gradient from primary orange to secondary amber. Title text is dark brown, 2em, bold, centered for reliable contrast across both gradient endpoints
- **Subtitle**: Text-light brown, 1.2em, below block
- **Author**: Bold, dark text
- **Date/Institution**: Text-light, stacked below

### Section Slide (`new-section-slide`)

- **Background**: Warm cream (`palette.bg`)
- **Layout**: Centered vertically and horizontally
- **Top Accent**: Orange bottom-border line (30% width, 3pt)
- **Text**: Section heading in deep burnt orange, 2em, semibold, italic
- **Bottom Accent**: Golden-yellow bottom-border line (20% width, 2pt)
- **Feel**: Elegant asymmetry with two accent lines of different widths and colors

### Content Slide (`slide`)

- **Background**: Warm cream (`palette.bg`)
- **Header**: Open typographic stack on cream: a warm-brown section label, dark-brown semibold slide title, and a short primary-to-secondary gradient rule. This keeps the sunset signature without a dominant full-width title bar
- **Footer**: Three-part grid with footer content on the left, a short gradient rule in the center, and page counter on the right ("N / M")
- **Content Area**: Cream background, configurable alignment

### Focus Slide (`focus-slide`)

- **Background**: Diagonal gradient from accessible deep burnt orange to tertiary purple (135°) — the dramatic sunset gradient
- **Text**: White, 1.8em, centered within a width-constrained block
- **Feel**: The most visually striking slide — captures the full sunset color spectrum

### Ending Slide (`ending-slide`)

- **Background**: Secondary amber (`palette.secondary`)
- **Text**: Dark brown (`palette.text-dark`), 2em, bold, centered
- **Feel**: Warm, inviting close with high-contrast dark text on amber

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Warm Card | `warm-card(title, body, accent: none)` | Left-bordered card (4pt accent border) with very light tinted background (accent lightened 92%). Bold title in accent color, body text below. 4pt rounded corners. Default accent: deep burnt orange |
| Timeline Item | `timeline-item(year, title, description)` | Two-column layout: left column has a rounded pill badge (14pt radius) with year text in white on deep burnt orange; right column has bold dark title and lighter description text. Ideal for milestone sequences |
| Callout | `callout(body, icon: "!")` | Rounded box (6pt radius) with golden-yellow background (lightened 60%) and 1.5pt golden-yellow border. Left side has a circular icon badge (deep burnt orange fill, white bold text). Body text in dark brown on the right. Grid layout |

## Best Use Cases

- Motivational and inspirational talks
- Creative portfolio showcases and art presentations
- Storytelling and narrative-driven presentations
- Travel and adventure content
- Startup vision and mission presentations
- Event and conference keynotes
- Education and workshop materials with a warm tone

## Recommended Complexity

**Plain** — Lead with typography, whitespace, and the warm cream/orange palette. Use `timeline-item`, `warm-card`, and `callout` selectively when the content benefits from them; ordinary headings, lists, and `cols` remain the default authoring pattern. The short gradient rules and title-slide sun circles provide identity without requiring decorative canvas composition.
