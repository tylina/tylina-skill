# Aurora Prism — Visual Design Specification

## Theme Identity
**Metaphor**: Northern lights refracted through crystal
**Tier**: Rich
**Best for**: Academic conference talks (ICML, NeurIPS, AAAI oral/spotlight)

## Color Palette
| Role | Color | Hex |
|------|-------|-----|
| Background | Pure White | #FFFFFF |
| Text | Deep Charcoal | #2C2C2C |
| Primary Accent | Indigo | #3F51B5 |
| Secondary | Violet | #7C4DFF |
| Highlight | Amber | #FF8F00 |
| Muted | Cool Gray | #78909C |

## Typography
- Base: 18pt, Noto Sans
- Headings: Bold, deep charcoal
- Accent text: Indigo

## Decorative Elements
- Aurora gradient bar (top edge of content slides): 5pt height SVG gradient (blue→indigo→violet→amber)
- Crystal geometric pattern (title/ending frame): angular facets
- Clean, restrained — aurora gradient is the signature element

## Component Inventory
1. `prism-card` — left indigo border, no fill
2. `aurora-stat` — large number + gradient underline
3. `refraction-highlight` — rainbow top-edge block
4. `beam-tag` — inline indigo pill
5. `spectrum-divider` — SVG rainbow gradient line
6. `crystal-quote` — rainbow gradient left border quote
7. `data-panel` — white card for charts

## Slide Types
- Title: Full aurora band + crystal frame
- Section: Indigo number + aurora accent line
- Content: Subtle aurora bar at top, persistent atmosphere
- Focus: Centered text on white, aurora band emphasis
- Ending: Crystal frame bookending with title
