# Observatory Theme -- Design Specification

## Concept

Telescope dome / astronomical observatory aesthetic. Dome silhouettes against twilight sky, telescope tracking lines, eyepiece crosshairs, observation log paper. This is about the BUILDING and INSTRUMENTS of stargazing -- not constellations or star charts (that is the "celestial" theme). The feeling is precision instruments in a dome: intellectual, precise, warm copper meets cool steel.

## Color Palette

| Role | Hex | Description |
|------|-----|-------------|
| Background | #F0F4FA | Light twilight sky-blue |
| Primary | #1E3355 | Deep observatory blue (dome interior) |
| Accent | #B87333 | Copper/brass instrument color |
| Accent Text | #8A4A18 | Dark copper for small labels on light presets |
| Secondary | #546E7A | Cool slate (steel instrument body) |
| Text | #1A1A2E | Deep near-black for readability |
| Card | #FEFCF8 | Parchment/observation log paper |
| Dark BG | #0F1B2D | Deep night for dark-slide variant |
| Dark Text | #E8EDF3 | Light text for dark backgrounds |

## Presets

- **twilight** (default): Light sky background, copper accents -- the primary daytime/twilight feel
- **midnight**: Dark observatory blue background, light text -- nighttime observing session
- **dawn**: Warm parchment background, earthy copper -- end of night, logbook feel

## Typography

- Reusable theme entry: font-agnostic; the project/demo chooses the base family
- Verified demo family: Avenir Next; instrument labels: DejaVu Sans Mono
- Display: 40pt bold (titles)
- H1: 28pt bold (section headings)
- H2: 22pt bold (slide headings)
- Body: 16pt regular
- Small: 12pt
- Tiny: 9pt mono (labels, kickers)
- Meta: 8pt mono (footer metadata)

## SVG Decorations (5 complex SVGs)

1. **Dome Silhouette** (12 elements): Observatory dome profile with slit opening, support structure lines, and subtle internal detail. Used in title/ending slides for bookending.

2. **Telescope Crosshair** (10 elements): Eyepiece view with concentric circles and crosshair lines with tick marks. Used as corner atmosphere on content slides and inline ornament.

3. **Tracking Arcs** (11 elements): Curved lines suggesting celestial object tracking paths with scattered point markers. Used as persistent background atmosphere on dark slides.

4. **Eyepiece Reticle** (13 elements): Detailed finder scope view with concentric rings, cardinal tick marks, and diagonal references. Used as section number backdrop and component ornament.

5. **Observation Grid** (15 elements): Full-page coordinate grid with faint horizontal/vertical lines, dashed tracking curves, and center crosshair. Used as persistent background on ALL content slides.

## Slide Types

| Slide | Purpose | Key Features |
|-------|---------|--------------|
| title-slide | Opening | Dome silhouette, crosshair, full atmosphere, copper frame |
| new-section-slide | Section divider | Large reticle with number, AZ/ALT coordinate label |
| slide | Standard content | Observation grid bg, corner crosshairs, copper accents |
| dark-slide | Rhythm break | Deep blue bg, tracking arcs, copper pips |
| focus-slide | Statement | Tracking arcs bg, crosshair corners, italic quote |
| ending-slide | Closing | Dome silhouette (bookends title), reticle ornament |

## Components (9 observatory-named)

| Component | Pattern | Description |
|-----------|---------|-------------|
| dome-card | SVG-decorated card | Card with crosshair corner marks and copper border |
| eyepiece-stat | Stat with ornament | One centered reticle → value → label stack; no paragraph-flow spacers |
| tracking-box | SVG overlay content | Content area with tracking arc background |
| reticle-divider | Decorative divider | Line with copper pips and mini crosshair |
| zenith-tag | Tag/chip | Small instrument readout label |
| aperture-highlight | Bordered highlight | Copper left bar observation note style |
| logbook-note | Timestamp card | Observation log entry with time/observer header |
| azimuth-grid | Data table | Observation log table with grid styling |
| finder-badge | Badge/chip | Small badge with pip icon |

Components accept an optional `colors` palette so the public presets propagate to their surfaces and text. `dome-card` retains its terminal lazy-layout spacer, which is inert outside lazy layout; each lazy column contains exactly one direct stretchable card. Semantic one-row columns use `cols`, while the observation log and instrument inventory retain `grid` as intentional 2×2 matrices. `azimuth-grid` is a bare native `table` with an accessible header and row-fill callback.

## Structural Diversity

- **SVG-decorated**: dome-card (crosshair corners), eyepiece-stat (reticle ornament)
- **place()-overlay**: tracking-box (SVG background overlay)
- **Borderless**: aperture-highlight (copper left bar only)
- **Divider**: reticle-divider (horizontal separator)
- **Tag patterns**: zenith-tag, finder-badge (inline chips)

## Canvas-Level Requirements Met

- Dark-slide function with inverted colors (dark-bg + dark-text)
- Persistent background atmosphere on ALL content slides (observation-grid SVG)
- 5 inline SVGs with 10+ elements each
- Full-page SVG (observation-grid, 15 elements)
- Component structural diversity (6 distinct patterns)
- Bookending between title/ending slides (dome silhouette + copper frame)
- "Wow Moment" test: precision instrument aesthetic with warm copper
