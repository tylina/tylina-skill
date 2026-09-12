# Shared Technical Standards

Universal technical constraints for SeaSlides Typst Slides. Ensures consistency across all generated content.

> **Extended reference**: For detailed examples (advanced table patterns, icon API, Typst native math syntax), see [`shared-standards-extended.md`](./shared-standards-extended.md). Only read it when you need those specific details.

> **Authority**: This file is the canonical technical contract. The extended reference supplies optional recipes and does not override rules defined here.

## Contents

- [Typst syntax quick reference](#0-typst-syntax-quick-reference)
- [Project directory structure](#project-directory-structure)
- [Template-content separation](#1-template-content-separation-principles)
- [Typst and Touying hard constraints](#2-typsttouying-hard-constraints)
- [Design standards](#3-design-standards)
- [Layout best practices](#4-layout-best-practices)
- [Third-party packages](#5-third-party-package-reference)
- [Compilation and verification](#6-compilation--verification-pipeline)
- [Typst markup best practices](#7-typst-markup-best-practices)
- [P0 hard rules](#8-hard-rules-p0)
- [Anti-patterns](#9-anti-patterns-do-not-use)
- [Related documents](#related-documents)

## 0. Typst Syntax Quick Reference

Typst is NOT Markdown. While some syntax looks similar, many elements differ. This table maps common constructs:

| Element | Typst | Markdown | Notes |
|---------|-------|----------|-------|
| **Paragraph break** | Blank line | Blank line | Same |
| **Bold** | `*bold*` | `**bold**` | Typst uses single `*` |
| **Italic** | `_italic_` | `_italic_` or `*italic*` | Same with `_` |
| **Raw/code inline** | `` `code` `` | `` `code` `` | Same |
| **Code block** | ` ```lang ... ``` ` | ` ```lang ... ``` ` | Same fenced syntax |
| **Heading** | `= H1`, `== H2`, `=== H3` | `# H1`, `## H2`, `### H3` | `=` instead of `#` |
| **Bullet list** | `- item` | `- item` | Same |
| **Numbered list** | `+ item` | `1. item` | Typst uses `+` |
| **Term list** | `/ Term: description` | N/A | Typst-specific |
| **Link** | `https://example.com` or `#link("url")[text]` | `[text](url)` | Auto-detect or function |
| **Image** | `#image("path.png", width: 80%)` | `![alt](path.png)` | Function call |
| **Label** | `<my-label>` | N/A | For cross-references |
| **Reference** | `@my-label` | N/A | References a label |
| **LaTeX math inline (default)** | `` #mi(`x^2 + y^2`) `` | `$x^2 + y^2$` | MiTeX + raw content |
| **LaTeX math block (default)** | `` #mitex(`x^2 + y^2`) `` | `$$...$$` | MiTeX + raw content |
| **Native math inline** | `$x^2 + y^2$` | N/A | Typst syntax, not LaTeX |
| **Native math block** | `$ x^2 + y^2 $` | N/A | Spaces make a display equation |
| **Line break** | `\` | Two trailing spaces or `<br>` | Backslash |
| **Comment** | `// line` or `/* block */` | N/A (HTML `<!-- -->`) | C-style |
| **Function call** | `#rect(width: 1cm)` | N/A | Typst scripting |
| **Escape** | `\#`, `\*`, `\_` | `\#`, `\*`, `\_` | Similar |
| **Smart quotes** | `'single'` or `"double"` | Plain quotes | Auto-converted |
| **Em dash** | `—` | `—` | Use the literal Unicode em dash; `---` is a Touying slide break and must not appear in slide content |
| **Non-breaking space** | `~` | `&nbsp;` | Tilde |

### Key Differences from Markdown

1. **`#` is NOT a heading** — it starts a code expression. Headings use `=`.
2. **Content mode vs Code mode**: Inside `[brackets]` is content mode (like writing prose). Inside `{braces}` is code mode (like a script). The `#` prefix switches from content to code inline.
3. **No `**bold**`** — Typst uses `*single asterisks*` for bold.
4. **Arrays use `(a, b, c)`** — not `[a, b, c]`. Square brackets are content blocks.
5. **Named arguments**: `func(width: 80%, fill: red)` — keyword arguments with colon.
6. **Content blocks as arguments**: `#func[content here]` passes the bracketed content as the last positional argument.
7. **LaTeX math needs MiTeX**: use raw `` #mi(`...`) `` inline and `` #mitex(`...`) ``
   for display math. Do not paste LaTeX commands into native `$...$` math.

### Raw Text (Code) in Typst

````typst
// Inline raw (like markdown backticks)
This has `inline code` in it.

// Block raw with language tag (like markdown fenced code)
```python
def hello():
    print("world")
```

// Raw block without language
```
plain monospace text
```
````

> **For LLMs**: When writing Typst, remember that `#` means "execute code here" — it does NOT mean heading. A common mistake is writing `# Title` (Markdown heading) when you should write `= Title` (Typst heading).

## Project Directory Structure

```
project_name/
├── main.typ                # Content + structural layout
├── template.typ            # Theme — styles, colors, components, slide functions
├── content_design_spec.md  # Design specification (from Strategist)
├── assets/                 # Images and resources
│   ├── *.png/jpg
│   └── image_prompts.md    # AI image prompts (if applicable)
└── output/                 # Compiled output
    ├── slides.pdf
    ├── slides.pptx
    ├── overview.png        # All slides in one grid (for LLM review)
    └── pngs/
        └── slide_{01,02,...}.png
```

> `#speaker-note[...]` automatically attaches to the preceding slide. Place it anywhere after the slide's content — inside `#slide[...]`, after bullet points under `== Heading`, or before the next `==` heading. Ensure every slide has one.

---

## 1. Template-Content Separation Principles

### 1a. Core Architecture

| File | Contains | Does NOT Contain |
|------|----------|------------------|
| `template.typ` | Color palette, component functions, slide functions, theme entry point | Any slide content text |
| `main.typ` | Slide content, headings, lists, component calls, structural layout | Raw `rgb(...)`, ad-hoc styled blocks, font family changes |

When switching themes, only template.typ changes. main.typ stays the same.

### 1b. What's Allowed in main.typ

| Category | Allowed | Not Allowed |
|----------|---------|-------------|
| **Layout** | Natural flow for sequential component calls; `grid()`, `cols`, `stack()`, `align()`, `place()`, intentional stretch such as `#v(1fr)`, `#slide(composer:)`, `#table(...)` | A fixed `v()` or an otherwise unnecessary `stack()` added only to separate complete caller-side components; short `v()` chains inside a header, KPI, card, or other visual group |
| **Text overrides** | `#text(size:, fill: <template-var>)` on individual elements; `#set text(size:)` at slide scope | `#text(size:)[entire slide content...]` as shrink hack |
| **Global font** | `#set text(size: 16pt)` right after `#show: theme.with(...)` | `#set par(spacing:)` inline per-slide |
| **Styling** | Reference template variables/components | `rgb("#...")`, `block(fill:, stroke:)`, `rect(fill:)` inline |

**Guiding principle**: If a visual pattern appears on more than one slide, it MUST be a template component. One-off layout decisions (like "this slide needs 3 columns") are fine in main.typ.

At the slide/caller level, write complete components directly in normal flow by
default. Do not insert a fixed `v()` or wrap adjacent components in `stack()`
merely to manufacture routine separation. If the rendered design genuinely
needs controlled geometry, prefer the owning component's inset or the semantic
container's gutter; use a caller-side fixed spacer only as a documented,
render-verified fixed-canvas exception. This does not apply to stretch semantics
such as `v(1fr)` or `lazy-v(1fr)`.

### 1c. Plain / Rich / Canvas Complexity

| Aspect | Plain | Rich | Canvas |
|--------|-------|------|--------|
| **Character** | Content-driven; headings + bullets | Design-driven; grid layouts + components | Canvas-level composition; `place()` + inline styling |
| **Template components** | Primarily existing theme primitives | Reusable components selected for the content | Deck-specific components only where they earn their complexity |
| **Composition** | Normal flow | Theme-supported grids and components | Page-level composition with deliberate overlays |
| **`place()` in main.typ** | Avoid unless required by the theme | Use only for genuine overlays | Use deliberately for canvas overlays, not ordinary flow |
| **`block(fill:)` in main.typ** | Keep styling in the template | Keep styling in the template | May be used with palette tokens under the Canvas contract |
| **Best for** | Academic, seminars, papers | Consulting, finance, product launches | Magazine editorial, festival, poster-style |
| **Default styles** | Academic | General, Consulting, MBB | (custom per deck) |

> Plain / Rich / Canvas is a recommendation, not a hard rule. The user decides.

> **Canvas exception**: Canvas mode lifts the `block(fill:)` restriction in main.typ. All color values must still reference `palette.xxx` — never use inline `rgb("#...")`. Canvas-level presentations may also use inline `text(font: ...)` for deliberate typographic variation (e.g., mono labels, serif quotes), but the base document font must still be set via `#set text(font: ...)` in main.typ.

### 1d. Quick Examples

**Plain**: `== Title` + bullets + markups — content-driven, minimal markup.

**Rich**: `== Title` + `#grid(...)` with `kpi-card(...)` calls + `#insight-box(...)` — component-rich, visual layouts.

**Canvas**: `#slide(config: config-page(...))` + `#place()` overlays + inline `text(size:, fill:)` — every page is a unique layout canvas. Colors still use `palette.xxx`.

---

## 2. Typst/Touying Hard Constraints

### Version and Import

**Direct-import hard lock**: Project-owned entries and custom themes use
`0.7.4`; their APIs and examples in this skill assume that version. A
third-party Universe theme may transitively own Touying 0.6.x. In that case,
use the package's documented API and version boundary; do not add a second
direct Touying import, mix 0.7.4 configs into the older package, or edit the
package cache.

```typst
#import "@preview/touying:0.7.4": *
```

#### Import Patterns by Theme Type

| Theme Type | Import Pattern | When |
|------------|---------------|------|
| **Custom / User** (Flow 2, 3, 4) | `#import "template.typ": *` | Default for all projects |
| **Builtin** (Flow 1) | `#import themes.<name>: *` | Only when user explicitly names a builtin theme |
| **Universe** (Flow 1) | `#import "@preview/<package>:<version>": *` | Only for universe-published themes |

```typst
// ✅ CORRECT — Custom theme (default for all content types)
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: my-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [My Presentation]),
)

// ✅ CORRECT — Builtin theme (ONLY when user explicitly requests)
#import "@preview/touying:0.7.4": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(title: [My Presentation]),
)
```

### Page Dimensions

Touying's default page sizes (from `presentation-16-9` and `presentation-4-3` paper):

| Format | Width | Height | Aspect |
|--------|-------|--------|--------|
| 16:9 (default) | 841.89pt | 473.56pt | 1.778 |
| 4:3 | 793.7pt | 595.28pt | 1.333 |

With standard themes (header ~40pt, footer ~20pt, margins ~30pt each side), effective content area is approximately:

| Format | Content Width | Content Height |
|--------|--------------|----------------|
| 16:9 | ~780pt | ~390pt |
| 4:3 | ~730pt | ~510pt |

> Use `1fr` and percentage widths rather than hardcoded pt values whenever possible. Exact content area depends on theme header/footer/margin configuration.

### Slide Structure

- **Slide titles**: Use `==` syntax — do NOT use `#slide(title: [...])` unless overriding the title
- **Multi-column layouts**: Use `#cols[...][...]` (universal column layout)
- **Display titles**: Use `utils.display-current-heading()` in template
- **Theme construction**: Use `touying-slide` and `touying-slides`

```typst
== My Slide Title
- Bullet point one

// Two-column layout
== Comparison
#cols[Left column][Right column]

// Custom column ratios
#cols(columns: (3fr, 2fr))[Wide column][Narrow column]
```

> For template.typ construction patterns (theme entry points, slide functions, headers, `lazy-v`, `std.align`), see `template-designer.md`.

---

## 3. Design Standards

### Font Configuration

```typst
#set text(font: ("Arial", "Noto Sans CJK SC"), size: 20pt)
```

First font: English/Latin. Second font: CJK. Default size: 20pt.

### Font Size Hierarchy

| Level | Reference Size | Weight (Corporate/Academic) | Weight (Editorial/Swiss) | Usage |
|-------|------|------|------|-------|
| Display | 36-44pt | Bold | 200-300 (Light) | Cover title, main headings |
| H1 | 28-32pt | Semibold | 200-300 | Section title |
| H2 | 22-26pt | Medium (500) | 300-400 | Slide title |
| Body | 18-20pt | Regular | Regular (400) | Body text, paragraphs |
| Small | 14-16pt | Regular | 400-500 | Captions, labels, figure legends |
| Tiny | 10-12pt | Regular | 500-600 | Footnotes, sources, fine print |

These are planning ranges, not global overrides. The selected theme, language, canvas, and delivery mode own the final tokens. Small text may need a slightly heavier weight to survive projection, rasterization, or mixed-script rendering; large display text may use a lighter weight when the theme and contrast support it.

> **Even for Corporate/Academic themes**: avoid setting ALL headings to `weight: "bold"`. Use the selected theme's semantic heading tokens; reserve stronger weights for places where hierarchy or delivery conditions need them. This prevents the typographic monotony that makes AI-generated decks look generic.

#### Usage Guidelines

- **Display**: Cover slides and major section dividers only
- **H1**: Section title slides (divider slides)
- **H2**: Individual slide titles
- **Body**: Default text size for all content
- **Small**: Supporting information, sparingly
- **Tiny**: Only when necessary (e.g., citations)

**Inverse Weight Hierarchy (Theme- and Delivery-Aware)**

When a Swiss or editorial theme documents an inverse weight ladder, let larger text become lighter and smaller labels/captions become slightly heavier. Treat the table above as a starting range, then verify the actual language and delivery output. Do not impose one fixed size threshold on every Swiss theme, and do not copy the ladder into themes whose typography calls for a different hierarchy.

See `canvas.md` §2 Rule 2 for full typography guidance.

### Color System

#### Optional 60-30-10 Heuristic

When a new theme has no stronger visual direction, 60-30-10 can be a useful
starting point for assigning dominant, supporting, and accent roles. It is not
a measured quota and must not override the selected theme's documented palette
or a composition that needs a different balance.

#### Text Contrast

- **Minimum contrast ratio**: 4.5:1 normal text (WCAG AA), 3:1 for text > 18pt

#### Palette Coherence

Use the smallest set of hues that communicates the intended hierarchy. Prefer
theme tokens and related tints/shades over introducing one-off colors; do not
enforce a universal hue count across themes, charts, illustrations, and maps.

### Color Definition

```typst
#let primary = rgb("#2E5C8A")
#let secondary = rgb("#7CB342")
```

---

## 4. Layout Best Practices

### Multi-Column: Three Approaches

Do NOT define custom `two-column`/`three-column` wrappers. Use these built-in approaches:

| Approach | Syntax | When to Use |
|----------|--------|-------------|
| **A: `#cols[...][...]`** | `#cols(columns: (1fr, 1fr))[content-a][content-b]` | Universal multi-column layout (default, safe for any content) |
| **B: `#cols(lazy-layout: true)`** | `#cols(lazy-layout: true)[#card-a][#card-b]` | Height-equalized cards — every column must contain exactly one direct component with `lazy-v(1fr)` |
| **C: `grid()`** | `#grid(columns: (1fr, 1fr), gutter: 10pt, ...)` | Multi-row layouts; keep lazy layout off. Reusable children may still contain inert `lazy-v` markers |

**When to use `lazy-layout: true`**: Enable it explicitly only when the columns
need height equalization and every column contains exactly one direct stretchable
component. That component contains a terminal `lazy-v(1fr)`. Reusable cards may
safely retain this marker because it has no visual effect when lazy layout is off.

```typst
// Height-equalized cards — exactly ONE direct component per column
#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
  concept-card([Card A], [...]),
  concept-card([Card B], [...]),
  concept-card([Card C], [...]),
)
```

> [!CAUTION]
> **`lazy-layout: true` requires exactly ONE direct component per column.** Do
> not place a bundle of multiple components in a lazy column and do not rely on
> how Touying resolves multiple markers. If a column needs multiple components,
> use ordinary `cols`. Keep terminal `lazy-v(1fr)` markers in reusable components
> so any one of them can later be used as the sole child of a valid lazy column.
>
> ```typst
> // ❌ WRONG — the left lazy column contains multiple components
> #cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1em,
>   {
>     concept-card([Topic A], [...])
>     insight-box([Key Insight], [...])
>   },
>   concept-card([Topic B], [...]),
> )
>
> // ✅ CORRECT — ordinary cols for multi-component columns
> #cols(columns: (1fr, 1fr), gutter: 1em)[
>   #concept-card([Topic A], [...])
>   #insight-box([Key Insight], [...])
> ][
>   #concept-card([Topic B], [...])
> ]
>
> // ✅ CORRECT — one direct stretchable component in every lazy column
> #cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 1em,
>   concept-card([Card A], [...]),
>   concept-card([Card B], [...]),
>   concept-card([Card C], [...]),
> )
> ```

### Equalizing Card Heights with `lazy-v`

Place `lazy-v(1fr)` at the end of a stretchable card component to equalize heights
when used inside `cols(lazy-layout: true)`. Keep the marker in the reusable
component even when most callers use ordinary `cols`; it is inert there and
preserves opt-in equalization:

```typst
#let my-card(title, body) = {
  block(width: 100%, fill: luma(240), inset: 12pt, radius: 4pt)[
    #stack(spacing: .8em,
      text(weight: "bold", title), body, lazy-v(1fr),
    )
  ]
}
```

> **Dark page caution**: Be cautious with `lazy-v(1fr)` in cards placed on slides with custom `config-page()` overrides — the available height differs from default slides because margin/header calculations change. Test dark-page cards separately.

### Avoiding `height: 100%` in Components

**Problem**: `height: 100%` inside a component (card, divider, panel) does NOT inherit the parent's measured height. Without a fixed-height ancestor container, it expands to the available page height, pushing sibling elements off-screen.

**When `height: 100%` is safe**:
- Inside `place()` (taken out of flow, sized relative to page)
- Inside a container with an explicit fixed height (e.g., `block(height: 200pt)[...]`)

**When `height: 100%` is dangerous**:
- Inside `cols(lazy-layout: true)` cells — use `lazy-v(1fr)` instead
- As a divider between lazy columns — use `block(width: 2pt, fill: color)[#lazy-v(1fr)]`
- In component backgrounds — use `place()` with `width: 100%` + `height: 100%` only if the element is decorative (won't affect flow)

```typst
// ❌ WRONG — height: 100% divider pushes siblings off
grid(columns: (1fr, auto, 1fr),
  content-left,
  block(width: 2pt, height: 100%, fill: gray),  // ← expands to page height!
  content-right,
)

// ✅ CORRECT — one direct stretchable component per lazy column
cols(lazy-layout: true, columns: (1fr, auto, 1fr), column-gutter: 0pt,
  block(width: 100%)[#content-left #lazy-v(1fr)],
  block(width: 2pt, fill: gray)[#lazy-v(1fr)],  // ← fills actual column height
  block(width: 100%)[#content-right #lazy-v(1fr)],
)

// ✅ CORRECT — place() for decorative backgrounds (doesn't affect flow)
let setting(body) = {
  place(top + left, image(bytes(bg-svg), width: 100%, height: 100%))
  body
}
```

### Component Parameter Style

Prefer **content-block parameters** over array parameters for component APIs. Content blocks are more natural in Typst and easier to write:

```typst
// ✅ PREFERRED — content-block style (natural Typst)
#data-card[Ground Stations][
  - All-sky cameras: 48 sites
  - Magnetometers: 120+ stations
  - Ionosondes: 35 locations
]

// ⚠️ ACCEPTABLE but verbose — array style
#data-card([Ground Stations], (
  [All-sky cameras: 48 sites],
  [Magnetometers: 120+ stations],
  [Ionosondes: 35 locations],
))
```

When defining component functions, prefer accepting `content` over `array`:
```typst
// ✅ Content-block API
#let data-card(title, body) = { ... }
// Usage: #data-card[Title][body content with - lists]

// ⚠️ Array API (harder to use)
#let data-card(title, items) = { for item in items { ... } }
// Usage: #data-card([Title], ([item1], [item2]))
```

#### Rendered Content vs String Data

For any argument whose semantic role is presentation copy—such as a title,
label, value, caption, quote attribution, or body—prefer a Typst content block
over a quoted string. This preserves markup, math, citations, styling, and inline
components at the call site:

```typst
// ✅ PREFERRED — both arguments are renderable content
#insight-card[Hanami Tradition][
  _Hanami_ (花見) celebrates the beauty of cherry blossoms.
]

// ✅ PREFERRED — named configuration stays in parentheses; content follows
#insight-card(accent: palette.gold)[Wabi-Sabi][Body content]

// ⚠️ AVOID for presentation copy — needlessly narrows the API to plain text
#insight-card("Hanami Tradition")[Body content]
```

Keep quoted strings when the value is semantically string data: file paths,
URLs, font names, enum/config selectors such as `variant: "accent"`, dictionary
keys, serialization input, or values intentionally processed with string-only
operations such as `upper`, `lower`, `split`, `replace`, or regular expressions.
Do not mechanically replace every string literal; classify the parameter by how
the callee uses it.

### Preventing Content Overflow

For a project-owned/custom Touying 0.7.4 entry:

```typst
#show: my-theme.with(
  config-common(breakable: false),  // Truncate instead of creating new slides
)
```

- `breakable: false` — Recommended. Truncates with warning.
- `clip: true` — Silently clips overflow.
- Limit bullet points to 4-5 per slide. In 4-column grids, keep cards to 2-3 lines.

`config-common(breakable: false)` must be passed inside the theme show rule:

```typst
#show: my-theme.with(
  config-common(breakable: false),
)
```

Do not leave `#config-common(breakable: false)` as a standalone body expression. Standalone `config-common(...)` does not configure the deck reliably and can render as visible/debug content in broken mixed-mode contexts.

For a third-party Universe theme, add `breakable: false` only through the
package's supported configuration API. Older package-owned Touying versions may
not expose `config-common` compatibly. In every case, verify physical page count
and every rendered page; the setting does not replace visual review.

**Rules of thumb** for avoiding overflow:
- Keep bullets and vertically stacked cards short enough to scan at delivery size; there is no universal item cap.
- If content looks too dense: split into two slides — never shrink font to compensate
- Long math formulas: use `aligned` environment or move to a full-width slide

### Content Alignment

`align: horizon` (default) vertically centers slide content. Override per-slide: `#slide(align: top)[...]`.

### Wrap Tables in `#figure()`

Prevents Touying from splitting tables across slides:

```typst
#figure[
  #data-table(
    ([Component], [Technology], [Scale]),
    (([Training], [Custom], [10K+]),),
  )
  #text(size: 0.7em, fill: gray)[Data source: Annual Report 2024]
]
```

Note: `#figure[...]` wraps its content in a content block — use `#` prefix for function calls inside as usual.

### Table Fundamentals

#### Basic Table

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

#### Key Parameters

| Parameter | Purpose | Example |
|-----------|---------|---------|
| `columns` | Column widths | `(1fr, 2fr)`, `3 * (1fr,)`, `(auto, 1fr, 80pt)` |
| `rows` | Row heights | `(auto, 1fr)` |
| `align` | Cell alignment | `center`, `(left, center, right)`, or `(x, y) => ...` |
| `inset` | Cell padding | `8pt`, `(x: 12pt, y: 6pt)` |
| `stroke` | Cell borders | `0.5pt`, `none`, `(x, y) => ...` |
| `fill` | Cell background | `luma(245)`, `(x, y) => if y == 0 { blue }` |
| `gutter` | Gap between cells | `4pt`, `column-gutter: 8pt` |

Use `table.header(...)` for header rows, `table.cell(colspan:)` / `table.cell(rowspan:)` for merging, `table.hline()` for three-line academic style.

#### Three-Line Table (Academic Style)

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

> **More patterns** (rowspan/colspan, styled headers, zebra stripes): See `shared-standards-extended.md` §Table Fundamentals.

### Use `stack()` for Cohesive Visual Groups

At the caller level, complete components normally remain direct sequential flow;
do not add `stack()` or fixed `v()` solely to separate them. When multiple
elements together form one designed visual group whose internal spacing must be
controlled—such as a header, KPI, or composite card—use `stack(spacing:)`
instead of sequential elements joined by `v()`.

> **Rule of thumb**: 2+ elements in one deliberate vertical visual group →
> `stack(spacing:)`. For ordinary prose/content groups, start around
> `spacing: .8em` and tune against the rendered typography. Headers and KPI
> internals follow the `.8em` minimums below. Smaller positive spacing can
> be correct for tiny labels, dimension marks, badges, and tightly coupled
> decorative primitives. Do not create a stack merely to satisfy a numeric
> threshold. Horizontal
> `stack(dir: ltr, ...)` is a separate axis. The only zero-gap exception is a
> deliberately seamless primitive such as the adjacent-block pattern below.
> Three-part horizontal footer → `grid(columns: (1fr, auto, 1fr))`, NOT
> `h(1fr)`.

> **MANDATORY in headers**: Theme headers that combine a title + accent line
> (or kicker + title + rule) MUST use `stack(spacing: .8em)` or more. Using
> `v()` between these elements causes paragraph-spacing drift; replacing it
> with an undersized `.3em` stack does not create a useful visual group.

> **MANDATORY in stat/KPI/metric cards**: A vertical icon → value → label
> composition MUST use one centered `stack(spacing: .8em, ...)` or more. Do not insert
> `v(Npt)` between those component internals; paragraph-flow spacing produces
> inconsistent card rhythm and height drift.

> **Adjacent blocks with no gap**: When two blocks must touch (e.g., title-bar + content-area in a browser-frame card), wrap them in `stack(spacing: 0pt)` and set `clip: true` on the outer container. Otherwise Typst inserts paragraph spacing between them.

> **Checker boundary**: The quality checker reports negative spacing for
> overlap review and a literal zero gap as `advisory` because it may be an
> intentional seamless join. It does not impose a global minimum on positive
> spacing: only the component's semantic role and rendered typography can
> determine whether a compact gap is correct. Explicit horizontal and unresolved
> dynamic directions remain outside this source heuristic.

> **Header/footer code examples**: See `template-designer.md` §Visual Bug Prevention for canonical implementations using `stack()` and `grid()`.

### Inline SVG via `image(bytes(...))`

Use `image(bytes(svg-string), width: Npt)` to render SVG as images. Key rules: use `image(bytes(...))` (NOT `image.decode`), define SVGs at module level, use `currentColor` + `.replace()` for palette colors.

> **Full example and rules**: See `shared-standards-extended.md` §Inline SVG. Also see `template-designer.md` §"Inline SVG Patterns".

> **Frame/Border Centering**: For decorative `place()`-based borders, use percentage-based dimensions (`width: 96%, height: 94%`), never hardcoded pt values. See `shared-standards-extended.md` §Frame/Border Centering.

### Key Typst Layout Functions (Quick Reference)

| Function | Purpose | Key Parameters |
|----------|---------|---------------|
| `place(alignment, dx:, dy:, content)` | Position element relative to slide bounds; removes from flow | `top + left`, `center + horizon`, `dx: Xpt`, `dy: Ypt` |
| `grid(columns:, rows:, gutter:, ..children)` | Multi-row/column layout grid | `columns: (1fr, 2fr)`, `column-gutter:`, `row-gutter:` |
| `box(width:, height:, clip:, fill:, inset:, radius:, content)` | Inline container | `clip: true` for cropping, `radius: 50%` for circular |
| `block(width:, height:, fill:, inset:, radius:, stroke:, content)` | Block-level container | `width: 100%`, `breakable: false` |
| `config-page(background:, fill:, margin:)` | Touying per-slide page config | `background: image(...)` for full-bleed backgrounds |
| `image(source, width:, height:, fit:)` | Embed image | `fit: "cover"` (fill + crop), `"contain"` (fit within), `"stretch"` |
| `stack(dir:, spacing:, ..children)` | Stack elements with consistent spacing | `dir: ltr` for horizontal; default vertical |

> **`place()` in main.typ**: Only for overlays (floating labels, watermarks, badges). For full-bleed backgrounds, use `config-page(background:)`. For column layouts, use `#cols`.

### Source Images & Placeholders

For imported PDF source images: use `#slide(composer: (2fr, 1fr))` with `height: 100%, fit: "contain"`. For placeholders: use a dashed `rect` with label text.

> **Full patterns and code**: See `shared-standards-extended.md` §Source Images and §Placeholder Images. Also see `image-layout-patterns.md` patterns #2, #3 for image + text column variants.

---

## 5. Third-party Package Reference

| Package | Version | Purpose | Import |
|---------|---------|---------|--------|
| touying | 0.7.4 | Slide framework | `#import "@preview/touying:0.7.4": *` |
| mitex | 0.2.7 | Math equations (LaTeX→Typst). `` #mi(`E=mc^2`) `` inline, `` #mitex(`...`) `` block. Backtick strings only. | `#import "@preview/mitex:0.2.7": *` |
| lilaq | 0.6.0 | Mature Typst-native statistical plotting and the default for existing SeaSlides chart templates. | `#import "@preview/lilaq:0.6.0" as lq` |
| gribouille | 0.6.0 | Layered Grammar of Graphics with mapped aesthetics, statistics, scales, labels, and themes. Pin the version because the API is still evolving. | `#import "@preview/gribouille:0.6.0": *` |
| codly | 1.3.0 | Code blocks with zebra stripes, line numbers (optional — template already styles code by default) | `#import "@preview/codly:1.3.0": *` |
| lovelace | 0.3.1 | Pseudocode / algorithm typesetting | `#import "@preview/lovelace:0.3.1": *` |
| cheq | 0.4.0 | Checklists: `- [x]` / `- [ ]` / `- [/]` syntax | `#import "@preview/cheq:0.4.0": *` |
| merman | 0.1.0 | Mermaid diagrams rendered to export-safe SVG during Typst compilation through a bundled WASM plugin. | `#import "@preview/merman:0.1.0": mermaid, show-mermaid-blocks` |
| cetz | 0.5.2 | Drawing/diagrams | `#import "@preview/cetz:0.5.2"` |
| cetz-plot | 0.1.4 | Charts/plots | `#import "@preview/cetz-plot:0.1.4"` |
| fletcher | 0.5.8 | Flowcharts | `#import "@preview/fletcher:0.5.8"` |
| showybox | 2.0.4 | Styled boxes/cards | `#import "@preview/showybox:2.0.4": showybox` |
| gentle-clues | 1.3.1 | Admonition boxes | `#import "@preview/gentle-clues:1.3.1": *` |
| pintorita | 0.1.4 | Diagrams from text | `#import "@preview/pintorita:0.1.4"` |
| shadowed | 0.3.0 | CSS-like box shadows for cards and components | `#import "@preview/shadowed:0.3.0": shadow` |

> **Content-driven selection**: math formulas → mitex; standard slide/scientific plots → lilaq; layered mapped-aesthetic/statistical plots → gribouille; code with zebra stripes → codly; algorithms → lovelace; task lists → cheq; flowcharts/Gantt/sequence diagrams → merman. Multiple can be combined. Gribouille is an alternative plotting model, not an automatic replacement for Lilaq.
> **More packages**: See `_shared/packages/index.json` for additional curated packages
> (theorion, tablem, pinit, numbly, tiaoma, cuti). Human-readable docs are at
> `_shared/packages/README.md`.
> **Charts**: See `_shared/charts/index.json` for chart component templates
> (lilaq, primaviz, merman, etc.).
> **Icons**: See `_shared/icons/index.json` and `_shared/icons/README.md`. Use emoji by default.

### Shadowed (Box Shadows)

```typst
#import "@preview/shadowed:0.3.0": shadow

// API: shadow(dx, dy, blur, spread, fill, radius)[body]
#shadow(dx: 2pt, dy: 2pt, blur: 4pt, fill: rgb(0,0,0,8%), radius: 4pt)[
  #block(fill: white, inset: 12pt, radius: 4pt)[Card content]
]
```

The `body` inside `shadow()` should be a `block()` with its own `fill` — the shadow wraps around the visual bounds of its child.

> **More elevation presets** (medium / strong): See `shared-standards-extended.md` §Shadowed.

### Heading Numbering (numbly)

Use `numbly` for automatic heading numbering (lectures, courseware). Format: `numbly("Part {1:I}.", "{1:I}.{2}.")`.

> **Details and format specifiers**: See `shared-standards-extended.md` §Heading Numbering.

### Icons and Logos

**Decision logic**:

| Condition | Use | Reason |
|-----------|-----|--------|
| Casual/general; font availability uncertain | Unicode emoji (`🚀 ✅ 📊`) | Always renders; no dependency |
| Need visual consistency across fonts/exports (PPTX) | `booticons` (SVG-based) | Won't become tofu blocks; font-independent |
| Need brand logos (GitHub, Python, Typst) | `sicons` (Simple Icons) | 3000+ official brand SVGs |
| No icons needed | Omit entirely | Cleaner |

> **Default**: Emoji. Switch to `booticons` only when the deck will be exported to PPTX or when consistent icon rendering matters more than simplicity.

**Sizing rule of thumb**: Inline icons → `height: .9em, baseline: .1em`. Larger standalone icons → set explicit `height` (e.g., `2em`, `24pt`).

> **Full API reference** (booticons, sicons code examples, `context` requirements): See `shared-standards-extended.md` §Icons and Logos.
> **Icon lists**: `_shared/icons/index.json`, `_shared/icons/booticons/icons.txt`,
> `_shared/icons/sicons/slugs.txt`.

---

## 6. Compilation & Verification Pipeline

### Compile to PDF

```bash
python3 typst_compiler.py <project_path> --format pdf
```

### Compile to PNG (for visual review)

```bash
python3 typst_compiler.py <project_path> --format png --ppi 144
```

PNGs are saved to `output/pngs/slide_01.png`, `slide_02.png`, etc.

### Compile to Overview (for LLM review)

```bash
python3 typst_compiler.py <project_path> --format overview
```

Produces a single `output/overview.png` grid image with all slides. Columns and PPI are auto-adjusted to fit within 2000x2000 pixels.

### Export to PPTX (optional)

```bash
python3 typst_compiler.py <project_path> --format pptx
```

> Full verification checklist: see SKILL.md §7.

---

## 7. Typst Markup Best Practices

### Markup Mode vs Code Mode

Confusing these two modes causes slides to display raw code as text. This is the most common render failure.

Typst has two parsing modes:

**Markup mode** (`[...]` content blocks): Like Markdown, text flows naturally. Use `#` prefix to embed code expressions.

**Code mode** (`{...}` code blocks or `#...` expressions): Standard programming language, every statement is code.

#### Quick Reference (Memorize This Table)

| Context | `v(8pt)` without `#` | `#v(8pt)` with `#` |
|---------|---------------------|---------------------|
| `#slide[...]` markup body | **WRONG** — literal text "v(8pt)" shown | **CORRECT** — executes vertical space |
| `#block[...]` content argument | **WRONG** — literal text shown | **CORRECT** — executes function |
| `{...}` code block (grid child) | **CORRECT** — executes function | **WRONG** — syntax error |
| After `#let x = ...` assignment | **CORRECT** — code context | **WRONG** — double prefix |

**The rule is simple**: `[...]` = needs `#`. `{...}` = no `#`. No exceptions.

```typst
// ✅ CORRECT: Inside block()[...], use # for function calls
#let my-card(title, body) = {
  block(fill: luma(240), inset: 12pt, radius: 4pt)[
    #stack(spacing: .8em,
      text(weight: "bold", title), body, lazy-v(1fr),
    )
  ]
}
```

**Rule of thumb**: Inside `block()[...]`, `table[col][col][...]`, `figure[...]`, and any other `[...]` content argument, always prefix function calls with `#`.

#### `cols` / `stack` Mode Cookbook

`cols` is the universal multi-column function. There is no separate `col()` helper. The important distinction is the argument mode, not whether `cols` itself has a `#` prefix:

```typst
// Markup block style: each column is a [...] block, so calls inside need #
#cols[
  #metric-card([Signal], [High])
][
  #metric-card([Risk], [Medium])
]

// Parenthesized content arguments: [...] values are markup content values
#cols(columns: (1fr, 1fr), gutter: 1em,
  [#metric-card([Signal], [High])],
  [#metric-card([Risk], [Medium])],
)

// Code block arguments: {...} is code mode, so inner function calls are bare
#cols(columns: (1fr, 1fr), gutter: 1em,
  { metric-card([Signal], [High]); note-box([Reason]) },
  { metric-card([Risk], [Medium]); note-box([Mitigation]) },
)

// Three columns are the same pattern
#cols[ #card([A], [Text]) ][ #card([B], [Text]) ][ #card([C], [Text]) ]
```

`stack(...)`, `grid(...)`, `block(...)`, and most component calls are code expressions once you are inside their `(...)` argument list. Use bare calls for nested arguments there; use `#` again only when you enter a nested `[...]` markup body.

```typst
// Correct: stack arguments are code-mode expressions
#stack(spacing: .8em,
  block(fill: pal.panel, inset: 10pt)[#text(weight: "bold")[Title]],
  block(fill: pal.surface, inset: 10pt)[#body],
)

// Wrong: a raw `stack(` or `block(` line inside [...] renders as visible text
```

Header/footer helpers should prefer `{...}` code blocks when they contain `if`, `let`, or `set`:

```typst
// Correct inside a theme function
stack(spacing: .8em,
  {
    set text(size: 1.4em, weight: "bold")
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
  },
  block(width: 60pt, height: 2pt, fill: pal.accent),
)
```

#### Mixed-Mode Slides (Canvas Themes)

Canvas themes mix `[...]` and `{...}` on the same slide. The `{...}` code blocks (e.g., as grid children) use bare calls, but the outer `#slide[...]` body is markup mode requiring `#`. Do NOT confuse the two levels:

```typst
// ✅ CORRECT: outer [...] uses #, inner {...} uses bare calls
#slide(title: none)[
  #grid(columns: (3fr, 2fr), column-gutter: 24pt,
    stack(spacing: .8em,
      kicker[THESIS],
      text(size: 2.6em, weight: 200)[Big Statement],
    ),
    { card-fill([Detail], [Info]); card-outlined([More], [Extra]) },
  )
]
```

### Bold/Strong Syntax: Single Star, Not Double

Typst uses `*text*` for bold/strong. Double stars `**` are parsed as two empty strong spans:

```typst
// ✅ CORRECT: Single star for bold
*植物染*，即以植物根、茎、叶为原料...

// ❌ WRONG: **text** in Typst is empty strong + text + empty strong
**植物染**  // Warning: "no text within stars"

// ✅ For literal asterisks (e.g., WeChat article style markers), escape them
\*\*植物染\*\*
```

> When converting content from WeChat articles or other sources that use `**text**` for bold, replace with Typst's `*text*`.

### Markdown Residue Cleanup

Markdown source text must be converted to Typst-native constructs before it reaches the slide body:

- Pipe tables such as `| A | B |` / `|---|---|` -> `#table(...)` or a theme table component.
- Gantt or Mermaid text -> `merman` with `#show raw.where(lang: "mermaid"): show-mermaid-blocks(width: 100%)`, or a custom schedule component.
- Pseudocode -> `lovelace` or a themed pseudocode component, not raw Markdown prose.
- Fenced code stays as raw code only when the slide is intentionally showing code.

Do not leave lines like `Gantt:`, `|---|`, or Markdown list/table scaffolding as presentation content unless the slide explicitly teaches Markdown syntax.

### Content Block Nesting: Use `#` for All Function Calls

Every `[...]` block resets to markup mode, regardless of nesting depth. Even inside `#stack(...)` or `#align(...)`, inner content blocks need `#`:

```typst
// ✅ CORRECT: # prefix at every nesting level inside [...]
#block(inset: 10pt)[
  #align(center + horizon)[
    #stack(spacing: .8em,
      { set text(size: 1.6em, weight: "bold"); [#value] },
      { set text(size: 0.7em); [#label] },
    )
  ]
  #lazy-v(1fr)
]
```

### Block Arguments: `align()` Is NOT a Block Parameter

`align()` is a content layout function, not a parameter of `block()`:

```typst
// ❌ WRONG: align() passed as positional argument to block()
#block(fill: luma(240), inset: 12pt, align(center + horizon))[
  Centered content
]

// ✅ CORRECT: align() wraps the content inside the block
#block(fill: luma(240), inset: 12pt)[
  #align(center + horizon)[Centered content]
]
```

> Forward references: functions must be defined before use. See `template-designer.md` for ordering rules.

### Function Parameters: Positional vs Named

Positional parameters cannot be called with names. If `#let stat-card(value, label) = {...}`, then `#stat-card(value: [...])` is an ERROR — must use `#stat-card([...], [...])`.

> **Guideline**: Use positional parameters for required args (1-2), named parameters (with defaults) for optional ones.

### Escaping Markup Characters

Inside `[...]` content brackets, these characters must be escaped with `\`:

| Character | Meaning | Escaped |
|-----------|---------|---------|
| `_` | Emphasis | `\_` |
| `*` | Strong | `\*` |
| `#` | Code expression | `\#` |
| `@` | Cite | `\@` |
| `$` | Math mode | `\$` |
| `` ` `` | Raw/code | `` \` `` |

```typst
// ❌ WRONG — > starts blockquote, _ starts emphasis
#text(fill: palette.accent)[>_ ]
// ✅ CORRECT
#text(fill: palette.accent)[\>\_]
```

List markers are contextual rather than generally reserved characters. At the
start of a markup line—including a new line inside a table/KPI cell or another
content block—Typst recognizes these forms:

| Source form | Meaning | Literal form |
|-------------|---------|--------------|
| `- item` | Bulleted-list item | `\- item` |
| `+ item` | Numbered-list item | `\+ item` |
| `/ Term: definition` | Term-list item | `\/ Term: definition` |

Escape the marker only when literal text actually matches one of these forms.
A sign or slash without marker whitespace is ordinary text, so `[+32%]`,
`[-5%]`, and `[/API]` need no escaping. Do not add a broad validator rule for
leading `-`, `+`, or `/`; it would confuse legitimate signs, paths, and lists.

### Touying-Specific Pitfalls

#### `---` Is a Slide Break

In Touying, `---` creates a new slide (not a horizontal rule). Use `--` for dashes, `#line()` for separators.

```typst
== My Slide Title
First part
---
Second part (new slide, same title)

// Use -- for dashes, #line() for separators
Some text -- more text
#line(length: 100%, stroke: 0.5pt + gray)
```

#### `context` Requires `{}` for Multi-Expression Blocks

```typst
// ❌ WRONG: Only slide-counter.display() is in context
context utils.slide-counter.display() + " / " + utils.last-slide-number

// ✅ CORRECT
context { utils.slide-counter.display() + " / " + utils.last-slide-number }
```

### Code Blocks: Use Raw Syntax

Use standard Typst raw block syntax (triple backticks) for code examples. Do NOT manually format with `\{`, `#h(1em)`, or escape sequences.

````typst
// CORRECT
#code-block([API Request])[
  ```http
  POST /v1/messages
  {"model": "claude-sonnet-4"}
  ```
]
````

### Font Availability: Verify Before Use

Always verify font availability on the compilation system before using them in Typst files:

```bash
# Check available fonts
typst fonts | grep -i "cjk\|chinese\|song\|hei\|kai"
```

Common macOS Chinese fonts: `Heiti SC`, `PingFang SC`, `Kaiti SC`, `Songti SC`. On Linux, use `Noto Sans CJK SC` / `Noto Serif CJK SC`.

### Content Overflow Strategy

When slides overflow, use this priority cascade:
1. **Trim content** — reduce card count, shorten text, remove low-value bullets
2. Split into two slides using `---` or a new `== Heading`
3. Reduce margins: `margin: (top: 3.2em, bottom: 1.0em, x: 1.3em)`
4. Reduce base font: from `20pt` → `16pt` → `15pt` (ONLY if absolutely necessary)
5. Reduce component insets (e.g., `inset: 12pt` → `inset: 8pt`)
6. As last resort, reduce image `height:` to limit vertical space

**NEVER** use `#text(size: Xpt)[entire slide content...]` as a shrink hack — this destroys typography hierarchy.

### Math Equations

> **Critical**: Typst's built-in math syntax is NOT LaTeX. Do not use `\frac{}{}`, `\int`, `\sum`, etc. in Typst's native `$ ... $` mode.

#### LaTeX Math via MiTeX Package (default)

Default new formulas to MiTeX. Preserve an existing document's verified native math. Use new native
`$...$` only when already fluent in every exact Typst spelling and expecting the first authored
expression to validate; short or simple is not sufficient. Speed is not an excuse for fake math.

Never imitate an equation with ordinary text, a quoted string, `#raw(...)`, code styling, or
Unicode superscript, subscript, Greek, and operator lookalikes outside actual math content.
MiTeX backticks are raw input to a real math renderer; visible raw text is not math.

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

#### When to Use Which

| Scenario | Recommendation |
|----------|---------------|
| New formula or uncertain native spelling | **MiTeX package** |
| Existing document consistently uses verified Typst-native math | Preserve native math |
| Already fluent in exact Typst spelling; first draft expected to validate | Typst native math, then inspect |
| Converting LaTeX source with formulas | MiTeX package (no rewriting needed) |
| PDF source processed by MinerU (contains `$...$` LaTeX) | MiTeX package — MinerU outputs LaTeX math notation |

> **Typst native math syntax, LaTeX↔Typst comparison table, MinerU workflow details**: See `shared-standards-extended.md` §Math Equations.

Compilation only proves that Typst accepted the source. Compare operators, indices, dimensions,
masks, constants, and notation with the paper or other authoritative source, then inspect the
rendered equation at readable size.

> Bibliography and citation rules: see `executors/academic.md` §8.

---

## 8. Hard Rules (P0)

| Rule | Wrong | Right |
|------|-------|-------|
| No fake text/Unicode math | `#raw("QKᵀ/√dₖ")` or plain `β̂ ∈ ℝⁿ` | `#mi(\`QK^\\top / \\sqrt{d_k}\`)` |
| No `#slide(title: ...)` | `#slide(title: [X])[...]` | `== X` then content (§2) |
| Inline math = `#mi()`, block math = `#mitex()` | `#mitex(\`x^2\`)` inline | `#mi(\`x^2\`)` inline; `#mitex(\`...\`)` on own line |
| Compile success is not formula verification | A compiling but altered index or mask | Compare with source and inspect the rendered equation |

---

## 9. Anti-Patterns (DO NOT USE)

> These patterns cause compilation errors, duplicate content, or unprofessional output. The Executor MUST avoid all of them.

### 9a. Compilation/Structural Anti-Patterns

| Anti-Pattern | Problem | Fix |
|---|---|---|
| `#new-section-slide[...]` manual call | Section slides are **automatically created** by `= Heading` (level-1 headings). Manual calls produce DUPLICATE section slides. | Use `= Section Title` headings only. |
| `#outline()` on every section | Produces a redundant TOC at the start of every section. | Only use `#outline()` once on a dedicated "Outline" slide. |
| `#slide[...]` wrapping all content | In Touying 0.7.4, `== Title` automatically creates slides. Wrapping every slide in `#slide[...]` is redundant and can interfere with the heading-based structure. | Use `#cols[...] [...]` for ordinary multi-column composition; use `#slide` only when a selected theme explicitly documents a custom composer or special format. |
| Inline `rgb()` / `block(fill: ...)` in main.typ | For Plain/Rich complexity, colors and styling belong in `template.typ`. Inline colors make themes non-portable. | Use `palette.xxx` semantic keys. Define colors in template.typ. |
| `#show: slides.with(...)` | Touying 0.4.x/0.5.x syntax. WILL NOT COMPILE with 0.7.4. | Use `#show: <theme-function>.with(...)` |
| `#show: touying.with(...)` | Not valid syntax in any Touying version. | Use `#show: <theme-function>.with(...)` |
| Direct `@preview/touying:0.5.3` in a project-owned/custom theme | Wrong direct-import version; API incompatible with this skill's custom-theme patterns. | Use direct `@preview/touying:0.7.4`. For a Universe package that owns an older transitive version, keep its documented package API instead of mixing versions. |
| Bare function calls inside `[...]` markup blocks | `v(8pt)`, `text(...)`, `block(...)`, `align(...)` without `#` prefix inside `#slide[...]`, `#block[...]`, or any `[...]` content block | Renders as literal text instead of executing the function — causes entire slides to display raw code | Always use `#v()`, `#text()`, `#block()`, `#align()` inside `[...]` markup. Bare calls are ONLY correct inside `{...}` code blocks. See §7 "Markup Mode vs Code Mode". |
| Raw template code rendered on slides | Visible `if self.store...`, `utils.display-current-heading`, `config-common(...)`, `stack(...)`, or Markdown scaffolding such as `|---|` in the output | A `[...]` markup block was used where `{...}` code mode was required, or Markdown was not converted | Fix the source mode boundary and recompile; inspect `overview.png` and run `validate_project.py`. |
| Third-party `#show` rules AFTER theme show rule | Packages like codly, cheq use `#show` rules that must wrap the theme. Placing them after `#show: theme.with(...)` can cause blank first slides, broken code blocks, or ignored styling. | Place third-party `#show` rules BEFORE the theme show rule: `#show: codly-init` / `#show: checklist.with(...)` then `#show: theme.with(...)`. The theme show rule should always be last. Do NOT use zebraw — it causes compilation failures. |

### 9b. Design/Quality Anti-Patterns

| Anti-Pattern | Problem | Fix |
|---|---|---|
| All slides are `== Heading` + bullet points | Plain complexity regardless of label. Fails Rich/Canvas. | Use theme components: cards, boxes, grids, tables. |
| Using builtin theme without explicit user request | Generic output. | Default to custom themes from `custom-rich/` or `custom-canvas/`. |
| Accidental repeated layout | Can feel mechanical when repetition has no communicative purpose. | Review in narrative context; keep stable layouts for comparison/sequence and vary accidental monotony. |
| `#text(size: X)[entire slide content...]` as shrink hack | Ruins hierarchy. | Reduce content or split into multiple slides. |
| Speaker notes missing | Less useful for presenter. | Add `#speaker-note[...]` on EVERY slide. |
| Full-width solid-color header bar | Looks AI-generated. | Title on background with thin accent underline, or thin top bar (≤ 4pt). |
| Bold weight for ALL headings | Monotonous typography. | Vary weights: lighter for large text, bolder for small labels. |

> For Canvas-specific anti-patterns (rounded corners, accent overuse, dark page rhythm, symmetric grids, etc.), see `canvas.md` §8.

### 9c. Canvas-Specific Anti-Patterns

| Anti-Pattern | Problem | Fix |
|---|---|---|
| Using raw hex `rgb("#FF0000")` in main.typ | Even in Canvas mode, colors must be semantic. | Use `palette.primary`, `palette.accent`, etc. defined in template.typ |
| Not using `place()` at all in Canvas | Canvas complexity means full layout control. Without `place()`, it's just Rich. | Use `place()` for overlays, absolute-positioned elements, decorative layers. |
| Canvas label without bespoke composition | The requested complexity and rendered result do not match. | Judge the rendered composition and use of Canvas capabilities; do not use source-line count as a proxy. |

---

## Related Documents

- [shared-standards-extended.md](./shared-standards-extended.md) - Extended examples (tables, shadows, icons API, math syntax)
- [image-layout-patterns.md](./image-layout-patterns.md) - 72 image-text layout patterns (Primary + Modifier vocabulary)
- [image-generator.md](./image-generator.md) - Image generation reference
