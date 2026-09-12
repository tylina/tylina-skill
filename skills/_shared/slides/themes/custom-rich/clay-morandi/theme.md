# Clay Morandi

**Type**: Custom (local template)
**Touying version**: 0.7.4
**Entry function**: `clay-morandi-theme`
**Style**: Muted earth tones, ceramic warmth, rounded softness inspired by Morandi paintings
**Primary color**: `#8B7D6B` (warm gray-brown)
**Best For**: Interior design, lifestyle brands, wellness, sustainability, craft, ceramics, creative agencies
**Style Objective**: General Versatile
**Complexity Level**: Rich

## Description

A warm, muted theme inspired by Giorgio Morandi's still life palette and modern clay/ceramic aesthetics. Features 6 rotating earth-tone shades (dusty rose, sage, terracotta, slate blue, sand, mauve) applied to different cards and components, creating a patchwork of quiet, harmonious colors. Signature 12pt rounded corners everywhere evoke smoothed clay vessels. Perfect for presentations about design, wellness, sustainability, and craft.

## Quick Start

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Noto Sans SC"), size: 20pt)

#show: clay-morandi-theme.with(
  aspect-ratio: "16-9",
  footer: [Studio Terra],
  config-info(
    title: [Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
  ),
)

#title-slide()

= First Section

== First Slide

Content goes here.

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
#set text(font: ("Arial", "Noto Sans SC"), size: 20pt)
```

## Available Slide Types

### `#title-slide()`
Warm linen background with a large morandi-colored (terracotta) rounded rectangle filling ~60% of the slide. Title and subtitle appear centered in high-contrast warm dark brown on the colored block. Author/institution/date are centered at the bottom. Small decorative morandi circles sit at the corners.

### `#slide(title: auto)`
Standard content slide with warm linen background. Header shows semibold title in warm brown with thin morandi-shade underline (2.5pt, rounded). Footer has three-column grid: footer text, small morandi dot, page counter.

### `#new-section-slide[...]`
Auto-triggered by `= Heading`. Warm linen background with large sage-colored rounded block (~70% width). Section title is centered in high-contrast warm dark brown on the block. Small decorative circles sit at the corners.

### `#focus-slide[...]`
An accessible dark slate-blue Morandi shade fills the entire background. Large warm-white centered semibold text is width-constrained for long statements. No header/footer.

### `#ending-slide[...]`
Warm linen background with centered text in warm brown. Row of 6 small morandi-colored circle ornaments below the text. Translucent morandi circles at all four corners.

### `#outline-slide(title: [Contents])`
Clean table-of-contents slide with warm linen background. Title with morandi underline, section list below. Decorative corner circles.

## Reusable Components

### `#morandi-card(title, body, shade: 0)`
Primary content card with rotating morandi shades. Each `shade` index (0-5) picks a different color. Card has 12pt radius, morandi-tinted fill (lightened 75%), 1pt morandi border, title in darkened shade color.

```typst
#morandi-card([Card Title], [Card body content here.], shade: 0)
```

### `#vessel-stat(value, label, shade: 0)`
Number/KPI display card with thick morandi-colored bottom border (4pt). Centered large bold number, small label below. 12pt rounded corners.

```typst
#vessel-stat([72%], [Lower Carbon Footprint], shade: 2)
```

### `#earth-tag(content, shade: 0)`
Inline rounded pill/tag in a morandi shade. 99pt radius for full pill shape. Small semibold text.

```typst
#earth-tag([Sustainable], shade: 1)
```

### `#linen-quote(quote, author: none, shade: 0)`
Quote block with warm white card background and thin (3pt) morandi-colored left border. Italic quote text with optional author attribution.

```typst
#linen-quote([The best design is invisible.], author: [Dieter Rams], shade: 3)
```

### `#ceramic-divider(shade: 0, width: 40%)`
Thin centered decorative line in a morandi shade. Not full width -- subtle and elegant.

```typst
#ceramic-divider(shade: 2)
```

### `#palette-strip()`
Decorative row of 6 small rounded color blocks showing all morandi shades. Useful as a visual separator or brand element.

```typst
#palette-strip()
```

## Color Scheme

### Palette Dictionary

| Role | HEX | `palette.key` | Purpose |
|------|-----|---------------|---------|
| **Primary** | `#8B7D6B` | `palette.primary` | Warm gray-brown, main branding |
| **Background** | `#F5F1EC` | `palette.bg` | Warm linen page background |
| **Card** | `#FDFBF8` | `palette.card` | Warm off-white card fills |
| **Text** | `#3D3530` | `palette.text` | Warm dark brown headings |
| **Text Body** | `#5A4E47` | `palette.text-body` | Medium warm brown body text |
| **Text Light** | `#776B64` | `palette.text-light` | Accessible muted captions |
| **Border** | `#E8E0D8` | `palette.border` | Warm borders |
| **Focus Background** | `#677B8C` | `palette.focus-bg` | Accessible inverted focus slides |

### Morandi Shades (accessed via `_morandi-shades` array or `morandi-color(index)`)

| Index | Name | HEX | Usage |
|-------|------|-----|-------|
| 0 | Dusty Rose | `#C4A4A0` | Cards, tags, decorative |
| 1 | Sage | `#A8B5A0` | Cards, section slides |
| 2 | Terracotta | `#C49A7C` | Title slide, cards |
| 3 | Slate Blue | `#8B9DAD` | Focus slide, cards |
| 4 | Sand | `#D4C4A8` | Cards, tags |
| 5 | Mauve | `#B8A0B8` | Cards, tags |

### Touying Color Mapping

```typst
config-colors(
  primary: palette.primary,          // #8B7D6B warm gray-brown
  neutral-lightest: rgb("#FDFBF8"),  // Warm white for dark backgrounds
  neutral-darkest: palette.text,     // #3D3530 warm dark brown
)
```

## Compatibility

- **Touying**: 0.7.4
- **Typst**: Latest stable release

## Files

- `template.typ` -- Theme definition (copy to your project)
- `demo.typ` -- Compilable usage example (Sustainable Interior Design)

## Demo

See `demo.typ` for a compilable example showcasing all slide types and components with content about sustainable interior design, biophilic design, and artisan craft.
