# Template Designer — Touying Theme Design Role

## Table of Contents

- [Core Mission](#core-mission)
- [Role Independence](#role-independence)
- [Visual Impact Guidance](#visual-impact-guidance-for-canvas-and-rich)
- [Output Location](#output-location)
- [Core Template Inventory](#core-template-inventory)
- [Template Design Specifications](#template-design-specifications)
- [Theme Design Patterns](#theme-design-patterns)
- [Component Design Guidelines](#component-design-guidelines)
- [Third-Party Package Integration](#third-party-package-integration)
- [Theme Conventions](#theme-conventions)
- [Common Pitfalls](#common-pitfalls-must-read)
- [Demo File Best Practices](#demo-file-best-practices)
- [Theme Quality Checklist](#theme-quality-checklist)
- [Aesthetic Identity and Visual Distinction](#aesthetic-identity--visual-distinction)
- [Inline SVG Patterns](#inline-svg-patterns-canvas--rich)
- [Visual Bug Prevention](#visual-bug-prevention-headerfooterframe)
- [Capability-Aware Complexity Guidance](#capability-aware-complexity-guidance)

## Core Mission
Generate custom Touying themes based on Design Specification.

> **Scope**: This file owns theme deliverables, public component APIs, demo obligations, and theme-specific quality gates. Use `shared-standards.md` for general Typst/Touying rules and `design-guide.md` for aesthetic direction.

> **One-shot reference**: Before writing a new theme from scratch, study the complete working examples in `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-rich/` and `custom-canvas/`. Each theme's `template.typ` demonstrates all patterns described below — slide wrapper functions, component definitions, palette usage, header implementations, and `config-common` setup. Start with `custom-rich/psychology/template.typ` (warm healing style with rich components) or `custom-rich/smart-red/template.typ` (bold modern business). For Canvas-level themes, study `custom-canvas/guizang-magazine/template.typ` (editorial two-tone with dark/light pages) or `custom-canvas/sugar-rush/template.typ` (Memphis/pop art with full-bleed imagery).
>
> **Quality reference (MUST STUDY for stunning themes)**: `custom-rich/chalkboard/template.typ` and `custom-canvas/celestial/template.typ` are the gold standard for visual impact. Study how they implement persistent background atmosphere on content slides, structurally diverse components, complex multi-element SVGs, and bookending between title/ending slides. Your theme must match or exceed their level of visual personality. See **§Visual Impact Guidance** below.

## Role Independence
This is a standalone role, triggered only through the `${SKILL_DIR}/references/seaslides/workflows/create-template.md` workflow.

---

## Visual Impact Guidance for Canvas and Rich

> These guidelines address the gap between a technically correct theme and a
> coherent visual system. Canvas themes normally need a stronger visual world;
> Rich themes may rely more on typography, color, and composition. Judge the
> rendered result rather than satisfying decorative or component counts.

### A. The "World-Building" Principle

A theme does NOT decorate a template — it creates a **WORLD** the viewer inhabits for the duration of the presentation.

- **Every design decision must serve the world.** If you are building a "film noir" theme, ask: "Would this element exist in a 1940s detective's office?" If yes, include it. If not, redesign it.
- **Carry the atmosphere as far as the concept needs.** A restrained content slide
  may express the world through typography, color, rhythm, or whitespace; do not
  add ornaments solely to prove that decoration is present.
- **The "Visual Signature Test"**: Remove all text from a content slide. Can you still identify which theme this is? If not, the content slide needs more visual identity.

### B. Persistent Background Atmosphere

Content slides should remain recognizably part of the same world. Use a background
motif, ornament, framing rhythm, or typographic treatment only when it reinforces
the metaphor and leaves the content legible. A deliberate quiet slide is valid;
generic visual drift is not.

**Reference implementations:**
- Chalkboard: `ruled-lines-bg()` draws faint dashed lines across every slide + `chalk-dust()` in corners
- Celestial: `celestial-grid` SVG background + corner `star-point()` on every content slide

**Implementation pattern:**
```typst
// Define a background atmosphere function
#let _bg-atmosphere(pal) = {
  // Full-page texture: place() takes it out of flow — safe to use width/height: 100%
  place(top + left,
    image(bytes(your-texture-svg), width: 100%, height: 100%))
  // Small decorative elements in corners
  place(top + right, dx: -1.5em, dy: 0.5em,
    your-small-ornament(color: pal.accent-muted, size: 4pt))
  place(bottom + left, dx: 1.5em, dy: -0.8em,
    your-small-ornament(color: pal.accent-muted, size: 3pt))
}

// Call it inside the slide's setting() function:
let setting(body) = {
  _bg-atmosphere(pal)
  body
}
```

> **Note on `height: 100%`**: Using `width: 100%` / `height: 100%` is safe ONLY inside `place()` (out-of-flow). Never use `height: 100%` in flow containers (grid cells, block children) — it expands to page height and pushes siblings off-screen. Use `lazy-v(1fr)` instead for height-filling in `cols`.

**Anti-pattern**: Content slides lose the established identity and revert to an
unrelated generic header-and-card system.

### C. SVG Fitness Standards

| Decision | Pass condition | Failure signal |
|---|---|---|
| Use an SVG | It communicates a theme-specific motif, texture, frame, diagram, or ornament better than native Typst shapes | It exists only to satisfy a quota |
| Choose complexity | The geometry is sufficient for a clear silhouette and the intended depth at its actual display size | Extra paths add noise, or sparse geometry reads as an accidental placeholder |
| Choose scale | Full-page, component-scale, or inline placement follows the compositional role | A full-page asset is forced into a theme that benefits from restraint |
| Choose opacity | Layering stays visible without competing with content | The asset disappears in the final render or damages contrast |

SVGs are optional when native Typst primitives, typography, and whitespace express
the concept more clearly. When an SVG is used, inspect it at its real rendered size;
source-code complexity is not evidence of visual quality.

### D. Component Structural Diversity

Choose a component structure from the information relationship it must express.
Comparable peers may deliberately repeat one pattern; quotes, metrics, sequences,
warnings, and annotations should not all become the same bordered card merely for
implementation convenience.

Useful structures include SVG-supported motifs, out-of-flow overlays, borderless
typographic regions, semantic dividers, and inline tags. They are a vocabulary, not
a checklist. If components with materially different content relationships all
reduce to the same `block(fill: ..., stroke: ...)` skeleton, redesign the repeated
ones that obscure those differences.

### E. Slide Type Personality

Give each slide type the degree of personality its narrative role needs; avoid
making every type the same layout with only a text-size change:

| Slide Type | Visual Approach | Key Differentiator |
|---|---|---|
| **Title** | Establishes the visual world | Uses the strongest appropriate expression of the theme, whether decorative or restrained |
| **Section** | Creates a clear transition | Uses scale, rhythm, color, or a focal motif to mark a new act |
| **Content** | Maintains the system while serving information | Keeps the theme recognizable without competing with the body |
| **Focus** | Emphasizes one idea | Changes composition or intensity only as much as the message needs |
| **Ending** | Resolves the visual narrative | May bookend the title or continue the system consistently |

**Bookending guidance**: When the presentation concept benefits from a clear
opening and closing, let title and ending slides share a visual element that is
distinct from ordinary content slides. Do not force this device when a continuous,
uniform system is more appropriate.

- Chalkboard: title + ending both have `wood-frame()` + `chalk-dust()` in corners. Content slides have neither.
- Celestial: title + ending both have `constellation-pattern()` + gold frame rect + `star-marker()` at corners. Content slides have only the subtle grid + tiny star-points.

### F. Memorability and Fitness Review

After completing the theme, apply this self-evaluation:

1. Can the theme's visual logic be described in one sentence?
2. Do its distinctive details improve recognition, hierarchy, or comprehension?
3. Does the rendered deck feel intentional beside a professional presentation,
   without relying on decorative filler?

A surprising visual moment can be valuable, but it is not a mandatory quota. A
quiet, precise theme can be equally successful when restraint is part of its idea.

---

## Output Location
`${TYLINA_SKILLS_ROOT}/_shared/slides/themes/<template_name>/`

---

## Core Template Inventory

| # | File | Purpose | Description |
|---|------|---------|-------------|
| 01 | `template.typ` | Complete Theme | Contains all slide functions, components, color palette, and theme entry point |
| 02 | `demo.typ` | Usage Example | Compilable demo showcasing all slide types and components |
| 03 | `theme_design_spec.md` | Visual Design Spec | Defines colors, typography, layout parameters, component designs (from `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_design_spec_reference.md`) |
| 04 | `theme.md` | API Summary | Concise theme reference for downstream roles (from `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_reference.md`) |

---

## Template Design Specifications

### 1. Must Generate theme_design_spec.md and theme.md

Every theme must include:

**`theme_design_spec.md`** — Visual design document (use `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_design_spec_reference.md` as template):
- Color palette, typography settings, layout parameters, component definitions, slide type visual descriptions

**`theme.md`** — API summary document (use `${TYLINA_SKILLS_ROOT}/_shared/slides/theme_reference.md` as template):
- Quick start code, theme parameters table, available slide types, reusable components, color scheme mapping

### 2. Inherit Design Specification

The theme must inherit and implement all parameters specified in the Strategist's Design Specification:
- Page format (16:9 or 4:3)
- Color scheme (industry-specific or custom)
- Typography plan (font family + base size)
- Style objective (general / consulting / MBB-consulting / academic)
- Complexity level (plain / rich / canvas)
- Third-party package selection

### 3. Template-Content Separation Principles

> Full TCS specification: see `shared-standards.md` §1.

| Principle | Description |
|-----------|-------------|
| No Content in Template | template.typ contains zero content text |
| Concise Markup in main.typ | Standard markup: `== Title`, `*bold*`, `- list` |
| Component Encapsulation | Complex layouts → reusable component functions |
| Dynamic Heading Display | Use `utils.display-current-heading()` for titles |

### 4. Touying 0.7.4 Theme Structure (MANDATORY)

> **Reference**: See `docs/touying/tutorials/build-your-own-theme.md` for the complete bamboo theme tutorial.

Touying 0.7.4 uses a **config-based** architecture. Themes are built with `touying-slides.with()` and a set of `config-*()` functions. **Do NOT use the old `register()`/`states.default()` API — it is deprecated.**

#### 4a. Theme Entry Point Function

The theme entry point is a function that wraps `touying-slides.with()`:

```typst
#import "@preview/touying:0.7.4": *

#let my-theme(
  aspect-ratio: "16-9",
  align: horizon,      // Default vertical centering (like metropolis)
  footer: none,
  ..args,
  body,
) = {
  // Only set size, NOT font — fonts belong in demo.typ / main.typ
  set text(size: 20pt)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 4em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,                         // default content slide
      new-section-slide-fn: new-section-slide,  // auto-triggered on `= Heading`
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.primary,
      primary-dark: palette.primary-dark,
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: palette.text-dark,
    ),
    config-store(
      title: none,
      align: align,      // Store the alignment setting
      footer: footer,
    ),
    ..args,
  )

  body
}
```

**Key parameters**:
- `align: horizon` — Vertically centers slide content by default (prevents top-heavy layouts)
- Content in main.typ should use `config-common(breakable: false)` to prevent overflow

**Key config functions**:

| Function | Purpose | Example |
|----------|---------|---------|
| `config-page()` | Page size, margins, header/footer | `config-page(paper: "presentation-16-9", margin: (...))` |
| `config-common()` | Slide function bindings | `config-common(slide-fn: slide, new-section-slide-fn: ...)` |
| `config-colors()` | Color palette | `config-colors(primary: rgb("#..."), neutral-lightest: ...)` |
| `config-store()` | Custom state variables | `config-store(title: none, footer: footer)` |
| `config-methods()` | Utility methods | `config-methods(alert: utils.alert-with-primary-color)` |
| `config-info()` | Presentation metadata | `config-info(title: [...], author: [...], date: ...)` |

#### 4b. Content Slide Function (slide)

Every theme must define a `slide` function registered via `config-common(slide-fn: slide)`. This is the default slide type triggered by `== Heading`:

```typst
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align    // Per-slide alignment override
  }
  let header(self) = {
    set std.align(top)           // Use std.align to avoid shadowing
    show: components.cell.with(fill: self.colors.primary, inset: 1em)
    set std.align(horizon)
    set text(fill: self.colors.neutral-lightest, size: .7em)
    utils.display-current-heading(level: 1)   // section title
    linebreak()
    set text(size: 1.5em)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)  // slide title
    }
  }
  let footer(self) = {
    set std.align(bottom)
    show: pad.with(.4em)
    set text(fill: self.colors.neutral-darkest, size: .8em)
    utils.call-or-display(self, self.store.footer)
    h(1fr)
    context { utils.slide-counter.display() + " / " + utils.last-slide-number }
  }
  let setting(body) = {
    show: std.align.with(self.store.align)   // Apply stored alignment
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer),
  )
  touying-slide(self: self, setting: setting, ..args)
})
```

**Critical patterns**:
- `touying-slide-wrapper(self => { ... })` — wraps slide logic, provides `self`
- `self.colors.primary` — access color palette
- `self.store.title` — access custom state
- `utils.display-current-heading(level: N)` — display heading from content
- `utils.call-or-display(self, value)` — handle both content and `self => content` functions
- `std.align` — use instead of `align` when the parameter name shadows the built-in

> **Working examples**: See `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-rich/psychology/template.typ` for a warm component-rich slide function with header/footer, and `custom-rich/smart-red/template.typ` for a bold modern business implementation.

#### 4c. Special Slide Functions

All special slides use `touying-slide-wrapper(self => { ... })`. Key patterns:

```typst
// Title slide — reads from self.info
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    set align(center + horizon)
    block(fill: self.colors.primary, width: 80%, inset: (y: 1em), radius: 1em,
      text(size: 2em, fill: self.colors.neutral-lightest, weight: "bold", info.title))
    if info.author != none { block(info.author) }
    if info.date != none { block(utils.display-info-date(self)) }
  }
  touying-slide(self: self, body)
})

// Section slide — auto-triggered on `= First-Level Heading`
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    set text(size: 2em, fill: self.colors.primary, weight: "bold", style: "italic")
    utils.display-current-heading(level: 1)
  }
  touying-slide(self: self, main-body)
})

// Focus/Ending slides — full-color background, centered text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(fill: self.colors.primary, margin: 2em))
  set text(fill: self.colors.neutral-lightest, size: 2em)
  touying-slide(self: self, align(horizon + center, body))
})
#let ending-slide = focus-slide  // Same pattern; customize styling as needed
```

> **Canvas cover warning**: `title-slide()` generates its own page from `self.info` data and does NOT accept body content. Content placed after `#title-slide()` ends up on the next auto-generated slide. For Canvas-level cover slides with custom overlays (geometric patterns, scrim gradients, etc.), use `#slide(config: config-page(background: ..., margin: 0pt, header: none, footer: none))[]` instead.

#### 4d. Canvas Slide Functions

> **Working examples**: See `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-canvas/guizang-magazine/template.typ` and `custom-canvas/sugar-rush/template.typ` for complete dark-slide, hero-slide, and place()-heavy implementations in production themes.

Canvas-level themes benefit from specialized slide functions for dark pages and hero images. These are the two most common Canvas slide types:

**Dark Slide** (ink background + ghost text + auto-inverted chrome):

```typst
#let dark-slide(title: none, ghost: none, ghost-size: 180pt, ghost-dy: -40pt, ghost-dx: 0pt, header-left: none, header-right: none, ..args, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  let header(self) = {
    set std.align(top)
    show: pad.with(x: 2em, top: 1.2em)
    set text(size: 8pt, fill: pal.paper.transparentize(50%))
    grid(columns: (1fr, 1fr),
      if header-left != none { std.align(left, header-left) },
      if header-right != none { std.align(right, header-right) },
    )
  }
  self = utils.merge-dicts(self, config-page(
    fill: pal.ink, header: header, footer: none,
    margin: (x: 2.5em, top: 3em, bottom: 1.5em),
  ))
  let main-body = {
    set text(fill: pal.paper)
    if ghost != none {
      place(top + right, dx: ghost-dx, dy: ghost-dy,
        text(size: ghost-size, weight: "bold", fill: pal.paper.transparentize(94%), ghost))
    }
    body
  }
  touying-slide(self: self, main-body, ..args)
})
```

**Hero Slide** (full-bleed image + scrim + floating text):

```typst
#let hero-slide(background-image: none, scrim: true, ..args, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(self, config-page(
    header: none, footer: none, margin: 0pt,
  ))
  let main-body = {
    if background-image != none {
      place(top + left, image(background-image, width: 100%, height: 100%, fit: "cover"))
    }
    if scrim {
      place(bottom + left, block(width: 100%, height: 50%,
        fill: gradient.linear(pal.ink.transparentize(100%), pal.ink.transparentize(30%), angle: 180deg)))
    }
    body  // Caller uses place() to position text overlays
  }
  touying-slide(self: self, main-body, ..args)
})
```

#### 4e. Usage in main.typ

```typst
#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: my-theme.with(
  aspect-ratio: "16-9", footer: [My Company],
  config-info(title: [Title], author: [Author], date: datetime.today()),
)
#title-slide()

= Section Title       // triggers new-section-slide
== Slide Title         // triggers slide
- Content
#focus-slide[Key Takeaway]
#ending-slide[Thank You!]
```

### 5. Font Size Hierarchy

> See `shared-standards.md` §3 for the canonical size table.

---

## Theme Design Patterns

All patterns below use the correct Touying 0.7.4 `touying-slide-wrapper` API.

### Pattern 1: Minimalist Theme (Top Consulting) — Canonical Example

Clean, professional, data-focused. Header has a thin accent line under the slide title. Based on mckinsey/anthropic themes.

```typst
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto { self.store.title = title }
  if align != auto { self.store.align = align }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(size: 1.4em, weight: "bold", fill: self.colors.neutral-darkest)
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 60pt, stroke: 2pt + self.colors.primary),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: self.colors.neutral-darkest.lighten(40%), size: .7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none { utils.call-or-display(self, self.store.footer) },
      { box(circle(radius: 2.5pt, fill: self.colors.primary)) },
      {
        set std.align(right)
        context text(size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = { show: std.align.with(self.store.align); body }
  self = utils.merge-dicts(self, config-page(header: header, footer: footer))
  touying-slide(self: self, setting: setting, ..args)
})
```

### Pattern Variations (Differences from Pattern 1)

Patterns 2 and 3 share the same `slide` function structure — only the **header** and **footer center element** differ. All other code (title handling, setting, merge-dicts) is identical to Pattern 1.

| Element | Pattern 1: Minimalist | Pattern 2: Creative (General Versatile) | Pattern 3: Data-Driven (General Consulting) |
|---------|----------------------|----------------------------------------|---------------------------------------------|
| **Top bar** | None | `block(width: 100%, height: 6pt, fill: self.colors.primary)` | `block(width: 100%, height: 4pt, fill: self.colors.primary)` |
| **Title size** | `1.4em` | `1.5em` | `1.4em` |
| **Accent underline** | `line(length: 60pt, stroke: 2pt + self.colors.primary)` | `block(width: 80pt, height: 3pt, fill: self.colors.primary, radius: 1.5pt)` | Two-segment: `block(width: 60pt, ...)` + `block(width: 25pt, ..., fill: primary.lighten(40%))` via `stack(dir: ltr)` |
| **Header inset-top** | `0.8em` | `0.3em` (less padding below top bar) | `0.4em` |
| **Footer center** | Single `circle(radius: 2.5pt)` | `circle(radius: 3pt)` | Two circles: `circle(radius: 3pt)` + `circle(radius: 3pt, fill: primary.lighten(40%))` via `stack(dir: ltr)` |

---

## Component Design Guidelines

Components are reusable functions defined in `template.typ` and called from `main.typ`. They encapsulate complex layouts so that `main.typ` stays clean and content-focused.

### Reusable Component Functions

```typst
// Callout Box (with accent parameter for color variants)
#let callout-box(title, body, accent: palette.primary) = {
  block(
    width: 100%, fill: accent.lighten(90%),
    stroke: (left: 3pt + accent), inset: 12pt, radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      text(weight: "bold", fill: accent, title),
      [#body
       #lazy-v(1fr)],  // Equalize height in eligible lazy cols layouts
    )
  ]
}
#let info-card = callout-box
#let warning-box(title, body) = callout-box(title, body, accent: palette.accent)

// KPI / Stat Card — MUST use stack(spacing:) for value+label sequences
#let stat-card(value, label, accent: palette.primary) = {
  block(fill: accent.lighten(85%), stroke: 0.5pt + accent.lighten(40%),
    inset: 12pt, radius: 6pt, width: 100%,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: 1.8em, weight: "bold", fill: accent, value),
      text(size: 0.78em, fill: palette.text-body, label),
      lazy-v(1fr),
    )
  ]
}

// Takeaway Box (for consulting themes)
#let takeaway-box(body) = {
  block(width: 100%, fill: palette.primary, inset: 12pt, radius: 5pt)[
    #set text(size: 0.9em, weight: "bold", fill: white); #body
  ]
}
```

> **CRITICAL**: For stat/KPI/metric cards that stack icon → value → label vertically, **always use one centered `stack(spacing: .8em, ...)` or larger**. Do NOT use `#v(...)` between elements, and do not substitute an undersized `.3em`/`.4em` stack — both produce cramped, drifting visual groups. This is the #1 source of manual fixes in generated themes.

```typst
// ❌ WRONG — v() causes spacing drift in stat cards
block(inset: 12pt)[
  #set std.align(center)
  #icon-element
  #v(4pt)
  #text(size: 1.8em, weight: "bold", fill: accent, value)
  #v(4pt)
  #text(size: 0.78em, fill: palette.text-body, label)
  #lazy-v(1fr)
]

// ✅ CORRECT — stack() gives precise, predictable spacing
block(inset: 12pt)[
  #set std.align(center)
  #stack(
    spacing: .8em,
    icon-element,
    text(size: 1.8em, weight: "bold", fill: accent, value),
    text(size: 0.78em, fill: palette.text-body, label),
    lazy-v(1fr),
  )
]
```

### Opaque Fills Required for Card-Type Components

Every component that displays text over a background with decorative SVG elements MUST have an opaque `fill` on its outer block. This is critical for themes with persistent background atmosphere (see §Visual Impact Guidance §B):

```typst
// ❌ WRONG: No fill — text may be unreadable over background SVG decorations
block(width: 100%, inset: 12pt, radius: 4pt, stroke: 1pt + accent)[content]

// ✅ RIGHT: Opaque fill ensures readability regardless of background
block(width: 100%, inset: 12pt, radius: 4pt, fill: palette.bg, stroke: 1pt + accent)[content]
```

This applies to: info-cards, stat-boxes, quote-blocks, highlight-boxes, and any component used on content slides that have persistent background atmosphere. Without an opaque fill, decorative SVGs (constellation grids, chalk dust, geometric patterns) will bleed through and make text unreadable.

### Table Components — Keep Bare

Custom table components (comparison-table, datasheet-table, etc.) should return a bare `table()` with a `fill` callback for row styling. Three anti-patterns to avoid:

1. **Outer `block()` wrapper** — interferes with Touying's slide-splitting logic, creates double-border artifacts
2. **`table.cell()` enumerate pattern** — building cells one-by-one with `rows.enumerate().map(((i, row)) => table.cell(fill: ...))` is verbose and fragile; use a `fill` callback instead
3. **`block()` + `grid()` manual table** — reimplements table layout from scratch; use native `table()` which handles strokes, alignment, and page breaks correctly

```typst
// ❌ WRONG — outer block wrapper
#let my-table(headers, rows) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 3pt, clip: true)[
    #table(columns: headers.len(), ..headers, ..rows.flatten())
  ]
}

// ❌ WRONG — table.cell() enumerate pattern (verbose, fragile)
#let my-table(headers, rows) = {
  let header-cells = headers.map(h => table.cell(fill: palette.primary)[...])
  let body-cells = rows.enumerate().map(((i, row)) => {
    row.map(cell => table.cell(fill: if calc.rem(i, 2) == 0 { ... } else { ... })[...])
  }).flatten()
  table(columns: headers.len(), ..header-cells, ..body-cells)
}

// ❌ WRONG — block() + grid() manual table
#let my-table(headers, ..rows) = {
  block(width: 100%, stroke: ...)[
    #block(fill: ..., inset: ...)[#grid(columns: ..., ..headers)]
    #for row in rows.pos() { block(inset: ...)[#grid(columns: ..., ..row)] }
  ]
}

// ✅ CORRECT — bare table with fill callback, table.header(), and align parameter
#let my-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary.lighten(85%) }
      else if calc.odd(row) { palette.bg } else { palette.card },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.6em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", h))),
    ..rows.flatten(),
  )
}
```

Use `table.header()` to wrap the header row — it improves accessibility and enables header repetition on page breaks. The `fill` callback handles both header and body styling in one place: `row == 0` targets the header, `calc.odd(row)` alternates body rows. Expose `align` as a function parameter (default `center + horizon`) and pass it through to the inner `table()` call so callers can override alignment per use.

### Inline `circle()` Requires `box()` Wrapper

Bare `circle()` in inline/horizontal contexts (e.g., traffic-light dots, bullet markers in `stack(dir: ltr)`) breaks layout. Always wrap in `box()`:

```typst
// ❌ WRONG — bare circle() causes layout issues
stack(dir: ltr, spacing: 6pt,
  circle(radius: 4pt, fill: red),
  circle(radius: 4pt, fill: yellow),
  circle(radius: 4pt, fill: green),
)

// ✅ CORRECT — box() makes circles behave as inline elements
stack(dir: ltr, spacing: 6pt,
  box(circle(radius: 4pt, fill: red)),
  box(circle(radius: 4pt, fill: yellow)),
  box(circle(radius: 4pt, fill: green)),
)
```

### Layout Components

> See `shared-standards.md` §2 for multi-column approaches, `lazy-v`, `stack()`, and footer layout rules.

---

## Third-Party Package Integration

> See `shared-standards.md` §5 for all package versions and import patterns. Always use the exact versions listed there to ensure compatibility.

---

## Theme Conventions

These conventions keep themes consistent and maintainable across the template library.

### Convention 1: Palette Dictionary for Colors

> **Working examples**: See `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-canvas/guizang-magazine/template.typ` for the two-tone `build-palette` pattern, and `custom-rich/psychology/template.typ` for a standard multi-color palette dictionary.

Define all colors in a single `palette` dictionary at the top of template.typ. Do NOT use prefixed variables like `my-primary`.

```typst
#let palette = (
  primary: rgb("#2E5C8A"), accent: rgb("#ED8936"),
  text-dark: rgb("#2D3748"), text-body: rgb("#4A5568"),
  bg: rgb("#F7FAFC"), card: rgb("#FFFFFF"), border: rgb("#E2E8F0"),
)
```

### Pattern: Two-Tone Derivation Palette

The most elegant palette pattern derives all colors from just `ink` and `paper`:

```typst
#let build-palette(ink, paper) = (
  ink: ink,
  paper: paper,
  ink-light: ink.transparentize(40%),      // Secondary text
  ink-faint: ink.transparentize(80%),      // Borders, rules
  ink-ghost: ink.transparentize(94%),      // Ghost decorations
  ink-muted: ink.transparentize(60%),      // Metadata text
  rule-color: ink.transparentize(70%),     // Hairline rules
  meta-color: ink.transparentize(50%),     // Chrome/footer text
)
```

This guarantees palette coherence — every color is harmonious because they share the same hue, differing only in opacity. Used by guizang-magazine and guizang-swiss.

### Convention 2: No Fonts in template.typ

Only set `size:` in theme entry, NOT `font:`. Fonts are set in `demo.typ`/`main.typ` after `#show: theme.with(...)`. Exception: monospace inside code-block components.

### Convention 3: Deduplicate Box Components

One base function + aliases: `#let callout-box(title, body, accent: palette.primary) = { ... }` then `#let insight-box = callout-box` and `#let warning-box(t, b) = callout-box(t, b, accent: palette.red)`.

### Convention 4: Section Numbering in new-section-slide

To display section numbers separately: `set heading(numbering: (..args) => none)` in theme entry, then use `utils.display-current-heading-number(level: 1, numbering: "01")` for the number and `utils.display-current-heading(level: 1, numbered: false)` for text. If you don't need separated numbers, just use `utils.display-current-heading(level: 1)`.

### Convention 5: List Styling via `set list` / `set enum` — No Custom List Components

Do NOT create custom list components (e.g., `numbered-list`, `step-list`, `branded-list`) that take an array of items and render them in a loop. Instead, use `set list(marker: ...)` for unordered lists and `set enum(numbering: ...)` for ordered/numbered lists — this lets users write standard Typst `- item` / `+ item` syntax.

**Unordered lists** (`- item` syntax):

```typst
// ❌ WRONG — custom component forces non-standard syntax
#let atrium-list(..items) = {
  for item in items.pos() {
    grid(columns: (auto, 1fr),
      circle(radius: 3.5pt, fill: palette.primary),
      item)
  }
}
// Usage: #atrium-list([Item A], [Item B])  ← non-standard

// ✅ CORRECT — set list in theme entry for global effect
#set list(marker: box(baseline: .6em, circle(radius: .25em, fill: palette.primary.transparentize(20%))))
// Usage: - Item A  ← standard syntax

// ✅ Also OK — scoped via component for local effect
#let warm-list(body) = {
  set list(marker: box(baseline: .6em, circle(radius: .25em, fill: palette.primary)))
  body
}
// Usage: #warm-list[- Item A \n - Item B]  ← still standard list syntax inside
```

**Ordered/numbered lists** (`+ item` syntax):

```typst
// ❌ WRONG — custom numbered-list component
#let numbered-list(items) = {
  for (i, item) in items.enumerate() {
    grid(columns: (36pt, 1fr),
      text(size: 22pt, weight: "bold", fill: palette.accent)[#{i + 1}],
      item)
  }
}
// Usage: #numbered-list(([Item A], [Item B]))  ← non-standard

// ✅ CORRECT — set enum for styled numbering
#set enum(numbering: n => text(size: 22pt, weight: "bold", fill: palette.accent)[#n.])
// Usage:
// + Item A
// + Item B
// ← standard Typst enum syntax

// ✅ Also OK — custom numbering function with styled badges
#set enum(numbering: n => box(
  width: 26pt, height: 26pt, radius: 13pt, fill: palette.primary,
  align(center + horizon, text(fill: white, weight: "bold", size: 0.8em, str(n)))
))
// ← renders numbered circles, still uses + syntax

// ✅ Scoped via component for local effect
#let fancy-enum(body) = {
  set enum(numbering: n => text(fill: palette.accent, weight: "bold")[#n.])
  body
}
// Usage: #fancy-enum[+ Step one \n + Step two]
```

**`enum` key parameters** (use in `set enum(...)` or `enum(...)` directly):

| Parameter | Type | Description |
|-----------|------|-------------|
| `numbering` | `str` or `function` | Format string (`"1."`, `"a)"`, `"I."`) or function `n => content` |
| `full` | `bool` | When `true`, numbering function receives all ancestor numbers: `(..nums) => ...` |
| `start` | `int` | Starting number (default 1) |
| `indent` | `length` | Indent before marker |
| `body-indent` | `length` | Gap between marker and body |
| `spacing` | `length` | Vertical gap between items |
| `number-align` | `alignment` | Alignment of the number marker |

### Convention 6: Code Block Styling — Three Approaches

Three approaches for code block styling. **Custom `show raw` (Approach B) is the recommended default** — it's zero-dependency, adapts to any theme palette, and avoids compatibility issues. Use the others when they're a better fit.

**Approach A: Default built-in**

Don't add any custom `show raw` rules. Typst's default syntax highlighting and raw block rendering is used as-is. Best when you just need highlighted text without extra decoration or framing.

**Approach B: Custom `show raw` in theme entry function (RECOMMENDED)**

Add `show raw.where(block: true/false)` rules in the theme entry function, before `show: touying-slides.with(...)`. This gives a simple framed/boxed appearance with zero dependencies and consistent palette integration.

```typst
#let my-theme(aspect-ratio: "16-9", ..args, body) = {
  set text(size: 18pt, fill: palette.ink)

  let raw-color = palette.bg.darken(3%)  // slightly darker than slide bg
  show raw.where(block: false): body => box(
    fill: raw-color,
    inset: (x: 3pt, y: 0pt),
    outset: (x: 0pt, y: 3pt),
    radius: 2pt,
    { set par(justify: false); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: raw-color,
    outset: (x: 0pt, y: 4pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    { set par(justify: false); body },
  )

  show: touying-slides.with(...)
}
```

**Approach C: codly package**

Use `@preview/codly:1.3.0` for zebra-striped alternating row appearance, line numbers, language icons, etc. Works well when the zebra-stripe aesthetic fits the theme's visual style. The codly `#show` rule goes in demo.typ BEFORE the theme show rule:

```typst
// In demo.typ
#import "@preview/codly:1.3.0": *
#show: codly-init
#codly(zebra-fill: palette.bg.darken(2%), display-icon: false)
#show: my-theme.with(...)
```

See `${TYLINA_SKILLS_ROOT}/_shared/packages/codly/README.md` for full API.

**Do NOT use zebraw** — it causes compilation failures.

**Tips for custom `show raw` (Approach B)**:
- **Light themes**: Use `palette.bg.darken(3%)` or a similar slightly-darker shade. Default `auto` syntax highlighting works well.
- **Dark themes**: Use a card/elevated background color (e.g., `palette.card-bg`). The theme's light `text(fill:)` ensures code is readable.

**Understanding `set raw(theme: ...)`**: Only affects syntax token colors, NOT foreground/background of the raw block. Options:
- `auto` (default): Typst's built-in highlighting. Works well on light backgrounds.
- `none`: Disables syntax highlighting entirely. **Avoid** — loses color information.
- A `.tmTheme` file path: Custom highlighting. **Avoid** — do not bundle custom tmTheme files in theme directories.

### Convention 7: Footer Layout

Use `grid(columns: (1fr, auto, 1fr))`, NOT `h(1fr)`. See `shared-standards.md` §2.

### Convention 8: TOC Slide Naming

Name the TOC/outline slide function `outline-slide`, NOT `toc-slide`.

### Convention 9: Checklists with cheq — No Custom Checklist Components

Do NOT create custom checklist components (e.g., `field-checklist`, `todo-list`). Use `@preview/cheq:0.4.0` with native `- [x]` / `- [ ]` syntax:

```typst
// In demo.typ / main.typ — show rule BEFORE theme show rule
#import "@preview/cheq:0.4.0": checklist
#show: checklist.with(stroke: palette.accent, radius: 0.2em)
#show: my-theme.with(...)

// Usage — standard Typst checklist syntax
- [x] Completed item
- [ ] Pending item
```

Same principle as Convention 5: use standard syntax, not custom wrappers.

---

## Common Pitfalls (MUST READ)

| # | Pitfall | Rule |
|---|---------|------|
| 0 | Layout & Overflow | See `shared-standards.md` §4: `grid()` vs `cols()`, exactly one direct component per lazy column, inert `lazy-v` markers when lazy layout is off, `breakable: false` |
| 1 | Spacing | At caller level, compose complete components directly in natural flow; do not add a fixed `v()` or a wrapper `stack()` merely for routine separation. Headers and stat/KPI groups use `stack(spacing: .8em)` or larger; other ordinary content groups start near `.8em` and are tuned in the render. Smaller positive spacing is valid for tiny labels, dimension marks, badges, and tightly coupled primitives, so the checker does not impose a global positive minimum; zero-gap stacks remain advisory and negative gaps require overlap review. Horizontal stacks are separate. Footer: `grid(columns: (1fr, auto, 1fr))` not `h(1fr)` |
| 2 | `std.align` vs `align` | When slide function has `align` parameter, use `std.align(top)` for built-in — the parameter shadows it |
| 3 | Markup escaping | `_`, `*`, `#`, `@`, `$`, `` ` `` in `[...]` brackets must be escaped with `\`. See `shared-standards.md` §7 |
| 4 | Forward references | Typst evaluates `#let` bindings sequentially — define functions BEFORE referencing them. See below. |
| 5 | Redefining `lazy-v` | `lazy-v` is already exported by Touying 0.7.4 — never define your own version. See below. |
| 6 | Manual box shadows | Use `@preview/shadowed:0.3.0` — never fake shadows with `place()` hacks. See below. |
| 7 | Card components without fill | All card-type components MUST have opaque `fill` when used over background atmosphere. See §Component Design Guidelines. |
| 8 | Empty `[]` column | `#cols[][content][content]` creates an unintended empty column — use `#cols[content][content]` for two columns |
| 9 | Bare `circle()` inline | `circle()` in horizontal `stack(dir: ltr)` or grid breaks layout. Wrap in `box()`: `box(circle(radius: 3pt, fill: color))` |
| 10 | Table anti-patterns | Custom table components must return a bare `table()` with a `fill` callback. Avoid: outer `block()` wrapper, `table.cell()` enumerate pattern, `block()+grid()` manual tables. Use `table.header()` for the header row. |
| 11 | SVG raw syntax/comments | Start SVG raw text on a new line. Valid XML comments compile; a comment body containing an internal `--` is invalid and must be rewritten or removed. |
| 12 | `---` in content text | `---` creates a Touying slide break! Use the literal Unicode em dash `—` when an em dash is intended. |
| 13 | `outline()` in outline-slide | Use standard Typst `outline(title: none, depth: 1)`. Do NOT use non-existent `components.custom-progressive-outline()`. |

### Shadow & Elevation — Use `@preview/shadowed:0.3.0`

For box shadows, use the `shadowed` package. See `shared-standards.md` for full API reference.

```typst
#import "@preview/shadowed:0.3.0": shadow
shadow(dx: 3pt, dy: 3pt, blur: 6pt, fill: rgb(0, 0, 0, 12%), radius: 4pt)[
  #block(fill: white, radius: 4pt, inset: 12pt)[content]
]
```

### Forward References (Define Before Use)

Typst evaluates `#let` bindings sequentially. A function must be defined BEFORE it is referenced. This is especially relevant in `template.typ` where the theme entry function calls slide functions:

```typst
// ❌ PROBLEMATIC: Forward reference — new-section-slide used before definition
#let theme(..args, body) = {
  show: touying-slides.with(
    config-common(
      new-section-slide-fn: new-section-slide,  // May fail if defined later!
    ),
  )
  body
}

// ...later in file...
#let new-section-slide(self: none, body) = { ... }

// ✅ FIX: Define all functions BEFORE they are referenced
// Order: palette → slide functions → components → theme entry point
#let new-section-slide(self: none, body) = { ... }
#let slide(title: auto, align: auto, ..args) = { ... }
#let theme(..args, body) = { ... }  // Now all refs resolve correctly
```

---

## Demo File Best Practices

**Structure**: Theme setup (with `breakable: false`) → title-slide → outline-slide (if available) → content sections (demo each component) → focus-slide → ending-slide.

**Rules**: Use realistic content (not lorem ipsum). Choose each layout from the
content relationship and vary it when the examples genuinely differ. Demonstrate
`cols(lazy-layout: true)` only when height equalization is needed and every column
contains exactly one direct stretchable component. Keep that component's terminal
`lazy-v(1fr)` in its reusable definition; it is inert when lazy layout is off.
Keep content concise enough for the chosen composition. Wrap
tables in `#figure()`. Pass rendered demo copy through content blocks rather
than quoted strings; retain strings for paths, URLs, enum/config selectors, font
names, and parameters that deliberately use string operations. Always set
`config-common(breakable: false)`.

---

## Theme Quality Checklist

> **Common checks**: See `executors/base.md` §8 for the full shared checklist (TCS, package versions, heading syntax, cols, breakable, contrast, etc.).

**Template-designer-specific checks**:
- [ ] Theme entry point uses `touying-slides.with(config-*(...))` (NOT old `register`/`states` API)
- [ ] All slide types defined: `title-slide`, `new-section-slide`, `slide`, `focus-slide`, `ending-slide`
- [ ] `slide` function uses `touying-slide-wrapper(self => { ... })` pattern
- [ ] `slide` function has `align: auto` parameter with `setting` that applies `std.align.with(self.store.align)`
- [ ] Theme entry has `align: horizon` parameter stored in `config-store`
- [ ] Colors defined in `palette` dictionary (Convention 1)
- [ ] No `font:` in `set text()` inside theme entry (Convention 2)
- [ ] Reusable stretchable card components include terminal `#lazy-v(1fr)` for optional height equalization; fixed-height and intentionally intrinsic components document that exception
- [ ] Reusable stretchable cards retain terminal `lazy-v(1fr)`; every `cols(lazy-layout: true)` demo has exactly one direct component per column
- [ ] Duplicate box components consolidated with aliases (Convention 3)
- [ ] Rendered component arguments in `demo.typ` use content blocks; strings are reserved for string-semantic data or string operations
- [ ] Complete caller-side components use direct natural flow; no fixed `v()` or wrapper `stack()` exists solely for routine separation
- [ ] Header uses vertical `stack(spacing: .8em)` or larger, not `v()` or `.3em` (Pitfall §1)
- [ ] Footer three-part layout uses `grid`, not `h(1fr)` (Convention 7)
- [ ] All `align()` inside slide functions use `std.align()` (Pitfall §2)
- [ ] All `context` expressions use `{}` braces
- [ ] `theme_design_spec.md` and `theme.md` are complete
- [ ] Frame borders use percentage-based centering: `place(center + horizon, rect(width: 96%, height: 94%...))`
- [ ] Inline SVG decorations compile correctly and are proportioned to slide dimensions
- [ ] SVG raw strings start on a new line; any XML comments are valid and contain no internal `--`
- [ ] Stat/KPI card internals use one centered `stack(spacing: .8em)` or larger, with no `v()` between elements (Pitfall §1)
- [ ] Table components return bare `table()` with `fill` callback, `table.header()`, and `align` parameter (default `center + horizon`); no `block()` wrapper or `table.cell()` enumerate (Pitfall §10)
- [ ] Inline `circle()` calls wrapped in `box()` (Pitfall §9)
- [ ] No `---` in content text (creates a slide break — use the literal Unicode em dash `—` where an em dash is intended) (Pitfall §12)
- [ ] Focus-slide content doesn't overflow (max text width constrained with `block(width: 80%...)` or similar)
- [ ] No hardcoded absolute positions for frame/border elements (use `place(center + horizon, ...)`)

---

## Aesthetic Identity & Visual Distinction

> This section captures lessons from creating 50+ themes. The difference between a memorable theme (celestial, chalkboard, data-ink) and a forgettable one (generic blue gradients) is **strong aesthetic identity**.

### What Makes a Theme Memorable

A great theme has:
1. **A clear visual metaphor** — chalkboard = university lecture; celestial = star charts; newspaper = broadsheet. The metaphor informs every design decision.
2. **Distinctive SVG decorative elements** — inline SVG patterns that couldn't belong to any other theme. A constellation pattern is unmistakably celestial. A circuit trace is unmistakably PCB.
3. **Unique component vocabulary** — components named from the theme's world (not generic "info-card" but "chalk-card", "star-card", "ic-card"). Names reinforce identity.
4. **Color palette derived from the metaphor** — chalkboard uses chalk-white on green; celestial uses gold on deep navy; newspaper uses newsprint + dark red nameplate. Colors should feel inevitable for the subject.
5. **A coherent visual signature when the concept calls for one** — the thing
   people remember can be a motif, a compositional rule, or disciplined restraint.
   Brutalist-web's thick borders, Data-ink's sparklines, and Origami's fold-corner
   cards are examples, not quotas.

### Anti-Patterns That Kill Identity

| Problem | Example | Fix |
|---------|---------|-----|
| Generic naming | `info-card`, `highlight-box` | Theme-world naming: `mosaic-card`, `led-stat` |
| Blue-on-white default | Every business deck | Pick colors from the metaphor's world |
| Same layout for all themes | header + body + footer grid | Let the metaphor dictate structure |
| Missing visual identity | Generic rectangles and lines with no concept-specific logic | Add the smallest motif, typographic rule, or compositional device that makes the metaphor legible |
| Overdecorated | Every element competes for attention | Retain only decorations that support the metaphor, hierarchy, or comprehension |

### Complexity-Level Identity Strategy

| Level | Identity Through | Decoration Approach | Atmosphere Expectation |
|-------|-----------------|---------------------|------------------------|
| Plain | Typography + color + whitespace | Native elements only unless a motif is essential | Identity comes from disciplined type, color, and spacing |
| Rich | Components + accent colors + restrained motifs | Add only assets that clarify the concept or hierarchy | Content slides remain recognizably in the same system |
| Canvas | Composed scenes, SVG motifs, page rhythm, and presets | Complexity follows the visual metaphor and actual render | The visual world remains coherent across slide types without obscuring content |

---

## Inline SVG Patterns (Canvas & Rich)

> Inline SVG via `image(bytes())` is the most powerful technique for creating visually distinctive themes. It produces decorative elements that are resolution-independent, palette-aware, and unique to each theme.

### Basic Pattern

```typst
// Define SVG as a string, then render inline
#let _star-svg = ```<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <polygon points="50,5 61,35 95,35 68,57 79,91 50,70 21,91 32,57 5,35 39,35"
           fill="none" stroke="currentColor" stroke-width="2"/>
</svg>```.text

// Use in components
#let star-ornament(size: 20pt, color: palette.accent) = {
  image(bytes(_star-svg.replace("currentColor", color.to-hex())), width: size, height: size)
}
```

### SVG Pattern Categories for Themes

| Category | Examples | Best For |
|----------|----------|----------|
| **Geometric patterns** | Tessellations, grids, triangles, hexagons | origami, silk-road, bauhaus |
| **Organic shapes** | Blobs, waves, branches, clouds | watercolor, botanical |
| **Technical diagrams** | Circuit traces, star charts, grid lines | circuit-board, celestial, blueprint |
| **Ornamental** | Flourishes, frames, borders, stars | memoir, stained-glass, art-deco |
| **Textural** | Scan lines, paper grain, weave patterns | retro-terminal, carbon-fiber |
| **Typographic** | Decorative rules, drop-cap frames | newspaper, editorial-grid |

### SVG Design Rules

1. **Use only the geometry the motif needs.** A simple mark may need very few
   shapes; a texture may need more. Extra paths must improve the rendered result,
   and complex assets must remain practical to compile.
2. **Use `currentColor`** or palette hex values — SVGs should respect the theme's palette.
3. **Size via `image(bytes(...), width: Npt, height: Npt)`** — never rely on SVG's intrinsic size.
4. **Define SVGs as module-level `#let` bindings** — not inline in functions (avoids re-parsing).
5. **Test at every size the theme actually uses** — ensure paths scale cleanly and
   details remain legible in the compiled slide.
6. **Avoid text in SVGs** — use Typst native text positioned over the SVG instead.
7. **Vary opacity when layering needs depth**, while preserving contrast at the
   actual placement and background.
8. **Choose full-page, component-scale, or inline placement from the SVG's role.**
   Do not force a full-page asset when the theme benefits from restraint.
9. **Use valid SVG raw text and XML comments.** Put a newline between the raw
   opener and `<svg>` to avoid the raw-text future-syntax advisory. XML comments
   are allowed, but their bodies must not contain an internal `--`; rewrite or
   remove only invalid comments.

### SVG Design Rules for Recognizability

When creating decorative SVGs (especially for background atmosphere and motif patterns), follow these rules to ensure elements are actually visible and identifiable at their intended display size and opacity:

- **Use filled shapes when thin outlines disappear at the intended opacity.** Keep
  outlines when they remain legible and suit the motif.
- **Ensure clear silhouette** — the pattern should be identifiable without color. If you squint and can't tell what it is, it's too complex or too thin.
- **Prefer a few legible forms over many indistinct details** — recognizability
  matters more than path count.
- **Let primary forms carry more visual weight than secondary details** — tune fill
  and opacity in the rendered slide rather than following a fixed numeric recipe.
- **For complex motifs (dragons, flowers, mythological creatures)**: if you can't make it recognizable at slide-display size, use a simpler subject (a vase, a leaf, a cloud, a seal) instead of an unrecognizable blob.
- **Test at actual display size and opacity** — what looks good in an SVG editor
  may disappear or become noisy on a slide. Verify the final `transparentize()`
  value in the compiled PNG.

### Example: Multi-Element SVG Component

```typst
// Constellation pattern: stars connected by lines
#let _constellation-svg = ```<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 120">
  <line x1="30" y1="40" x2="80" y2="25" stroke="currentColor" stroke-width="0.5" opacity="0.6"/>
  <line x1="80" y1="25" x2="140" y2="50" stroke="currentColor" stroke-width="0.5" opacity="0.6"/>
  <line x1="140" y1="50" x2="170" y2="90" stroke="currentColor" stroke-width="0.5" opacity="0.6"/>
  <circle cx="30" cy="40" r="2.5" fill="currentColor"/>
  <circle cx="80" cy="25" r="3" fill="currentColor"/>
  <circle cx="140" cy="50" r="2" fill="currentColor"/>
  <circle cx="170" cy="90" r="2.5" fill="currentColor"/>
</svg>```.text

#let constellation(width: 160pt, color: palette.accent) = {
  image(bytes(
    _constellation-svg.replace("currentColor", color.to-hex())),
    width: width,
  )
}
```

---

## Visual Bug Prevention (Header/Footer/Frame)

> These are the most common visual bugs in generated themes. Follow these patterns to avoid them.

### 1. Header Element Spacing — Use `stack()` Always

**Problem**: Header elements (title + accent line, or kicker + title) placed with `v()` get unpredictable paragraph spacing, causing elements to appear too far apart.

**Fix**: Always use `stack(spacing: .8em)` or larger for vertical header compositions.

```typst
// ❌ BAD: v() causes unpredictable spacing
#let _header(self) = {
  let pal = self.store.palette
  show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.3em))
  text(size: 1.5em, weight: "bold", fill: pal.ink)[Title]
  v(0.3em)  // Spacing is unreliable
  block(width: 60pt, height: 3pt, fill: pal.accent)
}

// ✅ GOOD: stack() gives precise, predictable spacing
#let _header(self) = {
  let pal = self.store.palette
  show: components.cell.with(inset: (x: 2em, top: 1.2em, bottom: 0.3em))
  set std.align(horizon + left)
  stack(spacing: .8em,
    {
      set text(size: 1.5em, weight: "bold", fill: pal.ink)
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 60pt, height: 3pt, fill: pal.accent),
  )
}
```

### 1b. Header/Footer Logic — Use Code Blocks, Not Markup Blocks

**Problem**: Header/footer functions often need `if self.store.title`, `utils.call-or-display`, or `utils.display-current-heading`. If those statements are placed inside a `[...]` markup block without `#`, Typst renders the source code as visible text on slides.

**Fix**: Put conditional header/footer logic in `{...}` code blocks passed to `stack(...)`, `place(...)`, or other layout functions.

```typst
// WRONG: the `if` statement is markup text inside [...]
stack(spacing: .8em,
  [
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    }
  ],
  block(width: 60pt, height: 2pt, fill: pal.accent),
)

// RIGHT: the child is code mode; inner calls are bare
stack(spacing: .8em,
  {
    set text(size: 1.5em, weight: "bold", fill: pal.ink)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
  },
  block(width: 60pt, height: 2pt, fill: pal.accent),
)
```

Apply the same rule to footers, section labels, progress indicators, and any theme chrome that contains `let`, `set`, `if`, `for`, or `utils.*`.

### 2. Frame Borders — Percentage-Based Centering

**Problem**: Hardcoded `place(top + left, dx: 0.6em, dy: -3.2em, rect(width: 780pt, ...))` doesn't center properly across different content areas.

**Fix**: Use percentage-based placement centered in the content area.

```typst
// ❌ BAD: hardcoded absolute dimensions
place(top + left, dx: 0.6em, dy: -3.2em,
  rect(width: 780pt, height: 420pt, stroke: 3pt + pal.ink, fill: none))

// ✅ GOOD: percentage-based, always centered
place(center + horizon,
  rect(width: 96%, height: 94%, stroke: 3pt + pal.ink, radius: 0pt, fill: none))
```

### 3. Focus-Slide Overflow — Constrain Text Width

**Problem**: Large text on focus-slides overflows horizontally when text is too long.

**Fix**: Wrap focus content in a width-constrained block.

```typst
// ✅ GOOD: constrained width prevents overflow
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(self, config-page(
    fill: pal.accent, margin: 3em, header: none, footer: none,
  ))
  let main-body = {
    set text(fill: pal.bg, size: 2em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[  // ← constrains horizontal overflow
      #body
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})
```

### 4. Adjacent Blocks Gap — Use `stack(spacing: 0pt)` with `clip: true`

**Problem**: Two adjacent blocks (e.g., title-bar + content-area in a browser-frame) produce a thin gap.

**Fix**: Wrap in `stack(spacing: 0pt)` and set `clip: true` on the outer container.

```typst
// ✅ GOOD: no gap between title bar and content
block(width: 100%, stroke: 3pt + rgb("#000"), radius: 0pt, clip: true)[
  #stack(spacing: 0pt,
    block(width: 100%, fill: rgb("#000"), inset: (x: 10pt, y: 6pt))[...title bar...],
    block(width: 100%, fill: white, inset: (x: 14pt, y: 12pt))[...content...],
  )
]
```

### 5. Slide Content Margin Safety

Standard margins that prevent content clipping:

```typst
config-page(
  margin: (top: 5.5em, bottom: 1.5em, x: 2.2em),  // Standard content slide
)
// For slides with no header/footer (title, section, ending):
config-page(header: none, footer: none, margin: 0pt)  // Full control via pad()
```

### 6. `stack(spacing: 0pt)` for Adjacent Colored Blocks (Extended)

When a component has a colored header bar followed by a content area, use `stack(spacing: 0pt)` to prevent Typst's default paragraph spacing from inserting gaps:

```typst
// ✅ RIGHT: No gap between header and body
stack(spacing: 0pt,
  block(fill: accent, width: 100%, inset: (x: 12pt, y: 6pt), clip: true)[Header],
  block(fill: white, width: 100%, inset: 12pt, clip: true)[Body content],
)
```

Without `stack(spacing: 0pt)`, Typst's default paragraph spacing inserts visible gaps between the blocks. This is distinct from the frame-component pattern in §4 (which wraps in an outer `block(clip: true)`) — this pattern is for standalone stacked components that don't need an outer border.

---

## Capability-Aware Complexity Guidance

Choose complexity from task needs and demonstrated execution reliability, not from a model brand.

| Capability profile | Canvas? | Recommended |
|---|---|---|
| Correctly handles `[...]`/`{...}`, understands the selected theme API, and passes a compile probe | When bespoke composition materially helps | Rich or Canvas |
| Any uncertainty about content/code modes, theme calls, or compile reliability | No | Rich |
| User explicitly requests minimal or undecorated output | No | Plain |

**Plain themes** (`custom-plain/`): Only use when the user **explicitly** requests minimal/plain style (e.g., "朴素一些", "不要太多装饰", "简约风格") or names a specific plain theme. Never default to Plain.

### Guidance for Rich-Mode Execution

When a Canvas theme is used without bespoke Canvas composition, restrict execution to **Rich-style usage**:
- Call only the pre-built component functions from `theme.md`
- Do NOT compose with `place()`, inline `block(fill:...)`, or per-page `config-page()`
- Use `== Heading` for section slides (auto-triggered)
- Use `#cols[...] [...]` for ordinary multi-column layouts; use a theme-specific composer only when `theme.md` requires it
- This gives them the visual quality of Canvas themes (SVG decorations, dark-slide variant) while keeping the content authoring at Rich complexity
