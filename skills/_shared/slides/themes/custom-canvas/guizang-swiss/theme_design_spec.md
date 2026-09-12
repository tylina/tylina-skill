# Guizang Swiss Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | guizang-swiss |
| **Best For** | Product launches, tech startups, data dashboards, investment decks, modernist presentations |
| **Style Objective** | International Typographic Style / Swiss Design |
| **Complexity Level** | Canvas |

An International Typographic Style (Swiss Design) presentation theme with a single accent color, inverse weight hierarchy (light 200-weight for titles, bold for details), sharp rectangles, grid-first layout. Features dot-matrix decorations, 4 accent presets (ikb, lemon, green, orange), and multiple specialized slide types including thesis-slide, kpi-slide, dark-slide, and plain-slide.

## Design Philosophy

- **Grid-First Layout**: Swiss design grid system with strict alignment and generous whitespace
- **Inverse Weight Hierarchy**: Light 200-weight large numbers/titles, heavier weights for smaller labels/details
- **Single Accent Color**: One accent color per preset drives all highlights; everything else is black/white/grey
- **Sharp Rectangles**: No rounded corners; all elements are precise rectangles aligned to the grid

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Paper | `#FAFAF8` | Page background |
| Ink | `#0A0A0A` | Primary text, card-ink background |
| Grey-1 | `#F0F0EE` | Card-fill background, bar background |
| Grey-2 | `#D4D4D2` | Light borders, dot-matrix, dividers |
| Grey-3 | `#737373` | Metadata, kickers, secondary text |
| IKB Blue (accent) | `#002FA7` | Default accent (International Klein Blue) |
| Lemon (accent) | `#FFD500` | Lemon preset accent |
| Green (accent) | `#C5E803` | Green preset accent |
| Orange (accent) | `#FF6B35` | Orange preset accent |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: swiss-theme.with(
  aspect-ratio: "16-9",
  preset: "ikb",
  footer: [PRODUCT OVERVIEW],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Company],
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `preset` | `string` | `"ikb"` | Accent preset: `"ikb"`, `"lemon"`, `"green"`, `"orange"` |
| `footer` | `content/function` | `none` | Footer content or function |
| `align` | `alignment` | `horizon` | Default content alignment |

## Slide Functions

### `title-slide(..args)`
Cover slide with full accent-colored background, dot-matrix decoration (top-right), institution kicker, large 200-weight title in accent-on color, subtitle, hairline divider, author, and date. Left-aligned, vertically centered.

### `slide(title: auto, align: auto, ..args)`
Standard content slide with left-aligned 1.3em 300-weight title, 40pt accent rule below, and footer with page counter. Paper background.

### `plain-slide(..args)`
Content slide without header -- body fills the area. Use when content contains its own `chrome-min` or `kicker`. Includes footer.

### `new-section-slide(self: none, body)`
Section divider with paper background, vertical accent bar (left edge), large 200-weight section number (3.5em), section title (2em, weight 200), accent rule, and dot-matrix decoration. Auto-triggered by `= Section Title`.

### `dark-slide(title: none, ..args)`
Ink background with accent line at top, optional large 200-weight white title, white body text, and footer. For statement pages.

### `thesis-slide(..args)`
Large statement + detail layout on paper background. Designed for slides with big thesis text on one side and detail cards on the other.

### `kpi-slide(title: auto, ..args)`
Performance dashboard layout with chrome-min header, stat cards row, hairline rule, and detail content below.

### `focus-slide(body)`
Statement page with paper background, top accent line, large 200-weight centered text, no header/footer.

### `ending-slide(body)`
Closing slide with 35% accent left panel, 65% paper right panel, large 200-weight farewell text, accent rule below, and dot-matrix decoration.

## Reusable Components

### `kicker(body)`
Mono uppercase tracked label (9pt, weight 600, grey-3 fill).

```typst
#kicker[MARKET OVERVIEW]
```

### `hairline-rule(width: 100%)`
0.5pt ink horizontal divider.

```typst
#hairline-rule(width: 80%)
```

### `accent-rule(width: 48pt, accent: palette.accent)`
Accent-colored block rule (3pt height).

```typst
#accent-rule(width: 60pt)
```

### `kpi-hero(value, label: none)`
Giant number display (36pt, weight 200) with optional small label below.

```typst
#kpi-hero([2.4M], label: [Monthly Active Users])
```

### `chrome-min(left-text, right-text)`
Minimal top chrome bar with left/right uppercase text.

```typst
#chrome-min([SECTION 01], [DECK v1.2])
```

### `dot-matrix(rows: 3, cols: 8, size: 2.5pt)`
Geometric dot decoration grid for visual texture.

```typst
#dot-matrix(rows: 4, cols: 6, size: 2pt)
```

### `numbered-item(number, title, body, accent: palette.accent)`
Number + title + description block layout.

```typst
#numbered-item([01], [DISCOVERY], [User research and market analysis phase])
```

### `card-ink(title, body)`
Card with ink background and white text.

```typst
#card-ink([Constraint], [Single database, 10ms SLA requirement])
```

### `card-accent(title, body, accent: palette.accent, accent-on: palette.accent-on)`
Card with accent color background.

```typst
#card-accent([Highlight], [Key differentiator in the market])
```

### `card-fill(title, body)`
Card with grey-1 fill (most common card variant).

```typst
#card-fill([Feature], [Automatic scaling based on load patterns])
```

### `card-outlined(title, body)`
Card with hairline border only (no fill).

```typst
#card-outlined([Note], [Optional configuration parameter])
```

### `stat-card(value, label, unit: none)`
Large number + small label in grey-1 filled card.

```typst
#stat-card([99.9], [UPTIME], unit: [%])
```

### `timeline-node(year, title, body, accent: palette.accent)`
Compact vertical timeline entry with year, dot marker, title, and description.

```typst
#timeline-node(2024, [Series A], [Raised $12M from Tier-1 VCs])
```

### `bar-chart-row(label, value, max-value: 100, accent: palette.accent)`
Horizontal bar with percentage fill for data visualization.

```typst
#bar-chart-row([React], 78, max-value: 100)
#bar-chart-row([Vue], 45, max-value: 100)
```

### `duo-compare(left-title, left-body, right-title, right-body)`
Left/right comparison with center vertical rule.

```typst
#duo-compare(
  [Before], [Manual process, 3 days],
  [After], [Automated, 15 minutes],
)
```

## Preset Dictionary

| Preset | Accent | Accent-On | Best For |
|--------|--------|-----------|----------|
| `ikb` | `#002FA7` | `#FFFFFF` | Corporate, professional |
| `lemon` | `#FFD500` | `#0A0A0A` | Energetic, creative |
| `green` | `#C5E803` | `#0A0A0A` | Growth, sustainability |
| `orange` | `#FF6B35` | `#FFFFFF` | Bold, startup energy |

## Demo

See `demo.typ` for a complete demonstration covering product/startup pitch topics.

## File Structure

```
guizang-swiss/
  template.typ   -- Theme definition (palette, components, slides)
  demo.typ       -- Full demonstration presentation
```
