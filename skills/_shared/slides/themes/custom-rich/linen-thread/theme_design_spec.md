# Linen Thread -- Design Specification

## Concept

**Linen Thread** is a presentation theme inspired by handwoven textiles, natural fiber, weaving looms, embroidery samplers, and the warmth and precision of textile craft. The visual language evokes the intersection of material culture and intellectual rigor -- making it ideal for humanities, social science, and cultural studies presentations.

The theme's name deliberately avoids explicit "academic" labeling while providing the structure and gravitas expected in scholarly contexts.

The visual language draws from:
- Handloom weaving studios and warp/weft structures
- Cross-stitch and running-stitch embroidery samplers
- Natural fiber textures (linen, cotton, wool)
- Weaving shuttles and bobbins as craft tools
- Pulled thread work and drawn-thread techniques
- Fabric texture grids and crosshatch patterns

## Visual Identity

### Color System (Light Theme)

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Natural off-white/cream | `#FDFBF7` | Warm unbleached linen ground |
| Primary | Indigo blue | `#2C4F7C` | Traditional plant-based textile dye, scholarly depth |
| Secondary | Terracotta/rust | `#B85C3C` | Natural iron-oxide dye, warmth and emphasis |
| Accent | Sage green | `#6B8E6B` | Plant/woad tones, organic calm |
| Text (headings) | Warm charcoal | `#2E2B26` | Near-black with organic warmth |
| Text (body) | Warm dark grey | `#4A4540` | Comfortable reading, not cold |
| Text (muted) | Mid warm grey | `#8A8279` | Captions and metadata |
| Cards | Pure white | `#FFFFFF` | Clean surfaces for content |
| Borders | Warm border | `#E2DAD0` | Soft woven-edge feel |
| Linen fill | Off-cream | `#F4EFE7` | Layering tone, slightly darker than bg |

### Typography

- **Headings:** 1.4em, semibold, text-dark color
- **Body:** 20pt base, text-body color, regular weight
- **Captions/metadata:** 0.78em, text-muted color
- **KPI values:** 2em bold with accent color
- **Font choice delegated to demo.typ** (theme sets size only)
- **Weight hierarchy:** Clean modern sans with medium weight steps

### SVG Decorative System

Five module-level SVG definitions provide the theme's visual texture:

1. **Woven Texture** (800x450): Full-page background with 17 horizontal warp thread paths and 16 vertical weft thread paths. Each path uses cubic bezier curves for organic waviness. Alternating stroke widths (0.5/0.4pt) and opacities (0.06/0.05 horizontal, 0.04/0.035 vertical) create depth and fiber-like variety. Total: 33 path elements.

2. **Embroidery Frame** (800x450): Double rectangular border (outer 1.5pt, inner 0.6pt) with elaborate cross-stitch corner patterns. Each corner features three overlapping X-marks at decreasing sizes/opacities, plus small circle accents. Running-stitch patterns along top and bottom edges. Total: 40+ elements.

3. **Thread Divider** (300x16): Horizontal pulled-thread effect with main thread (1.2pt), secondary thinner thread (0.6pt), three fraying fiber ends on each side at different angles, and four stitch-mark circles along the length. Total: 11 elements.

4. **Stitch Accent** (80x12): Running-stitch line with 7 dash segments, 6 small dot markers between dashes, and chevron end-caps on both sides. Creates a hand-stitched header underline effect. Total: 15 elements.

5. **Shuttle Motif** (40x20): Stylized weaving shuttle with two concentric ellipses, central bobbin circle, thread exit lines on both ends, interior leaf-shaped thread wraps, and vertical warp indicators. Total: 10 elements.

### Decorative Principles

- **Subtlety over spectacle:** Background textures at 3.5-6% opacity
- **Organic imperfection:** Thread paths use cubic bezier curves with slight waviness
- **Corner emphasis:** Cross-stitch ornaments concentrate at corners, leaving center clear
- **Consistent vocabulary:** All decorations relate to weaving/textile/embroidery craft
- **Bookending:** Title and ending slides share embroidery frame + shuttle motifs
- **Stitch rhythm:** The running-stitch accent creates visual rhythm without weight

## Slide Architecture

### Title Slide
- Full woven texture background
- Embroidery frame border with cross-stitch corners (bookend element)
- Shuttle motifs flanking center (left and right horizon)
- Centered title stack: title, subtitle, thread divider, author, institution, date
- No header/footer, zero margin (full bleed)

### Section Slide
- Woven texture background
- Left panel (28% width) with primary color transparent fill (92%)
- Vertical terracotta thread line at panel edge
- Shuttle motif centered in left panel
- Stitch accent at top-right
- Section number (large, faded) at top-left
- Section title right of divider with stitch accent underline

### Content Slide
- `_bg-atmosphere()`: woven texture + stitch accent (top-right) + shuttle (bottom-left)
- Header: slide title with terracotta stitch accent underline
- Footer: left text + shuttle motif (center) + page number (right)
- Content area with standard margins (top: 4em, bottom: 1.5em, x: 2em)

### Focus Slide
- Solid indigo (primary) background
- Woven texture in cream at 50% transparency
- Stitch accents at top-left and bottom-right corners
- Shuttle motifs flanking left and right
- Subtle rectangular frame line (88% x 76%)
- Centered cream text at 2em, semibold

### Ending Slide
- Full woven texture background
- Embroidery frame border (matching title -- bookend)
- Shuttle motifs at top-right and bottom-left
- Centered farewell text + thread divider + shuttle trio

### Outline Slide
- Woven texture background
- Shuttle motif decoration top-right
- Title + stitch accent + outline content
- Clean, minimal structure

## Component Design System

### Structural Categories

The 9 components span these structural types:

| Type | Components | Description |
|------|-----------|-------------|
| **Stacked header+body** | `weave-card` | `stack(spacing: 0pt)` for linen header strip above white body |
| **Left-bordered callout** | `thread-box` | Left accent border with tinted background |
| **SVG-decorated metric** | `sampler-stat` | Centered value with stitch accent above |
| **Bordered quote** | `loom-quote` | Left-bordered italic block with Unicode quote mark |
| **Tag/pill** | `stitch-tag` | Inline rounded pill |
| **Separator** | `fiber-divider` | Pure SVG thread divider |
| **Featured box** | `tapestry-box` | Top+bottom accent borders with shuttle motif header |
| **Numbered list** | `bobbin-list` | Circular numbered indicators with thread connectors |
| **Framework card** | `pattern-card` | Top-bordered card with square bullet header |

### Lazy Multi-column Layouts

In `cols(lazy-layout: true, ...)`, each column contains one direct stretchable card component. `weave-card` and `pattern-card` end with `lazy-v(1fr)` to match their heights; this spacer is inert in ordinary flow layouts.

### Color Customization

Most components accept an `accent` parameter allowing per-instance color override:
- Default accents are spread across primary, secondary, and accent colors
- This enables visual variety within consistent structural patterns

## Academic Suitability

### Target Use Cases
- Humanities conference presentations
- Social science research talks
- Textile/material culture research
- Cultural studies and heritage studies
- Education and pedagogy presentations
- Ethnographic research reports
- Qualitative research findings
- Arts-based research dissemination

### Professional Signals
- Natural, warm palette suggests approachability and depth
- Structured grid layouts with clear hierarchy
- Data visualization through sampler-stat metrics
- Bobbin-list for sequential/process information
- Quotation styling for participant voices and literary references
- Thread/stitch decorations signal craft and care without frivolity

### NOT Suitable For
- Corporate finance presentations (too organic/warm)
- High-energy startup pitches (too calm and scholarly)
- Technical engineering deep-dives (wrong aesthetic register)
- Medical/clinical presentations (inappropriate color associations)

## Technical Implementation Notes

1. **Touying 0.7.4 patterns:** Uses `touying-slide-wrapper`, `config-page`, `config-store`, `utils.merge-dicts`
2. **SVG rendering:** All SVGs defined as raw strings via ` ```...```.text `, rendered with `image(bytes(svg.replace("currentColor", color.to-hex())), ...)`
3. **Alignment safety:** Uses `std.align` inside slide functions to avoid shadowing Touying's `align` parameter
4. **Lazy columns:** Each lazy column has one direct stretchable card; card spacers are inert outside lazy layouts
5. **Stack for adjacency:** `stack(spacing: 0pt)` used in `weave-card` for seamless header-body join
6. **Stack for headers:** Header elements use `stack(spacing: .8em)` not `v()`
7. **Background persistence:** `_bg-atmosphere()` called in every content slide's `setting` function
8. **Bookending symmetry:** Title and ending slides share embroidery frame + shuttle motifs
