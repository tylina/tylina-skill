# MiTeX — LaTeX Math in Typst

**Package**: `@preview/mitex:0.2.7`
**Category**: Math

## Description

LaTeX math support for Typst powered by Rust and WASM. Convert LaTeX equations to Typst content directly.

## Usage in Touying Slides

> **Important**: Always use raw content (backticks) instead of strings to avoid complex escape sequences.

MiTeX raw arguments are input to a real math renderer. Do not replace a formula with visible
`#raw(...)`, ordinary/code text, or Unicode superscript, subscript, and operator lookalikes.

```typst
#import "@preview/mitex:0.2.7": *

// Inline LaTeX — use backticks, NOT strings
#mi(`e^{i\pi} + 1 = 0`)        // ✅ correct
// #mi("e^{i\\pi} + 1 = 0")    // ❌ avoid — requires double backslash escaping

// Block LaTeX
#mitex(`\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}`)

// Already inside code mode: omit the markup escape, keep raw content
#let energy = mitex(`E = mc^2`)
#block(energy)

// Convert to Typst string
#mitex-convert(`\alpha x`)
```

## Functions

| Function | Usage |
|----------|-------|
| `mi(...)` | Inline LaTeX equation |
| `mitex(...)` / `mimath(...)` | Block LaTeX equation |
| `mitext(...)` | LaTeX text mode |
| `mitex-convert(...)` | Convert LaTeX to Typst string |

> **Tip**: All functions accept raw content (`` `...` ``). This avoids the need to double-escape backslashes in LaTeX commands.

The examples above use `#mi(...)` and `#mitex(...)` in markup mode. Inside `{...}`, a function
argument list, or another code expression, call `mi(...)` or `mitex(...)` without `#`.
