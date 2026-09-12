# Prism Light Theme -- Design Specification

## Design Concept

**Prism Light** captures the moment white light passes through a crystal prism and splits into its constituent spectral colors. The theme treats the presentation canvas as an optics laboratory where scientific beauty becomes visible through physics.

### Core Metaphor
Light refraction through a crystal prism -- rainbow spectrum accents emerge from clean white surfaces, just as spectral colors emerge from dispersed white light.

### Mood & Tone
- Scientific precision with visual elegance
- Clean, analytical, illuminating
- The beauty of physics made tangible
- Professional yet intellectually engaging

### Target Use Cases
- Optics and photonics research presentations
- Physics and engineering talks
- Data visualization showcases
- Creative technology and algorithm presentations
- Scientific conferences and lab meetings

---

## Color System

### Philosophy
Colors are drawn directly from the visible electromagnetic spectrum. The primary color (violet) represents the shortest visible wavelength, while the secondary (red-orange) represents the longest. Mid-spectrum colors serve as tertiary and accent roles.

### Palette Definition

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Cool white | `#FCFCFE` | Near-pure white with faint blue shift (like a clean optical surface) |
| Primary | Violet | `#4A3FA8` | Shortest visible wavelength; high energy, scientifically significant |
| Secondary | Red-orange | `#D4543B` | Longest visible wavelength; warm counterpoint |
| Tertiary | Emerald green | `#1B8A6E` | Mid-spectrum; balance and harmony |
| Accent Blue | Blue | `#3B7DD8` | Blue spectrum band; trust and clarity |
| Accent Amber | Amber | `#D4890B` | Yellow-orange band; energy and attention |
| Text Dark | Violet-black | `#1E1E3C` | Deep enough for readability, violet-tinged for cohesion |
| Text Body | Violet-gray | `#3D3D5C` | Primary reading text; warm-cool balance |
| Text Muted | Violet-gray | `#686887` | WCAG-AA secondary information and captions |
| Card BG | Pure white | `#FFFFFF` | Maximum contrast for content cards |
| Border | Faint violet | `#E5E3F0` | Subtle structure without visual weight |
| Spectrum fill | Light violet | `#F5F3FA` | Tinted background for secondary surfaces |
| Blue Text | Dark blue | `#245EAA` | Accessible blue text on light surfaces |
| Cyan Text | Dark cyan | `#087785` | Accessible cyan text on light surfaces |
| Green Text | Dark green | `#0D755B` | Accessible green text on light surfaces |
| Amber Text | Dark amber | `#805100` | Accessible amber text on light surfaces |
| Orange Text | Burnt orange | `#A54124` | Accessible orange text on light surfaces |
| Red Text | Dark red | `#A83B29` | Accessible red text on light surfaces |

### Spectral Color Progression
Used for cycling/indexing across components:
1. Violet `#4A3FA8`
2. Indigo `#5B4FD4`
3. Blue `#3B7DD8`
4. Cyan `#1BA8B8`
5. Green `#1B8A6E`
6. Yellow `#D4890B`
7. Orange `#D4643B`
8. Red `#D4543B`

### Color Usage Rules
- Primary (violet) for titles, key accents, interactive elements
- Secondary (red-orange) for contrast, warnings, attention
- Tertiary (green) for success states, alternative accents
- Accent Blue for informational elements
- Accent Amber for highlights and emphasis
- Never use spectral colors at full saturation for large fills
- Background elements use 90-95% transparency
- Bright spectral colors are decorative; text-bearing components map them through `spectrum-text-color` to darker semantic variants

---

## Typography

### Hierarchy
| Level | Size | Weight | Color |
|-------|------|--------|-------|
| Slide title | 1.35em (27pt) | Bold | `text-dark` |
| Section title | 2.2em (44pt) | Bold | White (on violet) |
| Component title | 0.92-0.95em | Bold | Varies by component |
| Body text | 0.82em (16.4pt) | Regular | `text-body` |
| Muted/caption | 0.72-0.75em | Regular/Semibold | `text-muted` |
| Metric value | 1.7-2.2em | Bold | Component accent color |

### Font Stack
Fonts are set in `demo.typ` (not in theme entry) to allow user customization:
- Sans-serif: IBM Plex Sans, Noto Sans SC
- Base size: `set text(size: 20pt)` in theme entry

---

## Visual Language

### SVG Decorations (4 major elements)

1. **Prism Refraction** (`_prism-refraction-svg`)
   - Triangular prism shape with incoming white beam and 7 dispersed spectral output beams
   - Used on title/ending slides (bookend element)
   - 14 SVG elements: gradient-filled polygon, inner facet, input beam, 7 output beams, 2 focal points, 1 inner polygon

2. **Spectrum Gradient Bar** (`_spectrum-bar-svg`)
   - Full rainbow horizontal gradient from violet to red
   - Used as top border on content slides, headers, decorative separators
   - 8-stop linear gradient in rounded rectangle

3. **Light Ray Convergence** (`_light-rays-bg-svg`)
   - Subtle converging lines from top-left focal point (+ secondary set from bottom-right)
   - Persistent background atmosphere on all content slides
   - 15 elements: 8 primary rays, 4 secondary rays, 3 concentric arcs

4. **Wavelength Sine Wave** (`_wavelength-wave-svg`)
   - Overlapping sinusoidal waves at different frequencies (violet=tight, red=broad)
   - Represents electromagnetic wave nature of light
   - 10 elements: 4 sine wave paths, dotted baseline, 3 endpoint markers, amplitude indicators

### Additional SVG Elements

5. **Diamond/Crystal Icon** -- Faceted gem shape for insight-box accents
6. **Lens Rays** -- Converging/diverging lines through convex lens shape
7. **Photon Icon** -- Radiating star/particle symbol for notes

### Background Atmosphere
Every content slide includes `_bg-atmosphere()` which places the light ray convergence SVG at full page size. Opacity is kept very low (3-4%) to provide subtle depth without interfering with content readability.

---

## Component Architecture

### Structural Diversity (11 components)

| Component | Structure Type | Visual Character |
|-----------|---------------|------------------|
| `spectrum-card` | `stack(spacing:0pt)` header+natural body | Rainbow gradient top bar |
| `lens-box` | `block` with SVG overlay | Left accent + placed SVG decoration |
| `wavelength-tag` | Inline `box` pill | Colored dot + text tag |
| `refraction-divider` | Centered SVG | Pure decorative separator |
| `stat-card` | Centered `stack` in `block` | Diamond → value → label, bottom border |
| `code-card` | `stack(spacing:0pt)` header+body | Dark header with terminal dots |
| `beam-card` | `block` with left border | Simple colored left accent |
| `insight-box` | Borderless `block` | Diamond icon + no stroke |
| `comparison-table` | Bare configurable `table` | Violet header, alternating fills, caller-sized columns/text |
| `photon-note` | Inline `stack` | Icon + italic text, no border |
| `focus-card` | Centered `stack` in `block` | Lens → value → label metric |

### Design Principles
- **Not all blocks with fill+stroke**: Includes borderless (insight-box, photon-note), SVG-decorated (lens-box, stat-card, focus-card), tag/badge (wavelength-tag), divider (refraction-divider), and table types
- **Natural-height stability**: Cards do not consume remaining slide height; regular KPI matrices use `grid`, while narrative columns use `cols`
- **Adjacent colored blocks**: `code-card` and `spectrum-card` use `stack(spacing: 0pt)` for seamless header-body connection
- **SVG integration**: Components with placed SVG decorations use `place()` for overlay without affecting flow

---

## Slide Design

### Content Slide Layout
```
+--[spectrum bar (4pt)]---------------------------+
|                                                  |
|  Title (bold, text-dark)                        |
|  [violet][blue][green][amber] underline dots    |
|                                                  |
|  [ _bg-atmosphere: converging rays ]            |
|                                                  |
|  Content area (user content)                    |
|                                                  |
|                                                  |
+--[footer][spectral dots][page number]------------+
```

### Title Slide Layout (Bookend A)
```
+--[rainbow corner top-left]----------------------+
|                                                  |
|  [deep violet fill]                             |
|                                                  |
|       Title (white, bold, 2.3em)                |
|       Subtitle (white, translucent)             |
|       [blue][green][amber] separator            |
|       Author / Institution / Date               |
|                                                  |
|  [wavelength wave]     [prism refraction SVG]   |
|  ================================================|
|  [spectrum frame bar]                           |
|  [dots]                    [rainbow corner BR]  |
+--------------------------------------------------+
```

### Ending Slide Layout (Bookend B)
```
+--------------------------------------------------+
|  [spectrum frame bar]    [rainbow corner TR]    |
|                                                  |
|  [prism SVG               +---card---+          |
|   (mirrored side)]        | spectrum |          |
|                           | Title    |          |
|                           | diamond  |          |
|                           | dots     |          |
|                           +----------+          |
|                                                  |
|  [rainbow corner BL]                            |
+--------------------------------------------------+
```

### Bookending Strategy
Title and ending slides share:
- Rainbow corner accents (vertical colored bars in corners)
- Prism refraction SVG (right on title, left on ending)
- Spectrum gradient bar frame
- Spectral dots

These elements are NOT present on content slides, creating clear visual bookends.

---

## Spacing & Sizing

| Element | Value |
|---------|-------|
| Page margin (content) | top: 4em, bottom: 1.8em, x: 2em |
| Component inset | x: 1-1.2em, y: 0.7-1em |
| Card border radius | 6-8pt |
| Spectrum bar height | 3-4pt |
| Border stroke | 0.5-1pt |
| Left accent width | 3-4pt |
| Column gutter | 0.8-1.2em |
| Component spacing | 0.3-0.5em (v-spacing between components) |

---

## Accessibility Considerations

- Text contrast ratios exceed WCAG AA on all light content surfaces
- Primary text (`#3D3D5C` on `#FCFCFE`): ratio 10.14:1
- Bold text (`#1E1E3C` on `#FCFCFE`): ratio 15.69:1
- Muted text (`#686887` on `#FCFCFE`): ratio 5.23:1
- Mapped spectral text variants: at least 5.27:1 on white
- Spectral colors are used decoratively, not for conveying meaning alone
- Background atmosphere opacity is low enough to not interfere with readability
- Table alternating rows provide sufficient contrast difference

---

## Technical Implementation Notes

- All SVGs use `image(bytes(svg-string), ...)` pattern (NOT `image.decode`)
- SVGs defined at module level with a newline after each raw opener
- `std.align` used instead of bare `align` inside slide functions to avoid shadowing
- No `height: 100%` in flow containers; full-canvas uses are isolated inside `place()`
- Headers use `stack(spacing:)` for element composition
- Stat and focus cards use a single centered icon/value/label `stack(spacing:)`
- Inline circles are wrapped in `box()`
- Theme entry sets `set text(size: 20pt)` -- fonts set in demo only
