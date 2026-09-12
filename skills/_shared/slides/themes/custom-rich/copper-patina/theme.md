# Copper Patina

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `copper-patina-theme`
**Style**: Industrial copper, verdigris patina, mechanical precision
**Primary color**: `#B87333` (copper)
**Best For**: Engineering, industrial design, steampunk, manufacturing, material science
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A warm industrial theme inspired by aged copper metalwork, verdigris green patina, and Victorian engineering. Every slide inhabits a workshop of brass instruments, riveted plates, and steam-age precision. Features persistent gear-pattern atmosphere, rivet-decorated cards, pressure-gauge statistics, and blueprint-style technical boxes. The copper-to-verdigris gradient represents the beautiful transformation of time on metal.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: copper-patina-theme.with(
  aspect-ratio: "16-9",
  footer: [My Presentation],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
  config-common(breakable: false),
)

#set text(font: ("Arial", "Noto Sans SC"))

#title-slide()

= First Section

== First Slide

Content goes here.

#focus-slide[Key Takeaway]

#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/function | `none` | Footer content; can be a function `self => ...` |

## Fonts

Fonts are configured in `main.typ`, NOT in `template.typ`:

```typst
#set text(font: ("Arial", "Noto Sans SC"), size: 18pt)
```

The template sets size and color only. The document owns its font choice; raw/code blocks use Typst's default syntax-highlighting font unless the document overrides it.

## Available Slide Types

### `#title-slide()`
Full industrial-framed cover with pipe borders, pressure gauge decoration, and rivet rows. Displays title in copper, subtitle in italics, author, institution, and date. Bookends with ending slide via shared pipe-frame and rivet-row elements.

### `#slide(title: auto)`
Standard content slide with warm cream background, semibold title + copper-to-verdigris gradient accent (with rivet dots at ends), gear-pattern persistent atmosphere, and corner rivet decorations. Supports multi-column via `#slide[...][...]`.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Shows large faded copper section number, bold section title, and rivet-row separator. Left gradient bar (copper-to-verdigris) as accent.

### `#focus-slide[...]`
Dark steel background with inverted gear pattern. Centered copper-light text. Rivet rows at top and bottom edges. Use for key takeaways and dramatic statements.

### `#ending-slide[...]`
Bookends with title slide: pipe frame + rivet rows. Centered copper text with gradient accent line and tagline. Creates narrative closure.

## Reusable Components

### `#rivet-card(title, body, accent: palette.primary)`
Card with decorative rivet dots along top and bottom edges. Shadow elevation via `shadowed` package. Supports `lazy-v(1fr)` for height equalization in `cols()`. Use for any general content that needs visual weight.

```typst
#rivet-card([Card Title], [
  Card body content with bullet points or paragraphs.
], accent: palette.accent)
```

### `#gauge-stat(label, value, color: palette.primary)`
Circular gauge display showing a large centered number inside concentric circles, mimicking a pressure meter. Label appears below. Best in grid/cols layouts.

```typst
#gauge-stat([Temperature], [1085], color: palette.primary)
```

### `#blueprint-box(title, body)`
Technical drawing style box with dashed steel border and corner measurement marks (+). Title prefixed with triangle symbol. Use for specifications, processes, and technical details.

```typst
#blueprint-box([Specifications], [
  Technical details in a blueprint-style container.
])
```

### `#patina-highlight(title, body)`
Green-tinted accent box with verdigris left border and patina-light background wash. Use for key insights, important callouts, or highlighted information.

```typst
#patina-highlight([Key Insight], [
  Important information highlighted with verdigris patina accent.
])
```

### `#brass-tag(content, color: palette.primary)`
Small inline label styled like a stamped brass plate. Use for categories, tags, and metadata badges.

```typst
#brass-tag[Category] #brass-tag[Status] #brass-tag[Priority]
```

### `#copper-divider(width: 80%)`
Centered gradient line from copper to verdigris. Use as a visual section separator within slides.

```typst
#copper-divider(width: 60%)
```

### `#forge-quote(quote, source: none)`
Industrial-style blockquote with a copper pipe-like left rail. Italic quote text with optional attributed source.

```typst
#forge-quote(
  [The quoted text goes here.],
  source: [Attribution],
)
```

### `#oxide-section(title, body)`
Borderless typography-only section: bold copper title + copper divider + body content. No visible box or border. Use for clean text sections within complex layouts.

```typst
#oxide-section([Section Title], [
  Body content without any box or border decoration.
])
```

### `#rivet-row(color: palette.rivet, width: 100%)`
Decorative SVG row of brass rivets with highlight reflections. Use as a visual separator or decorative element.

```typst
#rivet-row(color: palette.rivet, width: 60%)
```

## Color Scheme

### Palette Dictionary (Rich)

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#B87333` | `palette.primary` | Copper headers, accent bars |
| **Primary Ink** | `#995721` | `palette.primary-ink` | Accessible copper text on light surfaces |
| **Dark** | `#1A1A2E` | `palette.dark` | Dark steel backgrounds |
| **Accent** | `#4A8C7B` | `palette.accent` | Verdigris patina highlights |
| **Accent Ink** | `#356F61` | `palette.accent-ink` | Accessible verdigris text on light surfaces |
| **Background** | `#FAF6F0` | `palette.bg` | Warm cream page background |
| **Card** | `#FFFFFF` | `palette.card` | Content card fills |
| **Text Dark** | `#2A1F14` | `palette.text-dark` | Headings, primary text |
| **Text Body** | `#4A3F35` | `palette.text-body` | Body text |
| **Text Light** | `#7B6D5C` | `palette.text-light` | Accessible captions and secondary text |
| **Border** | `#D4C4A8` | `palette.border` | Card borders |
| **Copper Light** | `#D4956A` | `palette.copper-light` | Highlights on dark slides |
| **Verdigris** | `#4A8C7B` | `palette.verdigris` | Green patina accents |
| **Steel** | `#3A4A5C` | `palette.steel` | Blueprint elements |
| **Rivet** | `#8B6914` | `palette.rivet` | Rivet decorations |
| **Patina Light** | `#A8D5C8` | `palette.patina-light` | Subtle green washes |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary-ink,    // #995721 accessible copper text
  neutral-lightest: palette.bg,    // #FAF6F0 warm cream
  neutral-darkest: palette.text-dark, // #2A1F14 dark brown
)
```

## SVG Decorations

The theme includes 3 inline SVG patterns:

1. **Gear Pattern** (`_gear-pattern-svg`) -- Interlocking mechanical gears of various sizes. Used as persistent background atmosphere on every content slide.
2. **Rivet Row** (`_rivet-row-svg`) -- Horizontal band of evenly spaced brass rivets with highlight dots. Used as decorative separators and in rivet-card edges.
3. **Pipe Frame** (`_pipe-frame-svg`) -- Industrial piping with corner elbow joints, valves, and a central pressure gauge. Used on title/ending slides as bookending frame elements.

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release
- **Dependencies**: `@preview/shadowed:0.3.0` (box shadows for metallic depth)

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with content about copper metallurgy, industrial engineering, and material science.
