# Herbarium Press Theme - API Reference

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: herbarium-press-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Herbarium Nationale Botanica],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime.today(),
  ),
)

#title-slide()

= Section Title
== Slide Title
Content here...

#focus-slide[Key Message]
#ending-slide[Thank You]
```

## Theme Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `aspect-ratio` | `"16-9"` | Page aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `none` | Footer text displayed on content slides |
| `align` | `horizon` | Default vertical alignment of slide content |

## Color Palette

| Key | Hex | Usage |
|-----|-----|-------|
| `palette.bg` | #FAF7F0 | Warm cream -- aged paper background |
| `palette.primary` | #2D5016 | Deep forest green -- titles, accents, borders |
| `palette.secondary` | #8B9F6F | Dried sage -- dividers, subtle accents |
| `palette.accent` | #9B6B7D | Pressed rose/mauve -- highlights, field notes |
| `palette.text` | #3D3226 | Sepia -- primary text color |
| `palette.text-light` | #6B5D52 | Lighter sepia -- secondary text |
| `palette.text-muted` | #7A6D63 | Accessible warm grey -- captions, metadata, footer |
| `palette.card` | #F5F1E8 | Slightly darker cream -- card backgrounds |
| `palette.border` | #D4C9B8 | Warm border -- strokes, rules |
| `palette.label-bg` | #FFFDF8 | Specimen label white -- card fills |
| `palette.vein` | #C4D4A8 | Leaf vein green -- very soft decorative |

## Slide Types

| Function | Trigger | Description |
|----------|---------|-------------|
| `title-slide()` | Manual call | Botanical frame bookend, specimen label card, leaf dividers |
| `new-section-slide` | `= Heading` | Deep forest green gradient, ghosted leaf veins, rose accent bar |
| `slide` | `== Heading` | Aged paper bg, mounting corners, sepia rule header |
| `focus-slide[...]` | Manual call | Dark sepia bg, ghosted specimen sheet, white text |
| `ending-slide[...]` | Manual call | Matching botanical frame bookend with title slide |

## Reusable Components

### `specimen-card(title, body, accent: palette.primary)`
Card with mounting-corner bracket decorations, like a pressed specimen mounted on archival card.
Titles use an automatically darkened version of `accent` so custom accent colors remain legible on the light card.

```typst
#specimen-card([Card Title], [Card content here...])
#specimen-card([Accent Card], [...], accent: palette.secondary)
```

### `botanical-box(title, body, accent: palette.primary)`
Insight/highlight box with leaf-vein left border pattern and faint leaf decoration.

```typst
#botanical-box([Key Insight], [Important information...])
#botanical-box([Note], [...], accent: palette.accent)
```

### `collection-stat(label, value, note: none, accent: palette.primary)`
Metric display with specimen-label framing (top/bottom accent borders).
Use each stat as the sole component in a `lazy-layout` column when building an equal-height metric row.

```typst
#collection-stat([Specimens], [2,847], note: [+680 from 2025])
```

### `pressed-quote(body, attribution: none)`
Quote block with botanical line borders and italic text.

```typst
#pressed-quote(
  [The herbarium is a library of pressed plants...],
  attribution: [Agnes Arber, 1954],
)
```

### `genus-tag(label, accent: palette.primary)`
Taxonomic-style italic label tag (like binomial nomenclature labels).

```typst
#genus-tag([Saxifraga sect. Porphyrion])
#genus-tag([Poaceae], accent: palette.secondary)
```

### `vine-divider(color: palette.secondary)`
Delicate botanical separator using the leaf divider SVG motif.
Its restrained internal padding keeps the motif clear without creating large vertical gaps.

```typst
#vine-divider()
```

### `field-note(title, body, accent: palette.text-light)`
Observation box styled like a naturalist's field note with faint ruled lines.

```typst
#field-note([Field Observation, 14 Aug], [
  Observed early flowering at summit...
])
```

### `classification-table(headers, rows)`
Taxonomy-style data display with herbarium-appropriate styling and alternating row fills.

```typst
#classification-table(
  ([Family], [Species], [Count]),
  (
    ([Saxifragaceae], [Saxifraga spp.], [142]),
    ([Poaceae], [Festuca spp.], [124]),
  ),
)
```

### `petal-card(title, body, accent: palette.accent)`
Soft card with pressed-flower-inspired gradient (warm mauve to cream).

```typst
#petal-card([Discovery], [A new species was found...])
#petal-card([Alert], [...], accent: palette.primary)
```

## Layout Patterns

### Four-column stats row
```typst
#cols(lazy-layout: true, columns: (1fr,) * 4, gutter: 12pt,
  collection-stat([Label 1], [Value], note: [note]),
  collection-stat([Label 2], [Value]),
  collection-stat([Label 3], [Value]),
  collection-stat([Label 4], [Value]),
)
```

### Three-column specimen cards
```typst
#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
  specimen-card([Title 1], [...], accent: palette.primary),
  specimen-card([Title 2], [...], accent: palette.secondary),
  specimen-card([Title 3], [...], accent: palette.accent),
)
```

### Two-column with mixed components
```typst
#cols(columns: (3fr, 2fr), gutter: 16pt)[
  #petal-card([Main Content], [...])
][
  #stack(
    spacing: .8em,
    collection-stat([Metric], [Value]),
    genus-tag([Taxonomy Label]),
  )
]
```

## Design Notes

- **Signature look**: Aged paper, pressed botanical specimens, Victorian natural history aesthetic
- **Decorative elements**: Leaf vein SVGs, mounting corner brackets, specimen labels, vine runners
- **Best for**: Scientific presentations, botanical research, natural history, academic conferences, museum talks
- **Typography**: The template leaves font ownership to the consuming deck; the demo uses bundled Libertinus Serif for an archival scientific voice
- **Atmosphere**: Every content slide has subtle leaf vein patterns and corner brackets
