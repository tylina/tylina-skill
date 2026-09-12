# Executor Academic — Academic Presentation Style

## Contents

- [Role and references](#role-definition)
- [Complexity level](#complexity-level)
- [Action titles](#1-action-titles-critical)
- [Narrative structures](#2-narrative-structures)
- [Exhibit discipline](#3-exhibit-discipline)
- [Text discipline](#4-text-discipline)
- [Deck architecture](#5-deck-architecture)
- [Long lectures and courseware](#5b-long-decks-lectures--courseware-30-slides)
- [Design minimalism](#6-design-minimalism)
- [Template components](#7-template-components)
- [Citations and attribution](#8-citations-and-attribution)
- [Speaker notes](#9-speaker-notes-style)
- [Quality checklist and best practices](#10-quality-checklist)

## Role Definition
Academic presentation executor for conference talks, research seminars, thesis defenses, group meetings, and paper presentations. Emphasizes communication clarity, argument structure, and evidence-based reasoning over visual decoration.

> **Scope**: This file owns academic narrative and presentation-style guidance. `base.md` owns the shared executor workflow, and `shared-standards.md` owns technical rules.

## References
- `base.md` — Common execution guidelines
- `shared-standards.md` — Typst/Touying technical constraints
- `template-designer.md` — Theme design patterns

---

## Complexity Level

> See `shared-standards.md` §1c for the full Plain/Rich/Canvas comparison table.

This style **defaults to Rich+Plain hybrid**. Academic presentations prioritize content clarity but benefit from visually distinct Rich slides at meaningful transitions or explanation-heavy moments.

| Complexity | When to Use |
|------------|-------------|
| **Rich+Plain hybrid (default)** | Conference talks, seminars, course lectures (30+ slides) |
| **Rich** | Thesis defense, detailed research showcases, demo days |
| **Plain (only when explicitly requested)** | Group meetings, quick informal talks where user requests minimal decoration |
| **Canvas** | Poster-style academic presentations with unique per-page visual composition |

---

## 1. Action Titles (CRITICAL)

Every content slide title must be a **complete sentence stating the takeaway**, not a topic label.

### Topic Labels vs Action Titles

| Topic Label | Action Title |
|-------------|-------------|
| Results | Treatment effect is significant across all three cohorts |
| Literature Review | Prior work leaves the causal mechanism unexplained |
| Data | Dataset covers 40 years of county-level panel data |
| Methodology | Regression discontinuity exploits a sharp funding threshold |
| Conclusion | AI-powered models outperform traditional baselines by 15% |

### Ghost Deck Test

Read only slide titles in sequence — they must convey the complete argument. PASSES: "Prior work leaves X unexplored → We propose Y → Model achieves Z → Ablation confirms W → X improves downstream by 12%". FAILS: "Background → Related Work → Methodology → Results → Conclusion".

Use `== [action title]` headings. Support claims with citations (`@key`) where appropriate.

---

## 2. Narrative Structures

Choose ONE narrative spine for the entire presentation:

### Option A -- Situation / Complication / Resolution (SCR)

| Phase | Purpose | Slides |
|-------|---------|--------|
| **Situation** | Established knowledge | 1-2 |
| **Complication** | What's missing or contested | 1-2 |
| **Resolution** | Your contribution | Remaining |

### Option B -- Funnel

Broad context -> specific gap -> your approach -> key findings -> implications.

### Option C -- Answer First

Lead with conclusion, then supporting evidence. Best for senior audiences (grant panels, advisory boards).

### Flow Test

Read slide titles sequentially -- each should make the next feel like a natural consequence.

---

## 3. Exhibit Discipline

### One Exhibit Per Results Slide

Each results slide has exactly one figure, table, or diagram supporting the action title.

**Two-part test**: (1) Cover the exhibit -- does the title stand alone? (2) Cover the title -- is the takeaway obvious from the exhibit?

### Layout Convention

Use `#cols[#image(...)][text]` or similar layouts for exhibit + interpretation. Prefer graphs over tables — use **lilaq** for existing/direct statistical chart templates, or **gribouille** when mapped aesthetics, layers, and statistical transforms clarify the analysis. Annotate key findings directly on charts. Rebuild figures at presentation resolution (axis labels >= 16pt). Never paste screenshots from papers.

---

## 4. Text Discipline

### Conciseness

Aim for ~40 words per slide. If text must shrink below 20pt to fit, remove content instead.

### Bullet Discipline

- One idea per bullet
- Prefer 3-5 bullets; more suggests the slide should be split
- Telegraphic language acceptable

### Typography Rules

- **Bold**: key terms on first introduction, inline labels, focal findings
- **Italic**: statistical notation, species names, publication titles -- NOT for decoration
- **All other emphasis**: through font size hierarchy defined in template

---

## 5. Deck Architecture

### Typical Slide Structure

| # | Slide Type | Purpose | Notes |
|---|-----------|---------|-------|
| 1 | `title-slide` | Title, authors, affiliation | Use `config-info(...)` |
| 2 | Motivation (1-2) | Why the problem matters | SCR "Situation + Complication" |
| 3 | Research Question (1) | Explicit statement | By slide 2-3 at latest |
| 4 | Methods (1-2) | Only what's needed to evaluate findings | Details -> appendix |
| 5+ | Results (as needed) | One finding per slide | Action title states finding |
| N-2 | Discussion (1-2) | Interpret findings, limitations | |
| N-1 | Conclusions (1) | 2-4 bullet points | **Stays on screen during Q&A** |
| N | Contact/References | Email, QR, link to paper | |
| App | Appendix (labeled) | Pre-built Q&A slides | Label clearly |

### Critical Rule: NO "Thank You" Slide

Conclusions slide stays on screen during Q&A. End with `== Key contributions and implications` + 2-4 bullet points + contact info at bottom.

### Slide Budgets

| Talk Length | Content Slides (max) | Rule |
|-------------|---------------------|------|
| 10 min | 8-10 | ~1 slide per minute |
| 15 min | 12-14 | |
| 20 min | 15-18 | |
| 45 min seminar | 30-40 | |
| 90 min lecture | 50-70 | Course/lecture slides |
| Full course module | 80-120 | Chunked courseware |

---

## 5b. Long Decks: Lectures & Courseware (30+ slides)

For academic courses, lecture series, and comprehensive seminars that produce 30–120 slides:

### Recommended Complexity

Use a **Rich+Plain hybrid** for long academic decks (30+ slides). Plain remains the workhorse for standard content, but template-provided components should appear at rhythm points to break monotony and signal importance. Canvas tier is inappropriate for 30+ slides.

### Rhythm Rule

Insert a visually distinct slide when a long run of Plain slides begins to obscure structure or tire the audience. Use real narrative transitions, focus statements, diagrams, or component-supported explanations rather than inserting variety by count.

Use whatever components the chosen theme provides — highlight boxes for key results, data displays for metrics, comparison layouts for method evaluation, section transitions between major parts.

### Guardrails

1. **Use Rich slides selectively** — components should clarify important academic content rather than make the deck resemble a product pitch
2. **No decorative-only elements** — every rich component must contain substantive academic content
3. **Action titles still mandatory** — Rich slides still need action-title headings stating the takeaway
4. **Academic color restraint** — Rich components inherit the theme palette; no new colors for variety

### Structural Patterns for Long Decks

**Automatic heading numbering** via `numbly` (configured in `template.typ`):

```typst
// In template.typ:
#import "@preview/numbly:0.1.0": numbly
#set heading(numbering: numbly(
  "Part {1:I}.",   // Level 1: Part I., Part II., ...
  "{1:I}.{2}.",    // Level 2: I.1., I.2., ...
))
```

Then in `main.typ`, just write headings naturally — numbering is automatic:

```typst
= Foundations              // → "Part I. Foundations" (section divider)
== Definition of convergence  // → "I.1. Definition of convergence" (content slide)
== Examples                   // → "I.2. Examples"
...
= Applications             // → "Part II. Applications"
```

**Section dividers at major transitions**: Level-1 headings (`=`) render as section divider slides. Level-2 (`==`) are content slides.

**Table of Contents slide** (mandatory for 25+ slides):

```typst
== Outline
#components.progressive-outline(level: 1)
```

**Recurring structural elements**: For lecture slides, establish a rhythm:
- Definition → Example → Exercise pattern
- Theorem → Proof sketch → Corollary pattern
- Concept → Diagram → Application pattern

### Consistency for Long Decks

Since all colors/fonts/components live in `template.typ`, visual consistency is automatic regardless of deck length. The content rules to maintain:

- Consistent bullet depth across all content slides (max 2 levels)
- One font size hierarchy throughout (no "special" sizing for individual slides)
- Section dividers use the same visual treatment every time
- Same action-title format on every content slide (no switching between topic labels and action titles mid-deck)

### Math-Heavy Lecture Decks

For courses in mathematics, physics, computer science, etc.:

- **Default to MiTeX** (``#mi(`...`)`` inline, ``#mitex(`...`)`` block) — see `shared-standards.md` §7 "Math Equations". This avoids error-prone LaTeX→Typst math rewriting
- **Import**: `#import "@preview/mitex:0.2.7": *`
- **Typst native math** (`$ ... $`): Valid when you know the native syntax and verify notation plus rendering
- **Theorem environments**: Use `theorion` package — see `${TYLINA_SKILLS_ROOT}/_shared/packages/theorion/README.md` for full API
- **Equation numbering**: Label important equations with `$ ... $ <eq:name>` and cross-reference with `@eq:name` (works with both native math and mitex block)
- **Pseudocode**: Use `lovelace` for algorithm slides — see `${TYLINA_SKILLS_ROOT}/_shared/packages/lovelace/README.md`
- **One key equation per slide** as a general rule; derivation steps can have 2-3 aligned equations using `&` alignment

**Theorion style selection**:

| Style | Import | When to Use |
|-------|--------|-------------|
| `cosmos.simple` | Minimal, LaTeX-like | Plain-tier decks, conference talks |
| `cosmos.clouds` | Rounded-rect background | Rich-tier decks, modern themes |
| `cosmos.rainbow` | Left colored border | Technical slides, admonition-style |
| `cosmos.fancy` | Decorated frames | Formal presentations only |

```typst
#import "@preview/theorion:0.6.0": *
#import cosmos.clouds: *    // Choose style based on deck aesthetic
#show: show-theorion        // AFTER theme's #show: rule

#theorem[Euclid's Theorem][
  There are infinitely many prime numbers.
] <thm:euclid>

// Custom numbering (counter continuation)
#theorem(number: (2, 3))[
  Explicitly numbered 2.3. Next auto-numbered continues as 2.4.
]
```

**Equations**:

```typst
// Labeled equation using MiTeX (default)
#mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`) <eq:gaussian>

// Reference elsewhere
As shown in @eq:gaussian, the Gaussian integral evaluates to...

// Inline math example
The loss function #mi(`\mathcal{L}(\theta)`) is minimized via gradient descent.
```

**Pseudocode** (via `lovelace`):

```typst
#import "@preview/lovelace:0.3.1": *

#figure(
  kind: "algorithm", supplement: [Algorithm],
  pseudocode-list(booktabs: true, numbered-title: smallcaps[Binary Search])[
    + *Input*: Sorted array $A$, target $x$
    + $l <- 0$, $r <- n - 1$
    + *while* $l <= r$ *do*
      + $m <- floor((l + r) / 2)$
      + *if* $A[m] = x$ *then* *return* $m$
      + *else if* $A[m] < x$ *then* $l <- m + 1$
      + *else* $r <- m - 1$
    + *end*
    + *return* $-1$
  ]
) <algo:bsearch>
```

> **Package lookup**: See `${TYLINA_SKILLS_ROOT}/_shared/packages/index.json` for all available packages.

---

## 6. Design Minimalism

### Visual Rules

| Rule | Value |
|------|-------|
| **Background** | White or very light neutral |
| **Colors** | Maximum 3: primary (dark navy/blue), accent (mid-blue), alert (optional red) |
| **Font** | Single sans-serif family throughout |
| **Decorative elements** | Minimal — favor clean, unadorned layouts |
| **Images** | Only data figures, diagrams, and architecture illustrations |

### Academic Color Defaults

Primary: `#1F4E79` (dark navy), Accent: `#2E75B6` (mid blue), Alert: `#C00000` (red, sparingly), Text: `#333333`, Muted: `#888888`. Keep visual elements clean and purposeful.

---

## 7. Template Components

> **Component implementations**: See `template-designer.md` for full code definitions.

Components are **defined in the theme's `template.typ`** — use whatever the chosen theme provides. Each theme has its own set of components for data display, callouts, highlight boxes, etc. Do not hardcode specific component names.

**Source attribution** (universal, works with any theme): Use `#text(size: 0.7em, fill: gray)[Source: Chen et al. (2023)]` at slide bottom.

Usage: `== [action title]` → `#cols[#image(...)][bullets]` → key finding emphasis → source attribution.

---

## 8. Citations and Attribution

Cite on the slide where each borrowed claim appears using `@key` syntax. Add source attribution at slide bottom (e.g., `#text(size: 0.7em, fill: gray)[Author et al. (Year)]`).

**References slide** (mandatory): Use `== References` + `#magic.bibliography(title: none)`. See §8 "Bibliography and Citations" below for full setup.

**Two bibliography approaches** (full details in "Bibliography and Citations" below):

1. **External `.bib` file** (recommended for 5+ citations): Place `references.bib` in project root. Setup in config:
   ```typst
   config-common(show-bibliography-as-footnote: bibliography("references.bib"))
   ```

2. **Inline `bytes(...)` bib** (for quick decks with few citations):
   ```typst
   #bibliography(title: [References], bytes(`
   @article{smith2024,
     title={...}, author={Smith, J.}, journal={...}, year={2024}
   }
   `.text))
   ```

**Style selection**: Default is `"ieee"`. For other fields, use `style: "apa"` (psychology), `"chicago-author-date"` (social science), or `"american-physics-society"` (physics). See "Bibliography Styles" below for full style table.

**Fallback** (no .bib available): manual numbered list at 14pt.

### Bibliography and Citations

Typst supports two bibliography file formats: **BibLaTeX `.bib`** files and **Hayagriva `.yaml/.yml`** files. Only entries actually cited with `@key` in the document will appear in the bibliography.

#### Option A: External `.bib` File (recommended for most cases)

Place `references.bib` in the project root alongside `main.typ`.

**Setup** (in Touying):
```typst
#show: my-theme.with(
  config-common(show-bibliography-as-footnote: bibliography("references.bib")),
)
```

**Inline citations**: `@vaswani2017` (standard Typst `@key` syntax).

```typst
This was already noted by pirates long ago. @arrgh

Multiple sources say ... @arrgh @netwok.
```

**Bibliography slide**:
```typst
== References
#magic.bibliography(title: none)
```

#### Option B: Inline BibTeX via `bytes(...)` (no external file needed)

When you want to keep everything self-contained in a single `.typ` file (e.g., LLM-generated references without creating a separate file):

```typst
This was already noted by pirates long ago. @netwok

#bibliography(title: [References], bytes(`
@article{netwok,
  title={At-scale impact of the {Net Wok}: A culinarically holistic investigation of distributed dumplings},
  author={Astley, Rick and Morris, Linda},
  journal={Armenian Journal of Proceedings},
  volume={61},
  pages={192--219},
  year={2020},
  publisher={Automattic Inc.}
}
`.text))
```

> **When to use inline bib**: Short decks with few citations where creating a separate file adds unnecessary complexity. The LLM can generate the bib entries directly in `main.typ`.

#### Bibliography Styles

```typst
// Default style is "ieee". Override with:
#bibliography("refs.bib", style: "apa")
```

| Field | Typical Style |
|-------|---------------|
| Engineering, IT | `"ieee"` |
| Psychology, Life Sciences | `"apa"` |
| Social sciences | `"chicago-author-date"` |
| Humanities | `"mla"`, `"chicago-notes"` |
| Economics | `"harvard-cite-them-right"` |
| Physics | `"american-physics-society"` |

#### Citation Syntax

```typst
@key              // Standard citation
@key[pp. 1-10]   // Citation with supplement (page numbers)
#cite(<key>)      // Explicit function call (same result)
```

---

## 9. Speaker Notes Style

**Academic tone**: Clear, precise, measured pace. Explain methodology decisions. Acknowledge limitations proactively. Structure each note: state action title → explain exhibit/data → connect to broader argument → transition to next slide. Use "As we can see in Figure N..." and "The key takeaway here is...".

---

## 10. Quality Checklist

> **Common checks**: See `base.md` §8 for the full shared checklist.

**Academic-specific checks**:
- [ ] CRITICAL: Every content slide has a #speaker-note[...] block
- [ ] All slides created via == Heading (NOT #slide(title: ...))
- [ ] Inline math uses #mi(), block math uses #mitex()
- [ ] NO fake formula text or Unicode lookalikes — use real `#mi`/`#mitex` or verified native `$...$` math
- [ ] All relevant source images from sources/ are used in slides
- [ ] If sources/ contains images, verify at least some are referenced in main.typ
- [ ] Every content slide has an action title (complete sentence)
- [ ] Ghost deck test passes (titles alone tell the argument)
- [ ] Narrative spine is clear (SCR, Funnel, or Answer-first)
- [ ] One exhibit per results slide
- [ ] Each exhibit has a "so what" annotation
- [ ] Body text <= ~40 words per slide
- [ ] Conclusions slide is last non-appendix slide (NOT "Thank You")
- [ ] Every borrowed claim has an in-slide citation
- [ ] References slide exists with complete citations
- [ ] White or light neutral background
- [ ] Maximum 3 colors (primary, accent, optional alert)
- [ ] Single font family throughout
- [ ] No decorative elements without content purpose
- [ ] Body text >= 20pt, figure labels >= 16pt
- [ ] `---` used only for intentional slide breaks

---

## 11. Best Practices

- Research question by slide 2-3; one argument per presentation; appendix the rest
- Communication-first design; white space = analytical clarity; rebuild paper figures at presentation resolution
- ~1 slide/min; pre-identify cuttable slides; anticipate 3-5 Q&A questions with appendix slides
- End on conclusions — keep them on screen during Q&A
