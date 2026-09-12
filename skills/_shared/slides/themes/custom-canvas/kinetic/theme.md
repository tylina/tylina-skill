# Kinetic Theme

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `kinetic-theme`
**Style**: Motion Graphics / Kinetic Typography, diagonal composition, speed-inspired
**Primary color**: Derived from preset (default `#0D0D0D` bg, `#FFFFFF` ink, `#FF3366` accent, `#00FF88` secondary)
**Best For**: Creative presentations, motion graphics, product launches, tech demos, data dashboards
**Style Objective**: Motion Graphics / Kinetic Typography
**Complexity Level**: Canvas

## Description

A motion graphics-inspired presentation theme with dynamic, energetic aesthetics. Diagonal lines, bold angles, overlapping elements, and speed-inspired layouts. Features a four-color system (bg/ink/accent/secondary) with gradient accents, velocity kickers, speed lines, and diagonal composition.

Key features: built-in **dark-slide**, **impact-slide** (high-contrast split-panel layout), and **ticker-slide** (scrolling-style data strip) functions with automatic gradient accent placement and ghost elements.

Design philosophy: "Every element implies motion."

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("neon")

#show: kinetic-theme.with(
  aspect-ratio: "16-9",
  preset: "neon",
  footer: self => self.info.institution,
  config-info(
    title: [Your Presentation Title],
    subtitle: [Subtitle text],
    author: [Author Name],
    date: datetime.today(),
    institution: [YOUR ORG],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content goes here.

// Dark slide with ghost number
#dark-slide(ghost: [01], header-left: [TOPIC], header-right: [2025])[
  #text(size: 36pt, weight: "black")[A bold claim.]
]

// Impact slide with diagonal split
#impact-slide(
  left-content: [#text(size: 2em, weight: "black")[LEFT]],
  right-content: [#text(size: 2em, weight: "black")[RIGHT]],
)
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | string | `"neon"` | Color preset name |
| `footer` | content/function | `none` | Footer content or function |
| `align` | alignment | `horizon` | Default content alignment |

## Available Slide Types

### `#slide(title: auto, align: auto)`

Standard content slide. Bold title with gradient accent rule below, mono chrome header, kinetic footer with accent dot. Title auto-detects from `== Heading`.

```typst
== My Slide Title
Content here...
```

### `#dark-slide(title: auto, ghost: none, ...)`

Dark slide with background color fill, gradient accent stripe at top, optional ghost element. For `neon` and `sunset` presets this is the natural background; for `arctic` it provides contrast.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Slide title (set to `none` for no title) |
| `ghost` | none/content | `none` | Ghost text/number shown in background |
| `ghost-dx` | length | `-20pt` | Ghost text horizontal offset |
| `ghost-dy` | length | `-30pt` | Ghost text vertical offset |
| `ghost-size` | length | `200pt` | Ghost text font size |
| `header-left` | none/content | `none` | Custom left header text |
| `header-right` | none/content | `none` | Custom right header text |

```typst
#dark-slide(
  ghost: [01],
  header-left: [MOTION DATA],
  header-right: [KINETIC 2025],
)[
  #text(size: 40pt, weight: "black")[Motion is the message.]
]
```

### `#impact-slide(left-content: none, right-content: none)`

High-contrast split-panel layout for paired statements. The accent left panel and background-color right panel use a crisp vertical partition. No header/footer.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `left-content` | none/content | `none` | Content for left accent panel |
| `right-content` | none/content | `none` | Content for right panel |

```typst
#impact-slide(
  left-content: [
    #text(size: 2em, weight: "black")[STATIC]
    Centered layouts. Symmetric grids.
  ],
  right-content: [
    #text(size: 2em, weight: "black")[KINETIC]
    Diagonal composition. Dynamic energy.
  ],
)
```

### `#ticker-slide(title: auto, ...)`

Scrolling-style data strip layout for timeline and sequence data. Dark background with gradient accent stripe and title. Ideal for frame-by-frame or step-by-step content.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | auto/content | `auto` | Large title rendered at 28pt |
| `header-left` | none/content | `none` | Custom left header text |
| `header-right` | none/content | `none` | Custom right header text |

```typst
#ticker-slide(
  title: [Motion Timeline],
  header-left: [TICKER],
)[
  // Timeline content with frame-numbers...
]
```

### `#title-slide()`

Full-page cover with massive black title, gradient accent rule, speed lines decoration, ghost frame number, velocity kicker for institution. Gradient bars at top and bottom.

```typst
#title-slide()
```

### `#new-section-slide[...]`

Section divider with kinetic energy: accent vertical bar, ghost section number in mono, speed lines, velocity kicker, gradient bars. Auto-triggered by `= Section Title`.

### `#focus-slide[...]`

Full-page centered statement with bold text, gradient bars at top and bottom, accent dot decoration.

```typst
#focus-slide[
  Every element implies motion.
  Stillness is just a paused frame.
]
```

### `#ending-slide[...]`

Closing page with centered heavy title, gradient accent rules, speed lines, ghost "FIN" text, KINETIC meta label.

```typst
#ending-slide[Thank You]
```

## Reusable Components

### `#velocity-kicker(body)`

Compact kicker with a translucent accent field and strong left rail. Uppercase mono label.

```typst
#velocity-kicker[FRAME ANALYSIS]
```

### `#speed-line(length: 120pt, thickness: 2.5pt, color: palette.accent)`

Decorative horizontal speed line with tapered gradient (fades in from left).

```typst
#speed-line()
#speed-line(length: 200pt, thickness: 3pt)
```

### `#angle-card(title, body, angle-height: 4pt)`

Card with a flush accent top rail and opaque surface body with bold title.

```typst
#angle-card([Velocity], [Speed determines hierarchy. Faster elements draw attention.])
```

### `#counter-block(value, label)`

Bold counter value with accent underline and uppercase mono label below.

```typst
#counter-block([24], [FRAMES PER SECOND])
```

### `#split-grid(left-content, right-content, ratio: 55%)`

Asymmetric two-column split with a strong accent divider between panels.

```typst
#split-grid(
  [Left panel content...],
  [Right panel content...],
  ratio: 60%,
)
```

### `#motion-blur-text(body, copies: 3, offset: 4pt)`

Text with fading offset copies creating a motion blur effect. Trailing copies at increasing transparency.

```typst
#motion-blur-text(text(size: 36pt, weight: "black")[SPEED])
```

### `#tag(body, color: palette.accent)`

Small pill-shaped inline label. Uppercase bold text on accent background.

```typst
#tag[GPU]
#tag(color: pal.secondary)[REAL-TIME]
```

### `#progress-bar(ratio, width: 100%, height: 8pt)`

Horizontal bar showing progress from 0.0 to 1.0. Gradient fill from accent to secondary.

```typst
#progress-bar(0.87)
#progress-bar(0.54, width: 200pt, height: 10pt)
```

### `#data-row(label, value)`

Horizontal label-value pair with dotted connecting line. Clean data display.

```typst
#data-row([Frame Rate], [60 fps])
```

### `#kinetic-rule(width: 100%, thickness: 3pt)`

Horizontal accent-to-secondary gradient rule. Width and thickness are configurable.

```typst
#kinetic-rule()
```

### `#frame-number(num)`

Oversized frame counter in monospace, styled like video timecode. Zero-padded. Very low opacity for background use.

```typst
#frame-number(1)   // Renders as "01"
#frame-number(24)  // Renders as "24"
```

### `#ghost-streak(body, copies: 4, dx: 0pt, dy: 0pt)`

Repeated fading text at -15deg angle for background decoration. Creates motion trail effect.

```typst
#ghost-streak([SPEED], dx: -20pt, dy: 40pt)
```

## Palette System

### `build-palette(preset-name)`

Exposed factory function. Returns a full palette dictionary from a preset name.

```typst
#let pal = build-palette("neon")
// Access: pal.bg, pal.ink, pal.accent, pal.secondary, pal.ink-light, etc.
```

### Preset Dictionary

| Preset | Background | Ink | Accent | Secondary | Best For |
|--------|-----------|-----|--------|-----------|----------|
| `neon` | `#0D0D0D` near-black | `#FFFFFF` white | `#FF3366` hot pink | `#00FF88` neon green | Creative, tech, nightclub |
| `sunset` | `#1A0A2E` deep purple | `#F8F0E3` cream | `#FF6B35` orange | `#FFD23F` yellow | Warm, editorial, events |
| `arctic` | `#F0F4F8` ice white | `#0D1B2A` navy | `#00B4D8` electric blue | `#90E0EF` light cyan | Corporate, clean, data |

### Derived Palette Keys

| Key | Derivation | Purpose |
|-----|-----------|---------|
| `palette.bg` | base | Page background |
| `palette.ink` | base | Primary text |
| `palette.accent` | base | Accent color, tags, bars, kickers |
| `palette.secondary` | base | Secondary accent, gradients, tags |
| `palette.ink-light` | ink @ 25% transparent | Secondary text |
| `palette.ink-muted` | ink @ 50% transparent | Kicker labels, metadata |
| `palette.ink-faint` | ink @ 75% transparent | Faint borders, dotted lines |
| `palette.ink-ghost` | ink @ 90% transparent | Ghost text |
| `palette.accent-light` | accent @ 40% transparent | Light accent elements |
| `palette.accent-faint` | accent @ 75% transparent | Very faint accent |
| `palette.accent-ghost` | accent @ 90% transparent | Accent ghost/stripe bg |
| `palette.secondary-light` | secondary @ 40% transparent | Light secondary |
| `palette.secondary-faint` | secondary @ 75% transparent | Faint secondary |
| `palette.surface` | ink @ 92% transparent | Card fills |
| `palette.divider` | ink @ 70% transparent | Dividers |
| `palette.overlay` | bg @ 40% transparent | Overlay panels |

## Typography Constants

Available via the `typo` dictionary:

| Key | Value | Usage |
|-----|-------|-------|
| `typo.display` | 52pt | Hero/cover text |
| `typo.h1` | 34pt | Main title |
| `typo.h2` | 22pt | Subtitle, card titles |
| `typo.body` | 16pt | Body text |
| `typo.kicker-size` | 9pt | Velocity kicker |
| `typo.meta-size` | 8pt | Metadata, tags |
| `typo.counter-size` | 48pt | Counter block number |
| `typo.frame-size` | 60pt | Frame number |

## Fonts

Configure the primary font in your document:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)
```

The theme internally uses:
- `"IBM Plex Mono"` for kickers, metadata, frame numbers, and chrome bars
- `("IBM Plex Sans", "Noto Sans SC")` for body text and CJK fallback

## Design Principles

1. **Diagonal composition** -- No perfectly centered, symmetric layouts
2. **Gradient accents** -- Accent-to-secondary gradients create motion direction
3. **Speed lines** -- Decorative tapered lines imply velocity
4. **Overlapping layers** -- Elements can overlap via `place()`
5. **Asymmetric splits** -- Panels are never 50/50
6. **Bold typography** -- Black weight for impact, regular for reading
7. **Four-color system** -- bg + ink + accent + secondary for maximum energy
8. **Motion blur** -- Fading offset copies create implied movement

## Files

- `template.typ` -- Theme definition (palette, components, slides, entry point)
- `demo.typ` -- Compilable showcase demonstrating all slide types and components

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
