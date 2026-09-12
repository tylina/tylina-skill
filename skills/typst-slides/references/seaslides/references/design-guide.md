# Design Philosophy & Aesthetic Guide

This document defines aesthetic standards for SeaSlides Typst Slides presentation generation — ensuring every presentation feels intentionally designed, visually distinctive, and professionally crafted.

> **Scope**: This file owns visual principles and aesthetic judgment. Use `shared-standards.md` for technical constraints and `template-designer.md` for theme implementation contracts.

## Contents

- [Design philosophy](#1-design-philosophy)
- [Pre-design checklist](#2-pre-design-thinking-checklist)
- [Visual aesthetics](#3-visual-aesthetics-guidelines)
- [Anti-patterns](#4-anti-patterns)
- [Style spectrum](#5-style-spectrum)
- [Slide rhythm and flow](#6-slide-rhythm--flow)
- [Aesthetic excellence](#7-aesthetic-excellence-principles)
- [Creative mandate](#8-creative-mandate)
- [Professional design-system lessons](#9-lessons-from-professional-design-systems)

---

## 1. Design Philosophy

**Distinctive, not generic.** Every presentation should have a unique visual identity reflecting its subject matter, audience, and emotional intent. A Zen Buddhism deck should feel nothing like a McKinsey strategy deck. If two unrelated presentations could swap themes without anyone noticing, the design has failed.

**Anti-AI-slop principle.** The most common failure mode is sameness: default blue palettes, predictable bullet-point layouts, symmetrical grids, decorative filler. Every design choice should be intentional and defensible.

**Aesthetic ambition with functional restraint.** A beautiful slide nobody can read is worse than a plain slide with clear information. Contrast ratios matter. Font sizes matter. Information density must match the audience's capacity.

**The human professional standard.** The benchmark is "indistinguishable from a skilled human designer":
- Thoughtful asymmetry over rigid symmetry
- Color choices that feel curated, not computed
- Typography with personality, not just hierarchy
- Layout decisions that respond to content, not templates
- Details that reward attention: accent lines, subtle gradients, considered spacing

**Every element earns its place.** If a decorative line, icon, or color block doesn't serve a purpose (hierarchy, emphasis, navigation, mood), remove it.

---

## 2. Pre-Design Thinking Checklist

> These questions inform the Strategist's Nine Confirmations (see `strategist.md`).

**Audience & Context**: Who is in the room? What setting? What formality and domain expertise level?

**Emotional Intent**: What tone? (serious, playful, inspiring, analytical, urgent) Should the audience feel informed, persuaded, moved, or challenged?

**The Memory Test**: What is the ONE thing people should remember 24 hours later? What makes this presentation unforgettable?

**Design Direction**: What aesthetics resonate with this topic? Dark or light? Warm or cool? Dense or spacious? What would be the WRONG aesthetic?

---

## 3. Visual Aesthetics Guidelines

### Color

Every presentation needs a **distinctive palette** — not default blues, not random pastels.

**Palette construction:**
- Start from the content's world (Zen → ink blues and lotus golds; debugging → dark-mode palette; consulting → McKinsey Blue with amber highlights).
- Follow the **60-30-10 rule** (see `shared-standards.md` §4).
- **Maximum 4-5 colors** including neutrals. Use tints/shades rather than adding new ones.
- Industry-appropriate but not cliched.

**Dark themes** require extra care: no pure black (`#000000`) — use dark grays/deep blues; no pure white text — use off-whites; accent colors need higher saturation; card backgrounds need subtle differentiation from page background.

**Color creates hierarchy, not just decoration.** Primary = titles and structure, accent = key data and CTAs, muted = supporting text. If you can't explain what a color means, remove it.

### Typography

**Font choice sets personality.** One family is usually enough — use weight and size for variation. If pairing, contrast purpose (one for headings, one for body). Monospace for code, data, and metadata/chrome elements (kickers, page numbers,
timestamps) — the tracked uppercase monospace label is a hallmark of editorial
and Swiss design.

**Size hierarchy must be immediately obvious** (see `shared-standards.md` §3). Never go below 12pt.

**CJK presentations**: Always specify a CJK fallback font. CJK text often needs slightly larger sizes. Line height should be 1.5-1.8 for CJK body text.

### Layout & Composition

- **White space is a design element**, not wasted space
- **Asymmetry creates visual interest** — use `composer: (2fr, 1fr)` or `(3fr, 2fr)`
- **Grid-based but not rigid** — break the grid deliberately for emphasis
- **One idea per slide** — dense information is acceptable for expert audiences, but each slide needs a single clear takeaway
- **Content margins should breathe** — default `(top: 4em, bottom: 1.5em, x: 2em)`

**Content density**: Target content occupying ≤65% of the slide area. The remaining 35%+ should be whitespace, margins, and breathing room. On data-heavy slides, this may stretch to 75% but never above.

### Visual Elements

- **Charts should tell a story** — highlight the critical bar in amber, not just display data
- **Icons should be consistent** — one style per deck (all line, all filled, or all emoji)
- **Images should be meaningful** — if an image slot can't be filled meaningfully, use a colored block or typographic treatment
- **Decorative elements reinforce theme** — they should feel inevitable, not added

### 3b. Action Titles (Consulting Convention)

Every slide title should be a complete sentence that states the slide's conclusion, not a topic label:

| Label Title (Avoid) | Action Title (Prefer) |
|---|---|
| Q3 Results | Q3 revenue exceeded target by 18% |
| Architecture | Microservices reduce deploy time from 4h to 12min |
| Team Growth | Engineering headcount doubled while maintaining velocity |
| Market Overview | Southeast Asia mobile payments grew 3x in 24 months |

**Self-check**: Read the title alone without seeing the slide content. If it doesn't tell you the conclusion, rewrite it.

**Exception**: Section dividers and focus-slides may use short thematic labels (e.g., "Raw Materials", "Frame by Frame").

---

## 4. Anti-Patterns

**Visual monotony**: Generic blue-on-white; identical layouts for every slide; symmetrical everything; default fonts with no pairing.

**Content problems**: 8+ bullets per slide; wall of text with no hierarchy; tiny unreadable text; meaningless stock imagery (handshakes, lightbulbs, puzzle pieces).

**Technical sloppiness**: Inconsistent spacing; mixed icon styles; rainbow color schemes; overcrowded slides; gratuitous animation descriptions.

**Structural failures**: No section dividers; uniform information density; generic opening/closing slides; no visual distinction between insight and detail slides.

**The "safe choices" trap**: Defaulting to light theme; only horizontal layouts; title always top-left; every card same size; colors that are "fine" instead of *right*.

**Card grid monotony threshold**: If more than 40% of content slides use the same card-grid layout (e.g., 2x2 or 1x3), the deck lacks visual variety. Remedy: replace some card grids with stat-blocks, comparison layouts, timeline views, or full-bleed image pages.

---

## 5. Style Spectrum

| Style | Characteristics | Example Reference |
|-------|----------------|-------------------|
| **Minimalist Corporate** | Clean lines, muted palette, generous white space, data-forward | Corporate, McKinsey, Emerald themes |
| **Bold Tech** | High contrast, strong accents, modern sans-serif, product-launch energy | Google, Anthropic themes |
| **Dark Mode Technical** | Dark backgrounds, syntax-highlighting palette, monospace accents | Slate, Midnight, AI-Ops themes |
| **Academic** | Communication-first, action titles, white background, max 3 colors, single font | Academic-Defense, CQU themes |
| **Academic Math** | Theorem/proof environments, equation numbering, clean math typesetting, minimal decoration | Clean-Math-Presentation, ENS-Rennes, Shuimu themes |
| **Creative Cultural** | Thematic color stories, cultural motifs, expressive typography | Cherry, Bamboo themes |
| **Data-Driven** | Bloomberg terminal aesthetic, dense but organized, chart-heavy | Exhibit theme |
| **Warm Organic** | Soft palettes, rounded elements, approachable typography | Nordic, Lavender themes |
| **Government/Institutional** | Formal, traditional, restrained color, seal/crest-style branding | Gov-Blue, Gov-Red themes |
| **Retro/Vintage** | Nostalgic palettes (ochre, rust, cream), textured backgrounds | Pixel-Retro, Terracotta themes |
| **Modern Editorial** | Magazine-style layouts, strong image/text interplay, asymmetric grids | Aurora, Rosewood themes |
| **Editorial Magazine** | Serif/sans/mono triple typography, ink/paper two-tone, restraint-first, images as first-class citizens | Guizang-Magazine theme |
| **Swiss International** | Single accent color, extreme type contrast, inverse weight hierarchy, sharp rectangles, grid-first, hairline dividers | Guizang-Swiss theme |

### Complexity Levels: Plain / Rich / Canvas

> **Working examples**: See `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/custom-plain/` (e.g., `monochrome/`, `slate/`), `custom-rich/` (e.g., `psychology/`, `smart-red/`, `mckinsey/`), and `custom-canvas/` (e.g., `sugar-rush/`, `guizang-magazine/`, `guizang-swiss/`) for concrete implementations at each complexity level.

> See `shared-standards.md` §1c for the canonical definition table and default recommendations.

**Plain**: Source simplicity, whitespace as a design element, typography-driven hierarchy, and few custom components.

**Rich**: Component-driven visual completeness using grids and reusable patterns in `template.typ`.

**Canvas**: Bespoke composition from Typst primitives (`place()`, `grid()`, `block()`, `text()`, `stack()`, `line()`) and the theme's semantic palette. The key difference from Rich is free-form composition rather than source length or component count. Abstract reusable patterns; keep genuinely unique composition local.

---

## 6. Slide Rhythm & Flow

**Balance density over the narrative.** Follow data-heavy slides with spacious takeaways when the audience needs synthesis; use section dividers only for real transitions.

**Section dividers create breathing room** — visually distinct from content, signaling "we're moving to something new."

**Build narrative tension**: Introduction (sparse, atmospheric) → Evidence (dense, structured) → Climax (bold, focused) → Resolution (clean, memorable).

**Mix layout types**: Full-text for key quotes, split layouts for comparisons, card grids for parallel concepts, image-heavy for context, data-focused for evidence.

**Opening and closing slides deserve extra creative attention.** Title slide = first impression. Ending slide = last image in memory.

**Page count awareness**: 6 slides → minimal structure. 15 slides → clear act breaks. 25+ → TOC and multiple section dividers. 50+ (lectures/courseware) → multi-level sections (`= Part` / `== Slide`), recurring structural patterns, progressive outline per section.

**Theme rhythm planning** (for editorial/magazine decks): Before picking any layout, list every page's visual mode (light/dark/hero-light/hero-dark) in a table. Enforce:
- Review long same-mode runs; retain them when continuity supports the content
- Use hero-dark or hero-light pages only where contrast supports an opening, transition, or emphasis point
- Insert a hero page only at a meaningful opening, transition, question, quote, or emphasis point

---

## 7. Aesthetic Excellence Principles

> Drawn from professional design systems. These principles separate "AI-generated deck" from "professionally designed presentation."

### 7a. Typography is the Foundation

**Font choice sets personality**, but *font discipline* sets quality:
- **Triple-font system** (editorial): Serif for titles/emphasis, sans-serif for body, monospace for metadata. Never let the three bleed into each other's roles.
- **Inverse weight hierarchy** (Swiss/modern): Larger text = lighter weight. A 36pt heading at weight 200 (ExtraLight) paired with 14pt body at weight 400 creates elegance that bold headlines cannot match.
- **Size contrast ratio**: Title-to-body ratio of at least 3:1 for standard decks, 8:1+ for Swiss/editorial styles. If the hierarchy isn't immediately obvious, increase the ratio.

### 7b. Color Restraint

- **Two-tone systems** (ink + paper) are inherently more elegant than multi-color palettes. guizang-magazine proves that a single ink color and a single paper color create more visual impact than 5+ accent colors.
- **Single accent color** per deck. If you need emphasis, use weight, size, or opacity — not a second color.
- **Derived colors only**: Tints and shades of the base palette (`color.lighten(N%)` / `color.transparentize(N%)`) rather than new hues.

### 7c. Structure Creates Beauty

- **Grid whitespace is intentional** — generous margins, consistent gutters, and deliberate asymmetry (60/40 or 70/30 splits) look more considered than centered 50/50 layouts.
- **Hairline rules** (0.5pt) divide content more elegantly than thick borders or card backgrounds.
- **Negative space** is a design element, not wasted space. If a slide feels empty, that might be correct — it gives the audience a visual pause.

### 7d. Component Minimalism

- **Restraint over spectacle** — decorative elements should be barely noticeable. A 6% opacity ghost number, a 0.5pt rule, a subtle tint — these details reward attention without demanding it.
- **Every element earns its place** — if a decorative line, colored block, or icon doesn't serve hierarchy, emphasis, or navigation, remove it.
- **Consistency within a deck** — one icon style, one card style, one heading treatment. Mixing rounded and sharp corners, or serif and sans-serif headings, signals carelessness.

### 7e. Image-First Design (for Canvas/Editorial)

- **Images are first-class citizens**, not decorative afterthoughts. Build the layout around the image, not the other way around.
- **Image cropping**: Crop at bottom only. Top and sides carry the image's identity.
- **Fixed heights, not aspect-ratio** — use `height: Npt` in image containers to prevent layout breakage.
- **Scrim overlays** for text over images: 2-3 overlapping gradient layers for readable text.

---

## 8. Creative Mandate

The Touying/Typst platform gives full creative control. Don't default to safe, predictable choices. Study the content — a Buddhist scripture deck should feel like holding a weathered manuscript; a debugging workshop should feel like a terminal at 2 AM. An editorial magazine deck should feel like reading *Monocle*; a Swiss design deck should feel like Massimo Vignelli designed it. **The standard is "someone would choose this over a professionally designed alternative."**

### Reference Aesthetic Anchors

| Style | Design Anchor | What to Study |
|-------|--------------|---------------|
| Editorial Magazine | *Monocle* magazine | Two-tone ink/paper, serif headlines, monospace metadata, generous whitespace |
| Swiss International | Massimo Vignelli / *Helvetica Forever* | Single accent color, extreme type contrast, inverse weight hierarchy, sharp geometry |
| Modern Tech | Acne Studios / Apple keynotes | Clean sans-serif, high contrast, product-forward |
| Data-Driven | Bloomberg Terminal / *The Economist* | Dense but organized, chart-heavy, restrained palette |
| Cultural/Art | Museum exhibition catalogs | Thematic color stories, expressive typography, image-dominant |

---

## 9. Lessons from Professional Design Systems

> These insights are drawn from analyzing professional presentation frameworks (guizang-ppt-skill, ppt-master) and from reproducing their outputs in Typst. They represent battle-tested principles for achieving design-studio-quality output.

### 9a. Constraint-Based Design Over Creative Freedom

Professional systems achieve aesthetic quality through **constraints**, not unlimited flexibility:
- **Curated presets only** — custom hex values are forbidden; only pre-designed palettes are allowed
- **Locked layout skeletons** — select from a catalog of proven layouts, don't compose from scratch
- **Component class validation** — every component must exist in the template before being used in content
- **Font weight ladder** — weight values are pre-mapped to size ranges, not chosen ad-hoc

The principle: constraints make AI-generated decks more reliable. Unlimited freedom leads to "AI slop" — predictable blue palettes, symmetric grids, decorative filler.

### 9b. Page Rhythm as Narrative Architecture

Before writing any slide content, create a **rhythm table** specifying each page's visual mode.

**Two complementary axes** (both appear in the content outline table):

1. **Visual Rhythm** — the color/visual treatment of the page:

| Mode | Density | Purpose |
|------|---------|---------|
| `hero-dark` | Low | Accent/dark background, ceremonial feel (cover, chapter divider, closing) |
| `hero-light` | Low | Light background, one strong visual element (quote, statement, hero image) |
| `content-light` | Medium-High | Standard content on light background |
| `content-dark` | Medium-High | Standard content on dark background (for contrast) |

2. **Page Rhythm** — the content density guide for the Executor:

| Tag | Purpose |
|-----|---------|
| `anchor` | Structural page (cover, section divider, ending) — follow theme's built-in slide type |
| `dense` | Information-heavy — card grids, multi-column layouts, tables, charts |
| `breathing` | Low-density impact — single emphasis, whitespace, full-bleed imagery |

> These axes are orthogonal: a `hero-dark` page is usually `anchor` or `breathing`, but a `content-dark` page can be `dense`. Always specify both in the outline.

**Review heuristics:**
- Review repeated Visual Rhythm modes and keep deliberate repetition when it strengthens the narrative
- Use `hero-dark` or `hero-light` only when contrast supports a real opening, transition, or emphasis point
- Add a `breathing` page after sustained density when comprehension or pacing needs it
- The opening and closing slides deserve 2-3x the design attention of content slides

### 9c. Image Generation Discipline

For AI-generated images in Canvas decks:
- **One coherent prose paragraph** (150-300 words) per prompt — never tag soup
- **Explicitly forbidden prompt words**: "modern, flat design, gradient, vibrant, professional, clean, 4K, high quality" — these produce generic results
- **Rendering × Palette × Type** — three orthogonal dimensions that must all be specified
- **Generated images must never contain slide chrome** (headers, footers, page numbers)
- **Screenshot framing**: process screenshots with consistent padding, background, shadow, and corner treatment before embedding

### 9d. Anti-"AI Look" Signals

If your deck has these characteristics, it looks AI-generated:
- Every page is a card grid with identical spacing
- Blue-on-white with no personality
- Symmetric 50/50 splits on every page
- Decorative elements on every page (dots, lines, gradients)
- Bold weight on all headings regardless of size
- Same 3 layout patterns repeated throughout
- Stock photo handshakes, lightbulbs, or puzzle pieces

The fix: use rhythm variation, asymmetric splits, inverse weight hierarchy, decoration restraint, and 3+ distinct layout patterns per deck.

### 9e. Shadow & Depth Philosophy

"Shadow is restraint, not default. The designed feel comes from absence, not abundance."
- Maximum 2-3 shadowed elements per page
- Single light source per page (consistent dx/dy direction)
- Don't stack visual-weight tools — pick ONE per container: shadow, border, gradient, or tint
- In Swiss themes: zero shadows, zero rounded corners
- In editorial themes: subtle hairline borders only, no drop shadows

### 9f. CJK Typography Micro-Adjustments

Chinese/Japanese/Korean text has different visual weight than Latin text at the same point size. CJK characters are square blocks with more visual mass, requiring adjustments:

**CJK Title Size Ladder** (compared to Latin titles at same visual weight):

| CJK title length | Recommended size | Notes |
|---|---|---|
| 1 line, ≤8 characters | Same as Latin or +2pt | CJK characters fill more visual space |
| 2 lines, each ≤8 chars | Latin size −2pt | Prevent crowding |
| 2 lines, 9-12 chars/line | Latin size −4pt | Reduce to prevent overflow |
| 3+ lines | Rewrite shorter; if impossible, Latin −6pt | Never let titles overflow |

**Hard rules:**
- CJK body text needs `line-height: 1.5-1.8` (versus 1.3-1.5 for Latin) because CJK glyphs are taller
- `tracking` (letter-spacing) on kickers: reduce by ~30% for CJK text (e.g., 1.8pt → 1.2pt) because CJK already has natural spacing between square glyphs
- Short CJK serif display titles need an optical test rather than the kicker rule. Start at normal
  spacing, then probe roughly `0.02em-0.06em` when two to eight large glyphs look cramped. Use less
  as the line gets longer; bold sans display may need zero or slightly negative tracking instead.
  Never apply display tracking globally to body copy.
- Mixed CJK+Latin titles: use `#h(0.3em)` between CJK and Latin words for visual breathing room
- Font fallback chain: always specify `("Latin Font", "CJK Font")` — e.g., `("Noto Sans", "Noto Sans CJK SC")`
- CJK serif fonts (e.g., Noto Serif CJK SC) are heavier than Latin serif at the same weight — use weight 400 where Latin uses 500

**Anti-patterns:**
- Using `tracking: 1.8pt` on CJK kickers — produces unnaturally wide spacing; use 0.8-1.2pt instead
- Setting CJK body text below 12pt — CJK characters become illegible faster than Latin
- Using weight 200 (ExtraLight) for CJK display text — CJK strokes are too complex for ultra-light weights; minimum weight 300 for CJK titles, or accept that CJK glyphs will look heavier than Latin at weight 200

### 9g. Dark/Light Page Rhythm — The Core of Guizang Aesthetics

The single most impactful design technique for achieving guizang-level visual quality is **dark/light page alternation**. Professional editorial decks alternate between ink-background and paper-background pages to create visual rhythm.

**Implementation pattern for dark pages** (copy-paste ready):

For themes with a `dark-slide()` function (guizang-magazine, guizang-swiss), simply use:
```typst
#dark-slide(title: none, ghost: [02], header-left: [...], header-right: [...])[
  // All text automatically uses paper color
  // Ghost text automatically placed at 6% opacity
  // Header/footer automatically inverted
  #text(size: 38pt, weight: "bold")[Your statement here.]
]
```

For themes WITHOUT `dark-slide()`, use `config-page()` manually:
```typst
#slide(title: none, config: config-page(
  fill: palette.ink,    // or palette.accent for accent-colored pages
  header: none,
  footer: none,
  margin: (x: 2.5em, top: 2.5em, bottom: 1.2em),
))[
  #set text(fill: palette.paper)
  // Must manually set all text colors
  // Must manually create header/footer if needed
  #text(size: 36pt, weight: "bold")[Statement text.]
]
```

**Rhythm planning table** (create before writing any content):
```
Page 1: hero-dark   (cover)
Page 2: hero-dark   (dark stat page — data impact)
Page 3: content-light (three pillar cards)
Page 4: content-light (comparison / detail)
Page 5: hero-dark   (section divider with ghost number)
Page 6: content-light (closing argument)
```

**Dark page selection criteria (when to use ink background):**
- Data reveals — large numbers meant to impress
- Section dividers — mark chapter transitions
- Key statements — one-line provocative claims
- Closing/ending — ceremonial feel

**Light page selection criteria (when to use paper background):**
- Detailed comparisons — readability matters
- Multi-card layouts — visual complexity needs breathing room
- Table-heavy pages — data density requires contrast
- Process/timeline pages — structural clarity

### 9h. Building Blocks Over Monolithic Functions

The most maintainable Canvas architecture uses small composable components:
- 8-15 component functions in `template.typ` (kicker, gold-rule, stat-card, etc.)
- Each component is self-contained with consistent padding, color, and typography
- Components compose via `grid()`, `cols()`, `stack()` in `main.typ`
- Page-level `place()` only for overlays (background images, watermarks, floating captions)
- **Monolithic page functions** (e.g., `#page-type-3(title, body, image, stats)`) are an anti-pattern — they're inflexible and hard to maintain

### 9i. Inline SVG as Design Identity

The single most effective technique for creating visually distinctive themes is **inline SVG decoration** via `image(bytes())`. SVG patterns give each theme a unique visual fingerprint that plain Typst shapes cannot achieve.

**What works:**
- Constellation lines connecting star-point dots (celestial)
- Chalk-stroke wavy underlines simulating hand-drawn marks (chalkboard)
- Circuit traces with 90° turns and connection pads (circuit-board)
- Geometric tessellations from cultural patterns (silk-road, origami)
- Organic blob shapes with bezier curves (watercolor)
- Sparkline micro-charts as inline data decoration (data-ink)

**Budget**: 2-5 SVG pattern definitions per theme. Each should be ≤20 path elements. Define as module-level `#let _pattern-svg = ...` strings, render with `image(bytes(svg-string.replace("currentColor", color.to-hex())), width: Npt)`.

**Key principle**: SVG decorations should be **barely noticeable** on content slides but **define the theme's identity** on hero/section slides. A celestial theme's constellation is subtle on normal slides (faint gold, small size) but dramatic on the title slide (large, bright gold).

### 9j. Theme Component Diversity & Information Density

Themes that feel rich and professional provide diverse component types for different content needs:

| Component Type | Purpose | Examples |
|---------------|---------|----------|
| **Stat/KPI** | Large numbers with context | `chalk-stat`, `magnitude-stat`, `gauge-stat` |
| **Card** | Bordered content container | `origami-card`, `ic-card`, `wash-card` |
| **Quote** | Emphasized citation | `chalk-quote`, `brush-quote`, `memoir-quote` |
| **Divider** | Visual separation | `trace-divider`, `bleed-divider`, `fleuron-divider` |
| **Tag/Label** | Small categorization | `signal-tag`, `pigment-tag`, `orbit-tag` |
| **Data display** | Dense information | `register-box`, `ephemeris-table`, `classified-box` |
| **Layout helper** | Multi-element composition | `bus-layout`, `news-grid`, `tessellation-grid` |

**Useful component coverage** (Rich/Canvas): provide the components the theme's
intended narratives actually need, such as a themed container, metric display,
separator, quotation treatment, label, or one metaphor-specific component.
Do not add components merely to satisfy a count; each public component must have
a demonstrated use and a stable layout contract.

### 9k. Layout Diversity Within Slides

Theme demos should show meaningful composition range without disguising useful
repetition. Depending on the theme, relevant examples may include:

- **Single-column** (full-width text/statement)
- **Two-column asymmetric** (60/40 or 70/30 split)
- **Three-column equal** (card grid, pillar layout)
- **Dashboard** (stat row + detail below, separated by divider)
- **Focus** (centered large statement, minimal chrome)
- **Mixed** (headline left, stacked cards right)

Choose enough distinct examples to prove the theme's intended capabilities. Do
not impose a layout-count quota, and preserve repeated structure when it
communicates comparison, sequence, or continuity.
