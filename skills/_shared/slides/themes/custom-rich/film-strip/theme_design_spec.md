# Film Strip Theme - Design Specification

## Theme Identity

**Name**: Film Strip
**Aesthetic**: Analog photography nostalgia - Kodak film boxes, Fujifilm packaging, light leaks, sprocket holes, warm film color science
**Complexity Level**: Rich
**Best For**: Photography talks, creative presentations, analog/vintage topics, art school lectures, visual arts

## Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Kodak Gold | #FFBF00 | Primary accent, section backgrounds, tags |
| Kodak Amber Ink | #A35D00 | Accessible emphasis text on warm-white surfaces |
| Fuji Green | #00A651 | Secondary accent, alternative callout boxes |
| Dark (Film Leader) | #1C1C1E | Film strips, borders, dark backgrounds |
| Warm White | #FFF8E7 | Slide background, paper-like warmth |
| Film Base Orange | #F97316 | Statistics, emphasis, light leak effects |
| Film Base Ink | #C05000 | Accessible statistic and attribution text on light surfaces |
| Safelight Red | #DC2626 | Focus slides, darkroom-themed callouts |
| Text Dark | #1C1C1E | Headings, primary text |
| Text Body | #3D3D3F | Body text |
| Text Light | #8A8A8E | Metadata on dark surfaces |
| Text Muted | #707075 | Captions, annotations, and frame counters on light surfaces |

## Typography

- **Display (Title slide)**: 2.2em, Bold, Kodak Gold on dark
- **H1 (Section)**: 2.4em, Bold, Dark on Kodak Gold
- **H2 (Slide title)**: 1.4em, Bold, Dark on warm white
- **Body**: 20pt base, Regular
- **Monospace annotations**: Courier New / Noto Sans SC for frame numbers and metadata

## Signature Visual Elements

### Sprocket Holes
Small rounded rectangles (8pt x 5pt, radius 1.5pt) placed along top and bottom film strip bars. Simulates 35mm film perforations. Uses semi-transparent warm white on dark strips.

### Film Frame Border
16-20pt dark strips at top and bottom of each slide containing sprocket hole cutouts. Creates the feeling of viewing a frame of developed film.

### Light Leaks
Subtle radial gradient circles (film-base orange or kodak-gold at 85-92% transparency) placed in corners to simulate analog light leak artifacts.

### Frame Counter
Monospace "FR X / Y" notation in footer, mimicking frame numbering on film strips.

## Slide Types

| Slide Type | Background | Key Elements |
|------------|-----------|--------------|
| `title-slide` | Dark (#1C1C1E) | Gold title, film strips, light leaks, "FRAME 01" annotation |
| `slide` | Warm white (#FFF8E7) | Dark film strips top/bottom with sprocket holes, Kodak-orange title underline |
| `new-section-slide` | Kodak Gold (#FFBF00) | Dark title, film strips, frame annotation |
| `focus-slide` | Safelight Red (#DC2626) | White text, vignette effect, minimal strips |
| `ending-slide` | Dark (#1C1C1E) | Gold monospace text, "END OF ROLL" annotation |
| `outline-slide` | Warm white (#FFF8E7) | Film strips, section list |

## Components

| Component | Purpose | Visual Style |
|-----------|---------|-------------|
| `contact-card` | Content card like contact sheet frame | Thin black border, monospace caption below |
| `exposure-stat` | Big statistic display | Large orange number, small mono annotation |
| `darkroom-box` | Callout/warning box | Red left border, light red fill |
| `film-tag` | Inline tag/badge | Kodak gold background, dark bold text |
| `developer-quote` | Quotation block | Gold left border, italic, warm fill |
| `fuji-box` | Alternative callout | Green left border (Fujifilm accent) |
| `light-leak` | Decorative overlay | Radial gradient, low opacity orange/gold |

## Layout Parameters

- **Aspect ratio**: 16:9
- **Margins**: top 4.5em, bottom 3.5em, x 2em
- **Film strip height**: 16-20pt
- **Sprocket hole size**: 8pt x 5-6pt, radius 1.5-2pt
- **Header/footer ascent/descent**: 30%
