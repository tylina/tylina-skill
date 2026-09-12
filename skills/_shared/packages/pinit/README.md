# Pinit — Relative Positioning

**Package**: `@preview/pinit:0.2.2`
**Category**: Layout / Annotation

## Description

Relative positioning by pins — pin content to specific positions, highlight text, add annotations. Works with Touying animations.

## Usage in Touying Slides

```typst
#import "@preview/pinit:0.2.2": *

A #pin(1)highlighted text#pin(2).
#pinit-highlight(1, 2)
#pinit-point-from(2)[Annotation]
```

## Key Functions

| Function | Description |
|----------|-------------|
| `#pin(id)` | Place a pin at current position |
| `#pinit-highlight(from, to)` | Highlight between two pins |
| `#pinit-point-from(pin)` | Arrow pointing from a pin |
| `#pinit-point-to(pin)` | Arrow pointing to a pin |
| `#pinit-line(from, to)` | Line between pins |

## Features

- Works with Touying/Polylux animations
- Equation annotations
- Text highlighting with custom colors
- Flexible arrow positioning
