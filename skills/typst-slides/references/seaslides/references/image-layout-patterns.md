# Image-Text Layout Patterns

A vocabulary registry of ways images can be placed on a slide. The point of this file is to **expand the mental list of options** so that when you reach for an image layout, you do not default to the same three patterns (left/right, top/bottom, full-bleed cover).

Every entry has a name plus a short technical hint in Typst syntax. This is a registry, not a teaching document; no use-case prescriptions or coverage requirements.

> **Numbers are local browse anchors, not a backend contract.** They help locate entries in this file, but a design spec does not need to cite them and no compiler maps them to fixed geometry. Plan by composition responsibility: **P** primary structure, useful **M** modifier layers, prepared **A** asset-dependent treatments, and intentional **C** cross-page continuity. Free-form, theme-owned composition remains valid.

## Contents

- [Image fundamentals](#image-fundamentals-typst-image-reference)
- [Two-layer composition principle](#core-principle--two-layers)
- [Container layouts](#container-layouts-where-the-image-sits)
- [Image-as-canvas overlays](#image-as-canvas--native-overlay-the-most-underused-family)
- [Multi-image and shaped compositions](#multi-image-compositions)
- [Overlay, masking, and atmosphere](#overlay--masking-treatments)
- [Special techniques](#special-techniques)
- [Composition guidance](#composition-guidance)
- [Hard constraints](#hard-constraints)
- [Screenshot framing](#screenshot-framing)
- [Generated-image chrome constraint](#hard-constraint-no-slide-chrome-in-generated-images)
- [Related documents](#related-documents)

---

## Image Fundamentals (Typst `image()` Reference)

### Basic Usage

```typst
// Simple image with width constraint
#image("assets/photo.jpg", width: 80%)

// Image with height constraint (useful in columns)
#image("assets/diagram.png", height: 100%)

// Image with both dimensions + fit mode
#image("assets/hero.jpg", width: 100%, height: 100%, fit: "cover")
```

### Key Parameters

| Parameter | Type | Default | Purpose |
|-----------|------|---------|---------|
| `source` | `str` or `bytes` | (required) | File path or raw bytes |
| `width` | `auto` / `relative` | `auto` | Horizontal size |
| `height` | `auto` / `relative` / `fraction` | `auto` | Vertical size; accepts `1fr` |
| `fit` | `str` | `"cover"` | How to fill the area |
| `alt` | `str` / `none` | `none` | Accessibility description |

### Fit Modes

| Mode | Behavior |
|------|----------|
| `"cover"` | Fill area completely, crop overflow (default — use for hero/background images) |
| `"contain"` | Fit entire image within area, may leave whitespace (use for diagrams/screenshots) |
| `"stretch"` | Distort to fill exactly (rarely appropriate) |

### Figure with Caption

```typst
#figure(
  image("assets/chart.png", width: 90%),
  caption: [Quarterly revenue growth 2024–2025],
)
```

### Image in Two-Column Slide

```typst
#slide(composer: (1fr, 1fr))[
  #image("assets/product.jpg", height: 100%, fit: "cover")
][
  === Product Overview
  Key features and benefits...
]
```

### Rounded Corners (clip + radius)

```typst
// Block with radius and clip: true crops the image to rounded shape
#block(radius: 12pt, clip: true)[
  #image("assets/portrait.jpg", width: 200pt)
]
```

### Drop Shadow Simulation

```typst
// Simulate shadow with offset dark rect behind
#let shadowed-image(path, width: 100%) = {
  let shadow = rect(width: width, height: auto, fill: black.transparentize(70%), radius: 8pt)
  place(dx: 3pt, dy: 3pt, shadow)
  block(radius: 8pt, clip: true)[#image(path, width: width)]
}
```

### Full-Slide Background (Cover Mode)

```typst
// Per-slide background image
#slide(config: config-page(background: {
  image("assets/bg.jpg", width: 100%, height: 100%, fit: "cover")
}))[
  // Content overlays the background
  #place(bottom + left, dx: 40pt, dy: -40pt)[
    #text(fill: white, size: 36pt, weight: "bold")[Title Here]
  ]
]
```

### Inline SVG via `bytes()`

```typst
// Define SVG string (module-level)
#let _icon-svg = ```<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
  <circle cx="12" cy="12" r="10" fill="currentColor"/>
</svg>```.text

// Render with color substitution
#let icon(size: 20pt, color: rgb("#FF6B6B")) = {
  image(bytes(_icon-svg.replace("currentColor", color.to-hex())), width: size, height: size)
}

// Usage
#icon(size: 24pt, color: palette.accent)
```

### Using `height: 1fr` for Equal Distribution

```typst
// Two images stacked equally in available space
#stack(spacing: .8em,
  image("assets/before.png", height: 1fr, fit: "contain"),
  image("assets/after.png", height: 1fr, fit: "contain"),
)
```

### Image with Colored Border Frame

```typst
#rect(stroke: 2pt + palette.accent, inset: 0pt, radius: 4pt)[
  #image("assets/feature.png", width: 100%)
]
```

---

## Core Principle — Two Layers

Almost every pattern below is an instance of one underlying split:

> **The image carries atmosphere, world-building, emotional weight. Native Typst elements carry information, data, editable text.**

The default reflex is to place image and text in adjacent rectangles. The far more powerful move — especially for content-rich pages — is to let the image **be the canvas** (often full-bleed) and draw native elements (annotation cards, flow nodes, KPI tiles, diagrams) directly on top using `place()`.

Anything that must be editable, numerically accurate, contain CJK text, or be styled to the deck's exact palette belongs in the Typst layer regardless of what the image looks like underneath.

### Touying Idiomatics — Choosing the Right Mechanism

| Goal | Idiomatic Approach | NOT This |
|------|-------------------|----------|
| **Full-bleed background image** | `config-page(background: image("bg.png", width: 100%, height: 100%, fit: "cover"))` in slide config | `place(image(...))` as first element |
| **Image + text side-by-side** | `#cols(columns: (1fr, 2fr))[#image(...)][text]` | Ad-hoc absolute placement for normal flow |
| **Overlay elements on background** | `place(top + left, dx: Xpt, dy: Ypt, ...)` inside slide body | Baking text into the image |
| **Per-slide background** | `#slide(config: config-page(background: ...))[content]` | `place()` for the background layer |
| **Image in a card/component** | `image(...)` inside a block/rect component | `place()` for inline images |

> **Rule**: Use `config-page(background:)` for any image that fills the slide (patterns #1, #4, #11, #12, #38–#46). Use `#cols(...)` for ordinary image + text column splits (patterns #2, #3, #13, #18). Reserve `place()` for overlay elements that float above the background (annotations, KPI cards, labels, scrims). Use a theme-specific `#slide` composer only when the selected theme explicitly documents it.

### SVG Embedding Note

Typst natively supports SVG images via `#image("file.svg")`. Use SVG when you need:
- Precision vector graphics (diagrams, flowcharts, technical illustrations)
- Scalable decorative elements that must remain sharp at any resolution
- Complex shapes or paths that Typst's built-in drawing cannot express

Generate SVG files with the image generation pipeline or create them programmatically, then embed like any other image.

---

# Part 1 — Primary Structures

Pick one or more of these as the page's bones. Cross-primary combinations are encouraged (see Composition Guidance).

## Container Layouts (where the image sits)

1. **Full-bleed background with floating title** — `#slide(config: config-page(background: image("bg.png", width: 100%, height: 100%, fit: "cover")))` + scrim `place(rect(width: 100%, height: 100%, fill: black.transparentize(60%)))` + overlay text via `place()`.

2. **Left-third image + right text body** — `#cols(columns: (1fr, 2fr))[#image("img.png", height: 100%, fit: "cover")][text body]`.

3. **Right-third image + left text body** — mirror of #2: `#cols(columns: (2fr, 1fr))[text body][#image("img.png", height: 100%, fit: "cover")]`.

4. **Image bleeding into text area with gradient fade** — `config-page(background: image(..., width: 100%, height: 100%, fit: "cover"))` + `place(rect(width: 100%, height: 100%, fill: gradient.linear(black.transparentize(0%), black.transparentize(100%))))` for the text-side scrim.

5. **Top-band image + bottom multi-column text** — `stack(image(..., height: 45%), grid(columns: 3, ..))` or manual placement.

6. **Bottom-band image + top title + middle text** — mirror of #5 with image at bottom via `place(bottom + left, image(...))`.

7. **Top-and-bottom symmetric split** — image occupies 50% (top or bottom) with a divider element separating the halves.

8. **Z-pattern serpentine** — three rows, image on the left in rows 1 and 3, on the right in row 2. Each row roughly 1/3 slide height; visual flow zigzags down the page.

9. **3×3 grid with central image** — `grid(columns: 3, rows: 3, ...)` with center cell holding the image; other 8 hold text blocks.

10. **Centered image with radial callouts** — image (often circular via `clip`) at slide center; `place()` for leader lines and labels radiating outward.

11. **Diagonal split with gradient overlay** — `config-page(background: image(..., width: 100%, height: 100%, fit: "cover"))` + `place(rect(width: 100%, height: 100%, fill: gradient.linear(bg.transparentize(0%), bg.transparentize(100%), angle: 45deg)))`. The gradient does the "splitting" softly; avoid hard polygon clipping.

12. **Faded image as backdrop with oversized overlay text** — `config-page(background: image(..., width: 100%, height: 100%, fit: "cover"))` + `place(rect(width: 100%, height: 100%, fill: bg.transparentize(40%)))` + huge `text(size: 72pt)[...]` on top.

13. **Narrow vertical image strip + giant horizontal title** — `#cols(columns: (200pt, 1fr))[#image(..., height: 100%, fit: "cover")][#text(size: 60pt)[Title]]`.

14. **Horizontal banner strip cutting through mid-section** — `place(top + left, dy: 40%, image(..., width: 100%, height: 25%))` with content above and below.

15. **Multi-image montage with bold text spanning across** — multiple images tiled via `grid` + large text in a darkened band spanning the full montage.

16. **Negative-space dominant — small image, mostly whitespace** — image and text occupy less than 40% of the slide; rest is breathing room.

17. **Picture-in-picture inset** — large background image + small `place(top + right, dx: -20pt, dy: 20pt, image(..., width: 25%))` overlaid with border.

18. **Image as full-height sidebar column** — `#cols(columns: (200pt, 1fr))[#image(..., height: 100%, fit: "cover")][content]`.

19. **Image floating in whitespace with thin frame and caption** — `align(center, stack(spacing: .8em, rect(stroke: 0.5pt + gray, inset: 4pt, image(...)), text(size: 10pt)[Caption]))`.

## Image-as-Canvas + Native Overlay (the most underused family)

The shared pattern: image fills the slide via `config-page(background:)`, native Typst elements layered on top via `place()`. None of the overlay elements are in the image — they are Typst primitives.

> **Common prefix for all #38–#46**: `#slide(config: config-page(background: image("scene.png", width: 100%, height: 100%, fit: "cover")))[...]` — then overlays inside the slide body.

38. **Background image + annotation cards with leader lines** — config-page background + 2–4 small info cards (`place(top + left, dx: Xpt, dy: Ypt, rect(radius: 4pt, fill: white.transparentize(15%))[...])`) in calm regions. Draw connecting lines with `line()` or embedded SVG paths pointing to image objects.

39. **Background image + flow nodes drawn over the scene** — config-page background; on top, numbered step indicators via `place()` connected by dashed paths (use SVG or Typst `line` elements). Each node = number + label.

40. **Background image + floating KPI metric cards** — config-page background + dark scrim via `place(rect(width: 100%, height: 100%, fill: black.transparentize(50%)))` + `place()` cards in negative-space regions. Each card = icon + label + large metric number.

41. **Background image + measurement lines and module tags** — config-page background; draw measurement annotations with `place()` lines and label boxes. Reads as engineering drawing markup.

42. **Background image + glassmorphism panels** — config-page background; overlay semi-transparent panels via `place(top + left, dx: Xpt, dy: Ypt, rect(fill: white.transparentize(30%), stroke: 0.5pt + white.transparentize(50%))[...])`.

43. **Background image + native data chart on top** — AI cannot produce accurate charts. Use config-page background as visual atmosphere and draw the actual chart with Typst chart components or SVG overlays.

44. **Background image + native architecture diagram** — same logic as #43 but for structural diagrams. Config-page background provides anchor; nodes, connections, labels are Typst/SVG elements via `place()`.

45. **Background image + numbered hotspots with sidebar legend** — config-page background + small numbered circles via `place()`. A sidebar lists corresponding descriptions.

46. **Background image + highlight rectangle** — config-page background + `place(top + left, dx: Xpt, dy: Ypt, rect(stroke: 2pt + accent, fill: none))` framing a sub-region + nearby caption.

## Multi-Image Compositions

47. **Small multiples — 3–6 same-kind images in a row** — `grid(columns: N, ..images)` each with identical caption block underneath. Identical framing is the message.

48. **Side-by-side comparison (before/after, A/B)** — two images in 50/50 split: `grid(columns: 2, gutter: 4pt, image(...), image(...))` with "before"/"after" labels.

49. **Asymmetric collage** — one large image + 2–3 smaller images; use `grid` with varying column widths or `place()` for exact positioning.

50. **Tiled grid (2×2, 2×3, 3×3)** — `grid(columns: N, rows: M, gutter: 4pt, ..images)` with equal cells.

51. **Mosaic** — irregular tile sizes packed together; use `grid` with explicit column/row sizes or manual `place()`.

52. **Image strip / filmstrip** — horizontal sequence with thin gaps; same height: `grid(columns: N, gutter: 2pt, ..images)`.

53. **Vertical image stack** — column of images aligned by width: `stack(spacing: .8em, ..images)`.

54. **Overlapping image stack** — images with overlapping positions via `place(top + left, dx: Xpt, dy: Ypt, image(...))`. Document order = z-order.

55. **Diptych split** — two images abutting at 50/50, vertical or horizontal.

56. **Image triptych** — three independent images side-by-side via `grid(columns: 3, ...)`.

---

# Part 2 — Modifier Layers

Stack any of these freely on top of a Primary structure. Multiple Modifiers per page is the expected case.

## Non-rectangular Image Shapes

20. **Circular crop** — `#box(clip: true, radius: 50%, image(...))` or use `circle(fill: image(...))` pattern.

21. **Rounded rectangle crop** — `#box(clip: true, radius: 8pt, image(...))`.

22. **Ellipse crop** — Typst `ellipse(fill: image(...))` or clip with appropriate radius values.

23. **Hexagonal / polygonal crop** — use SVG `<clipPath>` on the image file itself, or create an SVG wrapper.

24. **Custom path crop (blob, silhouette)** — generate the image with the desired shape baked in, or use SVG clipPath.

25. **Layered paper-cut stack** — multiple image layers each in rounded boxes with offset/fill simulating shadow (Typst has no native `shadow` parameter; simulate with overlapping `rect` elements offset by 2-3pt).

26. **Triptych baked into a single wide image** — one wide image whose internal composition already contains 2–3 scenes. Generate as one image when scene consistency matters.

## Overlay & Masking Treatments

27. **Linear gradient mask for text legibility** — `place(rect(fill: gradient.linear(black.transparentize(10%), black.transparentize(100%))))` over image. Most common: top-to-bottom darkening on cover images.

28. **Radial gradient vignette** — `place(rect(fill: gradient.radial(black.transparentize(100%), black.transparentize(30%))))`. Focuses attention by darkening periphery.

29. **Two-stop scrim — opaque on text side, transparent on focal side** — directional gradient: one stop at high opacity where text sits, transparent where the image subject is.

30. **Flat semi-transparent rectangle overlay** — `place(rect(fill: black.transparentize(60%)))` over image. Uniform darkening.

31. **Color-tinted overlay** — `place(rect(fill: primary.transparentize(80%)))`. Pushes the image toward the deck's palette.

32. **Multi-stop scrim with hue shift** — gradient with multiple color stops to re-grade the image's color without regenerating.

33. **Spotlight mask** — radial gradient with transparent center and opaque dark edges. Reads as a flashlight beam.

34. **Gaussian-blur backdrop** — generate a blurred version of the image or use it as-is with strong overlay. Note: Typst has no runtime blur filter; bake into source image.

35. **Duotone treatment** — two-color mapping baked into the source image at generation time. Request in the image prompt.

36. **Drop shadow under image panel** — simulate with a dark `rect` offset by 2-3pt behind the image panel, filled with `black.transparentize(50%)`. Typst has no native `shadow`; layer a blurred-edge rect or bake shadow into the source image.

37. **Glow effect on overlay shape** — simulate with a larger semi-transparent `rect` behind the element (same position, +4-8pt padding, filled with accent color at 30-40% opacity). Typst has no native blur/glow; bake into source image for photorealistic glow.

## Image as Texture / Atmosphere

57. **Full-bleed image at extreme low opacity as texture wash** — `config-page(background: image(..., width: 100%, height: 100%, fit: "cover"))` + `place(rect(width: 100%, height: 100%, fill: bg.transparentize(20%)))` so image barely shows through.

58. **Image fragment as decorative corner element** — small image placed in one corner via `place(bottom + right, ...)`. Not the focus, just visual seasoning.

59. **Image as horizontal divider band** — narrow image placed between text sections instead of a rule.

60. **Image as ambient noise** — visible but low contrast; mood-setting only.

61. **Image as watermark behind body content** — `config-page(background: image(..., width: 100%, height: 100%, fit: "contain"))` + heavy overlay `place(rect(width: 100%, height: 100%, fill: bg.transparentize(10%)))`. Or generate with baked-in transparency.

## Special Techniques

62. **Same image, two references — full view + zoom-callout** — reference the same image file twice: one at normal size, one clipped to a sub-region at larger display size. Connect with a line element; ring the zoom with a circle stroke.

63. **Transparent PNG sticker / cutout** — RGBA PNG placed via `image()` — transparency is native. Useful for subjects outside rectangular frames.

64. **Image with embedded text rendered by AI** — text becomes part of the artwork. Reliable only for **short English**. CJK text and digits regularly come back malformed; use Typst `text()` overlays instead.

65. **Image with NO text — labels added as native Typst** — generate with "no text, no letters, no numbers" instruction, then overlay all labels with `place(text(...))`.

66. **Image fading into solid background** — gradient overlay whose end-stop matches the slide background color exactly. The image boundary disappears.

67. **Image with knock-out shape** — overlay a shape filled with background color, creating impression of a hole.

68. **Text-as-mask over image** — letterforms revealing image. Must be baked into the image at generation time (prompt for "large lettering revealing scene through letterforms").

69. **Image rotated at slight angle** — `rotate(3deg, image(...))`. Adds dynamism; 2–6 degrees typical.

70. **Image with thin colored matte frame** — `rect(stroke: 2pt + accent, inset: 0pt, image(...))`.

71. **Image with multiple stacked frames** — nested boxes giving a "framed photograph" look.

72. **Image-to-image transition / merge** — two images with overlapping positions, one or both with gradient overlays creating a soft blend.

---

## Composition Guidance

Use the smallest combination that communicates the page:

1. Choose the **P — Primary Structure**: one visual field, image-as-canvas, comparison, sequence, or multi-visual system. Compatible structures may coexist when the page needs them.
2. Name a concrete integration job, then add only the **M — Modifier Layer** that serves it: crop/reveal, tone/focus, framing, placement, or restrained depth.
3. Use an **A — Asset-Dependent Treatment** only when its prepared local composite, cutout, baked effect, or registered derivative exists.
4. Add **C — Cross-Page Continuity** only when consecutive pages intentionally preserve or transform a visual relationship.
5. Stop when another layer no longer earns its place.

The numbered entries are optional recall aids. Repeated plain splits can be exactly right for comparison, sequence, or continuity; modifiers are not required for variety's sake.

## Hard Constraints

- Long body copy, data points, numeric labels, and CJK text always go in the Typst layer — never baked into the image.
- SVG images embed via standard `#image("file.svg")` — no special handling needed.
- Typst has no runtime `blur` or `mask` filter — bake these effects into source images at generation time.
- Image transparency relies on RGBA PNG or SVG with alpha; Typst renders it natively.
- `place()` is the workhorse for overlays; always specify positioning relative to slide bounds.

## Screenshot Framing

Preserve the original screenshot pixels, text, data, and UI details by default.
Choose the target slot ratio before choosing the treatment. Record `fit`, crop
permission, crop-safe area, focal point, and a concise truthful caption/source
when interpretation needs it. Use `contain` for legibility-sensitive UI,
diagrams, and terminal evidence. Use `cover` only when an approved crop keeps
all required evidence. Redesign a screenshot only when the source shape or
density cannot remain legible in the required slot.

Follow the selected theme's documented background, padding, inset, shadow,
corners, and alignment. If the theme is silent, use a restrained readable
container and avoid invented application chrome or device hardware. Review PDF
and PPTX when their framing or crop differs materially.

### Optional Crop-Safe Background

Use a local image as a background only when it is intentionally atmospheric or contextual and has a verified crop-safe region for the target canvas. Record asset, focal point, safe regions, contrast treatment, and whether it is optional in the design spec. If a crop hides evidence, competes with text, or fails at another target aspect ratio, retain the asset as an ordinary image/figure. Background imagery is optional, never required.

### P / M / A / C Composition Vocabulary

The catalog's composition responsibilities are optional planning vocabulary, not IDs, API calls, or coverage quotas:

| Dimension | Meaning |
|-----------|---------|
| **P — Primary Structures** | The page skeleton: single-visual, image-as-canvas, or multi-visual composition. |
| **M — Modifier Layers** | Crop/reveal, tone/focus, framing, placement, or depth added to a selected skeleton. |
| **A — Asset-Dependent Treatments** | Treatments requiring prepared composites, cutouts, baked effects, or registered derivatives. |
| **C — Cross-Page Continuity** | Deliberate persistent-state, camera, or matched-framing relationships across slides. |

Select only what earns its place. A page may cite no pattern, use a free-form composition, or deliberately repeat a composition for comparison, sequence, or continuity. Carry a meaningful cue across related slides and record purposeful resets at narrative transitions.

> A map is an optional contextual extension only when geography, movement, or location comparison is material to the narrative; it is never a default component.

## Hard Constraint: No Slide Chrome in Generated Images

AI-generated images must NEVER contain:
- Headers, footers, or page numbers
- Slide titles or section labels
- Corner marks or decorative frames
- Text overlays that should be Typst-native

These elements are handled by the template's slide functions. Including them in images creates duplication and prevents theme-switching.

> For the full "no slide chrome" rule and other hard constraints, see `image-generator.md` §3 Hard Rules.

---

## Related Documents

- [`image-generator.md`](image-generator.md) — Prompt assembly, Style Anchors, aspect ratio lookup table, and generation workflow. Determines what to generate for each pattern.
- [`shared-standards.md`](shared-standards.md) — Page dimensions, image embedding syntax, source image handling, and placeholder patterns (§2).
- [`design-guide.md`](design-guide.md) §9c — Aesthetic rules for Canvas-level image generation.
