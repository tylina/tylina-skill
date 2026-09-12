# Shared Technical Standards — Extended Reference

> **When to read**: Only consult this file when you need detailed examples for tables, shadows, icons, heading numbering, or math equations. The core `shared-standards.md` contains everything needed for standard slide generation.

## Contents

- [Tables](#table-fundamentals)
- [Box shadows](#shadowed-box-shadows)
- [Heading numbering](#heading-numbering-numbly)
- [Icons and logos](#icons-and-logos)
- [Math equations](#math-equations)
- [Inline SVG](#inline-svg-via-imagebytes)
- [Frame and border centering](#frameborder-centering--percentage-based)
- [Source images](#source-images-from-imported-pdfs)
- [Placeholder images](#placeholder-images)

---

## Table Fundamentals

### Basic Table

```typst
#table(
  columns: (1fr, 2fr, 1fr),
  align: (left, left, center),
  inset: (x: 12pt, y: 8pt),
  table.header([Name], [Description], [Status]),
  [Alpha], [First item in the sequence], [Active],
  [Beta], [Second item with longer text], [Pending],
)
```

### Key Parameters

| Parameter | Purpose | Example |
|-----------|---------|---------|
| `columns` | Column widths | `(1fr, 2fr)`, `3 * (1fr,)`, `(auto, 1fr, 80pt)` |
| `rows` | Row heights | `(auto, 1fr)` |
| `align` | Cell alignment | `center`, `(left, center, right)`, or `(x, y) => ...` |
| `inset` | Cell padding | `8pt`, `(x: 12pt, y: 6pt)` |
| `stroke` | Cell borders | `0.5pt`, `none`, `(x, y) => ...` |
| `fill` | Cell background | `luma(245)`, `(x, y) => if y == 0 { blue }` |
| `gutter` | Gap between cells | `4pt`, `column-gutter: 8pt` |

### Three-Line Table (Academic Style)

```typst
#let three-line-table(..args) = table(
  stroke: none,
  align: center + horizon,
  inset: (x: 12pt, y: 8pt),
  table.hline(stroke: 1.5pt),
  table.hline(y: 1, stroke: 0.75pt),
  ..args,
  table.hline(stroke: 1.5pt),
)

// Usage
#three-line-table(
  columns: 4,
  [Method], [Precision], [Recall], [F1],
  [Baseline], [0.82], [0.75], [0.78],
  [Ours], [*0.91*], [*0.88*], [*0.89*],
)
```

### Cell Merging (rowspan / colspan)

```typst
#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  // Header spanning all columns
  table.cell(colspan: 3)[*Q4 2024 Results*],
  [Region], [Revenue], [Growth],
  // Merge two rows when region is the same
  table.cell(rowspan: 2)[Asia-Pacific],
    [¥12.3B], [+18%],
    [¥8.7B], [+12%],
  [Europe], [€6.1B], [+5%],
)
```

### Styled Table with Header

```typst
#table(
  columns: (2fr, 1fr, 1fr),
  fill: (_, y) => if y == 0 { palette.primary.lighten(85%) },
  stroke: 0.5pt + luma(200),
  inset: (x: 10pt, y: 7pt),
  align: (left, center, center),
  table.header(
    [*Feature*], [*Baseline*], [*Proposed*],
  ),
  [Accuracy], [92.3%], [*96.1%*],
  [Latency], [45ms], [*28ms*],
  [Memory], [2.1GB], [*1.4GB*],
)
```

### Alternating Row Colors (Zebra Stripes)

```typst
#table(
  columns: 3 * (1fr,),
  fill: (_, y) => if calc.odd(y) and y > 0 { luma(248) },
  stroke: (x: none, y: 0.5pt + luma(220)),
  // ...rows
)
```

> **Tip**: Always wrap tables in `#figure[]` inside slides to prevent Touying from splitting them across pages. For data-heavy themes (corporate, mckinsey), prefer the theme's `data-table` or similar component over raw `#table()`.

---

## Shadowed (Box Shadows)

API: `shadow(dx, dy, blur, spread, fill, radius)[body]`

Common elevation presets for Touying theme cards:

```typst
#import "@preview/shadowed:0.3.0": shadow

// Subtle card shadow
#shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0,0,0,8%), radius: 4pt)[
  #block(fill: white, inset: 12pt, radius: 4pt)[Card content]
]

// Medium elevation
#shadow(dx: 3pt, dy: 3pt, blur: 6pt, fill: rgb(0,0,0,12%), radius: 4pt)[
  #block(fill: white, inset: 12pt, radius: 4pt)[Elevated panel]
]

// Strong / hero shadow
#shadow(dx: 5pt, dy: 5pt, blur: 8pt, fill: rgb(0,0,0,15%), radius: 4pt)[
  #block(fill: white, inset: 16pt, radius: 4pt)[Hero element]
]
```

- **`radius`** accepts a single length *or* a dictionary, e.g. `(top: 4pt, bottom: 0pt)`.
- The `body` inside `shadow()` should be a `block()` with its own `fill` — the shadow wraps around the visual bounds of its child.

---

## Heading Numbering (numbly)

For decks requiring automatic heading numbering (lectures, courseware, multi-part presentations):

```typst
#import "@preview/numbly:0.1.0": numbly

// In template.typ — set once, applies globally
#set heading(numbering: numbly(
  "Part {1:I}.",   // Level 1: Part I., Part II., ...
  "{1:I}.{2}.",    // Level 2: I.1., I.2., ...
))
```

Format specifiers: `{1}` (Arabic), `{1:A}` (uppercase letter), `{1:a}` (lowercase),
`{1:I}` (Roman numeral), `{1:i}` (lowercase roman). See
`_shared/packages/numbly/README.md`.

---

## Icons and Logos

**Decision logic**:

| Condition | Use | Reason |
|-----------|-----|--------|
| Casual/general; font availability uncertain | Unicode emoji (`🚀 ✅ 📊`) | Always renders; no dependency |
| Need visual consistency across fonts/exports (PPTX) | `booticons` (SVG-based) | Won't become tofu blocks; font-independent |
| Need brand logos (GitHub, Python, Typst) | `sicons` (Simple Icons) | 3000+ official brand SVGs |
| No icons needed | Omit entirely | Cleaner |

> **Default**: Emoji. Switch to `booticons` only when the deck will be exported to PPTX or when consistent icon rendering matters more than simplicity.

**Inline sizing for all icon packages** — icons used inline with text need `baseline` and `size`/`height` adjustment:

```typst
// booticons — inline with text (color: text.fill requires #context)
#import "@preview/booticons:0.0.1": bsicon
#context bsicon("house-fill", height: .9em, baseline: .1em, color: text.fill)  // Inline
#bsicon("graph-up", color: blue, height: 2em)  // Larger, standalone

// sicons — brand logos inline
#import "@preview/sicons:16.0.0": *
#box(baseline: .1em, sicon(slug: "typst", size: .9em)) Typst
#box(baseline: .1em, sicon(slug: "github", size: .9em)) GitHub
#box(baseline: .1em, sicon(slug: "python", size: .9em)) Python

// Grid of brand icons
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
  [#box(baseline: .1em, sicon(slug: "typst", size: .9em)) Typst],
  [#box(baseline: .1em, sicon(slug: "github", size: .9em)) GitHub],
  [#box(baseline: .1em, sicon(slug: "python", size: .9em)) Python],
)
```

> **`context` requirement**: Any parameter that reads document state (e.g., `color: text.fill`) requires wrapping the call in `#context`. Fixed colors like `color: blue` do not need it.

**Sizing rule of thumb**: Inline icons → `height: .9em, baseline: .1em`. Larger standalone icons → set explicit `height` (e.g., `2em`, `24pt`) without baseline adjustment.

**Sicons full API** (`@preview/sicons:16.0.0`):

| Function | Purpose | Example |
|----------|---------|---------|
| `sicon(slug:, size:, icon-color:)` | Icon only | `#sicon(slug: "github", size: 1em, icon-color: "default")` |
| `stitle(slug:, size:, text-color:)` | Brand name text only | `#stitle(slug: "github", size: 1em, text-color: "#000000")` |
| `sicon-label(slug:, size:, icon-color:, text-color:)` | Icon + brand name | `#sicon-label(slug: "github", size: 1em, icon-color: "default", text-color: "#000")` |
| `sicon-raw(slug:)` | Raw SVG content | `#sicon-raw(slug: "github")` |

> `icon-color: "default"` uses the brand's official color. Pass a hex string (e.g., `"#333333"`) for custom.

> See `_shared/icons/index.json` for the full package list.
> See `_shared/icons/booticons/icons.txt` for Bootstrap Icons names.
> See `_shared/icons/sicons/slugs.txt` for Simple Icons slugs.

---

## Math Equations

> **Critical**: Typst's built-in math syntax is NOT LaTeX. Do not use `\frac{}{}`, `\int`, `\sum`, etc. in Typst's native `$ ... $` mode.

### LaTeX Math via MiTeX Package (default)

Default new formulas to MiTeX. Preserve existing verified native math. Use new native `$...$` only
when already fluent in every exact Typst spelling and expecting the first authored expression to
validate; short or simple is not sufficient. Never imitate an equation with ordinary text, a
quoted string, `#raw(...)`, code styling, or Unicode lookalikes outside actual math content.

```typst
#import "@preview/mitex:0.2.7": *

// Inline LaTeX equation
Write inline equations like #mi(`x^2 + y^2 = z^2`).

// Block LaTeX equation
#mitex(`
  \newcommand{\f}[2]{#1f(#2)}
  \f\relax{x} = \int_{-\infty}^\infty
    \f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi
`)
```

> **Important**: Always use raw content (backticks `` ` ``) for LaTeX strings, NOT quoted strings. Backticks avoid double-backslash escaping.

| Function | Usage |
|----------|-------|
| ``#mi(`...`)`` | Inline LaTeX equation |
| ``#mitex(`...`)`` / ``#mimath(`...`)`` | Block LaTeX equation |
| `#mitext(`...`)` | LaTeX text mode |

### Typst Native Math (advanced)

> **When to use**: Use Typst native math when the existing document establishes that convention,
> or when the author knows the native syntax well enough to verify its notation and rendered
> result. Use MiTeX for LaTeX source, complex formulas, or any uncertainty.

Typst has its own math syntax inside `$ ... $`:

```typst
// Inline math
The function $f(x) = sum_(i=1)^n w_i dot x_i + b$ is linear.

// Block math ($ on its own line)
$ E = m c^2 $

// Key syntax differences from LaTeX:
// - Subscript: _ (same), but use () for multi-char: x_(i+1)
// - Superscript: ^ (same), but use () for multi-char: x^(2n)
// - Fractions: a/b is ALWAYS frac(a, b); use \/ for a literal slash
// - Greek letters: alpha, beta, gamma (not \alpha)
// - Operators: sum, integral, product (not \sum, \int, \prod)
// - Sets: RR, NN, ZZ, QQ, CC (not \mathbb{R})
// - Formatting: bold(x), italic(x), cal(F)
// - Spacing: quad, space, thin (not \quad, \;, \,)
// - Parentheses: () are auto-sizing by default; use \( \) for fixed-size
```

Common Typst math vs LaTeX comparison:

| LaTeX | Typst | Note |
|-------|-------|------|
| `\frac{a}{b}` | `a/b` or `frac(a, b)` | `a/b` always renders as fraction; use `a\/b` for literal slash |
| `\sum_{i=1}^{n}` | `sum_(i=1)^n` | Use `()` only for multi-char sub/super |
| `\int_0^\infty` | `integral_0^infinity` | Spelled-out names |
| `\alpha, \beta` | `alpha, beta` | No backslash |
| `\mathbb{R}` | `RR` | Double-letter shorthand |
| `\left( \right)` | `(` `)` | Parentheses auto-size by default; use `\(` `\)` for fixed-size |
| `\begin{aligned}` | `$ x &= 1 \ y &= 2 $` | `\` for newline, `&` for alignment |

### When to Use Which

| Scenario | Recommendation |
|----------|---------------|
| New formula or uncertain native spelling | **MiTeX package** |
| Existing document consistently uses verified Typst-native math | Preserve native math |
| Already fluent in exact Typst spelling; first draft expected to validate | Typst native math, then inspect |
| Converting LaTeX source with formulas | MiTeX package (no rewriting needed) |
| PDF source processed by MinerU (contains `$...$` LaTeX) | MiTeX package — MinerU outputs LaTeX math notation |
| Math-heavy academic deck (50+ equations) | MiTeX (reliable; avoids Typst math syntax errors) |

> **MinerU → Typst workflow**: When `pdf_to_md.py` uses the MinerU backend, extracted math
> appears as LaTeX (e.g., `$\frac{1}{2}$` or `$$\int_0^\infty ...$$`). In the generated
> Typst code, wrap these with ``#mi(`...`)`` (inline) or ``#mitex(`...`)`` (block).
> Do NOT attempt to manually convert MinerU's LaTeX output to Typst native math — use mitex directly.

Compilation verifies syntax only. Check notation, indices, dimensions, masks, constants, and
equation meaning against the source material, then inspect the rendered result at readable size.

> Bibliography and citation rules: see `executors/academic.md` §8.

---

## Inline SVG via `image(bytes(...))`

Inline SVG is the primary technique for creating visually distinctive theme decorations. Use `image(bytes(svg-string), width: Npt)` to render SVG strings as images.

```typst
// Define SVG as a module-level string
#let _star-svg = ```<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <polygon points="50,5 61,35 95,35 68,57 79,91 50,70 21,91 32,57 5,35 39,35"
           fill="none" stroke="currentColor" stroke-width="2"/>
</svg>```.text

// Render with palette color substitution
#let star(size: 20pt, color: palette.accent) = {
  image(bytes(_star-svg.replace("currentColor", color.to-hex())), width: size, height: size)
}
```

**Rules:**
- Use `image(bytes(...))` — NOT `image.decode(...)` (deprecated, produces warnings)
- Define SVG strings at module level (`#let _name-svg = ...`), not inline in functions
- Keep SVGs simple (5-20 path elements max) to avoid slow compilation
- Use `currentColor` in SVGs and `.replace("currentColor", color.to-hex())` for palette integration
- Size via `width:` / `height:` parameters on `image()`, not SVG intrinsic dimensions

> See `template-designer.md` §"Inline SVG Patterns" for detailed examples and categories.

---

## Frame/Border Centering — Percentage-Based

When a theme uses decorative frame borders (common in Canvas themes), always use percentage-based centering:

```typst
// ✅ GOOD: always centered, responsive to content area
place(center + horizon,
  rect(width: 96%, height: 94%, stroke: 3pt + pal.ink, radius: 0pt, fill: none))

// ❌ BAD: hardcoded position + dimensions, breaks on different content sizes
place(top + left, dx: 0.6em, dy: -3.2em,
  rect(width: 780pt, height: 420pt, stroke: 3pt + pal.ink, fill: none))
```

This applies to all `place()`-based decorative elements in slide `setting` functions.

---

## Source Images (from imported PDFs)

When users import source materials (via `pdf_to_md.py`), images are extracted to `sources/`. Use `composer` for side-by-side layouts:

```typst
// Image + text side-by-side (image on right)
== Analysis
#slide(composer: (2fr, 1fr))[
  - Key finding from the figure
  - Supporting evidence
][
  #image("sources/figure_p3_0.png", height: 100%, fit: "contain")
]

// Image + text side-by-side (image on left, wide)
== Key Takeaway
#slide(composer: (1fr, 2fr))[
  #image("sources/wide_figure.png", height: 100%, fit: "contain")
][
  - Data shows upward trend
  - Growth accelerated in Q4
]
```

**Rules:**
- Use proportional `composer` values (e.g., `(2fr, 1fr)`, `(1fr, 1fr)`) — NOT `auto`
- Use `height: 100%` with `fit: "contain"` for source images (preserves aspect ratio)
- Use `fit: "cover"` only for decorative/background images where cropping is acceptable
- Never set both `width` and `height` without specifying `fit`
- Prefer `composer` over manual `grid` for image + text column layouts

> See `image-layout-patterns.md` patterns #2, #3, #13, #18 for more image + text column variants.

---

## Placeholder Images

When images are pending (not yet generated or provided):

```typst
#let placeholder(w, h, label) = rect(
  width: w, height: h,
  stroke: (dash: "dashed", paint: gray),
  fill: rgb(240, 240, 240),
  align(center + horizon, text(14pt, fill: gray, label))
)

// Usage
#placeholder(100%, 200pt, [Pending: team photo])
```
