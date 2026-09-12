// ===============================================================
// Touying Quick Theme — Comprehensive Demo
// Universe package: @preview/touying-quick:0.4.2
// Touying version: 0.7.1 (owned by the Universe package)
// Base theme: Metropolis
//
// This demo showcases all features of the Touying Quick theme:
// TOML-based configuration, automatic title/outline/ending slides,
// background images, color themes, heading numbering, theorion
// admonition blocks, codly code highlighting, three-line tables,
// chapter-relative equation numbering, multi-column layouts,
// focus slides, and the unique info/styles/names API.
//
// NOTE: Unlike standard Touying themes, touying-quick does NOT
// use config-info() or config-colors(). It has its own API with
// `theme`, `info`, `styles`, and `names` parameters.
// ===============================================================

#import "@preview/touying-quick:0.4.2": *
#import "@preview/mitex:0.2.7": *

// --- Custom Info Dictionary ---
// Instead of config-info(), pass a dictionary matching the TOML schema.
// You can also load from a TOML file: toml("my-info.toml").default
#let my-info = (
  author: "Dr. Alice Chen",
  institution: "Department of Computer Science, Typst University",
  series: "Modern Presentation Techniques",
  footer: "Typst University",
  header: "",
  ending: "Thank You for Your Attention!",
  lang: "en",
)

// Native outline() repeats its title inside the body while Metropolis also
// displays it in the slide header. Suppress the redundant body title.
#let my-names = {
  let names = default-names
  names.sections.en.outline = none
  names
}

// --- Theme Configuration ---
// touying-quick generates title slide, outline, and ending slide
// automatically — no need to call #title-slide() or add an ending.
#show: touying-quick.with(
  title: "Touying Quick: Academic Reports",
  subtitle: "A Comprehensive Feature Demo",
  // Heading numbering in "1.1." format (default: true)
  heading-idx: true,
  // Background image: bgsky (default), bghexagon, bgbook, or custom path
  bgimg: bgsky,
  // Color theme: "blue" (default) or "red"
  theme: "blue",
  // TOML-based configuration dictionaries
  info: my-info,
  styles: default-styles,
  names: my-names,
  // Language: "en" or "zh" (overridden by info.lang)
  lang: "en",
)

// =========================================
// SECTION 1: Theme Overview
// =========================================
// Level-1 headings create section divider slides.
// The equation counter resets at each new section.
= Theme Overview

== What is Touying Quick?

Touying Quick is a *quick-start presentation template* for academic reports, built on the Touying Metropolis theme.

Key features:

- *TOML-based configuration* — fonts, sizes, spacing, colors, and localization are all driven by TOML dictionaries
- *Automatic slide generation* — title slide, table of contents, and ending slide are created automatically
- *Two color themes* — `"blue"` and `"red"` with 20 color slots each
- *Three background images* — `bgsky`, `bghexagon`, `bgbook`
- *Bundled packages* — `theorion` for theorem blocks, `codly` for code highlighting
- *Bilingual support* — English and Chinese out of the box

== How It Differs from Standard Touying

Unlike most Touying themes, Touying Quick uses a *unique API*:

#table(
  columns: (1fr, 1fr),
  align: (left, left),
  table.header(
    [*Standard Touying Theme*], [*Touying Quick*],
  ),
  [`config-info(title: [...])` wrapper], [Direct `title:` and `info:` dictionary],
  [`config-colors(primary: ...)` call], [`theme: "blue"` string selector],
  [Manual `#title-slide()` call], [Automatic title slide generation],
  [Inline font/size configuration], [TOML file-based `styles:` dictionary],
  [No localization system], [`names:` dictionary with `"en"` / `"zh"` keys],
)

== Configuration Architecture

The core API is three TOML-compatible dictionaries:

- *Info* — author, institution, footer, and ending text
- *Styles* — fonts, sizes, spacing, and the 20-slot color theme
- *Names* — localized outline, equation, figure, and table labels

// =========================================
// SECTION 2: Slide Types
// =========================================
= Slide Types

== Content Slides

Content slides are created with level-2 headings (`==`). This is the most common slide type. The heading becomes the slide title with automatic numbering.

- Bullet points work naturally
- With *bold* and _emphasis_ styling
  - Nested sub-items supported
  - Up to level-4 headings available

+ Numbered lists are also supported
+ With the same nesting capabilities

#slide(title: [2.2. Multi-Column Layouts], composer: (1fr, 1fr))[
  *Left Column*

  This column occupies half the slide width. Use the `composer` parameter to control proportions.

  - Point A
  - Point B
  - Point C
][
  *Right Column*

  The right column shows complementary content. Both columns render simultaneously.

  - Detail 1
  - Detail 2
  - Detail 3
]

#slide(title: [2.3. Three-Column Layout], composer: (1fr, 2fr, 1fr))[
  #align(center)[
    _Narrow_ \
    `1fr`
  ]
][
  #align(center)[
    The center column is twice as wide, ideal for main content with flanking sidebars or annotations.
  ]
][
  #align(center)[
    _Narrow_ \
    `1fr`
  ]
]

// =========================================
// SECTION 3: Academic Content
// =========================================
= Academic Content

== Mathematics

Touying Quick is designed for academic presentations. Equations render beautifully with the configured math font (Times New Roman by default):

The _Cauchy-Schwarz inequality_ states that for vectors #mi(`\mathbf{u}, \mathbf{v} \in \mathbb{R}^n`):

#mitex(`|\langle \mathbf{u}, \mathbf{v} \rangle|^2 \leq \langle \mathbf{u}, \mathbf{u} \rangle \cdot \langle \mathbf{v}, \mathbf{v} \rangle`)

Euler's identity, one of the most elegant equations in mathematics:

#mitex(`e^{i\pi} + 1 = 0`)

== Labeled Equations and Cross-References

Labeled equations receive *chapter-relative numbering* in `(section.n)` format. The counter resets at each level-1 heading.

The Fourier transform of #mi(`f`) is defined as:

#mitex(`\hat{f}(\xi) = \int_{-\infty}^{\infty} f(x) e^{-2\pi i x \xi} \, dx`) <eq:fourier>

The Gaussian integral evaluates to:

#mitex(`\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}`) <eq:gaussian>

== Aligned Equations

Mathematical derivations with alignment:

#mitex(`\begin{aligned} \nabla \times \mathbf{E} &= -\frac{\partial \mathbf{B}}{\partial t} \\ \nabla \times \mathbf{H} &= \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t} \\ \nabla \cdot \mathbf{D} &= \rho \\ \nabla \cdot \mathbf{B} &= 0 \end{aligned}`)

These are _Maxwell's equations_ in differential form.

== Three-Line Tables

Academic-style tables using the built-in `#tableq` helper (top rule, header separator, bottom rule; no vertical strokes):

#align(center)[
  #tableq(
    (
      ([*Method*], [*Precision*], [*Recall*], [*F1 Score*]),
      ([Baseline], [0.72], [0.68], [0.70]),
      ([Proposed (Ours)], [*0.89*], [*0.85*], [*0.87*]),
      ([Oracle], [0.95], [0.93], [0.94]),
    ),
    4,
  )
]

Results show significant improvement over the baseline across all metrics.

== Standard Tables

Standard Typst tables also work. Table captions are automatically positioned at the *top*:

#figure(
  table(
    columns: 3,
    align: (left, center, center),
    table.header(
      [*Dataset*], [*Samples*], [*Classes*],
    ),
    [MNIST], [70,000], [10],
    [CIFAR-10], [60,000], [10],
    [ImageNet], [1.2M], [1,000],
  ),
  caption: [Benchmark datasets for image classification],
  kind: table,
)

// =========================================
// SECTION 4: Code and Components
// =========================================
= Code and Components

== Code Highlighting

Raw code blocks are automatically styled using `codly` with a light gray background, rounded corners, and no display name:

```python
import torch
import torch.nn as nn

class TransformerBlock(nn.Module):
    def __init__(self, d_model: int, n_heads: int):
        super().__init__()
        self.attention = nn.MultiheadAttention(d_model, n_heads)
        self.norm = nn.LayerNorm(d_model)

    def forward(self, x):
        attn_out, _ = self.attention(x, x, x)
        return self.norm(x + attn_out)
```

== Code Block Helper

The `#code` function provides an alternative styled code wrapper:

#code("
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Calculate first 10 Fibonacci numbers
result = [fibonacci(i) for i in range(10)]
print(result)
", lang: "python")

== Admonition Blocks: Guidance

Touying Quick re-exports `theorion` blocks as convenient aliases:

#tip[
  Use `heading-idx: true` (the default) to enable automatic `1.1.` heading numbering across all levels.
]

#note[
  The `info.lang` value overrides the top-level `lang` parameter. Make sure they are consistent.
]

== Admonition Blocks: Warnings

#warning[
  When using custom TOML files, all required keys must be present. Missing keys will cause runtime errors.
]

#caution[
  Verify every configured font on the compilation system before sharing the deck.
]

// =========================================
// SECTION 5: Color Themes and Backgrounds
// =========================================
= Customization

== Color Theme: Blue (Current)

This demo uses the *blue* theme. The color families map to heading levels:

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  table.header(
    [*Color Family*], [*Value*], [*Usage*],
  ),
  [Primary], [`#001aff`], [Level-1 headings, title accent],
  [Secondary], [`#3297df`], [Level-2 headings],
  [Tertiary], [`#448C95`], [Level-3 headings],
  [Neutral], [`#3297df`], [Links, references],
)

To switch to the *red* theme, change `theme: "red"` in the configuration. The red theme uses `#af4343` as primary and `#a14848` as secondary.

== Background Images

Three built-in backgrounds are available as constants:

+ `bgsky` — Sky gradient (used in this demo)
+ `bghexagon` — Hexagonal pattern
+ `bgbook` — Book-themed

Custom images can also be provided by passing a file path string to `bgimg`.

== Custom TOML Files

For full control, create your own TOML files:

```toml
# my-info.toml
[default]
author = "Jane Doe"
institution = "Stanford University"
series = "Deep Learning Seminar"
footer = "Stanford CS"
ending = "Questions?"
lang = "en"
```

== Applying Custom TOML

Load the dictionaries, then pass them through the public theme API:

```typst
#let my-info = toml("my-info.toml").default
#let my-styles = toml("my-styles.toml")

#show: touying-quick.with(
  title: "Custom Presentation",
  info: my-info,
  styles: my-styles,
)
```

// =========================================
// Focus Slide
// =========================================
// Inherited from Metropolis: full-screen emphasis with
// primary color background and large centered text.
#focus-slide(config: config-page(background: none))[
  TOML-driven configuration makes academic presentations simple and reproducible.
]

// =========================================
// SECTION 6: Summary
// =========================================
= Summary

== Feature Recap: Configuration

Touying Quick provides a complete academic presentation toolkit:

+ *Unique TOML-based API* — `info`, `styles`, `names` dictionaries replace inline config calls
+ *Automatic slides* — title, outline, and ending slides generated without manual calls
+ *Two color themes* — blue and red, each with 20 color slots across 4 families
+ *Three backgrounds* — `bgsky`, `bghexagon`, `bgbook` plus custom image support

== Feature Recap: Academic Toolkit

+ *Academic typography* — chapter-relative equation numbering, three-line tables, top-positioned table captions
+ *Bundled packages* — `codly` for code, `theorion` for admonition blocks
+ *Bilingual support* — English and Chinese with extensible localization
+ *Metropolis foundation* — inherits all Metropolis features: focus slides, multi-column composers, section dividers

// =========================================
// The ending slide is generated automatically using
// info.ending text ("Thank You for Your Attention!")
// No need to add anything here — it appears after
// the last content slide.
// =========================================
