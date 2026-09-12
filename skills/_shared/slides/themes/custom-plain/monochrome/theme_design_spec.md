# Monochrome Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | monochrome |
| **Best For** | Minimalist presentations, editorial, typography-focused talks |
| **Style Objective** | General Versatile |
| **Complexity Level** | Plain |

## Design Philosophy

A rigorous, typographically-driven design rooted in the Swiss/International Style. The theme strips away all color to let structure, contrast, and whitespace do the talking. Thick black rules, sharp 0-radius corners, and a deliberate inverse weight hierarchy create an authoritative, no-nonsense visual language. Every pixel of decoration must earn its place — if it doesn't clarify, it doesn't exist.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| ⬛ | Black | `#212121` | `palette.black` | Near black — titles, body text, card borders |
| ⬛ | Dark | `#424242` | `palette.dark` | Dark gray — subtitles, numbered-list figures |
| ⚫ | Medium | `#616161` | `palette.medium` | Accessible medium gray — section labels, footer, metadata |
| 🔘 | Light | `#E0E0E0` | `palette.light` | Light gray — divider line strokes |
| ⬜ | Lighter | `#F5F5F5` | `palette.lighter` | Very light gray — (available for user content) |
| ⬜ | White | `#FAFAFA` | `palette.white` | Off-white — default slide background |

Additionally defined outside the palette:
| Color | Name | HEX | Variable | Purpose |
|-------|------|-----|----------|---------|
| ⬛ | Pure Black | `#000000` | `pure-black` | Absolute black — thick rules, vertical bars, focus/ending backgrounds |
| ⬜ | Pure White | `#FFFFFF` | `pure-white` | Absolute white — focus/ending slide text |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.black` (`#212121`) | Theme accent, `alert()` text |
| `neutral-lightest` | `palette.white` (`#FAFAFA`) | Light background reference |
| `neutral-darkest` | `pure-black` (`#000000`) | Maximum contrast dark reference |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | `palette.black` (`#212121`) — set via `init` method |
| **Font** | Set in `main.typ`, not in template; demo uses `Helvetica Neue` with `Arial` fallback |
| **Cover / Section** | 44pt / 38pt, light (300), `palette.black` |
| **H2 Headings** | 27–28pt, medium (500), `palette.black` |
| **Header Section Label** | 0.7em, `palette.medium` |
| **Header Title** | ~0.91em (0.7em × 1.3em), bold, `palette.black` |
| **Footer** | 0.7em, `palette.medium` |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Default `palette.white` (`#FAFAFA`). Margins set to zero on all sides (full-bleed layout).
**Layout:** Left-aligned, vertically centered. Content padded 80pt horizontal, 60pt vertical.
**Title:** 44pt, light (300), `palette.black`.
**Decorative line:** A thick black rule (120pt wide, 3pt stroke, `pure-black`) immediately below the title.
**Subtitle:** 18pt, `palette.dark`.
**Author/Institution/Date:** 14pt, `palette.medium`, stacked with 6pt spacing.
**Header/Footer:** None.
**Design note:** The full-bleed zero-margin layout is distinctive — content is precisely placed with manual padding rather than page margins.

### Section Slide (`new-section-slide`)

**Background:** Default, margin 2em.
**Layout:** Left-aligned, vertically centered, padded 40pt from the left.
**Decorations:** A tall vertical black bar (4pt × 64pt, `pure-black`) and the heading form a stable two-column grid with a 20pt gap.
**Title:** 38pt, light (300), `palette.black`. Displays current level-1 heading.
**Header/Footer:** None.

### Content Slide (`slide`)

**Header:** A structured stack within a 2em horizontal / 0.8em top / 0.6em bottom inset block. Section name is 0.7em medium gray; the slide title is independently set to 1.35em / medium (500), followed by a thick black underline (100% width, 2.5pt, `pure-black`).
**Footer:** A stable three-column grid carries an optional left label and right-aligned page counter in 0.7em accessible gray, padded 2em horizontal and 0.6em bottom.
**Content area:** `palette.white` background, margin top 3em, bottom 2em, x 2em. Header and footer ascent/descent both 0pt.

### Focus Slide (`focus-slide`)

**Background:** Solid `pure-black` (`#000000`), margin 2em.
**Text:** `pure-white`, 2em, light (300). Centered horizontally and vertically within an 80%-width measure.
**Header/Footer:** None.
**Purpose:** Maximum-contrast emphasis — black on white, nothing else.

### Ending Slide (`ending-slide`)

**Background:** Solid `pure-black` (`#000000`), margin 2em.
**Text:** `pure-white`, 2.5em, light (300). Centered horizontally and vertically within an 80%-width measure.
**Header/Footer:** None.
**Design note:** Slightly larger text than focus-slide (2.5em vs 2em) for a strong closing statement.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Mono Card | `mono-card(title, body)` | Card with 1.5pt `palette.black` border on all sides, no fill, no radius (sharp corners), 14pt inset. Title in 1.05em semibold `palette.black`. Purely structural — the border is the only decoration. |
| Quote Block | `quote-block(body, author: none)` | Left-border blockquote: 4pt `pure-black` left stroke, 20pt left inset. Body in italic `palette.dark`. Optional author line prefixed with em-dash, in 0.85em normal-style `palette.medium`. |
| Divider | `divider()` | A simple 100%-width horizontal line in 0.8pt `palette.light`. 8pt vertical padding above and below. |
| Enum Styling | `set enum(numbering: ...)` | Numbered list via native `+` syntax. Large semibold dark numbers (24pt, `palette.dark`). Configured globally via `set enum` in theme init. |
| Code Styling | automatic `show raw` rules | Sharp-cornered `palette.lighter` panel with a 3pt black left rule and deliberately monochrome syntax. |

## Best Use Cases

- Formal business presentations and board reports
- Architecture and design portfolio reviews
- Academic defenses and thesis presentations
- Legal and consulting pitch decks
- Any context where visual restraint signals authority

## Recommended Complexity

**Plain** — This is an intentionally austere theme. Its power comes from what it removes, not what it adds. There are no colors, no gradients, no rounded corners, and no decorative shapes. Typography and structure carry the entire visual weight.
