# Syntax Garden Theme

**Tier**: RICH
**Category**: Programming Education / Technical Tutorials
**Touying**: 0.7.4

## Description

A garden where code grows like plants. This theme uses a growing/branching tree metaphor where each lesson builds on previous ones, perfect for programming tutorials and coding workshops.

## Aesthetic

- Soft cream (#FDFCF7) background
- Deep forest green (#1B4332) primary text
- Leaf green (#40916C) accent
- Warm earth (#8B5E3C) secondary for stems/branches
- Organic shapes, rounded corners, leaf markers instead of bullets
- Subtle branch SVG in bottom-right of content slides
- Tree-frame SVG on title/ending slides

## Components

1. **seed-card** — Rounded card with leaf SVG icon before the title
2. **branch-step** — Numbered step with vertical stem line connecting steps
3. **root-block** — Code + explanation side by side (dark/light)
4. **leaf-tag** — Small organic pill badge
5. **vine-divider** — SVG branch/vine horizontal separator
6. **bloom-highlight** — Alert box with flower-bud SVG marker, colored left border
7. **canopy-quote** — Quote with organic curved left border

## Slide Types

- `title-slide` — Full tree-frame border
- `slide` — Standard content with branch-corner decoration
- `new-section-slide` — Section number with leaf marker
- `focus-slide` — Centered statement with organic frame
- `ending-slide` — Tree-frame with farewell message

## Entry Function

```typst
#show: syntax-garden-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer],
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    institution: [...],
    date: datetime(...),
  ),
)
```
