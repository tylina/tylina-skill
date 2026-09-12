# Reading Lamp Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | reading-lamp |
| **Best For** | Reading groups, seminar talks, paper discussions |
| **Style Objective** | Academic Intimate |
| **Complexity Level** | Plain |

## Design Philosophy

"Reading under a warm desk lamp." The theme evokes the quiet focus of a late-night reading session — warm cream paper, dark ink, and the single amber glow of a lamp. Beauty comes from warm typography, generous whitespace, and restraint. No SVG decorations, no gradients, no visual noise. Content is king. The single amber accent line acts as the "lamp" — a warm focal point that guides the eye without competing with the text.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| Cream | Cream | `#FBF7F0` | `palette.cream` | Warm off-white slide background |
| Brown-black | Ink | `#2C2417` | `palette.ink` | Primary text, headings, body |
| Amber | Amber | `#C67A1B` | `palette.amber` | Single accent — title underlines, card borders, numbered items |
| Dark brown | Ink Light | `#5C4A35` | `palette.ink-light` | Subtitle, card body text |
| Warm gray | Ink Muted | `#80684C` | `palette.ink-muted` | Accessible metadata, footer, annotation text |
| Pale warm | Rule Faint | `#E8DFD2` | `palette.rule-faint` | Divider strokes, card outer borders |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.amber` (`#C67A1B`) | Theme accent, `alert()` text |
| `neutral-lightest` | `palette.cream` (`#FBF7F0`) | Light background reference |
| `neutral-darkest` | `palette.ink` (`#2C2417`) | Maximum dark reference |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | `palette.ink` (`#2C2417`) — set by the theme entry point |
| **Font** | Set in `main.typ`, not in template; demo uses installed Charter with Iowan Old Style / Georgia fallbacks |
| **H2 Headings** | 1.1em (22pt at the 20pt base), semibold (600), `palette.ink` |
| **Header Section Label** | 0.65em, medium (500), `palette.ink-muted` |
| **Header Title** | 1.1em, semibold (600), `palette.ink`; sized independently from the label |
| **Footer** | 0.65em, `palette.ink-muted` |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Default `palette.cream`. Margins set to zero (full-bleed).
**Layout:** Left-aligned, vertically centered. Content padded 80pt horizontal, 60pt vertical.
**Title:** 38pt, semibold (600), `palette.ink`.
**Decorative line:** A warm amber rule (100pt wide, 2.5pt, `palette.amber`) below the title.
**Subtitle:** 16pt, `palette.ink-light`.
**Author/Institution/Date:** 13pt, accessible `palette.ink-muted`, stacked with 0.8em spacing.
**Header/Footer:** None.

### Section Slide (`new-section-slide`)

**Background:** Default, margin 2em.
**Layout:** Left-aligned, vertically centered, padded 50pt from left. A two-cell grid aligns the fixed bar and heading without overlap hacks.
**Decorations:** A vertical amber bar (3pt x 50pt, `palette.amber`) with an 18pt gutter before the heading.
**Title:** 32pt, medium (500), `palette.ink`. Displays current level-1 heading.
**Header/Footer:** None.

### Content Slide (`slide`)

**Header:** Structured 0.8em stack in a 2.4em horizontal / 0.9em top / 0.5em bottom inset block. Section name is independently sized at 0.65em medium in `palette.ink-muted`, followed by a 1.1em semibold title in `palette.ink` and an 80pt x 2pt amber rule block.
**Footer:** Stable `grid(columns: (1fr, auto, 1fr))` with optional footer content at left and page counter at right, all in accessible 0.65em `palette.ink-muted`; padded 2.4em horizontal and 0.6em bottom.
**Content area:** `palette.cream` background, margin top 3.2em, bottom 2em, x 2.4em. Header and footer ascent/descent both 0pt.

### Focus Slide (`focus-slide`)

**Background:** `palette.cream`, margin 2em.
**Text:** `palette.ink`, 1.6em, medium (500). Centered horizontally and vertically. Width constrained to 70%.
**Header/Footer:** None.
**Purpose:** A single powerful statement, width-limited for readability.

### Ending Slide (`ending-slide`)

**Background:** `palette.cream`, margin 2em.
**Text:** `palette.ink`, 2.2em, medium (500). Centered.
**Decoration:** 60pt amber rule below text.
**Header/Footer:** None.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Lamp Card | `lamp-card(title, body)` | Card with 3pt amber left border and 0.8pt `rule-faint` border on other sides. Faint cream fill (1% darker). Title in 1.05em semibold `palette.ink`; body in 0.9em `palette.ink-light`; one terminal `lazy-v(1fr)` supports exactly one direct card per lazy column. |
| Margin Quote | `margin-quote(body, author: none)` | Left-border blockquote: 3pt amber left stroke, 20pt left inset. Body and optional author form a measured stack; body is italic 0.95em `palette.ink-light`, author follows a true em dash in accessible 0.8em `palette.ink-muted`. |
| Paper Divider | `paper-divider()` | Horizontal line in 0.6pt `palette.rule-faint` inside one block with 8pt vertical inset; no sequential spacer calls. |
| Enum Styling | `set enum(numbering: ...)` | Numbered list via native `+` syntax. Semibold amber numbers (20pt, `palette.amber`). Configured globally by the theme entry point. |
| Annotation | `annotation(body)` | Small note block with 2% darker cream fill, 0.5pt faint border, 2pt radius. Text in 0.85em `palette.ink-muted`. |

## Best Use Cases

- Academic reading groups and paper discussions
- Seminar talks surveying recent literature
- Thesis/dissertation proposal presentations
- Book chapter summaries
- Any context where text clarity and warmth are paramount

## Recommended Complexity

**Plain** — This theme achieves its warmth through color and spacing, not decoration. Zero SVG elements. Zero gradients. The single amber accent line is the only decorative element beyond typography. Content-first design where the text is the presentation.
