# Zebraw — Code Blocks with Highlighting

**Package**: `@preview/zebraw:0.6.3`
**Category**: Code

## Description

Lightweight and fast code blocks with line numbers and line highlighting in a zebra-striped pattern.

## Usage in Touying Slides

> **Important**: `#show: zebraw` must be placed **before** `#show: simple-theme.with(...)` (or any Touying theme show rule). Typst processes show rules in reverse order, so the first `#show` is applied last.

```typst
#import "@preview/zebraw:0.6.3": *

#show: zebraw                                    // ← MUST be before theme
#show: simple-theme.with(aspect-ratio: "16-9")   // ← theme after zebraw

// Or use manually without global show rule:
#zebraw(
  ```python
  print("hello")
  ```
)
```

## Key Features

- Line numbers
- Line highlighting (zebra-striped)
- Header and footer support
- Line-level comments
- Fast and lightweight
