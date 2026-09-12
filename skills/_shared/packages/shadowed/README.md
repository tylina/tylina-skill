# shadowed — Box Shadows for Typst

> Version: 0.3.0 | Category: Layout/Decoration | [GitHub](https://github.com/T1mVo/shadowed)

## Import

```typst
#import "@preview/shadowed:0.3.0": shadow
```

## Function Signature

```typst
shadow(
  dx: 0pt,        // Horizontal offset
  dy: 0pt,        // Vertical offset
  blur: 0pt,      // Blur radius (must be ≥ 0pt)
  spread: 0pt,    // Expand/contract shadow size
  fill: black,    // Shadow color (color | gradient | none)
  radius: 0pt,    // Corner rounding (relative | dictionary)
  body,           // Content to shadow (required)
)
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `dx` | `length` | `0pt` | Horizontal offset |
| `dy` | `length` | `0pt` | Vertical offset |
| `blur` | `length` | `0pt` | Blur strength |
| `spread` | `length` | `0pt` | Shadow expansion/contraction |
| `fill` | `color \| gradient \| none` | `black` | Shadow fill |
| `radius` | `relative \| dictionary` | `0pt` | Corner rounding |
| `body` | `content` | *(required)* | Content placed in front of shadow |

### Radius Dictionary Keys (in precedence order)

- `top-left`, `top-right`, `bottom-right`, `bottom-left` — individual corners
- `left`, `top`, `right`, `bottom` — edge pairs
- `rest` — all corners not explicitly set

## Usage Patterns for Touying Themes

### Card Shadow (most common in themes)
```typst
shadow(dx: 3pt, dy: 3pt, blur: 6pt, fill: rgb(0, 0, 0, 12%), radius: 4pt)[
  #block(fill: white, radius: 4pt, inset: 12pt, width: 100%)[
    Card content here
  ]
]
```

### Subtle Elevation
```typst
shadow(dy: 2pt, blur: 4pt, fill: rgb(0, 0, 0, 8%), radius: 6pt)[
  #block(fill: palette.bg, radius: 6pt, inset: 10pt)[content]
]
```

### Offset Drop Shadow (paper-craft style)
```typst
shadow(dx: 4pt, dy: 4pt, blur: 0pt, fill: rgb(0, 0, 0, 15%), radius: 2pt)[
  #block(fill: white, radius: 2pt, inset: 12pt)[content]
]
```

## Important Notes

- Shadow does NOT affect layout — it's rendered behind the content using `place()`
- To prevent overlap with adjacent elements, wrap in `pad(blur + spread)[...]`
- The `radius` of the shadow should match the `radius` of the content block
- Supports gradients for artistic effects: `fill: gradient.linear(..color.map.rainbow)`
- Minimum recommended blur for readable cards: 4-6pt
- Keep shadow opacity subtle (8-15%) for professional look
