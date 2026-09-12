# Morning Dew — Visual Design Specification

## Design Philosophy

Morning Dew draws inspiration from the delicate beauty of dawn — dewdrops clinging to leaves and petals as the first light breaks through. The theme embodies freshness, clarity, and quiet contemplation, making it ideal for academic work where content should breathe and ideas should feel naturally connected.

The visual language uses:
- **Translucent dewdrop shapes** with white highlight reflections
- **Soft watercolor wash** backgrounds for atmospheric depth
- **Leaf vein patterns** suggesting organic growth and branching knowledge
- **Dawn rays** evoking the emergence of new understanding
- **Petal scatter** as gentle decorative accents

---

## Color Palette

### Primary Colors

| Color | Hex | RGB | Role |
|-------|-----|-----|------|
| Dawn BG | `#F9F7F4` | 249, 247, 244 | Main background — warm white with slight cream undertone |
| Dewdrop | `#5B8FA8` | 91, 143, 168 | Primary accent — the blue of water in morning light |
| Petal | `#D4899A` | 212, 137, 154 | Secondary accent — soft rose of flower petals |
| Leaf | `#7CAA82` | 124, 170, 130 | Tertiary accent — fresh green of morning leaves |

### Text Colors

| Color | Hex | Role |
|-------|-----|------|
| Dark Text | `#2B3640` | Headings — near-black with blue undertone |
| Body Text | `#4A5B66` | Body copy — softer for readability |

### Surface & UI Colors

| Color | Hex | Role |
|-------|-----|------|
| Card BG | `#FFFFFF` | Pure white card surfaces |
| Mist | `#EEF2F5` | Morning mist fills — subtle blue-grey |
| Border | `#D8E0E6` | Gentle borders — barely visible structure |
| Gold | `#C9A855` | Dawn light highlights — warm accent |

### Color Usage Guidelines

- **Dewdrop blue** is the dominant accent — use for primary elements, links, and interactive states
- **Petal rose** is for emphasis and quotes — softer emotional content
- **Leaf green** is for positive/growth content — findings, progress, nature
- **Gold** is for special highlights — awards, key numbers, sunrise decorations
- Never use all four accents in equal proportion — let dewdrop blue lead

---

## Typography

### Font Stack

The reusable theme leaves the font family to its caller and sets an 18pt base size. Demo uses:
```
Helvetica Neue, Arial
```

Recommended font pairings:
- **Serif**: Source Serif 4, Libre Baskerville, Crimson Pro
- **Sans**: Source Sans 3, Inter, Noto Sans
- **Monospace**: JetBrains Mono, Fira Code (for code slides)

### Type Scale

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Title slide heading | 2.2em | Bold | Dark Text |
| Section heading | 2em | Bold | Dark Text |
| Slide heading | 1.3em | Bold | Dark Text |
| Body text | 1em (18pt base) | Regular | Body Text |
| Card titles | 0.88–0.9em | Bold | Accent (varies) |
| Card body | 0.82em | Regular | Body Text |
| Tags | 0.72em | Semibold | Accent (varies) |
| Footer | 0.65em | Regular | Body Text (40% transparent) |

---

## SVG Decorations

### Dewdrop Cluster
- **Elements**: 7 translucent ellipses with white highlight spots
- **Opacity range**: 0.12–0.22
- **Highlights**: Small white ellipses at fill-opacity 0.4–0.6
- **Usage**: Title slide, ending slide (bookending element)

### Watercolor Wash
- **Elements**: 10 overlapping paths and circles
- **Colors**: Mix of dewdrop, leaf, petal, and gold
- **Opacity range**: 0.02–0.04 (very subtle)
- **Usage**: Persistent background on ALL content slides

### Leaf Vein Pattern
- **Elements**: 14 paths (outline + midrib + 12 branching veins)
- **Color**: Leaf green (#7CAA82)
- **Opacity range**: 0.05–0.15
- **Usage**: Title slide, ending slide, new-section slide (left panel)

### Dawn Rays
- **Elements**: 8 radiating lines + 2 concentric circles (sun glow)
- **Origin**: Top-right corner
- **Color**: Gold (#C9A855)
- **Opacity range**: 0.04–0.08
- **Usage**: Title slide, ending slide (bookending element)

### Petal Scatter
- **Elements**: 8 small petal-shaped paths
- **Color**: Petal rose (#D4899A)
- **Opacity range**: 0.06–0.12
- **Usage**: Content slides (bottom-right), focus slide (corners)

### Morning Divider
- **Elements**: 1 vine path + 5 dewdrop circles with highlights
- **Colors**: Leaf green vine, dewdrop blue circles, white highlights
- **Usage**: Horizontal separator between content sections

---

## Slide Type Specifications

### Title Slide

| Property | Value |
|----------|-------|
| Background | Dawn BG (#F9F7F4) |
| Decorations | Watercolor wash, dawn rays (top-right), leaf vein (bottom-left), dewdrop cluster (center-right), petal scatter (top-left) |
| Content alignment | Center, shifted left to accommodate dewdrop cluster |
| Header/Footer | None |
| Margin | 0pt (full-bleed) |

### Content Slide

| Property | Value |
|----------|-------|
| Background | Dawn BG (#F9F7F4) |
| Atmosphere | Watercolor wash + petal scatter (bottom-right) |
| Header | Title + dewdrop dots + thin line accent |
| Footer | 3-column grid: footer text / dewdrop dot / page number |
| Margins | top: 4em, bottom: 2.2em, x: 2em |

### New Section Slide

| Property | Value |
|----------|-------|
| Background | Dawn BG + watercolor wash |
| Left panel | Large leaf vein pattern |
| Right content | Dewdrop circle with section number + title + accent dots |
| Corner | Petal scatter bottom-right |
| Header/Footer | None |

### Outline Slide

| Property | Value |
|----------|-------|
| Background | Dawn BG + watercolor wash + petal scatter |
| Decoration | Small dewdrop cluster top-right |
| Content | Left-aligned title + accent line + TOC |
| Margins | x: 4em, y: 2.5em |

### Focus Slide

| Property | Value |
|----------|-------|
| Background | Dewdrop blue darkened 10% |
| Bottom overlay | Darker blue at 50% opacity |
| Corner decorations | Petal scatter (top-left, bottom-right) |
| Subtle accents | White circles at high transparency |
| Text | White, bold, 1.5em, centered |

### Ending Slide

| Property | Value |
|----------|-------|
| Background | Dawn BG + watercolor wash |
| Decorations | Same as title — dawn rays, leaf vein, dewdrop cluster, petal scatter |
| Content | Centered text between two morning dividers |
| Purpose | Visual bookend with title slide |

---

## Component Design

### Cards (dew-card, leaf-card, prism-card)

- **Fill**: Pure white (#FFFFFF) — opaque
- **Border**: 0.5pt + border color
- **Radius**: 6–8pt
- **Inset**: x: 1.2em, y: 0.8–0.9em
- **Height equalization**: `lazy-v(1fr)` at end

### Callouts (mist-box)

- **Fill**: Mist (#EEF2F5)
- **Left border**: 3pt + accent color
- **Right radius**: 6pt
- **No top/right/bottom border**

### Statistics (droplet-stat)

- **Centered layout** with dewdrop shape above number
- **Value size**: 1.6em bold in accent color
- **Label size**: 0.72em in body text color

### Tags (dawn-tag)

- **Shape**: Rounded pill (12pt radius)
- **Fill**: Accent at 88% transparency
- **Border**: 0.6pt + accent at 50% transparency
- **Text**: 0.72em semibold

### Quotes (petal-quote)

- **Fill**: Accent at 93% transparency
- **Left border**: 3pt + accent at 30% transparency
- **Text**: Italic, 0.88em
- **Author**: Semibold, 0.78em, normal style

---

## Spacing Guidelines

| Context | Spacing |
|---------|---------|
| Between components | 8–12pt |
| Card internal padding | x: 1.2em, y: 0.8–0.9em |
| Grid column gap | 12–16pt |
| After headings | 4–6pt |
| Morning divider padding | 4pt above and below |
| Tag spacing | 4pt horizontal gap |

---

## Bookending Strategy

The title and ending slides share the same three decorative elements that do NOT appear on content slides:
1. **Dewdrop cluster** (center-right)
2. **Leaf vein pattern** (bottom-left)
3. **Dawn rays** (top-right)

This creates visual coherence and a sense of completion. Content slides use only the watercolor wash atmosphere and petal scatter for a lighter, less decorated feel that keeps focus on the content.

---

## Accessibility Notes

- Text contrast ratios meet WCAG AA standards:
  - Dark Text on Dawn BG: 10.8:1
  - Body Text on Dawn BG: 6.9:1
  - White on Dewdrop (focus): 4.6:1
- All SVG decorations are purely decorative (low opacity)
- Card fills are fully opaque white for maximum readability
- Tags use sufficient contrast with darkened accent text
