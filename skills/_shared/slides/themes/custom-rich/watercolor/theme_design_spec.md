# Watercolor Theme for Touying 0.7.4

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Theme Name** | watercolor |
| **Best For** | Creative presentations, art direction, design portfolios, storytelling, branding talks |
| **Style Objective** | Creative |
| **Complexity Level** | Rich |

A soft, organic painting aesthetic with bleeding-edge shapes, featuring SVG blob forms (cubic bezier curves), paint splatter accents, wavy dividers, warm paper texture background, translucent wash fills, and brushstroke marks. Creates an artistic, hand-crafted feeling perfect for creative industries and visual storytelling.

## Design Philosophy

- **Organic & Fluid**: Irregular blob shapes created with cubic bezier curves replace geometric borders, evoking watercolor paper bleeding
- **Layered Translucency**: Multiple overlapping semi-transparent shapes create depth and visual richness without heaviness
- **Warm Craftsmanship**: Cream paper background and warm ink tones evoke the feeling of hand-painted artwork
- **Chromatic Expression**: Three color variants (blue, rose, gold) provide emotional range while maintaining cohesion through shared opacity and form language

## Color Palette

| Color | Hex | Role |
|-------|-----|------|
| Warm Cream | `#FDF8F0` | Background -- warm paper texture |
| Deep Sienna | `#2C1810` | Primary text -- rich dark ink |
| Ocean Blue | `#1E6091` | Primary accent -- trust, depth |
| Crimson Rose | `#9B2226` | Secondary accent -- passion, emphasis |
| Warm Gold | `#CA8A04` | Tertiary accent -- warmth, prosperity |
| Accessible Gold | `#A16207` | Gold foreground text and borders with projection-safe contrast |

## Theme Entry Point

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: watercolor-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    institution: [Institution],
    date: datetime.today(),
  ),
)
```

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | `string` | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | `content` | `none` | Footer text displayed on content slides |

## Slide Functions

### `title-slide(..args)`
Large decorative blob shapes layered as background (blue, rose, gold), centered title, wavy bleed-line divider, author in accent color, institution and date in muted ink, paint splatter accents in corners.

### `slide(title: auto, ..args)`
Cream paper background with bold title, wavy bleed-line underline (instead of straight rule), corner blob decoration top-right, footer with paint splatter accent, centered footer text, and slide counter.

### `new-section-slide(self: none, body)`
Deep blue wash background with overlaid organic blob texture, paint splatter accents in gold and rose, large white bold section title, white semi-transparent line, and decorative dot sequence.

### `focus-slide(body)`
Deep blue watercolor background (darkened) with organic blob overlays for depth, paint splatter accents, and centered white bold text.

### `ending-slide(body)`
Cream paper background with multiple overlapping blob shapes (blue, rose, gold, large), scattered paint splatters in all corners, centered text between wavy bleed-line decorations.

## Reusable Components

### `wash-card(title, body, variant: "blue")`
Card with organic SVG blob shape visible behind content as a watercolor wash. Available variants: `"blue"`, `"rose"`, `"gold"`. Thin colored border with rounded corners.

```typst
#wash-card([Warm Palettes], [
  Warm colors evoke energy, passion, and immediacy.
  - *Red:* Action, urgency, love
  - *Gold:* Wisdom, prosperity, warmth
], variant: "gold")
```

### `palette-stat(label, value, variant: "blue")`
Large colored number with paint-splatter dots as corner accent. Cream background with thin colored border and rounded corners.

```typst
#palette-stat([Emotional Recall], [+67%], variant: "blue")
```

### `brush-quote(quote-text, author: none)`
Quote with large brushstroke-style SVG accent mark, blue wash background fill, italic text, and bold author attribution.

```typst
#brush-quote(
  [Design is not just what it looks like. Design is how it works.],
  author: [Steve Jobs],
)
```

### `bleed-divider()`
Wavy irregular SVG line divider mimicking watercolor paper bleeding edges.

```typst
#bleed-divider()
```

### `swatch-grid(items)`
Grid of colored squares like a painter's palette, cycling through theme colors with translucent fills.

```typst
#swatch-grid(([Scale], [Color], [Contrast], [Proximity], [Alignment]))
```

### `pigment-tag(label, variant: "blue")`
Small tag with rounded organic shape (12pt radius), translucent fill, and semi-bold text. Variants: `"blue"`, `"rose"`, `"gold"`.

```typst
#pigment-tag([Proportion], variant: "blue")
#pigment-tag([Rhythm], variant: "rose")
#pigment-tag([Balance], variant: "gold")
```

### `wash-box(body, variant: "blue")`
Content area with soft translucent watercolor background fill. Rounded corners, no border. Variants: `"blue"`, `"rose"`, `"gold"`.

```typst
#wash-box([
  Color is not decoration -- it is communication.
], variant: "rose")
```

### `paint-splatter(variant: "blue", width: 50pt)`
Decorative SVG paint splatter cluster element. Variants: `"blue"`, `"rose"`, `"gold"`.

```typst
#paint-splatter(variant: "gold", width: 50pt)
```

## Helper Functions

### `paint-splatter(variant: "blue", width: 50pt)`
Renders an SVG cluster of irregular paint dots in the specified color variant.

## Available Colors

All colors are accessed via the `palette` dictionary:

```typst
#text(fill: palette.ink)[Deep sienna text]
#text(fill: palette.accent)[Ocean blue text]
#text(fill: palette.secondary)[Crimson rose text]
#text(fill: palette.gold)[Warm gold text]
```

- `palette.bg`, `palette.ink`, `palette.accent`, `palette.secondary`, `palette.gold`, `palette.gold-text`, `palette.white`
- `palette.wash-blue`, `palette.wash-rose`, `palette.wash-gold` (translucent fills)
- `palette.ink-light` (38% transparent), `palette.ink-muted` (30% transparent)

### Touying Color Mapping

| Touying Role | Mapped To | Usage |
|---|---|---|
| `primary` | `palette.accent` | Theme accent (ocean blue), `alert()` text |
| `neutral-lightest` | `palette.bg` | Light backgrounds (warm cream) |
| `neutral-darkest` | `palette.ink` | Dark text (deep sienna) |

## Best Use Cases

- Creative agency presentations and pitches
- Art direction and design portfolio showcases
- Visual storytelling and narrative presentations
- Brand identity and color theory talks
- Design education and composition lectures
- Workshop materials for creative professionals

## Recommended Complexity

**Rich** -- This theme uses multiple layered SVG blob shapes, paint splatters, and translucent washes to create visual depth. Use `wash-card`, `brush-quote`, and `palette-stat` to build compositions that feel organic and hand-crafted. The three color variants (blue, rose, gold) allow emotional range within a cohesive visual language.

## Demo

See `demo.typ` for a complete demonstration covering:
1. Title slide (layered blobs, splatters)
2. The Language of Color (color psychology, warm vs cool palettes)
3. Composition & Form (golden ratio, visual hierarchy toolkit)
4. Narrative Structure (story arcs, pacing & rhythm)
5. The Craft of Clarity (data as poetry, typography as voice)
6. Focus slide and ending slide

## File Structure

```
watercolor/
  template.typ   -- Theme definition (colors, slides, components)
  demo.typ       -- Full demonstration presentation
```
