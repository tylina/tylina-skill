# Pulse Grid Theme -- Design Specification

## Theme Identity

**Name**: Pulse Grid
**Tier**: custom-rich
**Aesthetic**: Heartbeat monitor / oscilloscope grid
**Mood**: Precise, analytical, real-time, scientific authority
**Best For**: Tech presentations, scientific research, data analysis, monitoring dashboards, R&D showcases

---

## Design Concept

The Pulse Grid theme draws inspiration from high-end medical/scientific monitoring equipment -- oscilloscopes, ECG monitors, and vital-signs displays. The visual language conveys precision, real-time data awareness, and scientific rigor.

Key visual metaphors:
- **Oscilloscope grid**: Fine green lines on light background creating a measurement grid
- **ECG traces**: Heartbeat-like pulse waveforms as decorative elements and dividers
- **Digital readouts**: Monospace values in glowing green evoking LED/LCD displays
- **Signal indicators**: Status dots and capsule tags representing live system states
- **Channel panels**: Labeled data streams reminiscent of multi-channel recorders

The theme avoids dark backgrounds for body slides (ensuring readability) while offering a dark "oscilloscope screen" mode for the focus slide.

---

## Color Palette

### Primary Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background | Very Light Gray | `#F8F9FA` | Clean, high-contrast reading surface |
| Card Background | White | `#FFFFFF` | Pure white for data panels |
| Text | Dark Charcoal | `#1E293B` | Maximum readability on light bg |
| Text Muted | Slate Gray | `#64748B` | Labels, secondary information |

### Accent Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Primary | Emerald Green | `#10B981` | Phosphor green (oscilloscope CRT) |
| Primary Dark | Dark Emerald | `#059669` | Deeper green for emphasis |
| Secondary | Electric Blue | `#3B82F6` | Secondary channel indicator |
| Alert Warning | Amber | `#F59E0B` | Warning threshold indicators |
| Alert Critical | Red | `#EF4444` | Critical/alarm states |

### Readable Accent Inks

Bright signal colors remain available for traces, borders, and status nodes. Text on light surfaces uses darker companion inks so labels and values meet WCAG AA.

| Role | Color | Hex | Usage |
|------|-------|-----|-------|
| Primary Ink | Deep Emerald | `#047857` | Green values, emphasized text, section numbers |
| Secondary Ink | Deep Blue | `#1D4ED8` | Blue values, subtitle text, channel labels |
| Warning Ink | Deep Amber | `#92400E` | Warning titles and timestamps |
| Critical Ink | Deep Red | `#B91C1C` | Critical alert titles |

### Structural Colors

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Grid Line | Emerald | `#10B981` | Oscilloscope grid traces |
| Grid Faint | Light Slate | `#E2E8F0` | Subtle structural borders |
| Border | Medium Slate | `#CBD5E1` | Card and component borders |
| Panel BG | Off-White | `#F1F5F9` | Slightly tinted panel areas |
| Trace Glow | Emerald | `#10B981` | SVG trace color |

---

## Typography

| Element | Font | Size | Weight | Color |
|---------|------|------|--------|-------|
| Body | IBM Plex Sans / Heiti SC fallback | 18pt | Regular | `text` |
| Slide Title | IBM Plex Sans | 23.4pt (1.3em) | Semibold | `text` |
| Section Number | IBM Plex Sans | 63pt (3.5em) | Bold | `primary-ink` |
| Section Title | IBM Plex Sans | 36pt (2em) | Semibold | `text` |
| Title Slide | IBM Plex Sans | 43.2pt (2.4em) | Bold | `text` |
| Readout Values | IBM Plex Mono | 32.4pt (1.8em) | Bold | readable accent ink |
| Labels | IBM Plex Sans | 13.5pt (0.75em) | Regular | `text-muted` |
| Tags | IBM Plex Sans | 13.5pt (0.75em) | Semibold | readable accent ink |
| Timestamps | IBM Plex Mono | 12.6pt (0.7em) | Bold | readable accent ink |
| Footer | IBM Plex Sans | 11.7pt (0.65em) | Regular | `text-muted` |

---

## SVG Elements

### 1. Oscilloscope Grid (Full-Page Background)

- **Dimensions**: 840x474 (16:9 ratio)
- **Fine grid**: 9 horizontal + 9 vertical lines at 0.4px, 12% opacity
- **Major divisions**: 3 horizontal + 3 vertical lines at 0.8px, 18% opacity
- **Intersection markers**: Circles at major grid crossings (r=2-2.5, 25-30% opacity)
- **Color**: Emerald green (#10B981)
- **Purpose**: Persistent content slide atmosphere

### 2. ECG Pulse Waveform (Divider/Decorator)

- **Dimensions**: 300x24
- **Pattern**: Baseline flat -> sharp spike sequence (3 repeats)
- **Stroke**: 1.8px, 70% opacity, round linecap/linejoin
- **Peak indicators**: Circles at peak positions (r=2.5, 50% opacity)
- **Endpoints**: Green start dot, blue end dot
- **Purpose**: Title underlines, section dividers, trace-box bottom borders

### 3. Monitor Frame (Bookend Element)

- **Dimensions**: 840x474
- **Outer frame**: Rect with 2px stroke, 60% opacity, 4px radius
- **Inner frame**: Rect with 0.8px stroke, 25% opacity
- **Corner brackets**: L-shaped paths with 2.5px stroke, node circles
- **Mid-edge accents**: Trace paths with offset angles
- **Purpose**: Shared between title and ending slides (visual bookend)

### 4. Signal Peak (Inline Decorator)

- **Dimensions**: 120x20
- **Pattern**: Flat baseline with zigzag pulse in center
- **Stroke**: 1.5px, 80% opacity
- **Markers**: Start/end/peak circles
- **Purpose**: Section slide decoration, inline emphasis

### 5. Crosshair Marker (Grid Intersection)

- **Dimensions**: 24x24
- **Elements**: Vertical line, horizontal line, outer circle, center dot
- **Purpose**: Decorative grid intersection markers (corner accents)

### 6. Baseline Waveform (Divider Variant)

- **Dimensions**: 400x16
- **Pattern**: Extended baseline with two distinct pulse groups
- **Additional markers**: Baseline dots at intervals
- **Purpose**: Wider decorative separator between content sections

---

## Layout Architecture

### Content Slides

```
+------------------------------------------+
| [Title]                                  | <- Header zone (4em top margin)
| [ECG Pulse Underline]                    |
|------------------------------------------|
|                                          |
|  [Content Area]                          | <- Oscilloscope grid atmosphere
|  (oscilloscope grid behind)              |    behind all content
|                                          |
|------------------------------------------|
| [Footer] [dot] [Page/Total]             | <- Footer with grid(1fr, auto, 1fr)
+------------------------------------------+
```

### Title/Ending Slides (Bookend)

```
+==========================================+
||  [Monitor Frame Border]                ||
||                                        ||
||        [Oscilloscope Grid BG]          ||
||                                        ||
||            [Title Text]                ||
||         [ECG Pulse Divider]            ||
||           [Subtitle]                   ||
||          [Author/Date]                 ||
||                                        ||
||  [Corner brackets with nodes]          ||
+==========================================+
```

### Section Slides

```
+------------------------------------------+
| |                                        |
| | [5pt green bar]                        |
| |                                        |
| |     [Section Number - 3.5em green]     |
| |     [Signal Peak Decoration]           |
| |     [Section Title - 2em bold]         |
| |                                        |
| |                          [Corner dots] |
+--[Bottom accent line - 2pt]-------------+
```

---

## Component Design Patterns

### Card Components (readout-card, trace-box, monitor-card, channel-card)

- White background (`card-bg`)
- Border: 1pt `border` color on most sides
- Accent: Colored top or left border (2-3pt)
- Inset: x=1em, y=0.7-0.8em
- Radius: 4pt (bottom only for top-bordered, all for left-bordered)
- All end with `#lazy-v(1fr)` for height equalization

### Status Indicators (signal-tag)

- Capsule shape (radius: 99pt)
- Background: accent color lightened 88%
- Border: 1pt accent at 40% transparency
- Content: 5pt colored dot + semibold text
- Inline element (box, not block)

### Alert Components (alert-box)

- Left border: 4pt accent
- Background: accent lightened 92%
- Two levels: `"warning"` (amber) and `"critical"` (red)
- Square indicator (8pt, radius 1pt) in header

### Data Display (spectrum-grid)

- Outer container: panel-bg with border
- Inner cells: card-bg with left accent + faint border
- Grid layout with configurable columns
- Monospace values in accent color

### Timeline (log-entry)

- Minimal: left 2pt border, faint border rest
- Compact single-line: timestamp (mono) + event title
- Optional detail line in muted text

---

## Atmosphere System

The content slide atmosphere layer consists of:

1. **Oscilloscope grid SVG** - Full-page placement at (0,0), covers entire slide
2. **Corner accent nodes** - Three small circles at TR, BL, BR positions
   - Top-right: 3pt radius, primary at 75% transparent
   - Bottom-left: 2.5pt radius, secondary at 80% transparent
   - Bottom-right: 2pt radius, primary at 85% transparent

This atmosphere is applied via the `setting(body)` function pattern ensuring it persists on all content slides without requiring manual placement.

---

## Footer Design

The footer uses `grid(columns: (1fr, auto, 1fr))` layout:

- **Left cell**: Custom footer content (text or none)
- **Center cell**: 6pt green dot (pulse indicator)
- **Right cell**: Slide counter "X / Y" aligned right

Text: 0.65em, text-muted color.

---

## Design Principles

1. **Precision over decoration**: Every visual element should suggest measurement and accuracy
2. **Light readability**: Light backgrounds ensure content is easily readable in any room
3. **Phosphor green as signal**: Green elements draw the eye to key data points
4. **Blue as secondary channel**: Blue provides visual variety without competing with green
5. **Monospace for values**: All numerical/data displays use IBM Plex Mono
6. **Grid as foundation**: The ever-present oscilloscope grid unifies all slides
7. **Waveforms as rhythm**: ECG pulses create visual rhythm and section breaks
8. **Status communication**: Signal tags and alert boxes leverage color semantics (green=good, amber=warning, red=critical)

---

## Accessibility Notes

- Primary text on light background exceeds WCAG AA contrast ratio
- Bright green, blue, amber, and red remain decorative accents; darker companion inks carry readable text on light surfaces
- Alert boxes use both color AND text labels for level communication
- Focus slide uses high-contrast green-on-charcoal (5.8:1 ratio)
- All SVG elements are decorative; no critical information is conveyed solely through SVG
