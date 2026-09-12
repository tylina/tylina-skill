# Terrace Garden Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | terrace-garden |
| **Best For** | Architecture, landscape design, Mediterranean studies, cultural heritage, food/wine |
| **Style Objective** | Mediterranean / Architectural Garden |
| **Complexity Level** | Rich |

A sun-warmed Mediterranean terrace aesthetic. Standing on a limestone terrace overlooking a Tuscan hillside — olive branches, terracotta planters, archway columns, and warm golden-hour light. Academic yet culturally rich.

## Design Philosophy

- **Architectural Authenticity**: Arched columns, stone textures, and terracotta planters rendered as detailed SVG silhouettes
- **Mediterranean Warmth**: Olive-sage and terracotta color palette evokes Southern European landscapes
- **Limestone Texture**: Subtle stone grain pattern creates the feeling of sun-warmed masonry throughout
- **Garden Serenity**: Olive branch motifs and planter decorations bring organic life to structured layouts

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Limestone | `#FDF8F3` | Main background |
| Warm olive / stone | `#7B6B4E` | Primary accent and headers |
| Terracotta | `#C17040` | Secondary accent |
| Olive green | `#6B8E5A` | Botanical decoration and tags |
| Aged gold | `#B8964A` | Optional decorative accent |
| Dark text | `#3D3226` | Heading text |
| Body text | `#5C4E3E` | Body copy |
| Light text | `#8B7B68` | Captions and footer text |
| Stone | `#F0E8DC` | Card and focus-slide fill |
| Border | `#E5D9C8` | Borders |

## Typography

- **Body:** IBM Plex Serif with Georgia and Times New Roman fallbacks at 20pt in the demo
- **Code:** IBM Plex Mono with Menlo and Courier fallbacks
- **Ownership:** The deck selects installed font families; the reusable theme owns size, color, and hierarchy
- **Headings:** Semibold dark text with a terracotta accent line

## SVG Decorations

- **Olive branch**: Botanical branch with alternating leaves and small olive fruits
- **Stone texture**: Full-page limestone grain with mineral specks and fine cracks
- **Terracotta planter**: Decorative planter with lip, tapered body, and leaf accent
- **Tile pattern**: Mediterranean diamond and dot repeating floor tile pattern
- **Archway columns**: Two fluted columns connected by semicircular arch with keystone

## Slide Types

- `title-slide` — Archway frame, olive branches, stone texture, and centered title metadata
- `slide` — Limestone background, stone texture atmosphere, terracotta header accent, corner olive branches, and measured three-part footer
- `new-section-slide` — Large faint section number, section title, terracotta rule, and lower-right olive branch
- `outline-slide` — Centered contents composition with stone texture and an olive corner branch
- `focus-slide` — Warm stone background, olive framing, centered focal text, and terracotta diamond
- `ending-slide` — Bookend with title slide using the same archway and olive-branch language

## Components

- `stone-card(title, body, accent)` — Two-region card with an accent-tinted arch-top header
- `terrace-box(title, body)` — Content-sized callout with a terracotta left rule
- `olive-quote(body, attribution)` — Italic quotation with an olive ornament and attribution
- `garden-tag(label, color)` — Compact Mediterranean tag with a diamond marker
- `mosaic-divider(color, width)` — Diamond-and-dot SVG divider
- `arch-card(title, body, accent)` — Card framed by a rounded architectural header
- `timeline-point(year, body)` — Dated entry with a stone-path dot and connector
- `stat-card(value, label, accent)` — Planter icon, value, and label in one centered stack
- `comparison-table(align, headers, ..rows)` — Alternating limestone academic table
- `column-box(title, body)` — Content box with a pillar-like left rule
- `inscription(body)` — Centered small-caps stone inscription
