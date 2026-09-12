# Codly — Beautiful Code Blocks

**Package**: `@preview/codly:1.3.0` + `@preview/codly-languages:0.1.10`
**Category**: Code

## Description

Simple yet beautiful and powerful code blocks with line numbers, language icons, annotations, and skip/range display. Use with `codly-languages` for automatic language detection and icons.

## Usage in Touying Slides

```typst
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *

#show: codly-init.with()

#codly(languages: codly-languages)
```

After setup, all fenced code blocks automatically get codly styling:

````typst
```rust
pub fn main() {
    println!("Hello, world!");
}
```
````

## Key Features

- Automatic line numbering
- Language detection and icons (via `codly-languages`)
- Line highlighting and annotations
- Code range display (skip lines)
- Customizable colors and styling
- Smart line number width
