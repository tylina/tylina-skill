# Swiss Theme (guizang-swiss)

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `swiss-theme`
**Style**: Swiss International Typographic Style -- single accent, inverse weight hierarchy, sharp rectangles
**Primary color**: `#002FA7` (International Klein Blue, default preset)
**Best For**: Tech, AI, design, corporate, sustainability, retail, sports
**Complexity Level**: Canvas

## Description

A Canvas-tier presentation theme inspired by the International Typographic Style. One accent color, inverse weight hierarchy (bigger = lighter), sharp rectangles, hairline dividers, and grid-first asymmetric layouts. Ships with 4 accent presets switchable via a single parameter. Includes specialized slide functions for dark statement pages, thesis layouts, and performance dashboards.

## Critical: Markup Mode vs Code Mode

> [!CAUTION]
> **The `#` prefix rule is the #1 cause of render failures with this theme.**
> Inside `#slide[...]`, `#dark-slide[...]`, `#thesis-slide[...]`, and any `[...]` content block,
> ALL function calls MUST have the `#` prefix. Without `#`, they render as literal text.
>
> This is different from `{...}` code blocks (e.g., inside `grid()` children) where `#` is NOT needed.

```typst
// ✅ CORRECT — # prefix inside [...] markup block
#slide(title: none, config: config-page(fill: palette.ink))[
  #v(8pt)
  #text(size: 36pt, weight: 200, fill: palette.paper)[Statement]
  #v(12pt)
  #text(size: 14pt, fill: palette.paper.transparentize(30%))[Detail text]
  #grid(columns: (1fr, 1fr), column-gutter: 16pt,
    #card-ink([Left], [Content...]),
    #card-ink([Right], [Content...]),
  )
]

// ✅ CORRECT — bare calls inside {...} code block (grid children)
#grid(columns: (1fr, 1fr), {
  kicker[SECTION]
  v(8pt)
  text(size: 9pt, weight: 600, fill: palette.grey-3)[LABEL]
  block(fill: palette.grey-1, inset: 12pt)[Card content]
}, {
  text(size: 14pt)[More content]
})

// ❌ WRONG — bare calls inside [...] (renders as literal text!)
#dark-slide(title: [Title])[
  v(8pt)                    // ← Literal text "v(8pt)" shown on slide!
  text(size: 36pt)[Big]     // ← Literal text "text(size: 36pt)[Big]" shown!
  grid(columns: (1fr))      // ← Literal text, not a grid!
]
```

**Quick test**: If you're inside `[...]` brackets and writing a function call, it MUST start with `#`. If you're inside `{...}` braces, it must NOT have `#`.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#show: swiss-theme.with(
  aspect-ratio: "16-9",
  preset: "ikb",
  footer: self => self.info.institution,
  config-info(
    title: [Your Title],
    subtitle: [Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Organization],
  ),
)

#title-slide()

= Section Title

== Slide Title

Your content here.
```

## Theme Parameters

### `swiss-theme(aspect-ratio, align, footer, preset, ..args, body)`

| Parameter | Type | Default | Description |
|---|---|---|---|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `align` | alignment | `horizon` | Default content alignment |
| `footer` | content/function | `none` | Footer content or function |
| `preset` | string | `"ikb"` | Color preset: `"ikb"`, `"lemon"`, `"green"`, `"orange"` |

### Preset Switching

Change the entire color scheme with a single parameter:

```typst
// International Klein Blue (default) -- tech, AI, design
#show: swiss-theme.with(preset: "ikb")

// Lemon Yellow -- youth, sports, retail
#show: swiss-theme.with(preset: "lemon")

// Acid Green -- ecology, sustainability
#show: swiss-theme.with(preset: "green")

// Signal Orange -- industrial, alerts
#show: swiss-theme.with(preset: "orange")
```

## Available Slide Types

### `#title-slide(..args)`
Full-accent-color cover slide with large light-weight title, dot matrix decoration, kicker, subtitle, author, and date. All text uses `accent-on` color.

```typst
#title-slide()
```

### `#slide(title: auto, ..args)`
Standard content slide with left-aligned title (weight 300), accent rule below, and minimal footer with page numbers. The workhorse slide.

```typst
== My Slide Title
Content here...
```

Or with explicit title:

```typst
#slide(title: [Custom Title])[
  Content here...
]
```

Use `title: none` for a chrome-free content area (pair with `#chrome-min` for custom headers).

### `#new-section-slide(self: none, body)`
Auto-generated section divider. Triggered by `= Section Title`. Features a large section number (weight 200, grey-2), section title (weight 200), accent bar on left edge, and accent rule.

### `#focus-slide(body)`
Statement page with centered text (1.6em, weight 200). Paper background with thin accent line at top. Use for key quotes or impactful statements.

```typst
#focus-slide[
  "The grid system is an aid, not a guarantee."

  #v(0.2em)
  #text(size: 0.5em, weight: 500, fill: palette.grey-3)[--- Mueller-Brockmann]
]
```

### `#ending-slide(body)`
Closing slide with vertical accent/paper split (35%/65%). Content on paper side with large light-weight text and accent rule. Dot matrix decoration on accent side.

```typst
#ending-slide[Thank You]
```

### `#dark-slide(title: none, ..args)[body]`
Ink-background slide with automatic text/header/footer inversion. Accent line at top. Optional title rendered at 2.4em weight 200 in white. All body text defaults to white. Footer is automatically styled for dark background.

Use for dramatic statement pages like "Open in blue. Close in blue."

```typst
#dark-slide(title: [Open in #text(fill: palette.accent, style: "italic")[blue].])[
  #v(1fr)
  Statement body content with white text on dark background.
  Accent color is available via `palette.accent`.
]
```

### `#thesis-slide(..args)[body]`
Large statement + detail cards layout. Paper background with footer. Designed for "The harness is the product" style slides where 60% is a big statement and 40% is supporting detail cards.

```typst
#thesis-slide[
  #grid(
    columns: (3fr, 2fr),
    column-gutter: 24pt,
    {
      text(size: 2.6em, weight: 200)[The \ harness \ #text(fill: palette.accent)[is the] \ product]
    },
    {
      // Detail cards, info boxes, etc.
    },
  )
]
```

### `#kpi-slide(title: auto, ..args)[body]`
Performance dashboard layout. Paper background, no header, footer with page counter. Designed for stat cards, bar charts, and KPI displays.

```typst
#kpi-slide[
  #kicker[PERFORMANCE]
  #v(4pt)
  #grid(
    columns: (5fr, 2fr, 2fr),
    column-gutter: 12pt,
    text(size: 1.8em, weight: 200)[General \ performance],
    { text(size: 36pt, weight: 200)[530] },
    { text(size: 36pt, weight: 200)[60] },
  )
  #v(6pt)
  #hairline-rule()
  // Detail content below...
]
```

### `#plain-slide`

Minimal chrome slide with no header, compact footer, and full content area. Use for data-heavy pages where maximum vertical space is needed, or for slides that need a cleaner look than the standard `#slide`.

**Parameters**: Same as `#slide` — accepts body content directly.

**Usage**:
```typst
#plain-slide[
  #kicker[SECTION 12 · THE SELF-EXPRESSION LOOP]
  #v(4pt)
  #text(size: 1.5em, weight: 300)[Content with full vertical space.]
  #v(12pt)
  // ... data-heavy content
]
```

**When to use**: Dashboard pages, multi-component layouts, any slide where the standard header takes too much space. Appears in 3+ demo slides.

## Reusable Components

### `#kpi-hero(value, label: none)`
Giant number display for data hero moments. 36pt, weight 200 (inverse hierarchy). Optional small label below.

```typst
#kpi-hero([96.4%], label: [Design Token Consistency])
```

### `#kicker(body)`
Mono uppercase meta label. 9pt, weight 600, tracked 1.5pt, grey-3. Place above section content.

```typst
#kicker[Historical Context]
```

### `#hairline-rule(width: 100%)`
0.5pt ink horizontal divider.

```typst
#hairline-rule()
#hairline-rule(width: 60%)
```

### `#accent-rule(width: 48pt, accent: palette.accent)`
Accent-colored block rule, 3pt height. Used below titles and as visual anchors.

```typst
#accent-rule()
#accent-rule(width: 100pt)
```

### `#numbered-item(number, title, body, accent: palette.accent)`
Number + title + description block. Number displayed at 22pt weight 200 in accent color, title as tracked uppercase kicker, body as 10pt regular text.

```typst
#numbered-item([01], [Data], [Read NPS scores and user feedback.])
#v(8pt)
#numbered-item([02], [Extract], [Identify patterns in negative feedback.])
#v(8pt)
#numbered-item([03], [Action], [Write back to skill files.])
```

### `#card-ink(title, body)`
Full ink (#0a0a0a) background card with white text. High contrast, use sparingly.

```typst
#card-ink([Dark Card], [
  White text on near-black background.
])
```

### `#card-accent(title, body, accent: palette.accent, accent-on: palette.accent-on)`
Full accent color background card. Text color adapts via accent-on.

```typst
#card-accent([Accent Card], [
  Content on accent background.
])
```

### `#card-fill(title, body)`
Grey-1 (#f0f0ee) fill card. The workhorse -- lowest contrast, most common.

```typst
#card-fill([Standard Card], [
  Most content goes in grey-fill cards.
])
```

### `#card-outlined(title, body)`
Hairline border only (0.5pt grey-2), no fill. Lightest visual weight.

```typst
#card-outlined([Outlined Card], [
  Minimal visual weight, maximum content focus.
])
```

### `#stat-card(value, label, unit: none)`
Large number + small uppercase label. Value at 24pt weight 200, label at 9pt weight 500.

```typst
#stat-card([248], [Components in production], unit: [+])
```

### `#timeline-node(year, title, body, accent: palette.accent)`
Compact timeline entry with year, accent dot, and content.

```typst
#timeline-node(1957, [Helvetica Released], [
  Max Miedinger designs Helvetica at the Haas Type Foundry.
])
```

### `#bar-chart-row(label, value, max-value: 100, accent: palette.accent)`
Horizontal bar chart row with label, accent-filled bar, and value.

```typst
#bar-chart-row([Helvetica], 34, max-value: 40)
#bar-chart-row([Noto Sans], 28, max-value: 40)
```

### `#dot-matrix(rows: 3, cols: 8, size: 2.5pt)`
Geometric dot decoration. Use only on hero/cover pages -- regular content slides must stay clean.

```typst
#dot-matrix(rows: 4, cols: 10, size: 2pt)
```

### `#duo-compare(left-title, left-body, right-title, right-body)`
Left/right comparison with center vertical hairline rule.

```typst
#duo-compare(
  [Before], [Manual processes, inconsistent layouts],
  [After], [Automated grid, systematic hierarchy],
)
```

### `#chrome-min(left-text, right-text)`
Minimal top chrome bar with left and right uppercase labels. 8pt, weight 500, grey-3. Use inside `#slide(title: none)` for custom header chrome.

```typst
#chrome-min([Section 03], [Q4 2024])
```

## Color Scheme

### Greyscale (All Presets)

| Role | HEX | `palette.key` | Purpose |
|---|---|---|---|
| Paper | `#fafaf8` | `palette.paper` | Warm off-white background |
| Ink | `#0a0a0a` | `palette.ink` | Near-black text |
| Grey 1 | `#f0f0ee` | `palette.grey-1` | Card fills, subtle bg |
| Grey 2 | `#d4d4d2` | `palette.grey-2` | Borders, dots, disabled |
| Grey 3 | `#737373` | `palette.grey-3` | Meta text, captions |

### Accent Colors by Preset

| Preset | Accent | Accent-On | `palette.accent` | `palette.accent-on` |
|---|---|---|---|---|
| `ikb` | `#002FA7` | `#ffffff` | International Klein Blue | White |
| `lemon` | `#FFD500` | `#0a0a0a` | Lemon Yellow | Near-black |
| `green` | `#C5E803` | `#0a0a0a` | Acid Green | Near-black |
| `orange` | `#FF6B35` | `#ffffff` | Signal Orange | White |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.accent,
  neutral-lightest: palette.paper,
  neutral-darkest: palette.ink,
)
```

## Inverse Weight Hierarchy Reference

| Size | Weight | Typst | Example |
|---|---|---|---|
| >= 36pt | 200 | `weight: 200` | Cover titles, KPI heroes, focus |
| 24--35pt | 200--300 | `weight: 300` | Slide titles, section titles |
| 16--23pt | 300--400 | `weight: 400` | Card titles, takeaway headings |
| 12--15pt | 400--500 | `weight: 500` | Body text, descriptions |
| 9--11pt | 500--600 | `weight: 600` | Kickers, meta, captions |

## Layout Patterns

### Standard 2-Column
```typst
#cols(columns: (3fr, 2fr))[
  Main content area...
][
  #stat-card([42], [Metric], unit: [%])
]
```

### 3-Column Cards
```typst
#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #card-fill([Card A], [Content...])
][
  #card-fill([Card B], [Content...])
][
  #card-fill([Card C], [Content...])
]
```

### Dark Statement Page
```typst
#dark-slide(title: [Statement #text(fill: palette.accent)[here].])[
  #v(1fr)
  #grid(
    columns: (1fr, 1.5fr),
    column-gutter: 24pt,
    { set text(size: 9pt, fill: palette.grey-3); [Description...] },
    {
      // Numbered items on dark background
      grid(
        columns: (auto, 1fr),
        column-gutter: 14pt,
        row-gutter: 16pt,
        text(size: 20pt, weight: 200, fill: white)[01],
        { text(size: 11pt, weight: 500, fill: white)[Item title]; v(2pt); set text(size: 8.5pt, fill: palette.grey-3); [Description...] },
      )
    },
  )
]
```

### Thesis Layout
```typst
#thesis-slide[
  #grid(
    columns: (3fr, 2fr),
    column-gutter: 24pt,
    { text(size: 2.6em, weight: 200)[Big \ Statement] },
    {
      #card-fill([Detail], [Supporting information...])
      v(8pt)
      #card-outlined([More], [Additional context...])
    },
  )
]
```

### KPI Dashboard
```typst
#kpi-slide[
  #kicker[PERFORMANCE]
  #grid(
    columns: (5fr, 2fr, 2fr, 2fr),
    column-gutter: 12pt,
    text(size: 1.8em, weight: 200)[Title],
    { text(size: 36pt, weight: 200)[530]; v(2pt); text(size: 8pt, fill: palette.grey-3)[calls / hr] },
    { text(size: 36pt, weight: 200)[60]; v(2pt); text(size: 8pt, fill: palette.grey-3)[baseline] },
    { text(size: 36pt, weight: 200)[\~13]; v(2pt); text(size: 8pt, fill: palette.grey-3)[sec / cycle] },
  )
  #hairline-rule()
  // Detail content below...
]
```

## Using Non-Default Presets with Components

Slide functions automatically use the selected preset's accent color via `self.store.palette`. However, standalone components like `accent-rule`, `card-accent`, `numbered-item`, `timeline-node`, and `bar-chart-row` default to the ikb accent. For non-default presets, reassign `palette` after import:

```typst
#import "template.typ": *

// Override palette for non-default preset
#let palette = make-palette("orange")

#show: swiss-theme.with(preset: "orange", ...)
```

This ensures all components use the correct accent color. Alternatively, pass `accent:` explicitly to each component.

## Fonts

Fonts are **not** set in `template.typ`. Configure in your main document:

```typst
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)
```

Recommended sans-serif fonts (Swiss rule: sans-serif only):
1. IBM Plex Sans / Noto Sans SC (the verified demo stack)
2. Liberation Sans (alternative)
3. IBM Plex Mono (for code blocks)

**Never use serif fonts with this theme.**

## Files

- `template.typ` -- Theme definition (palette, helpers, slides, components, entry point)
- `demo.typ` -- 8-page compilable showcase (AI harness architecture topic)
- `theme.md` -- This API reference

## Demo

See `demo.typ` for a compilable example with 8 pages covering all slide types including `dark-slide`, `thesis-slide`, and `kpi-slide`.
