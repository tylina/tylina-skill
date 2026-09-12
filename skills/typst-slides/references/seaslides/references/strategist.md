# Role: Strategist

## Contents

- [Core mission](#core-mission)
- [Pipeline context](#pipeline-context)
- [Pre-confirmation interview](#0-pre-confirmation-interview-optional)
- [Nine confirmations](#1-nine-confirmations-blocking)
- [Content analysis and outline](#2-content-analysis--outline)
- [Design spec output](#3-design-spec-output)
- [Quality checklist](#4-quality-checklist)
- [Handoff](#5-handoff)

## Core Mission

Receive source documents, perform content analysis and design planning, and output a **Content Design Specification & Outline** (`content_design_spec.md`).

> **Execution discipline**: The Strategist produces ONLY the `content_design_spec.md` and confirmations — no Typst code, no template files, no slide content. Those are the Executor's job.

## Pipeline Context

| Previous Step | Current Step | Next Step |
|---------------|--------------|-----------|
| Project creation + template option confirmed | **Strategist**: Nine Confirmations + Design Spec | Image Generator or Executor |

> **Technical foundation**: All Typst/Touying syntax, package versions, font sizes, color rules, and compilation commands live in `shared-standards.md`. This document does NOT duplicate that content.

> **GATE**: Before starting, you MUST `read_file` the chosen theme's `theme.md` to understand available components, slide types, and color scheme.

---

## 0. Pre-Confirmation Interview (Optional)

When the source material does not make the Nine Confirmations obvious, use this structured interview to gather requirements before inferring answers.

| # | Question | Why It Matters |
|---|---|---|
| 1 | Who is your audience? (role, expertise level, pain points) | Drives complexity, vocabulary, and detail level |
| 2 | What is the ONE thing they should remember? | Forces core message clarity |
| 3 | Where/how will this be presented? (live talk, sent as PDF, projected, self-paced) | Determines density and speaker notes needs |
| 4 | How long is the presentation slot? | Sets slide budget (see §1b matrix) |
| 5 | Do you have visual assets (logos, photos, charts)? | Determines image strategy |
| 6 | What feeling should the audience have afterward? (inspired, convinced, informed, alarmed) | Guides tone and visual treatment |
| 7 | Are there hard constraints? (brand colors, required sections, page limit, language) | Prevents rework |

**Auto-inference protocol**: For each question, first attempt to answer from the source material. Only ask the user if the answer is genuinely ambiguous or could go multiple ways. This supplements (does not replace) the Nine Confirmations below.

---

## 1. Nine Confirmations (BLOCKING)

Complete every confirmation before writing the design spec. Infer from source material when possible; ask only when genuinely ambiguous.

### a. Page Format

- **Default**: 16:9 (`presentation-16-9`). **Alternative**: 4:3 (`presentation-4-3`).
- See `shared-standards.md` §2 for the Typst `config-page` pattern.

### b. Page Count

| Context | Typical Range |
|---------|---------------|
| Short pitch / lightning talk | 8-15 slides |
| Standard presentation | 15-30 slides |
| Comprehensive report / workshop | 30-50 slides |
| Academic seminar (45 min) | 30-40 slides |
| Lecture (90 min) | 50-70 slides |
| Full course module | 80-120 slides |

Always include: cover (1), section dividers (1 per major section), content slides, ending (1-2).

#### Slide Budget by Duration and Style

| Duration | General | Consulting | MBB | Academic | Canvas |
|---|---|---|---|---|---|
| 5 min (lightning) | 5-7 | 4-6 | 3-5 | 4-6 | 5-8 |
| 10 min | 8-12 | 8-10 | 6-8 | 8-10 | 8-12 |
| 15 min | 12-16 | 12-15 | 8-12 | 12-14 | 10-15 |
| 20 min | 16-20 | 15-20 | 10-15 | 15-18 | 14-18 |
| 30 min | 22-30 | 20-28 | 12-18 | 20-28 | 18-24 |
| 45 min | 30-40 | 28-35 | 18-25 | 30-40 | 24-32 |
| 60 min | 40-50 | 35-45 | 20-30 | 40-50 | 30-40 |

**Rule of thumb**: General/Academic ~1 slide/min. Consulting ~0.8/min. MBB ~0.5/min (longer dwell per slide). Canvas varies by content density.

### c. Key Information

Confirm (or infer): 1) **Target audience** (who, expertise, pain points), 2) **Usage occasion** (internal/external, formal/informal), 3) **Core message** (single takeaway + desired action).

### d. Style Objective

| Style | Priority | Best For |
|-------|----------|----------|
| **A) General Versatile** | Visual Impact | Product launch, training, marketing, proposals |
| **B) Consulting** | Data Clarity | Business review, project updates, research findings |
| **C) MBB Consulting** | Logical Persuasion | Strategy presentations, executive briefings, board meetings |
| **D) Academic** | Communication Clarity | Conference talks, seminars, thesis defense, paper presentations |

**Heuristic**: Executive/board → C. Data-primary → B. Academic/research → D. Everything else → A.

#### Executor Selection Decision Tree

```
1. Academic/research purpose?
   YES → academic.md
   NO  ↓
2. C-suite, board, or investment decision-makers?
   YES → consultant-top.md (MBB)
   NO  ↓
3. Data-driven with KPIs, market analysis, or business metrics?
   YES → consultant.md
   NO  ↓
4. Magazine/editorial/Swiss visual craft requested?
   YES → canvas.md (requires Canvas-tier theme)
   NO  ↓
5. Default → general.md (Creative Versatile)
```

**Hybrid situations**:
- "Academic but visually polished" → academic.md + Rich complexity
- "Consulting report, creative layout" → consultant.md + Canvas hints
- "Training material, keep simple" → general.md + Plain complexity override

### e. Complexity Level

Choose main.typ writing complexity (see `shared-standards.md` §1c for full Plain/Rich/Canvas comparison):
- **Plain**: Typography- and content-driven with minimal components. Use when restraint supports the task or the user requests it.
- **Rich**: Component-driven composition with grids, cards, charts, or other reusable structures. Use as the dependable default when the content benefits from them.
- **Canvas**: Bespoke free-form composition using Typst primitives and semantic palette values. Use when the task materially benefits and execution passes the capability checks in `${SKILL_DIR}/references/seaslides/workflows/select-theme.md`.

| Style | Default | Rationale |
|-------|---------|-----------|
| General Versatile | **Rich** | Visual impact requires rich layouts and component grids |
| Consulting | **Rich** | KPI dashboards, data visualizations need component grids |
| MBB Consulting | **Rich** | SCQA + charts + takeaway boxes |
| Academic (conference/seminar/lecture 30+) | **Rich+Plain hybrid** | Content clarity with visual breaks at meaningful transitions |
| Academic (thesis defense/showcase) | **Rich** | Defense panels expect polished visual presentation |
| Editorial / Magazine | **Canvas** | Every page has unique composition; image-first design |
| Festival / Poster | **Canvas** | Bold visual identity; each page is a design canvas |

> These are recommendations, not constraints. Present the recommendation and let the user decide.

### f. Color Scheme

**Flow 1/2 (existing theme)**: Read theme's `theme.md` Color Scheme section. Present existing palette for confirmation.

**Flow 3 (new theme)**: Define semantic roles for background, primary, accent,
body text, and secondary text. The **60-30-10 heuristic** in
`shared-standards.md` §4 is an optional starting point, not a measured quota.

**Flow 4 (curated preset)**: When creating a new color scheme, start from a professionally balanced preset:

| Preset | Primary | Accent | Background | Text | Best For |
|---|---|---|---|---|---|
| Ocean Professional | #1A365D | #2B6CB0 | #FFFFFF | #2D3748 | Corporate, tech, finance |
| Warm Executive | #744210 | #DD6B20 | #FFFAF0 | #1A202C | Consulting, strategy |
| Forest Growth | #22543D | #38A169 | #F0FFF4 | #1A202C | Sustainability, health |
| Midnight Statement | #1A202C | #E53E3E | #FFFFFF | #2D3748 | Bold pitches, startups |
| Serene Academic | #2C5282 | #4299E1 | #EBF8FF | #2D3748 | Research, education |
| Monochrome Swiss | #0A0A0A | #002FA7 | #FAFAF8 | #0A0A0A | Minimalist, editorial |

**Palette guardrails** (validate any custom palette against these):
- Background-to-text contrast ratio >= 4.5:1
- Accent-to-background contrast ratio >= 3:1
- Every additional hue has a documented semantic or narrative role
- Accent remains distinguishable from primary in the actual rendered context;
  it may share a hue family when value, saturation, or another theme-owned cue
  preserves hierarchy

### g. Typography Plan

**Flow 1/2 (existing theme)**: Present theme's base size for confirmation. Recommend a font pair suited to project tone.

**Flow 3 (new theme)**: Choose a font pair:

| Preset | English Font | CJK Font | Best For |
|--------|-------------|----------|----------|
| Modern Business | Inter / Arial | Noto Sans CJK SC | Corporate, tech |
| Formal Document | Times New Roman | SimSun | Official, government |
| Cultural / Art | Merriweather | Noto Serif SC | Cultural, artistic |
| Conservative | Arial | SimHei | Traditional industries |

Font size hierarchy: see `shared-standards.md` §3. **Density-based selection**: Low density (<=5 bullets) → 20-22pt. Medium (6-10 items) → 18-20pt. High (>10 items/tables) → 16-18pt. Mixed decks → use median as base, adjust locally.

#### CJK Typography Grading

When the deck contains CJK (Chinese/Japanese/Korean) text, apply character-count-based sizing:

| Element | Condition | Size | Weight |
|---|---|---|---|
| Title (1-line) | <= 8 characters | 36-40pt | 700 (Bold) |
| Title (1-line) | 9-12 characters | 32-36pt | 700 |
| Title (2-line) | any | 28-32pt | 700 |
| Subtitle | <= 15 characters | 22-24pt | 400 |
| Body text | CJK paragraphs | 18-20pt | 400 |
| Body text | mixed CJK+Latin | CJK 18pt / Latin 20pt | 400 |
| Caption / footnote | any | 12-14pt | 300 |

**CJK spacing rule**: CJK body text at equivalent pt size appears ~10-15% larger than Latin. Reduce CJK body by 1-2pt relative to Latin base when mixing scripts in the same deck.

**Line height**: CJK paragraphs need 1.6-1.8x line height (vs 1.4-1.5x for Latin) due to character density.

### h. Image Strategy

| Strategy | When to Use | Notes |
|----------|-------------|-------|
| **Emoji** | Simple icons, casual tone | Unicode emoji directly; no import needed |
| **AI Generated** | Creative concepts, custom visuals | Mark as `[Pending: description]` in outline |
| **Web Search** | Real photography, landmarks, documentary | Zero-config (Openverse/Wikimedia); mark as `[Pending: description]` |
| **User Provided** | Brand assets, photos | Request file paths from user |
| **No Images** | Data-heavy, formal reports, **academic only** | Rely on typography and layout |

> [!CAUTION]
> **Image guidance for non-academic content**:
> If the presentation is **non-academic** and has no source images, prefer "Web Search" or "AI Generated" when relevant imagery would improve explanation, evidence, or atmosphere. Use `image_search.py` for real photography (people, places, events, landmarks) or `image_gen.py` for custom illustrations. Do not add filler imagery solely to satisfy a cadence.
>
> "No Images" is only acceptable when:
> - The content is academic/scientific (conference talks, papers)
> - The user explicitly requests text-only / no images
> - The content is data-heavy with charts/tables already filling the visual space

#### Style Anchor (required when AI Generated)

If image strategy includes AI generation, select a **Style Anchor** — a deck-wide visual rendering style applied to all generated images for coherence:

| Anchor | Best For |
|--------|----------|
| `editorial-photo` | Case studies, corporate, editorial decks |
| `flat-vector` | Tech explainers, SaaS, training materials |
| `ink-sketch` | Creative, academic, notebook-style |
| `3d-render` | Product, architecture, data visualization |
| `abstract-geometric` | Brand, festival, bold editorial |
| `data-viz` | Consulting, research, reports |
| `watercolor` | Cultural, art, wellness topics |
| `collage-editorial` | Fashion, culture, experimental |

> See `image-generator.md` §1 for full descriptions. The chosen anchor is recorded in `content_design_spec.md` §V header and prepended to every image prompt.

**Image narrative intent** (decide before consulting any ratio table):

| Intent | When to use |
|--------|-------------|
| **Hero / full-bleed** | Covers, chapter dividers, impact pages — image *is* the message |
| **Atmosphere / background** | Section backgrounds, mood-setting — image sets tone, text carries info |
| **Side-by-side** | Most content pages — image and text read together |
| **Accent / inline** | Supporting visuals, spot illustrations, small diagrams |

> Intent is driven by narrative purpose, not image ratio. The same photo can be hero on one page and side-by-side on another.

**Screenshot handling**: Preserve the original pixels, text, data, and UI details by default. Choose the target slot ratio first, then record fit, crop permission, crop-safe area, focal point, useful alt text, and a concise truthful caption/source when interpretation needs it. Use theme-supported background, padding, inset, shadow, corners, and alignment. Use `contain` for legibility-sensitive interfaces, diagrams, and terminal evidence; use `cover` only for an approved crop that preserves all required evidence. Redesign only when the source cannot remain legible in the required slot.

**Visual direction and continuity**: State a visual premise, recurring treatment, type/contrast posture, and intended section transitions before outlining pages. Carry a meaningful visual cue across related slides—such as treatment, alignment edge, accent behavior, or matched framing—and record purposeful resets when the narrative warrants them. A local atmospheric/contextual background is optional and must be crop-safe, focal-point-aware, and contrast-safe; otherwise use the asset as an ordinary image. A map is an optional contextual extension only when geography, movement, or location comparison is material to the narrative.

When useful, describe composition with the optional P/M/A/C vocabulary: Primary Structure (page skeleton), Modifier Layers (crop/tone/frame/depth), Asset-Dependent Treatments (prepared composite/cutout/baked effect), and Cross-Page Continuity (matched framing or persistent visual state). These are free-form cues, not image roles, IDs, or coverage quotas.

**Image Description Quality** — Provide detailed visual descriptions, not abstract concepts:
- Bad: "A technology image", "tech background"
- Good: "Isometric 3D illustration of a smart factory floor with robotic arms, blue-purple scheme, clean white background, soft shadows, no text"
- **Checklist**: subject, action/composition, art style, color palette, background, mood, "no text" (if applicable).

🚧 **GATE — Image Layout Patterns**: When image approach is AI/User/Placeholder (anything other than "No Images"):

1. **Read** `${SKILL_DIR}/references/seaslides/references/image-layout-patterns.md` before writing §V Image Resource List
2. **Produce** — every image row MUST describe its narrative purpose, framing/crop intent, and intended treatment. Catalog patterns may be optional shorthand; they are not required IDs or a substitute for the semantic decision.
3. **Image-as-canvas option** — consider an image-as-canvas composition with native overlays when the image has enough visual and semantic weight to carry a page.
4. **Skip-detection signal** — if every page resolves to the same bare split without a narrative reason, re-read the catalog and reconsider. Deliberate repetition for comparison, sequence, or continuity is valid.

### i. Third-party Package Selection

> Core package versions: see `shared-standards.md` §5.

**Key packages to actively consider** — these are underused; default to including them when content matches:

| Package | Trigger | Import |
|---------|---------|--------|
| **mitex** | Source has ANY math/formulas/equations | `@preview/mitex:0.2.7` |
| **lilaq** | Source needs a standard chart or an existing SeaSlides chart template | `@preview/lilaq:0.6.0` |
| **gribouille** | Analysis needs mapped aesthetics, multiple layers, or statistical transformations | `@preview/gribouille:0.6.0` |
| **codly** | Source has code snippets AND zebra-stripe style desired (template already styles code blocks by default) | `@preview/codly:1.3.0` |
| **lovelace** | Source has algorithms/pseudocode | `@preview/lovelace:0.3.1` |
| **cheq** | Source has task lists/checklists/roadmaps | `@preview/cheq:0.4.0` |
| **merman** | Source has Mermaid flowcharts/process diagrams/Gantt charts/sequence diagrams | `@preview/merman:0.1.0` |

> Scan the source content for these signals BEFORE deciding packages. Multiple packages can and should be combined (e.g., mitex + lilaq for a data science talk). Choose Lilaq for the existing chart-template path; choose Gribouille only when its Grammar-of-Graphics model materially simplifies the analysis.

**Discovering more options** — query these index files:
- `${TYLINA_SKILLS_ROOT}/_shared/charts/index.json` — chart and infographic component catalog
- `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/README.md` — theme dispatch (per-tier indexes in each sub-directory)
- `${TYLINA_SKILLS_ROOT}/_shared/slides/themes/user/` — user-created themes (disk scan)
- `${TYLINA_SKILLS_ROOT}/_shared/packages/index.json` — curated packages with runnable demos
- `${TYLINA_SKILLS_ROOT}/_shared/icons/index.json` — icon packages; default to emoji

**Selection**: Choose packages based on content needs (charts, callouts, diagrams), not style labels. Any style can use any package where appropriate.

---

## 2. Content Analysis & Outline

### 2a. Narrative Logic Planning (BEFORE layout decisions)

Before choosing layouts or visual rhythm, analyze the **story logic** — what the audience should know/feel after each page.

#### Arc-to-Executor Routing

| Executor Style | Recommended Arc | Rationale |
|---|---|---|
| General Versatile | Arc A (Hook/Context/Core/Shift/Takeaway) | Audience engagement, storytelling |
| Consulting | Arc B (SCQA) | Client expects structured argument |
| MBB Consulting | Arc C (Pyramid Principle) | Executive time is limited; lead with conclusion |
| Academic | Arc C or Funnel (see academic.md §2) | Evidence-building toward contribution |
| Canvas (Editorial) | Arc A with emphasis on visual rhythm | Story-driven, each page is a beat |
| Canvas (Swiss) | Arc C or Arc B | Data-driven, structured, minimal |

#### Narrative Arcs (choose one)

**Arc A — Hook/Context/Core/Shift/Takeaway**: General, editorial, product. Hook grabs attention → Context establishes why → Core delivers details → Shift challenges assumptions → Takeaway drives action.

**Arc B — SCQA**: Consulting, executive, strategy. Situation (20%) → Complication (30%) → Question (10%) → Answer (40%).

**Arc C — Pyramid Principle**: Data-heavy, board meetings. Lead with conclusion → Supporting arguments (most important first) → Evidence → Action/next steps.

#### Ghost Deck Test

Read ONLY slide titles in sequence — they should tell the complete argument. If titles are topic labels ("Overview → Market → Technology"), rewrite as conclusions ("Mobile payments grew 3x → Incumbents can't serve underbanked → Our SDK cuts integration from 6 weeks to 3 days").

#### Narrative Functions

Assign each page a narrative function: `hook`, `ground`, `build`, `pivot`, `prove`, `resolve`, or `breathe`. Story logic drives visual rhythm — not the other way around.

---

### 2b. Analysis Steps

1. **Structure scan** — identify major sections, logical flow
2. **Density assessment** — classify each slide as high / medium / low density
3. **Slide type mapping** — assign type: cover, section, content, or ending
4. **Content chunking** — apply "one idea per slide"; balance variety with consistency
5. **Page rhythm tagging** — assign `anchor` / `dense` / `breathing` to each page

| Tag | Purpose | Example slides |
|-----|---------|---------------|
| `anchor` | Key message anchoring a section | Cover, section dividers, conclusion |
| `dense` | Information-rich, data-heavy | Tables, dashboards, comparison grids |
| `breathing` | Narrative pause, single impactful idea | Hero quote, big number, feature image |

> Rhythm follows narrative, not quota. If content is genuinely data-dense, the deck may be nearly all `dense`. Every `breathing` page must answer "what independent thing is this page saying?"

**Layout diversity**: Plan visual variety only where it strengthens the story. Do not use catalog dimensions, pattern IDs, or image counts as quotas; deliberate repetition is valid for comparison, sequence, and continuity.

### Outline Format

The outline goes into **Section IV** of the design spec:

```markdown
| Page # | Slide Type | Title | Narrative Fn | Visual Rhythm | Page Rhythm | Key Content | Layout Notes |
|--------|------------|-------|-------------|---------------|-------------|-------------|--------------|
| 1 | title-slide | [title] | hook | hero-dark | anchor | subtitle, author, date | Full-bleed cover |
| 2 | new-section-slide | [section] | breathe | hero-dark | anchor | | Auto from `= Section` |
| 3-N | slide | [slide titles] | build/prove | content-light | dense | bullet points, components | layout hints |
| N+1 | ending-slide | Key Contributions | resolve | content-light | anchor | contact info | Stays on screen during Q&A |
```

For each content slide, include: title, 3-5 bullet points, chart/component hints, layout pattern.

### Layout Pattern Quick Reference

| Pattern | When to Use | Typst Syntax |
|---------|-------------|-------------|
| `single` | Default text flow | `== Title` + bullets |
| `cols` | Two-column comparison | `#cols[...][...]` |
| `card-grid` | 3-4 equal items | `#cols(columns: (1fr, 1fr, 1fr))[...][...][...]` |
| `table` | Structured data | `#table(...)` or `#data-table(...)` |
| `hero-image` | Full-width visual | `#image(width: 100%)` |
| `image+text` | Visual + explanation | `#cols[#image(...)][text]` |


---

## 3. Design Spec Output

### Use the canonical template

The content design spec MUST follow **`${TYLINA_SKILLS_ROOT}/_shared/slides/content_design_spec_reference.md`**:

| Section | Contents |
|---------|----------|
| **I. Project Information** | Name, format, page count, style, complexity, audience, use case, date |
| **II. Theme Selection** | Theme source, name, doc path, entry function, template file |
| **III. Third-party Packages** | Package / version / import / purpose table |
| **IV. Content Outline** | Page-by-page outline table (slide #, type, title, key content, layout) |
| **V. Image Resource List** | Filename, purpose, type, status, description |
| **VI. Chart & Diagram List** | Slide #, chart type, package, data source, notes |
| **VII. Speaker Notes** | Tone guidelines per style |

> Do NOT invent a different structure. Fill every section. Leave sections empty with a note rather than omitting them.

### Additional implementation sections (append after VIII)

When relevant, append: Typst Color Variable Mapping, Page Type to Slide Function Mapping, Custom Component List, File Structure.

### Page Rhythm in Content Outline

The `Page Rhythm` column in `content_design_spec.md` §IV is mandatory. Without it, the Executor defaults all pages to `dense` (the "every page is a card grid" failure mode).

| Tag | Meaning |
|-----|---------|
| `anchor` | Structural page (cover, section divider, ending) — follow theme's built-in slide type |
| `dense` | Information-heavy — card grids, multi-column, charts, tables permitted |
| `breathing` | Low-density impact — no multi-card grids; single emphasis, whitespace, full-bleed imagery |

Rhythm follows narrative, not quota: `breathing` pages mark natural pauses. Every page should have a rhythm tag in the outline table.

---

## 4. Quality Checklist

- [ ] All nine confirmations completed
- [ ] Design spec follows `${TYLINA_SKILLS_ROOT}/_shared/slides/content_design_spec_reference.md` structure
- [ ] Color scheme has at least 5 roles with HEX values
- [ ] Font sizes match `shared-standards.md` §3 hierarchy
- [ ] Package versions match `shared-standards.md` §5
- [ ] Content outline has every slide with title + key content
- [ ] Image strategy clear; AI-generated images have descriptions
- [ ] Visual direction records cross-page continuity and intentional resets
- [ ] Screenshots preserve the original UI by default and record slot ratio, fit, crop permission, focal/safe areas, and truthful caption/source when needed
- [ ] Any map is justified by geographic narrative need rather than inserted by default
- [ ] Chart slides reference specific templates from `charts/index.json`

### Speaker Notes Planning

If requested, plan as `#speaker-note[...]` blocks. Tone by style: General → conversational. Consulting → analytical, data-referencing. MBB → executive-level, concise. Academic → pedagogical, evidence-citing.

### Slide Budget

Rough guideline: ~1 slide per minute for most styles, slightly fewer for executive/MBB presentations.

---

## 5. Handoff

| Image Strategy | Next Step |
|----------------|-----------|
| AI Generated | → **Image Generator** (provide image prompts from Section V) |
| Web Search | → **Image Searcher** (provide search queries from Section V) |
| User Provided / Emoji / No Images | → **Executor** (pass `content_design_spec.md` directly) |

The Executor receives the `content_design_spec.md` file and implements `template.typ` + `main.typ`. No further strategist input is needed unless the Executor flags an ambiguity.
