# Sundial Brass Theme — Visual Design Specification

## Design Philosophy

The Sundial Brass theme evokes the world of astronomical instruments and precision timekeeping. It draws from the visual language of sundials, armillary spheres, clock mechanisms, and celestial cartography. The design balances scholarly elegance with mechanical precision, creating an atmosphere of intellectual rigor and temporal beauty.

## Visual World

- **Primary inspiration:** Sundial hour lines radiating from a gnomon point
- **Secondary motifs:** Clock gear teeth, armillary sphere concentric rings, celestial arc curves
- **Texture elements:** Brass engraving cross-hatching, Roman numeral markers, graduated tick scales
- **Material references:** Aged brass/bronze patina, polished ivory surfaces, dark navy enamel

## Color Palette

### Primary Colors
| Role | Name | Hex | RGB | Usage |
|------|------|-----|-----|-------|
| Background | Warm Ivory | `#FDFAF3` | 253, 250, 243 | Page/slide background |
| Primary | Aged Brass | `#8B6914` | 139, 105, 20 | Primary accents, borders, ornaments |
| Secondary | Deep Navy | `#1B2B4A` | 27, 43, 74 | Secondary accents, contrast elements |
| Accent | Patina Green | `#4A7C59` | 74, 124, 89 | Tertiary highlights, growth/nature |
| Text | Warm Charcoal | `#2D2A26` | 45, 42, 38 | Primary body text |

### Supporting Colors
| Role | Name | Hex | Usage |
|------|------|-----|-------|
| Card Background | Off-White | `#FFFDF7` | Component card fills |
| Deep Ivory | Parchment | `#F8F5EC` | Alternative backgrounds, focus slides |
| Border | Aged Linen | `#E8DFC8` | Card/component borders |
| Muted Text | Warm Gray | `#6B6560` | Captions, footer, secondary text |
| Light Brass | Gold Brass | `#B8941F` | Lighter brass variant |
| Muted Navy | Slate Blue | `#3B4D6B` | Subtitles, muted navy elements |
| Shadow | Warm Sand | `#D4C9A8` | Subtle shadow tones |

## Typography

- **Demo font:** Libertinus Serif — elegant, proportioned serif for academic tone
- **CJK fallback:** Noto Serif SC
- **Monospace recommendation:** DejaVu Sans Mono — for code and technical content
- **Ownership:** Font selection is applied by `demo.typ`/downstream decks, not by the reusable theme entry point
- **Base size:** 18pt
- **Weight hierarchy:**
  - Titles: Bold, 2.4em
  - Section headers: Bold, 2.0em
  - Slide headers: Bold, 1.3em
  - Component titles: Bold/Semibold, 0.92em
  - Body text: Regular, 0.82em
  - Captions/muted: Regular, 0.72-0.75em

## SVG Visual Elements

### 1. Sundial Background (Full-page, persistent)
- Radiating hour lines from a gnomon point at bottom-left (120, 400)
- 12 radiating lines spanning the slide at varying angles
- Celestial arc curves (navy, very faint) crossing horizontally
- Armillary ring arcs in top-right (patina green, ghostly)
- Gear tooth marks along bottom edge
- All elements at very low opacity (0.04-0.08) for atmosphere

### 2. Bookend Frame (Title + Ending slides)
- Double brass border with rounded corners
- Gear teeth along top and bottom edges (17 teeth each)
- Corner ornaments: concentric circles (armillary style)
- Central armillary sphere rings (brass outer, tilted navy ecliptic, patina equatorial)
- Radiating lines from center gnomon point
- Shared between title and ending slides for visual bookending

### 3. Dial Divider (Section separators)
- Gnomon dot at left origin
- Three radiating lines at slightly different angles
- Tick marks at regular intervals along main line
- Terminal dot at right end
- Width: 300px, Height: 16px

### 4. Gnomon Pointer (Metric indicator)
- Sundial face arc at bottom
- Hour marks around the arc
- Bold shadow line from gnomon base
- Central gnomon base with ivory center dot
- Size: 48x48px

### 5. Gear Border (Component decoration)
- Continuous brass bar background
- Repeating rectangular gear teeth (14 teeth)
- Width: 200px, Height: 8px

### 6. Armillary Rings (Feature decoration)
- Outer celestial sphere ring (brass)
- Ecliptic ring tilted 23.5 degrees (navy)
- Equatorial ring (patina green)
- Meridian ring (brass, narrow)
- Polar axis line with pole markers
- Central pivot point
- Size: 64x64px

### 7. Cross-Hatch Pattern (Texture)
- Diagonal lines in both directions
- Varying opacity for depth
- Tileable 40x40px pattern
- Evokes brass engraving technique

### 8. Celestial Arc (Quote decoration)
- Sinusoidal curves representing celestial paths
- Star-point markers along curves
- Three terminal/midpoint dots
- Width: 240px, Height: 32px

## Component Design Patterns

### hour-card
- Left border: 3pt accent color
- Remaining borders: 1pt aged linen
- Radiating line accents at top-left (2 lines, decreasing opacity)
- Brass dot + title row
- Card background fill
- Radius: 4pt

### gnomon-stat
- Top border: 3pt accent color
- Compact two-part row: gnomon pointer + large value, then label metadata
- Semibold label with optional muted description alongside the metric
- Radius: bottom 4pt only

### gear-box
- No outer colored border (1pt standard border)
- Gear-teeth SVG at top and bottom (full width)
- Square indicator dot + title in accent color
- Ivory fill background
- Radius: 4pt with clip

### meridian-quote
- Left border: 4pt navy
- Celestial arc SVG above quote text
- Italic text styling
- Optional attribution in muted weight
- Radius: right 4pt only

### epoch-tag
- Capsule shape (radius: 2pt, more angular than round)
- Lightened fill (88% lighter)
- 1pt border in semi-transparent accent
- Square dot + serif-font text
- Inline element for tag rows

### armillary-box
- 1.5pt border in semi-transparent accent
- Armillary rings ornament at top-right (28pt)
- Accent-lightened background (94%)
- Short accent bar separator below title
- Radius: 6pt

### chronometer-list
- Numbered circles alternating brass/navy
- White text on colored circles
- Standard card background and border
- 6pt vertical spacing between items
- Radius: 4pt

### engraving-card
- Left border: 3pt accent
- Cross-hatch pattern overlay (subtle, clipped)
- Square indicator dot + title
- Standard padding over pattern
- Radius: 4pt with clip

## Slide Layouts

### Title Slide
1. Warm ivory fill
2. Sundial background atmosphere (radiating lines)
3. Bookend frame overlay (gear teeth, armillary corners)
4. Centered: armillary rings (48pt) + title + dial divider + subtitle + author + institution + date

### Content Slide
1. Warm ivory fill
2. Persistent sundial atmosphere (radiating lines, corner dots)
3. Header: bold title + dial divider (160pt width)
4. Footer: left text + brass dot + right page numbers
5. Content area with horizon alignment

### Section Slide
1. Warm ivory fill
2. Sundial atmosphere
3. Left brass accent bar (4pt)
4. Gear border at top edge
5. Gnomon pointer ornament (top-right)
6. Roman numeral section number (3.5em brass)
7. Dial divider + section title
8. Bottom accent line

### Focus Slide
1. Deep ivory fill
2. Sundial atmosphere
3. Four corner brass/navy/patina dots
4. Centered content (72% width)
5. Dial divider below content

### Ending Slide
1. Warm ivory fill
2. Sundial atmosphere
3. Bookend frame (shared with title — visual bookend)
4. Centered: armillary rings (52pt) + farewell text + dial divider + brass bar

## Spacing Conventions
- Component internal padding: x: 1em, y: 0.8em
- Column gutter: 1.0-1.2em
- Between components: 0.4-0.5em vertical spacing
- Header inset: x: 1.5em, top: 0.6em
- Footer inset: x: 1.5em, y: 0.4em
- Page margin: top: 4em, bottom: 2em, x: 2.2em

## Design Principles
1. **Precision over decoration** — Every visual element references a real instrument feature
2. **Warm materiality** — Colors evoke aged brass, ivory, and patina rather than pure digital colors
3. **Radiating structure** — Hour lines create visual flow from bottom-left gnomon outward
4. **Temporal rhythm** — Components echo clockwork regularity and graduated scales
5. **Scholarly restraint** — Rich detail at low opacity; never overwhelming the content
