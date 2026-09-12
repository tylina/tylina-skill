# Ruled-Page Theme — Design Specification

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | ruled-page |
| **Best For** | Academic lab meetings, paper readings, research presentations |
| **Style Objective** | Academic Minimalism |
| **Complexity Level** | Plain |

## Design Philosophy

A freshly opened ruled notebook. The theme evokes the clarity and focus of handwritten lecture notes — warm off-white paper, ruled-line accents, pencil-gray text, and a single terracotta accent used with restraint. Beauty emerges from typography, whitespace, and a subtle ruled-line rhythm. No heavy decoration; content clarity is paramount.

## Color Palette

| Color | Name | HEX | `palette.key` | Purpose |
|-------|------|-----|---------------|---------|
| ◻️ | Paper | `#FFFEF9` | `palette.paper` | Warm off-white — slide background, notebook page |
| ⬛ | Text | `#4B4B4B` | `palette.text` | Pencil gray — body text |
| ⬛ | Dark | `#333333` | `palette.dark` | Darker pencil — titles, headings |
| ⚫ | Muted | `#707070` | `palette.muted` | Accessible pencil gray — metadata, footers, section labels (4.90:1 on paper) |
| ◻️ | Rule Line | `#E8E4DF` | `palette.rule-line` | Faint warm gray — horizontal ruled lines, dividers |
| 🟧 | Accent | `#C75C2A` | `palette.accent` | Terracotta — sparingly for emphasis rules, numbers, card borders |

## Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` (`#C75C2A`) | Theme accent, `alert()` text |
| `neutral-lightest` | `palette.paper` (`#FFFEF9`) | Light background reference |
| `neutral-darkest` | `palette.dark` (`#333333`) | Maximum contrast dark reference |

## Typography

| Property | Value |
|----------|-------|
| **Base Size** | 20pt |
| **Body Text Color** | `palette.text` (`#4B4B4B`) — set via `init` method |
| **Font** | Set in `main.typ`, not in template; demo uses verified `Libertinus Serif` + `Noto Serif SC` |
| **H2 Headings** | 26pt, medium, `palette.dark` — overridden via `init` |
| **Header Section Label** | 0.65em, `palette.muted` |
| **Header Title** | 1.4em, medium, `palette.dark` |
| **Footer** | 0.65em, `palette.muted` |

## Slide Type Designs

### Cover Slide (`title-slide`)

**Background:** Default `palette.paper` (`#FFFEF9`). Margins set to zero on all sides (full-bleed layout).
**Layout:** Left-aligned, vertically centered. Content padded 72pt horizontal, 56pt vertical.
**Title:** 38pt, bold, `palette.dark`.
**Decorative line:** A terracotta rule (80pt wide, 2.5pt stroke, `palette.accent`) immediately below the title.
**Subtitle:** 16pt, `palette.text`.
**Author/Institution/Date:** 13pt, `palette.muted`, stacked with 5pt spacing.
**Header/Footer:** None.

### Section Slide (`new-section-slide`)

**Background:** Default, margin 2em.
**Layout:** Left-aligned, vertically centered, padded 36pt from the left.
**Decorations:** A short terracotta rule (40pt wide, 2pt stroke) above the heading text.
**Title:** 32pt, semibold, `palette.dark`. Displays current level-1 heading.
**Header/Footer:** None.

### Content Slide (`slide`)

**Header:** A structured stack within a 2em horizontal / 0.8em top / 0.5em bottom inset block. Section name in 0.65em `palette.muted`, then the slide title in 1.4em medium `palette.dark`, then a terracotta underline (100% width, 1.2pt, `palette.accent`).
**Footer:** Three-column semantic grid in 0.65em `palette.muted`, padded 2em horizontal and 0.6em bottom. Optional configured footer content appears at left; the page counter appears at right.
**Content area:** `palette.paper` background, margin top 3em, bottom 2em, x 2em. Header and footer ascent/descent both 0pt.

### Focus Slide (`focus-slide`)

**Background:** `palette.paper` (`#FFFEF9`), margin 2em.
**Text:** `palette.dark`, 1.8em, bold. Centered horizontally and vertically. Width constrained to 80%.
**Header/Footer:** None.
**Purpose:** Clean emphasis on a single key insight.

### Ending Slide (`ending-slide`)

**Background:** `palette.paper` (`#FFFEF9`), margin 2em.
**Text:** `palette.dark`, 2.2em, semibold. Centered horizontally and vertically beneath a 60pt terracotta rule that bookends the cover.
**Header/Footer:** None.

## Component Inventory

| Component | Signature | Visual Description |
|-----------|-----------|-------------------|
| Ruled Card | `ruled-card(title, body)` | Left-bordered card with 2.5pt `palette.accent` left stroke and opaque `palette.paper` fill. Title in 1.05em semibold `palette.dark`. 14pt left inset, 10pt vertical inset. Ends with `lazy-v(1fr)` for one-card-per-column height equalization. |
| Margin Note | `margin-note(body)` | Left-bordered note block with 1.5pt `palette.muted` left stroke. Italic text in 0.9em `palette.text`. For asides and commentary. |
| Divider | `divider()` | A 100%-width horizontal line in 0.6pt `palette.rule-line` inside a block with 8pt vertical inset. Mimics ruled notebook lines without sequential spacer nodes. |
| Enum Styling | `set enum(numbering: ...)` | Numbered list via native `+` syntax. Large bold terracotta-colored numbers (22pt, `palette.accent`). Configured globally via `set enum` in theme init. |

## Decorative Elements (Plain Tier)

- **0 SVG decorations** — plain themes use only CSS-like lines/rules
- **2 decorative elements total**: terracotta accent rule (header underline, title decoration) and faint ruled-line dividers
- Content-first approach: academic material presented with maximum clarity

## Best Use Cases

- Academic lab meeting presentations
- Paper reading group discussions
- Research progress updates
- Thesis proposal presentations
- Any context requiring clean, focused content delivery

## Recommended Complexity

**Plain** — This is a deliberately understated theme. Its warmth comes from the notebook-paper color and terracotta accent, not from decoration. Typography and whitespace carry the visual weight. The ruled-line motif provides subtle texture without competing with content.
