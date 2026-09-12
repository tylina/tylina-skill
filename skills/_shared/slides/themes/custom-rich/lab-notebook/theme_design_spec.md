# Lab Notebook Theme — Design Specification

## Concept

Research laboratory notebook pages translated into clean typographic presentation design. The theme evokes the experience of flipping through a well-maintained Moleskine lab notebook: graph paper grids, red margin rules, ring-binder holes, specimen sketches, sticky note callouts, and handwritten annotations. The aesthetic is warm, structured, and scholarly without being overly formal.

## Visual Identity

### Atmosphere

- **Primary feel**: Open lab notebook on a warm wooden bench
- **Paper texture**: Warm off-white (#FAF8F3) as the canvas
- **Grid pattern**: Light blue graph paper lines at 20px intervals with heavier lines every 100px
- **Margin rule**: Double red/pink vertical line on the left side of every page
- **Binder holes**: Ring-binder punch holes along the left margin (decorative)
- **Page curl**: Subtle corner fold indicator at bottom-right

### Color Philosophy

The palette draws from real lab notebook materials:

| Role | Color | Rationale |
|------|-------|-----------|
| Paper background | #FAF8F3 | Warm off-white like aged graph paper |
| Primary ink | #2C2C2C | Deep charcoal, not pure black |
| Teal accent | #1A7A6C | Lab marker green — like teal pen ink |
| Orange accent | #D4552A | Red/orange pen for highlights and corrections |
| Margin red | #C75B5B | Traditional notebook margin rule color |
| Grid blue | #B8D4E3 | Graph paper blue, very light |
| Binding gray | #9E9E9E | Metal spiral binding wire color |
| Sticky yellow | #FFF8DC | Post-it note yellow |
| Specimen green | #2E7D32 | Biology/specimen label green |

### Typography

- **Demo base font**: Arial / Noto Sans SC at 18pt
- **Demo monospace**: IBM Plex Mono (for code, data)
- **Title weight**: Bold, 2.4em
- **Header weight**: Bold, 1.3em
- **Body size**: 0.82em relative within cards
- **Muted text**: #6B6B6B for secondary information

---

## SVG Design Elements

### 1. Graph Paper Grid (Full-page background)

- Small grid: 20x20px squares, stroke 0.4pt, #B8D4E3 at 50% opacity
- Large grid: 100x100px squares, stroke 0.8pt, #8FBDD4 at 40% opacity
- The grid texture remains separate from the margin-rule overlay so marks never double-render

### 2. Margin Rule (Content atmosphere)

- Primary rule: x=56, 1.5pt, #C75B5B at 40% opacity
- Secondary rule: x=58, 0.5pt, lighter
- Binder holes: 4 circles (r=5) along left at regular intervals
- Cross-hair marks through each binder hole
- Applied once on content, section, and focus slides; bookends use the binder frame instead

### 3. Binder Frame (Bookend — title/ending slides)

- Outer border: 1.5pt, #2C2C2C at 30% opacity, 4px border radius
- Inner accent: 0.8pt, #1A7A6C at 25% opacity
- 6 binder holes (r=7) along left side, evenly spaced
- Spiral curl paths on alternating holes
- Margin rule line at x=56

### 4. Specimen Frame

- Rounded rectangle (8px radius), #2E7D32, 1.5pt at 60% opacity
- Cross-hair marks at all four corners
- Used in specimen-box component styling

### 5. Sticky Tab

- Rounded-top tab shape, filled #FFF8DC
- Ruled lines inside (3 decreasing length)
- Colored dots at corners (teal, orange)
- Folded corner triangles at bottom edges

### 6. Binding Divider

- Horizontal center line, 0.8pt, #9E9E9E at 30% opacity
- 7 circles (r=5) evenly spaced along the line
- Spiral curl paths on every 3rd circle
- Used as section separator within slides

---

## Slide Structure

### Title Slide

```
+--[binder frame]----------------------------------+
|  O                                               |
|  |  [graph paper grid background]                |
|  O                                               |
|  |         Title (2.4em, bold, ink)              |
|  O         ═══════════════════════               |
|  |         Subtitle (teal, medium)               |
|  O         Author                                |
|  |         Institution (muted)                   |
|  O         Date (orange)                         |
|  |                                               |
+--------------------------------------------------+
```

### Content Slide

```
+--------------------------------------------------+
| ║  Title                                         |  <- header with teal underline
| ║  ────────                                      |
|--------------------------------------------------+
| ║  [graph paper grid + margin rule atmosphere]   |
| ║                                                |
| ║     [ content area ]                           |
| ║                                                |
| ║                                           ◢    |  <- page curl
+--------------------------------------------------+
| Footer text        ●        Page N / M           |  <- grid footer
+--------------------------------------------------+
```

### Section Slide

```
+--------------------------------------------------+
|█                                                 |  <- teal left bar
|█  [graph paper grid]                             |
|█                                                 |
|█      3                     <- section # (orange)|
|█      ○○○○○○○               <- binding coil     |
|█                                                 |
|█      Section Title         <- bold, ink         |
|█                                                 |
|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━|  <- bottom margin rule
+--------------------------------------------------+
```

### Focus Slide

```
+--------------------------------------------------+
|  [graph paper grid]                              |
|                                                  |
|    ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐     |
|    ╎                                       ╎     |  <- dashed teal border
|    ╎     Quote or statement text           ╎     |
|    ╎     ═══════════════════               ╎     |
|    ╎                                       ╎     |
|    └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘     |
|                                                  |
+--------------------------------------------------+
```

### Ending Slide

```
+--[binder frame]----------------------------------+
|  O                                               |
|  |  [graph paper grid background]                |
|  O                                               |
|  |         ○○○○○○○○○○○       <- binding coil    |
|  O                                               |
|  |         Thank You (2.4em, bold)               |
|  O         ═══════════                           |
|  |                                               |
+--------------------------------------------------+
```

---

## Component Design System

### Cards (entry-card, protocol-card, data-table-card)

- White background (#FFFFFF)
- Rounded corners (4pt)
- Left border accent (3pt colored) + subtle grid-blue borders
- Consistent padding: x=1em, y=0.8em
- Title with colored dot indicator
- All end with `lazy-v(1fr)` for height equalization

### Annotation Elements (margin-note, sticky-note, observation-log)

- **margin-note**: Paper background, red left border, italic text
- **sticky-note**: Yellow background (#FFF8DC), corner fold triangle
- **observation-log**: Orange-light background, left border, timestamp circle

### Specimen/Science Elements (specimen-box, sample-tag, reading-stat)

- **specimen-box**: Green border, cross-hair indicator, light green background
- **sample-tag**: Capsule shape (radius: 99pt), dot + text
- **reading-stat**: Large value display with indicator dot

### Structural Elements (binding-divider)

- SVG-based spiral coil separator
- Configurable width
- Used between logical sections within a slide

---

## Bookend Elements

The **binder frame** serves as the shared bookend element between title and ending slides:

- Creates visual continuity between opening and closing
- Ring-binder holes establish the "notebook" metaphor immediately
- Outer border + inner accent frame provide structure
- Margin rule line carries through from content slides

---

## Responsive Behavior

- Components use `width: 100%` to fill available space
- `lazy-v(1fr)` ensures height equalization in grid layouts
- Footer uses `grid(columns: (1fr, auto, 1fr))` for proper spacing
- Margin rules and grid backgrounds scale with page dimensions
- Cards adapt to content length while maintaining minimum structure

---

## Accessibility Considerations

- Minimum contrast ratio maintained between text and backgrounds
- Grid lines are very light (opacity 0.3-0.5) to not interfere with readability
- Primary text is deep charcoal (#2C2C2C) on warm white for comfortable reading
- Accent colors (teal, orange) are distinct enough for color-differentiated users
- Card borders provide structural separation beyond color alone

---

## Implementation Notes

- All SVG elements avoid HTML comments to prevent Typst compilation errors
- SVGs use 8+ path/shape elements with varying opacities (0.1-0.8)
- Background atmosphere is applied via `setting(body)` function in content slides
- Adjacent blocks in data-table-card use `stack(spacing: 0pt)` with `clip: true`
- Frame borders use percentage-based dimensions for aspect-ratio independence
- The theme entry function follows the pattern: `touying-slides.with(config-page(...), config-common(slide-fn: slide, new-section-slide-fn: new-section-slide), ...)`
