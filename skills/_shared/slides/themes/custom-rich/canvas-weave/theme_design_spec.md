# Canvas Weave — Design Specification

## Concept

**Canvas Weave** is a presentation theme inspired by woven fabric and canvas texture aesthetics. It embodies the philosophy that natural fibers woven into structured patterns create both beauty and durability — a metaphor for thoughtful brand building and sustainable business practices.

The visual language draws from:
- Artisan weaving studios and handloom workshops
- Natural canvas and linen textures
- Warp and weft thread structures
- Celtic and craft knot motifs
- Earth-tone material palettes

## Visual Identity

### Color System (Light Theme)

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Natural canvas white | `#FBF9F5` | Warm off-white mimicking unbleached canvas |
| Primary | Warm taupe/brown | `#6B5B4E` | Natural undyed fiber color, professional weight |
| Secondary | Golden thread | `#A0784C` | The highlight thread in a weave, warmth and richness |
| Tertiary | Forest weave green | `#5B7B6B` | Natural plant-dyed thread, growth and sustainability |
| Text (headings) | Deep charcoal brown | `#2D2922` | Near-black with warmth, not cold grey |
| Text (body) | Warm dark brown | `#4A443B` | Comfortable reading color, organic feel |
| Text (muted) | Deep warm grey | `#726860` | Captions and metadata with AA contrast on light surfaces |
| Cards | Pure white | `#FFFFFF` | Clean card surfaces for content clarity |
| Borders | Woven edge | `#DDD5C8` | Subtle warm border mimicking woven selvedge |
| Canvas fill | Weave tone | `#F2EDE5` | Slightly darker than background for layering |

### Typography

- **Headings:** 1.4em, semibold, text-dark color
- **Body:** 20pt base, text-body color, regular weight
- **Captions/metadata:** 0.78em, text-muted color
- **KPI values:** 2em bold with accent color
- **Font choice delegated to demo.typ** (theme sets size only)

### SVG Decorative System

Six module-level SVG definitions provide the theme's visual texture:

1. **Crosshatch Weave** (800x450): Full-page background texture featuring interlocking horizontal warp and vertical weft thread lines with slight organic waviness. Uses very low opacity (0.04-0.07) for subtlety.

2. **Thread Corner** (120x120): Flowing fiber lines that emanate from a corner point, creating a gentle arc of 3 parallel threads at decreasing opacities. Small dots mark thread intersections.

3. **Loom Frame** (800x450): Double rectangular border with emphasized corner joints — thick line segments forming L-shapes at each corner with filled circles at the join points. Includes small woven scallop patterns along top and bottom edges.

4. **Knot Motif** (40x40): Interlocking oval/circle pattern resembling a Celtic or weaver's knot. Features crossing paths that create an over-under illusion with a central filled circle.

5. **Loom Divider** (300x16): Horizontal separator with interweaving sine waves (two layers at different phases) punctuated by small circles and squares at regular intervals.

6. **Swatch Icon** (24x24): Miniature fabric swatch — a small square with grid lines representing warp and weft, used as an inline icon for notes and tags.

### Decorative Principles

- **Subtlety over spectacle:** Background textures at 4-7% opacity
- **Organic imperfection:** Thread paths use cubic bezier curves with slight waviness
- **Corner emphasis:** Decorations concentrate at corners, leaving center clear for content
- **Consistent vocabulary:** All decorations relate to weaving/textile craft
- **Bookending:** Title and ending slides share loom frame + thread corners; content slides use only subtle atmosphere

## Slide Architecture

### Title Slide
- Full crosshatch weave background texture
- Loom frame border (thick outer + thin inner rectangle with corner joints)
- Thread corner decorations at all 4 corners (90pt size)
- Knot motifs flanking center (left and right horizon)
- Centered title stack: title, subtitle, loom divider, author, institution, date
- No header/footer, zero margin (full bleed)

### Section Slide
- Crosshatch background
- Left panel (28% width) with primary color transparent fill (90%)
- Vertical golden thread line at panel edge
- Knot motif centered in left panel
- Thread corner at top-right
- Section number (large, faded) at top-left
- Section title right of divider with golden accent underline

### Content Slide
- `_bg-atmosphere()`: crosshatch weave + thread corners (top-left, bottom-right)
- Header: slide title with golden thread underline (55pt, 2.5pt height)
- Footer: left text + woven square dots (center) + page number (right)
- Content area with standard margins (top: 4em, bottom: 1.5em, x: 2em)

### Focus Slide
- Solid primary (taupe) background
- Crosshatch texture in canvas-white at 50% transparency
- Knot motifs at top-left and bottom-right corners
- Subtle rectangular frame line (88% x 76%)
- Centered white text at 2em, semibold

### Ending Slide
- Full crosshatch background
- Loom frame border (matching title — bookend)
- Thread corners at top-left and bottom-right (matching title)
- Knot motifs at top-right and bottom-left
- Centered farewell text + loom divider + knot trio

### Outline Slide
- Crosshatch background
- Knot motif decoration top-right
- Title + golden accent line + outline content
- Clean, minimal structure

## Component Design System

### Structural Categories

The 11 components span 6 structural types:

| Type | Components | Description |
|------|-----------|-------------|
| **Stacked header+body** | `woven-card` | `stack(spacing: 0pt)` for colored header strip above white body |
| **Left-bordered callout** | `thread-box`, `insight-box` | Left accent border with filled background |
| **SVG-decorated metric** | `metric-card` | Centered value with SVG knot above |
| **Borderless/icon** | `swatch-note` | No fill/stroke, grid layout with icon |
| **Tag/pill** | `fiber-tag` | Inline rounded pill with icon |
| **Separator** | `loom-divider` | Pure SVG divider, no container |

Additional structural types:
- `framework-card`: Top-bordered card with square bullet header
- `comparison-table`: Full table with alternating rows
- `timeline-card`: Grid layout with circular marker and connector
- `quote-weave`: Left-bordered italic block with Unicode quote mark

### Height Equalization

All block-level components include `#lazy-v(1fr)` at the end of their body content. This ensures equal heights when components are placed side-by-side in `cols` or `composer` layouts.

### Color Customization

Most components accept an `accent` parameter allowing per-instance color override:
- Default accents are spread across primary, secondary, and tertiary
- This enables visual variety within consistent structural patterns

## Business Suitability

### Target Use Cases
- Craft brand strategy presentations
- Sustainability/ESG reporting
- Consulting firm pitches
- Agency creative reviews
- Artisanal product launches
- B Corp and impact business communications

### Professional Signals
- Warm but restrained palette (no bright saturated colors)
- Structured grid layouts with clear hierarchy
- Data visualization through metric cards and comparison tables
- Timeline and framework components for strategic communication
- Quotation styling for testimonials and endorsements

### NOT Suitable For
- High-energy startup pitches (too calm)
- Technical/engineering deep-dives (too organic)
- Finance/banking (too informal for traditional finance)
- Medical/healthcare (wrong color associations)

## Technical Implementation Notes

1. **Touying 0.7.4 patterns:** Uses `touying-slide-wrapper`, `config-page`, `config-store`, `utils.merge-dicts`
2. **SVG rendering:** All SVGs defined as raw strings via ` ```...```.text `, rendered with `image(bytes(svg.replace("currentColor", color.to-hex())), ...)`
3. **Alignment safety:** Uses `std.align` inside slide functions to avoid shadowing Touying's `align` parameter
4. **No height: 100%:** Flow containers use `lazy-v(1fr)` for flexible sizing
5. **Stack for adjacency:** `stack(spacing: 0pt)` used in `woven-card` for seamless header-body join
6. **Stack for headers:** Header elements use `stack(spacing: .8em)` not `v()`
7. **Background persistence:** `_bg-atmosphere()` called in every content slide's `setting` function
8. **Bookending symmetry:** Title and ending slides share loom frame + thread corners, creating visual closure
