# Golden Ratio Theme — API Reference

A Touying 0.7.4 presentation theme inspired by the golden ratio (phi = 1.618), Fibonacci sequences, and mathematical proportion. Warm cream backgrounds with gold/amber accents create an elegant, professional aesthetic suitable for executive presentations, strategy talks, and any context where clarity and sophistication matter.

## Theme Entry Function

### `golden-ratio-theme`

```typst
#show: golden-ratio-theme.with(
  aspect-ratio: "16-9",
  footer: [Your Footer Text],
  config-info(
    title: [Presentation Title],
    subtitle: [Subtitle],
    author: [Author Name],
    institution: [Organization],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `aspect-ratio` | string | `"16-9"` | Slide aspect ratio (`"16-9"` or `"4-3"`) |
| `footer` | content/none | `none` | Footer text displayed on content slides |
| `..args` | any | — | Additional Touying config arguments |

**Fonts:** The theme sets an 18pt base size but deliberately does not select a font family. Choose installed families at deck level after the theme show rule. The demo uses `("Charter", "Arial Unicode MS")` at 17pt.

---

## Color Palette

Access via `palette.<name>`:

| Name | Hex | Usage |
|------|-----|-------|
| `bg` | `#FFFDF7` | Warm white/cream page background |
| `text` | `#3D3530` | Deep warm gray for body text |
| `primary` | `#C8922A` | Warm gold/amber — primary accent |
| `primary-text` | `#966917` | Contrast-safe gold ink for text on light surfaces |
| `secondary` | `#8B6914` | Muted bronze — secondary accent |
| `highlight` | `#7A9B6D` | Soft sage green — tertiary/highlight |
| `highlight-text` | `#557348` | Contrast-safe sage ink for text on light surfaces |
| `card-bg` | `#FFFFFF` | Pure white card backgrounds |
| `cream` | `#FBF7EF` | Warm cream for subtle fills |
| `gold-light` | `#F5E6C8` | Light gold for highlighted areas |
| `bronze` | `#6B4E2A` | Deep bronze for focus slides |
| `text-muted` | `#7A6F66` | Muted text for secondary info |
| `border` | `#E8DFD2` | Warm neutral card borders |
| `primary-soft` | — | Primary at 80% transparency |

---

## Slide Functions

### `title-slide`

Full-page title slide with golden frame (bookend element), Fibonacci grid background, and golden angle decoration.

```typst
#title-slide()
```

Uses metadata from `config-info(...)`.

---

### `slide`

Standard content slide with persistent golden spiral atmosphere, phi-divider header accent, and proportional footer.

```typst
== Slide Title

Content here...
```

The low-level `slide` function retains `title:` and `align:` overrides for framework and special-case use. Prefer heading-driven slides for normal deck authoring.

---

### `new-section-slide`

Auto-generated when using `= Section Heading`. Fibonacci grid background with golden angle pattern and phi-proportional accent bar.

```typst
= Section Name
```

---

### `focus-slide`

Dark bronze background with golden spiral overlay. Used for impactful quotes or key statements.

```typst
#focus-slide[
  _"Your quote here."_
]
```

---

### `ending-slide`

Closing slide with golden frame (bookend shared with title), vitruvian icon, and phi-divider.

```typst
#ending-slide[Thank You]
```

---

## Reusable Components

### `proportion-card(title, body, accent: palette.primary)`

Content card with left gold border and dot indicator. Phi-proportioned layout.

```typst
#proportion-card([Card Title], [
  Card body content here.
], accent: palette.primary)
```

---

### `spiral-box(title, body)`

Highlighted content box with gold background, vitruvian icon accent, and left border. For key insights.

```typst
#spiral-box([Key Insight], [
  Important content with emphasis on this idea.
])
```

---

### `phi-tag(content, color: palette.primary)`

Small capsule label with golden dot indicator. Used for tagging and categorization.

```typst
#phi-tag([Category], color: palette.primary)
```

---

### `sequence-card(label, value, description, color: palette.primary)`

Centered data display card with a strict ratio-node → value → label → description stack. This keeps short and wrapped metrics aligned without paragraph-flow drift.

```typst
#sequence-card([Revenue], [$1.2B], [18% YoY growth], color: palette.primary)
```

---

### `ratio-divider(width: 80%)`

Proportional line separator with phi-ratio markers. SVG-based decorative element.

```typst
#ratio-divider(width: 60%)
```

---

### `fibonacci-stat(label, value, color: palette.primary)`

KPI display with a strict centered ratio-node → value → label stack. Use a regular `grid` for KPI matrices so wrapped Latin or CJK labels remain row-aligned.

```typst
#fibonacci-stat([Total Users], [2.4M], color: palette.primary)
```

---

### `harmonic-card(left-title, left-body, right-title, right-body)`

Balanced two-panel comparison card with phi symbol divider. For before/after or A vs B layouts.

```typst
#harmonic-card(
  [Current State], [Details...],
  [Future State], [Details...],
)
```

---

### `nautilus-grid(items)`

Spiral-inspired multi-item layout. With two or more items, the first gets phi-proportioned space (1.618fr) and the remainder stack in the smaller chamber. A one-item tuple renders a single emphasized chamber.

```typst
#nautilus-grid((
  [Primary content — gets largest space],
  [Secondary item],
  [Tertiary item],
))
```

---

### `theorem-box(title, body, accent: palette.highlight)`

Precise content box with mathematical elegance. Sage green default accent with full border.

```typst
#theorem-box([Key Theorem], [
  A precise statement or principle.
], accent: palette.highlight)
```

---

### `annotation-note(title, body)`

Insight annotation with proportion marker. Cream background with sage green left accent.

```typst
#annotation-note([Important Note], [
  Supporting detail or caveat.
])
```

---

## SVG Decorative Elements

### `golden-spiral-bg()`

Full-page golden spiral background with nested rectangles and logarithmic arcs.

### `fibonacci-grid-bg()`

Full-page Fibonacci rectangle grid with spiral arcs and corner nodes.

### `golden-frame()`

Bookend frame element with golden spiral corners. Used on title and ending slides.

### `phi-divider(width: 100%)`

Inline phi-proportion divider with golden ratio markers along the line.

### `golden-angle-decoration(size: 80pt)`

Radial pattern based on the golden angle (137.5 degrees). Decorative circles.

### `vitruvian-icon(size: 50pt)`

Circle-inscribed-in-square geometric icon inspired by Vitruvian proportions.

---

## Layout Helpers

Use Touying's built-in `cols` for semantic columns. Enable lazy layout only when each column contains exactly one flexible component and no unrelated content follows the row:

```typst
#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  proportion-card([Left], [Content...]),
  proportion-card([Right], [Content...]),
)
```

For Fibonacci-proportioned columns:

```typst
#cols(columns: (1.618fr, 1fr), gutter: 1em,
  [Larger content area],
  [Smaller content area],
)
```

Use `grid` for regular KPI/stat matrices:

```typst
#grid(columns: (1fr, 1fr, 1fr), gutter: 1em,
  fibonacci-stat([Short], [28]),
  fibonacci-stat([Longer label], [6.2 years]),
  fibonacci-stat([中文标签], [94]),
)
```

`nautilus-grid` is intentionally theme-specific rather than a generic column wrapper: its phi-width primary chamber and stacked secondary chambers encode the shell-like visual hierarchy.

---

## Design Principles

1. **Proportional spacing**: All spacing follows Fibonacci-derived values
2. **Warm neutrals**: Cream/ivory backgrounds keep energy warm without distraction
3. **Gold as guide**: Primary gold draws the eye to structure, not decoration
4. **Mathematical beauty**: SVG elements reference phi, spirals, and proportion
5. **Bookend symmetry**: Title and ending slides share the golden frame element
