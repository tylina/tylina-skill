# Frost Glass Theme -- Design Specification

## Design Concept

**Frosted Glass Morphism with Depth Layers**

This theme translates the aesthetic of modern UI glassmorphism -- as seen in Apple iOS, macOS Big Sur+, and contemporary dashboard interfaces -- into a presentation format. The core visual metaphor is translucent frosted glass panels floating over a soft, luminous gradient background with subtle depth cues.

### Inspiration Sources
- Apple iOS/iPadOS notification panels and widgets
- macOS Control Center and Spotlight translucent overlays
- Windows 11 Mica/Acrylic material system
- Modern SaaS dashboard designs (Linear, Raycast, Arc browser)
- Depth-of-field photography with bokeh effects

---

## Visual Language

### Background System

The background uses a **multi-layer atmospheric system**:

1. **Base Layer**: Subtle blue-white gradient (`#F0F4FF` to `#FFFFFF`)
2. **Gradient Mesh Layer**: Full-page SVG with radial gradient blobs simulating an iOS-style unfocused backdrop. Four soft color orbs (blue and violet) with very low opacity (0.04-0.12)
3. **Floating Orbs Layer**: Additional circles at various positions with varying opacity (0.03-0.06) creating depth-of-field bokeh effect
4. **Accent Dots**: Small colored circles in corners providing subtle spatial anchors

This layered approach creates visual richness without overwhelming content readability.

### Glass Panel Treatment

Cards and containers simulate frosted glass through:

- **Fill**: Semi-transparent white (`#FFFFFF` at 75-90% opacity)
- **Border**: Very subtle white edge (`#FFFFFF` at 60% opacity) simulating light refraction at glass edges
- **Radius**: Generous border-radius (8-12pt) matching modern UI conventions
- **Left accent**: Colored left border providing content categorization without heavy visual weight

### Depth & Elevation

Depth is communicated through:

- **Layered borders**: Double-border technique with outer shadow border and inner highlight
- **Opacity gradients**: Higher opacity = closer to viewer
- **Colored accents**: Top/left borders in theme colors suggesting light source direction
- **Concentric shapes**: SVG decoration showing nested rounded rectangles receding into depth

---

## Color System

### Primary Palette

| Role | Color | Hex | Rationale |
|------|-------|-----|-----------|
| Background Start | Light blue-white | `#F0F4FF` | Cool, airy base that suggests depth |
| Background End | Pure white | `#FFFFFF` | Clean terminus for gradient |
| Text | Deep navy | `#1A2744` | High contrast against light bg, softer than pure black |
| Text Muted | Slate blue | `#5A6B8A` | Reduced emphasis while maintaining readability |
| Primary | Soft blue | `#4A8FE7` | Trustworthy, modern, not too saturated |
| Primary Dark | Deep blue | `#2B5EA3` | Accessible alternative for small text |
| Secondary | Violet purple | `#7C5CFC` | Creative complement to blue, adds visual interest |
| Secondary Light | Lavender | `#B8A4FF` | Decorative accents, low-contrast uses |

### Surface Colors

| Role | Color | Opacity | Usage |
|------|-------|---------|-------|
| Card Background | White | 75% | Primary card fill -- simulates glass |
| Card Border | White | 60% | Edge highlight -- light refraction |
| Frost White | White | 90% | Dense frosted panels (focus slide) |
| Glass Edge | Pure white | 100% | SVG edge highlights |
| Shadow | Navy | 8% | Subtle depth shadow |
| Surface | `#F7F9FF` | 100% | Opaque neutral surface |

### Glow Colors

| Role | Color | Opacity | Usage |
|------|-------|---------|-------|
| Glow Blue | `#4A8FE7` | 30% | Corner accent dots |
| Glow Violet | `#7C5CFC` | 30% | Corner accent dots |

---

## Typography

### Font Stack
The reusable theme is font-agnostic. Set a verified font stack in the deck entry; the demo uses `("Arial", "Helvetica")`.

### Scale
- **Base size**: 18pt
- **Title slide heading**: 2.4em (43.2pt)
- **Section heading**: 2em (36pt)
- **Slide title**: 1.3em (23.4pt)
- **Focus text**: 1.4em (25.2pt)
- **Card title**: 0.92em (16.56pt)
- **Card body**: 0.82em (14.76pt)
- **Tags/labels**: 0.75em (13.5pt)
- **Footer**: 0.65em (11.7pt)

### Weight Usage
- **Bold**: Titles, headings, emphasis text
- **Semibold**: Tags, metric labels
- **Medium**: Subtitles
- **Regular**: Body text, descriptions

---

## SVG Decorative Elements

### 1. Gradient Mesh Background (840x474)
Full-page atmospheric backdrop using radial gradients. Four overlapping gradient circles create a soft, unfocused color field. Additional ellipses at low opacity add organic variation.

**Technical**: Uses SVG `<radialGradient>` elements with stop-opacity transitions from 0.07-0.12 to fully transparent.

### 2. Floating Orbs (840x474)
10 circles and ellipses scattered across the viewport at 0.03-0.06 opacity. Sizes range from r=25 to r=70. Colors alternate between primary blue and secondary violet.

**Purpose**: Creates parallax-like depth when combined with the gradient mesh layer.

### 3. Glass Frame (840x474) -- Bookend Element
Shared between title and ending slides for visual cohesion:
- Rounded rectangle (rx=18) with 35% white fill
- Edge highlight borders using linear gradients
- **Refraction arc**: Curved path along top edge with rainbow gradient (blue-violet-lavender spectrum)
- Bottom echo arc at reduced opacity
- Decorative endpoint dots

### 4. Depth Layers (200x200)
Concentric rounded rectangles decreasing in size with increasing opacity:
- 6 nested rectangles from r=24 to r=8 border-radius
- Opacity progression: 0.15, 0.20, 0.25, 0.30, 0.35
- Center filled with lowest opacity, inner dot at highest

### 5. Refraction Divider (300x6)
Thin horizontal line with rainbow gradient fill:
- Linear gradient with 5 color stops (blue-violet-lavender spectrum)
- Decorative dots at even intervals along the line
- Subtle white overlay path for sparkle effect

### 6. Glass Edge Highlight (200x4)
Simulates light catching the edge of a glass panel:
- Center-weighted opacity gradient (0 -> 0.9 -> 0)
- Subtle blue underline at reduced opacity
- Three highlight dots and connecting curve

---

## Component Design Principles

### 1. Frosted Glass Panels (pane-card, frost-box)
- Semi-transparent white fills
- Subtle borders that suggest glass edges
- Generous padding (1em x 0.8em minimum)
- Large border-radius (8-12pt)
- Left accent borders for categorization

### 2. Metric Displays (crystal-stat)
- Glass panel container with full border
- Large, bold value in theme color
- Small muted label above
- Corner glow indicator dot with gradient fill
- Minimal padding for compact grid usage

### 3. Emphasis Elements (glow-box, frost-box)
- Full border (not just left) for emphasis
- Slightly different background tint (color.lighten(92-95%))
- Wider border (1.5-2pt) for visual weight
- Larger border-radius (10-12pt) for softness

### 4. Tags (blur-tag)
- Capsule shape (radius: 99pt)
- Gradient fill background
- Small dot indicator inline with text
- Compact padding for inline usage

### 5. Notifications (notification-note)
- Left accent bar (4pt) for urgency indicator
- Right-side rounded corners only
- Colored background tint matching accent
- Square indicator icon in title row

### 6. Grid Layouts (glass-tile-grid)
- Uniform glass tiles in grid arrangement
- Consistent border and radius across all tiles
- Flexible column count
- Native `grid` controls the tile matrix; it does not activate lazy equalization
- Reusable card components may retain inert terminal `lazy-v(1fr)` markers, but the grid helper does not add or remove them

---

## Slide Anatomy

### Content Slide
```
+--------------------------------------------------+
|  [Title]                                          |  <- header zone
|  [glass-edge decoration]                          |
+--------------------------------------------------+
|                                                   |
|  [gradient mesh background]                       |  <- atmosphere
|  [floating orbs layer]                            |
|  [corner glow accents]                            |
|                                                   |
|  +-- content area --------------------------+     |
|  |  Cards, grids, components                |     |
|  |                                          |     |
|  +------------------------------------------+     |
|                                                   |
+--------------------------------------------------+
|  [footer] . [gradient dot] . [page/total]         |  <- footer zone
+--------------------------------------------------+
```

### Title/Ending Slide (Bookend)
```
+--------------------------------------------------+
|                                                   |
|  [gradient mesh + floating orbs]                  |
|                                                   |
|  +-- glass frame (rounded rect) --------+         |
|  |                                      |         |
|  |  ~~~~refraction arc~~~~              |         |
|  |                                      |         |
|  |      [Title / Thank You]             |         |
|  |      [refraction divider]            |         |
|  |      [subtitle / glass edge]         |         |
|  |      [author]                        |         |
|  |                                      |         |
|  +--------------------------------------+         |
|                                                   |
+--------------------------------------------------+
```

### Section Slide
```
+--------------------------------------------------+
|█                                                  |  <- left accent bar
|█  [gradient mesh + floating orbs]                 |
|█                                                  |
|█     [3.5em section number]                       |
|█     [glass edge decoration]                      |
|█     [2em section title]                          |
|█                                                  |
|█                        +--[depth-layers]--+      |
|█                        |  concentric      |      |
|█                        |  rounded rects   |      |
|█                        +------------------+      |
|█  ............refraction divider..............     |
+--------------------------------------------------+
```

---

## Spacing & Layout Rules

### Margins
- **Page margin**: top 4em, bottom 2em, x 2.2em
- **Card inset**: x 1em, y 0.8em (standard), x 1.2em, y 0.9em (emphasis)
- **Header inset**: x 1.5em, top 0.6em, bottom 0.2em

### Grid Gutters
- **Standard**: 1.2em between cards
- **Compact (stats)**: 0.8em between stat cards
- **Standard columns**: 1em for 3-column layouts

### Vertical Rhythm
- **Between sections**: 0.5-0.6em
- **Between title and decoration**: 0.3-0.4em
- **Card internal spacing**: 4-6pt between title and content
- **After dividers**: 0.4em above and below

### Footer Layout
Uses `grid(columns: (1fr, auto, 1fr))`:
- Left: footer text (left-aligned)
- Center: gradient dot separator
- Right: page counter (right-aligned)

---

## Accessibility Considerations

- **Contrast ratios**: Deep navy text (#1A2744) on light backgrounds exceeds WCAG AA requirements
- **Color not sole indicator**: Left borders supplemented by typography weight and spatial hierarchy
- **Readable sizes**: Minimum body text 0.80em (14.4pt) ensures legibility
- **Decorative elements non-essential**: All SVG backgrounds and ornaments are purely decorative; content reads perfectly without them

---

## Animation & Motion (Conceptual)

While Typst does not support animation, the design is structured to suggest motion:
- Floating orbs suggest gentle drift
- Gradient mesh implies shifting light
- Refraction arcs suggest prismatic light play
- Depth layers suggest zoom/parallax

These could be animated in web-based exports or when presenting with tools that support transitions.
