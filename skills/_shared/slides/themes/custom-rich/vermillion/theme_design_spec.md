# Vermillion Theme — Design Specification

## Concept

Warm terracotta/vermillion professional theme inspired by Mediterranean architecture, sunbaked clay textures, and modern earthy business aesthetics. Suitable for marketing presentations, creative agency pitches, and lifestyle brand storytelling.

## Color Palette

| Token          | Hex       | Usage                              |
|----------------|-----------|-------------------------------------|
| bg             | #FDF9F5   | Warm white slide background         |
| primary        | #C84B31   | Vermillion — primary accent color   |
| primary-text   | #B53B27   | Text-safe vermillion on light fills |
| accent         | #A0522D   | Burnt sienna — secondary accent     |
| secondary      | #4A5D3A   | Deep olive — tertiary contrast      |
| text-dark      | #2C1810   | Espresso — headings/titles          |
| text-body      | #4A3228   | Warm brown — body text              |
| text-light     | #8B6B55   | Muted terracotta — captions/meta    |
| card           | #FFF8F0   | Cream — card backgrounds            |
| border         | #E8D8C8   | Warm border strokes                 |
| sand           | #F5EDE4   | Sand — secondary card/box fills     |
| highlight      | #FFF0E0   | Warm highlight gradient base        |

## Typography

The reusable theme is font-agnostic. The demo sets a verified installed deck-side stack:

- **Headings**: IBM Plex Sans / Heiti SC, bold, espresso (#2C1810)
- **Body**: IBM Plex Sans / Heiti SC, regular, warm brown (#4A3228)
- **Captions**: IBM Plex Sans / Heiti SC, muted terracotta (#8B6B55)
- **Code**: IBM Plex Mono

## SVG Decorations

### 1. Organic Arch Pattern (Background)
- Repeating rounded arches evoking Mediterranean windows/doorways
- Very subtle (3-5% opacity) persistent on content slides
- Slightly stronger on title/ending slides for bookending
- Color: primary vermillion

### 2. Sunburst Corner Ornament
- Radiating lines from corner with concentric arcs
- Evokes warm sunrise / golden hour lighting
- Used on title and ending slides as corner decoration
- Appears top-right, mirrored bottom-left

### 3. Wavy Terracotta Divider
- Organic flowing sine wave with double-line depth
- Used as header accent, section separator, and footer decoration
- Warm, hand-crafted feel without being childish

## Slide Types

1. **Content Slide** (`slide`): Warm white bg, wavy header accent, persistent arch atmosphere, footer with page counter
2. **Title Slide** (`title-slide`): Sunburst corners, vertical accent bar, arch pattern, centered content
3. **New Section Slide** (`new-section-slide`): Left vermillion bar, large faded section number, wavy separator
4. **Focus Slide** (`focus-slide`): Deep vermillion bg, white text centered, subtle white arch pattern
5. **Ending Slide** (`ending-slide`): Mirrors title — sunburst corners, vertical bar, bookending effect

## Components

1. **kiln-card**: Card with rounded top border accent and cream fill
2. **hearth-stat**: Centered value-over-label stack with a decorative warm circle and rounded container
3. **clay-box**: Content box with left vermillion bar and sand background
4. **terrace-divider**: Centered wavy line section separator
5. **ember-tag**: Small warm pill badge for inline labeling
6. **foundry-highlight**: Featured content block with warm gradient

Standard Typst lists receive global vermillion circle markers; no custom list component is exposed.

## Design Principles

- **Warm Professional**: Approachable confidence — never cold, never casual
- **Organic Geometry**: Rounded arches and waves over sharp angles
- **Layered Subtlety**: Background decorations at very low opacity create atmosphere without distraction
- **Bookending**: Title and ending slides share ornamental vocabulary for visual closure
- **Breathing Room**: Generous padding and spacing throughout
