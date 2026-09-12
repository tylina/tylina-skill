# Nordic Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | nordic |
| **Best For** | Design-oriented presentations, Scandinavian aesthetics, clean layouts |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

Inspired by Scandinavian design principles — functional beauty, restrained elegance, and respect for whitespace. The theme channels the quiet confidence of a well-designed IKEA catalog or a Copenhagen architecture studio. Muted blue-grays pair with a soft teal accent to create a calm, professional atmosphere where content breathes and structure speaks clearly without shouting.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| 🔵 | Primary | `#37474F` | `palette.primary` | Blue-gray dark — titles, focus slide background |
| 🔵 | Secondary | `#546E7A` | `palette.secondary` | Blue-gray medium — subtitles, ending slide background |
| 🟢 | Accent | `#80CBC4` | `palette.accent` | Teal-green — accent lines and card top bars |
| 🟢 | Accent Text | `#2F7772` | `palette.accent-text` | Text-safe teal — contact text, list markers, code rules |
| ⬜ | Background | `#ECEFF1` | `palette.bg` | Cool light gray — default slide background |
| ⬜ | Card BG | `#FFFFFF` | `palette.card-bg` | White — card body fill |
| 🟤 | Warm | `#BCAAA4` | `palette.warm` | Warm gray-brown — separator lines, warm contrast |
| ⬛ | Text Dark | `#263238` | `palette.text-dark` | Very dark blue-gray — primary body text |
| 🔵 | Text Light | `#546E7A` | `palette.text-light` | Accessible blue-gray — metadata, footer, labels |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.primary` (`#37474F`) | Theme accent, `alert()` text |
| `secondary` | `palette.secondary` (`#546E7A`) | Secondary elements |
| `neutral-lightest` | `white` | Light text on dark backgrounds (focus/ending slides) |
| `neutral-darkest` | `palette.text-dark` (`#263238`) | Body text on light backgrounds |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | `palette.text-dark` (`#263238`) |
| **Font** | Set in `main.typ`, not in template; demo uses installed `Avenir Next` with `Avenir` / `Arial` fallbacks |
| **Header Title** | 1.2em, medium weight, `palette.text-dark` |
| **Footer** | 0.65em, `palette.text-light` |
| **Section Label** | 0.8em, medium (500), `palette.text-light`, tracked 0.15em, uppercase |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Inherited `palette.bg` (`#ECEFF1`).
**Layout:** Left-aligned, vertically centered. Generous padding: 4em horizontal, 2em vertical.
**Title:** 2.4em, `palette.primary`, semibold (600).
**Decorative line:** A teal accent line (8em fixed width, 2pt stroke, `palette.accent`) below the title.
**Subtitle:** 1.1em, `palette.secondary`.
**Author/Institution/Date:** 0.85em, accessible `palette.text-light`, stacked with 0.5em spacing.
**Contact:** 0.85em, text-safe `palette.accent-text`.
**Header/Footer:** None (uses default page config — no explicit removal, but no header/footer functions defined for this slide).
**Design note:** The left-aligned layout with large padding creates an asymmetric, airy composition typical of Scandinavian editorial design.

### Section Slide (`new-section-slide`)

**Background:** Inherited `palette.bg`.
**Layout:** Left-aligned, vertically centered, padded 4em horizontal.
**Structure (top to bottom):**
1. A small label "SECTION" in 0.8em `palette.text-light`, tracked at 0.15em, uppercase — a typographic detail that adds structure without weight.
2. The section heading in 2em `palette.primary`, medium (500).
3. A short teal accent line (5em, 1.5pt, `palette.accent`).
**Design note:** The "SECTION" label in small caps with wide tracking is a distinctly Nordic typographic touch.

### Content Slide (`slide`)

**Header:** Padded 2em horizontal, 1em top, 0.4em bottom. Slide title in 1.2em medium-weight `palette.text-dark`, followed by a thin teal accent line (100% width, 0.5pt, `palette.accent`).
**Footer:** Padded 2em horizontal, 0.5em vertical. A very thin separator block sits above a stable three-column footer grid. Left side: custom footer in accessible `palette.text-light` at 0.65em. Right side: page counter with slash separator ("N / M") in `palette.text-light`.
**Content area:** `palette.bg` background, margin top 3.5em, bottom 2em, x 2em. Header ascent 30%, footer descent 30%.

### Focus Slide (`focus-slide`)

**Background:** Solid `palette.primary` (`#37474F`), margin 2em.
**Text:** White, 1.8em, light weight. Centered horizontally and vertically.
**Header/Footer:** None.
**Design note:** Uses light font weight (not bold) — a deliberate Nordic choice that lets the message land softly rather than aggressively.

### Ending Slide (`ending-slide`)

**Background:** Solid `palette.secondary` (`#546E7A`), margin 2em.
**Layout:** Centered vertically and horizontally.
**Text:** White, 2em, medium (500).
**Decorations:** A short teal accent line (4em, 1pt, `palette.accent`) below the text.
**Header/Footer:** None.
**Design note:** Uses `secondary` (lighter gray) instead of `primary` for the background, creating a softer closing compared to the focus slide.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Hygge Card | `hygge-card(title, body)` | White card (`palette.card-bg`) with 6pt radius, subtle border (0.5pt, `palette.bg` darkened 8%), clipped. A 3pt-tall teal accent bar (`palette.accent`) touches the card body through `stack(spacing: 0pt)`. Title is 0.95em semibold `palette.primary`; body is `palette.text-dark`; `lazy-v(1fr)` supports one-card-per-column equalization. |
| Native List Styling | theme-level `set list` | Standard `-` lists receive a semibold dash marker in text-safe `palette.accent-text`; no generic list wrapper is exposed. |
| Separator | `separator()` | A thin 100%-width horizontal line in `palette.warm` (`#BCAAA4`) at 0.4pt. The warm gray-brown tone adds a subtle temperature contrast against the cool palette. |
| Code Styling | automatic `show raw` rules | Inline code uses a white chip; block code uses a white rounded panel with a 3pt text-safe teal left rule while retaining Typst's built-in syntax highlighting. |

## Best Use Cases

- Technical talks and engineering presentations
- Academic lectures and research presentations
- Design reviews and UX case studies
- Startup pitch decks with a Scandinavian aesthetic
- Any context that values clarity, calm, and understated professionalism

## Recommended Complexity

**Plain** — The theme is intentionally restrained. Its beauty comes from proportion, whitespace, and a carefully limited accent palette. Decorative elements are minimal: thin lines, a single accent color, and clean geometric cards. The visual complexity is low by design.
