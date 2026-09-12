# Signal Wave Theme - Design Specification

## Concept

**Signal Wave** is a radio/audio waveform aesthetic theme inspired by radio observatories, sound studios, and signal processing labs. The world presented is one where invisible signals are made visible through elegant waveform traces. The design is dynamic yet precise, technical yet beautiful.

## Visual Identity

### Metaphor
- Radio observatory / sound studio
- Oscilloscope displays and spectrum analyzers
- Invisible electromagnetic waves rendered as flowing curves
- Technical precision meets aesthetic elegance

### Mood
- Clean and technical
- Data-driven and precise
- Professional yet engaging
- Light and open (NOT dark/hacker aesthetic)

## Color Palette

| Token | Hex | RGB | Usage |
|-------|-----|-----|-------|
| Background | `#F7F9FC` | 247, 249, 252 | Cool light gray-blue page fill |
| Primary | `#2E5090` | 46, 80, 144 | Deep signal blue - headers, accents |
| Secondary | `#E85D3A` | 232, 93, 58 | Warm frequency orange - highlights |
| Secondary Text | `#B33F25` | 179, 63, 37 | Text-safe orange - small labels and callout titles |
| Tertiary | `#3A8C6E` | 58, 140, 110 | Green signal - success, nature accent |
| Text Dark | `#1A2744` | 26, 39, 68 | Deep navy - titles, headings |
| Text Body | `#3D4F6B` | 61, 79, 107 | Slate blue - body copy |
| Card BG | `#FFFFFF` | 255, 255, 255 | Pure white card surfaces |
| Border | `#D8E2F0` | 216, 226, 240 | Soft blue borders |
| Wave BG | `#EDF2F9` | 237, 242, 249 | Light wave fill, alternating rows |
| Terminal BG | `#1E2A3F` | 30, 42, 63 | Terminal code surface |
| Terminal Title | `#A0B4D0` | 160, 180, 208 | Terminal title text |
| Terminal Meta | `#7F92AF` | 127, 146, 175 | Terminal metadata text |
| Terminal Text | `#C8D8EC` | 200, 216, 236 | Terminal body text |

### Color Relationships
- Primary + Secondary: Complementary cool/warm contrast
- Background + Card: Subtle depth layering (cool gray vs pure white)
- Text hierarchy: Dark navy titles > slate blue body > muted accents

## Typography

- **Base size**: 20pt (set in theme entry)
- **Fonts**: Set by user in demo file (verified demo stack: IBM Plex Sans, Arial, PingFang SC)
- **Title slides**: 2.2em bold
- **Section slides**: 2em bold
- **Slide headers**: 1.2em semibold
- **Component titles**: 0.8em bold
- **Component body**: 0.75em regular
- **Tags/labels**: 0.65em medium
- **Footer**: 0.55em regular

## SVG Decorations

### 1. Oscilloscope Grid (`_oscilloscope-grid-svg`)
Full-page background grid mimicking oscilloscope display:
- Minor grid: 48px spacing, 0.25px stroke, 6% opacity
- Major grid: 192px spacing, 0.5px stroke, 10% opacity
- Frequency axis labels (left edge): 1kHz, 2kHz, 4kHz, 8kHz, 16kHz
- Time axis labels (bottom): 10ms, 20ms, 30ms, 40ms
- Center crosshair marker

### 2. Multi-Frequency Sine Waves (`_sine-waves-svg`)
Overlapping waveforms at different frequencies:
- Fundamental (primary blue): 1.2px, 6% opacity
- 2nd harmonic (orange): 0.8px, 5% opacity
- 3rd harmonic (green): 0.6px, 4% opacity
- Amplitude envelope (dashed): 0.4px, 3% opacity
- Phase markers: 1.5px dot at grid intersections

### 3. Frequency Spectrum Bars (`_spectrum-bars-svg`)
Vertical bar chart visualization (17 bars):
- Varying heights representing frequency magnitudes
- Color-coded: primary blue, secondary orange, tertiary green accents
- Rounded corners (rx: 1)
- Used in headers and as inline decoration

### 4. Antenna/Signal Tower (`_antenna-tower-svg`)
Radio transmission tower icon:
- Vertical mast with diagonal support struts
- Cross braces at intervals
- Signal emission arcs (3 levels, decreasing opacity)
- Tip indicator dot with surrounding ring

### 5. Waveform Frame (`_waveform-frame-svg`)
Full-page decorative border for bookend slides:
- Double border (outer 1.8px, inner 0.5px)
- Sine wave integrated along top and bottom borders
- Corner frequency dots (blue and orange)
- Signal strength indicator bars (top-right corner)

### 6. Sine Wave Divider (`_wave-divider-svg`)
Horizontal separator element:
- Two overlapping waves (primary + secondary)
- Phase markers at key points
- Used between content sections

### 7. Pulse Line (`_pulse-line-svg`)
ECG/heartbeat-style sharp peaks:
- Three pulse groups with flat baseline between
- Sharp up-down transitions
- Baseline reference line underneath

### 8. Noise Pattern (`_noise-pattern-svg`)
Scattered dot pattern representing signal noise:
- 15 dots at varying sizes (0.5-0.9px radius)
- Random positioning in 40x40 viewport
- Multi-color (primary, secondary, tertiary, text)
- Various opacities (0.15-0.3)

## Layout Structure

### Background Atmosphere
Every content slide features persistent background via `_bg-atmosphere`:
1. Oscilloscope grid (full coverage)
2. Multi-frequency sine waves (full coverage)
Combined effect: subtle technical graph-paper feel

### Bookending Strategy
Title slide and ending slide share:
- Waveform frame border
- Antenna tower decorations (left-bottom + right-top)
- Enhanced sine wave atmosphere
These elements are NOT present on content slides.

### Content Slides
- Header: Title text + horizontal border line
- Body: Content with atmosphere background
- Footer: Footer text | wave-divider icon | page number

### Section Slides
- Full oscilloscope grid background
- Left accent band (6px primary)
- Large section title with wave divider below
- Spectrum bars decoration (bottom-right)

### Focus Slides
- Full primary-blue background
- Enhanced (doubled opacity) sine wave overlay
- Large centered white text

## Component Taxonomy

### Structural Diversity (11 components)

| Component | Structure | Visual Type |
|-----------|-----------|-------------|
| `frequency-card` | `stack(spacing:0pt)` header + body | SVG-decorated card |
| `spectrum-box` | opaque block with placed SVG spectrum marker | Side-accent box |
| `signal-tag` | inline `box` | Badge/tag |
| `wave-divider` | standalone block | SVG divider |
| `stat-card` | single block with SVG | Metric display |
| `code-block` | `stack(spacing:0pt)` header + body | Terminal container |
| `channel-card` | block with grid header | Multi-accent card |
| `insight-box` | left-border block | Callout |
| `comparison-table` | bare `table` with fill/stroke callbacks | Data table |
| `pulse-card` | `stack(spacing:0pt)` SVG-top + body | Pulse-decorated card |
| `noise-note` | grid with SVG icon | Borderless note |

### Height Equalization
Flexible card-style components end with `#lazy-v(1fr)` for one-card-per-column use in `cols(lazy-layout: true)`. Mixed-component columns use ordinary `cols`; native `grid` is reserved for fixed internal structures and does not participate in lazy height equalization.

### Adjacent Blocks
Components with colored headers (frequency-card, code-block, pulse-card) use `stack(spacing: 0pt)` to eliminate gaps between header and body blocks.

## Technical Implementation

### Touying 0.7.4 Patterns
- Entry function: `signal-wave-theme` using `touying-slides.with(config-*())` pattern
- Slide wrapper: All slide functions use `touying-slide-wrapper(self => { ... })`
- Config merge: `utils.merge-dicts(self, config-page(...))` for overrides
- Store: `config-store(title: none, align: align, footer: footer)`

### Critical Conventions
- `std.align` used inside slide functions (avoids parameter shadowing)
- No `height: 100%` in flow containers
- SVG rendering: `image(bytes(svg-string), width: ..., height: ...)`
- SVG definition: Module-level `let` bindings with ```.text` syntax
- Content-block API: `#component[title][body]` pattern
- Outline implementation: native `outline(title: none, depth: 1)`

## Target Audience

- Signal processing engineers
- Telecommunications professionals
- Audio engineering presentations
- Data science and analytics
- Research presentations in STEM
- Technical workshops and tutorials

## Accessibility Notes

- Sufficient contrast: text-dark on bg = 11.2:1
- Body text on bg = 7.8:1
- Primary on white = 5.1:1 (passes AA)
- Secondary on white = 3.8:1 (used for accents only, not text)
- Background decorations kept below 10% opacity to avoid interference
