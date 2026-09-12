# Blueprint Theme -- Design Specification

## Overview
Architectural blueprint / technical drawing theme inspired by the cyanotype printing process. Features blue backgrounds with white line-art, grid patterns, and engineering precision.

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| Blueprint Blue (bg) | #1E3F66 | Primary background for "drawing" slides |
| Line White (ink) | #FFFFFF | All content lines and text on dark slides |
| Grid | #FFFFFF @ 8% | Grid line pattern |
| Annotation Red | #FF4444 | Red-line markup corrections (sparingly) |
| Light BG | #F0F4F8 | Background for "specification" content slides |
| Light Ink | #1E3F66 | Text on light slides |

### Presets

| Preset | Background | Ink | Character |
|--------|-----------|-----|-----------|
| classic | #1E3F66 (blueprint blue) | #FFFFFF (white) | The original blueprint look |
| dark | #0D1B2A (navy-black) | #4FC3F7 (cyan) | Darker, more dramatic |
| invert | #F0F4F8 (light) | #1E3F66 (blue) | Inverted for content focus |

## Typography

- Display: 44pt, Bold
- H1: 30pt, Bold
- H2: 22pt, Bold
- Body: 16pt, Regular
- Kicker: 9pt, Medium, 1.8pt tracking, uppercase
- Meta: 8pt, monospace

### Font System
- Monospace (labels, annotations, technical text): IBM Plex Mono
- Sans (body text): IBM Plex Sans
- The template uses these installed defaults; consumers may override the
  document font in their entry file.

## Layout Parameters

- Aspect ratio: 16:9 (841.89pt x 473.56pt)
- Margins (light slides): top 6em, bottom 1.3em, x 2em
- Margins (dark slides): top 2.6em, bottom 1.2em, x 2em
- Grid spacing: 36pt major lines

## Slide Types

### title-slide
- Blueprint blue background
- White grid at 8% opacity
- Compass rose SVG (top-right, 120pt)
- "PROJECT:" monospace label above title
- "REV.A" red annotation (top-left)
- Dimension marks as bottom decoration
- Author/date in monospace

### new-section-slide
- Blueprint blue background with grid
- Large section number (140pt, monospace, 80% transparent)
- "SECTION 01" kicker label
- Section title with underline
- "DRAWING SET" footer annotation

### slide (default)
- Light background (#F0F4F8)
- Blue text (#1E3F66)
- Header: meta line + bold title + accent underline
- Footer: "SPECIFICATION" | dot | page number

### dark-slide
- Blueprint blue background
- White grid at 8% opacity
- Monospace title with underline
- White text throughout
- Footer: "DRAWING" | dot | page number

### focus-slide
- Blueprint blue background
- Grid at 6% opacity
- Thin border frame
- Centered white bold text

### ending-slide
- Blueprint blue background
- "END" ghost text (120pt, 92% transparent)
- "END OF DRAWINGS" kicker label
- Dimension marks as decoration
- "BLUEPRINT" footer label

### hero-slide
- Full-bleed image background
- Optional gradient scrim overlay
- Zero margins

## Components

| Component | Description |
|-----------|-------------|
| spec-card | White card with thin blue border, monospace title label |
| drawing-note | Left-border callout in monospace, annotation style |
| revision-mark | Small red bordered box for emphasis markup |
| dimension-line | Decorative measurement line with end marks + label |
| title-block | Bordered box with PROJECT/DWG/DATE/SCALE fields |
| grid-stat | Centered target icon, large white number, and monospace label |
| blueprint-kicker | Small tracked uppercase monospace label |
| compass-rose | SVG compass rose via image(bytes()) |

## Visual Signature

The memorable element is the blueprint BLUE background with white grid lines visible at low opacity, combined with monospace technical labels and dimension marks. Every "drawing" slide looks like a page from an architect's drawing set. The compass rose on the title slide and "REV.A" red annotation add authenticity.
