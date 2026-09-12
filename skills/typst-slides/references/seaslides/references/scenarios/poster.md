# Scenario: Academic and Research Posters (Typst)

Use this workflow when the deliverable is one physical poster page: a conference poster, research
poster, public evidence board, field-study summary, or result-first Better Poster. Posters use the
same source-truth and build infrastructure as SeaSlides, but they are not slide decks and must not
inherit slide-count, slide-density, or animation assumptions.

> **Scenario contract:** start from a reviewed Typst Universe package and one of the runnable
> examples in `templates/scenarios/poster/`. Keep the poster to exactly one physical page, preserve
> the package's useful design language, and adapt content and geometry in Typst. The whole canvas
> must resolve to a deliberate lower edge, but individual columns and cards do not all have to be
> the same height.

## Non-negotiable outcome

A usable poster satisfies all of the following:

1. It compiles to exactly one physical page.
2. Every claim, number, citation, author, affiliation, logo, and contact route is source-supported.
3. One primary result, decision, or question is identifiable at thumbnail size.
4. Body text, charts, captions, and limitations are readable at the intended viewing distance.
5. Nothing is clipped, hidden behind a footer, stranded on a second page, or rendered with an
   unreviewed font fallback.
6. The page has an intentional visual conclusion at the bottom edge: a footer, full-width band,
   final evidence region, continuing visual field, or explicitly framed quiet zone.
7. The design does not manufacture filler, stretch meaningless metadata, or force every column to
   share one bottom coordinate.

## Pipeline mapping

| Main workflow responsibility | Poster equivalent | Deliverable |
|---|---|---|
| Source processing | Step A: evidence intake | Verified content and asset inventory |
| Project preparation | Step B: workspace setup | Existing workspace prepared or new project initialized |
| Strategy | Step C: poster decisions | Canvas, package, argument, density, visual system |
| Asset preparation | Step D: figures and visual fields | Print-ready figures, logos, diagrams, and optional SVG assets |
| Execution | Step E: Typst authoring | One package-backed `.typ` entry |
| Compile and review | Step F: physical-page QA | One-page PDF plus full-size and thumbnail renders |

## Step A: Evidence intake

### A.1 Read the source

| User source | Preferred action |
|---|---|
| Paper PDF | `python3 ${SKILL_DIR}/scripts/source_to_md/pdf_to_md.py FILE.pdf -o source.md` |
| DOCX draft | `python3 ${SKILL_DIR}/scripts/source_to_md/doc_to_md.py FILE.docx -o source.md` |
| Existing PPTX | `python3 ${SKILL_DIR}/scripts/source_to_md/ppt_to_md.py FILE.pptx -o source.md` |
| URL | `python3 ${SKILL_DIR}/scripts/source_to_md/web_to_md.py URL -o source.md` |
| Markdown, Typst, or LaTeX | Read directly and inventory adjacent assets |
| Topic or verbal brief only | Gather the structured fields below; research only when authorized |

Do not begin layout from an abstract alone when the poster is expected to show quantitative
results. Ask for the relevant tables, figures, method details, limitations, and citations.

### A.2 Build a claim-to-evidence ledger

At minimum, identify:

- exact title, authors, affiliations, conference or venue, and contact route;
- the decision, research question, or problem the poster exists to communicate;
- the primary result and the evidence that directly supports it;
- method, sample, comparison, units, uncertainty, exclusions, and failure conditions;
- limitations and claims the study does **not** support;
- source citations, acknowledgments, funding statements, and required logos;
- every figure, table, diagram, photograph, icon, and QR-code destination;
- venue size, orientation, bleed, color profile, and submission format.

Use a small ledger before writing:

| Poster claim | Evidence | Required qualifier | Visual form |
|---|---|---|---|
| Primary result | Figure/table/source location | Scope and uncertainty | Hero number, figure, or comparison |
| Mechanism or method | Procedure/source location | Sample and exclusions | Process, timeline, or compact prose |
| Decision | Result plus operational rule | Stop condition | Decision band or result box |
| Limitation | Source discussion | Unsupported inference | Boundary box or footer note |

If a claim has no evidence, omit it or mark it as a question. Never invent data or citations to fill
space. The local examples visibly identify themselves as fictional demonstrations for this reason.

## Step B: Workspace setup

For an editor-owned or otherwise existing workspace, do not initialize a nested project. Prepare
the existing root and name its active entry:

```bash
python3 ${SKILL_DIR}/scripts/project_manager.py workspace WORKSPACE --entry main.typ --prepare
```

For a genuinely new SeaSlides project:

```bash
python3 ${SKILL_DIR}/scripts/project_manager.py init PROJECT_NAME
python3 ${SKILL_DIR}/scripts/project_manager.py import-sources PROJECT_PATH SOURCE_FILES
```

Copy required figures and logos into the project's asset directory. Keep original source files
unchanged. A poster example may be copied as the starting `main.typ`, but its package import,
license note, fictional-data warning, and child README must be read before adaptation.

## Step C: Poster decisions

Lock these decisions before detailed authoring. In Quick Mode, choose the defaults that best fit the
evidence instead of asking questions that do not materially change the result.

### C.1 Canvas and print contract

The venue specification is authoritative. Common starting points are A0 portrait, A0 landscape, A1
portrait, A1 landscape, 75 × 100 cm portrait, and 24 × 18 inch landscape. Do not translate a named
print size into a similar-looking arbitrary rectangle.

Record:

- physical dimensions and orientation;
- required bleed and safe area;
- expected viewing distance;
- whether the file is printed, displayed digitally, or both;
- PDF, PNG, and optional PPTX delivery requirements;
- printer color, embedded-font, transparency, and raster-resolution constraints.

### C.2 Package router

Use the package whose composition already matches the communication job. Avoid recreating a theme
that the package already provides.

| Package | Use when | Preserve | Main caution |
|---|---|---|---|
| [`peace-of-posters 0.6.0`](https://typst.app/universe/package/peace-of-posters/) | Canvas, column count, theme, or section geometry needs substantial control | Theme/layout state, title/column/footer boxes, explicit stretch behavior | `stretch-to-next` is selective, not a page-wide rule |
| [`placard 0.1.0`](https://typst.app/universe/package/placard/) | A compact card API, easy two/three-column routing, or light/dark variants fit the brief | `placard` page wrapper, `card` rhythm, scheme and color dictionaries | Global `scaling` affects every metric; retune structure first |
| [`pollux 0.1.0`](https://typst.app/universe/package/pollux/) | A Gemini-inspired A0 two-column research poster or Japanese/English stack is desired | A0 layout, theme, title and column box vocabulary | Raleway/Lato/Noto Sans CJK JP may be missing; inspect fallback metrics |
| [`pasquino 0.1.0`](https://typst.app/universe/package/pasquino/) | A quiet 75 × 100 cm editorial two-column poster is appropriate | Serif display/sans body contrast, banner, rules, section flow | Optional font families may fall back; page-level settings belong before `show: poster.with(...)` |
| [`postercise 0.2.0`](https://typst.app/universe/package/postercise/) | One conclusion should dominate a landscape page at billboard scale | Theme module, central focus field, narrow evidence/interpretation rails | Better Poster is intentionally asymmetric; verify bibliography behavior |

Local runnable examples:

| Communication job | Entry |
|---|---|
| Flexible A1 field-study poster | `templates/scenarios/poster/peace-of-posters/demo.typ` |
| Dense A0 three-column decision poster | `templates/scenarios/poster/peace-of-posters/demo-three-column.typ` |
| A1 visual-first poster with inline SVG | `templates/scenarios/poster/peace-of-posters/demo-visual-first.typ` |
| Light A1 card poster | `templates/scenarios/poster/placard/demo.typ` |
| Dark A1 operational poster | `templates/scenarios/poster/placard/demo-dark.typ` |
| Gemini-like A0 research poster | `templates/scenarios/poster/pollux/demo.typ` |
| Minimal 75 × 100 cm editorial poster | `templates/scenarios/poster/pasquino/demo.typ` |
| 24 × 18 inch Better Poster | `templates/scenarios/poster/postercise/demo.typ` |

### C.3 Argument and reading path

Choose a page argument, not merely a list of paper sections:

- **Classic two-column:** question and method on the left; evidence, interpretation, and conclusion
  on the right.
- **Three-column decision route:** setup and measurement; primary contrast and audit; supported
  claim, trade-offs, and decision.
- **Result billboard:** narrow context rail; dominant result field; narrow interpretation rail.
- **Visual-first:** one hero visual or diagram establishes the phenomenon; a small number of
  evidence blocks explain the decision.
- **Operational audit:** status windows, failure points, and stop rules lead to a concrete action.

Every column needs a job, but columns need not contain the same number of boxes or end at the same
height. Reading order must remain obvious without relying on decorative numbering alone.

### C.4 Density and visual character

- **Standard evidence-led:** balanced prose, one or two strong figures, visible result and limits.
- **Dense research:** more methods and tables, but still one dominant result and a readable path.
- **Minimal billboard:** very large conclusion, short supporting rails, intentionally framed quiet
  space.
- **Visual-first:** a large illustration, diagram, map, or waveform owns the page; native labels and
  evidence remain legible.

Select one visual language and keep it coherent. Useful poster-scale systems include strict Swiss
grid, quiet editorial rules, dark operational panels, limited-color screen print, and card-based
scientific layouts. Use a few large geometric moves rather than many decorative widgets. Negative
space can carry hierarchy when it is clearly bounded by a page-scale field or grid.

## Step D: Figures and visual fields

### D.1 Inventory and prepare assets

1. Inventory source figures and project assets.
2. Keep only visuals that support the page's argument or are institutionally required.
3. Prefer vector PDF/SVG for diagrams and plots when the toolchain renders them reliably.
4. For raster figures, verify effective resolution at the actual placed size; a nominal DPI value
   without placed dimensions is not sufficient.
5. Preserve aspect ratio, units, legends, uncertainty, and captions.
6. Record why relevant-looking assets were excluded rather than silently dropping them.

Do not enlarge a low-resolution figure simply to fill a column. Re-export it, redraw it natively,
or choose a different composition.

### D.2 Native Typst versus inline SVG

Keep exact and editable information native in Typst:

- titles, authors, affiliations, body copy, citations, and contacts;
- numbers, units, legends, axis labels, table cells, and annotations;
- claim boundaries, limitations, stop rules, and accessibility descriptions;
- simple bars, rules, grids, timelines, callouts, and process geometry.

Inline SVG is appropriate for complex **non-semantic** visual fields that would be awkward to draw
with many `place` calls: a waveform silhouette, map texture, halftone field, abstract topology,
background pattern, or decorative illustration. Embed it directly when no separate asset file is
useful:

```typst
#let visual-svg = bytes(
  "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1200 500\">" +
  "<rect width=\"1200\" height=\"500\" fill=\"#102F36\"/>" +
  "<path d=\"M0 270 C160 40 320 470 480 220 S820 30 1200 250\" " +
  "fill=\"none\" stroke=\"#F2C14E\" stroke-width=\"34\"/></svg>"
)

#image(visual-svg, width: 100%)
```

Do not bake authoritative text, exact values, labels, or a scientific chart into decorative SVG
merely to simplify placement. The native Typst layer must still communicate the evidence if the
decorative visual is removed. Add a concise caption or description for any substantive figure.

## Step E: Author in Typst

### E.1 Preserve package structure

Start from the nearest local example and replace content within the package's public API. Do not
copy the package internals into the project or invent a parallel local fallback unless the package
is demonstrably unable to meet the brief.

#### peace-of-posters

```typst
#import "@preview/peace-of-posters:0.6.0" as pop
#show: pop.a1-poster
#pop.set-theme(pop.uni-fr)

#pop.title-box("Title", subtitle: "Specific claim", authors: "...", institutes: "...")
#columns(2, [
  #pop.column-box(heading: "Question")[...]
  #colbreak()
  #pop.column-box(heading: "Result", stretch-to-next: true)[...]
])
#pop.bottom-box()[Contact · source · visible demo or limitation note]
```

For custom canvases, set the physical page, define a package layout dictionary, and call
`pop.set-poster-layout(...)` as shown in the three-column and visual-first demos.

#### placard

```typst
#import "@preview/placard:0.1.0": card, placard
#show: placard.with(
  title: "Title",
  authors: ("Author One", "Author Two"),
  paper: "a1",
  num-columns: 2,
  scaling: 1.20,
  colors: (accent: rgb("#234B45"), title: rgb("#22312E")),
  footer: (content: [Contact · source]),
)

#card(title: "Question")[...]
#card(title: "Primary result")[...]
```

Use `flipped: true`, `scheme: "dark"`, and three columns only when the content and reading path
support them. Scaling is a final fit control, not a substitute for editing.

#### pollux

```typst
#import "@preview/pollux:0.1.0": *
#set-theme(steel-blue)
#set page("a0", margin: 0cm)
#set-poster-layout(layout-a0)

#title-box("Title", authors: "...", institutes: "...")
#box(inset: 2cm)[#columns(2, [
  #column-box(heading: "Question")[...]
  #colbreak()
  #column-box(heading: "Evidence")[...]
])]
```

Package-owned text styles may request unavailable fonts. Treat warnings as a visual-review task,
not as harmless console noise.

#### pasquino

```typst
#import "@preview/pasquino:0.1.0": poster, section
#set page(footer: [Compact verified footer])
#show: poster.with(
  title: [Title],
  authors: ("Author One", "Author Two"),
  info: ([Affiliation], [Study contract]),
  theme: "green",
)

#section(title: "Question")[...]
#section(title: "Evidence")[...]
```

Place page-level settings before `show: poster.with(...)`; page configuration inside the package's
body container is invalid.

#### postercise Better Poster

```typst
#import "@preview/postercise:0.2.0": *
#import themes.better: *
#set page(width: 24in, height: 18in)
#show: theme.with(
  primary-color: rgb("#43375B"),
  background-color: rgb("#F7F2E9"),
  accent-color: rgb("#F2B27F"),
)

#poster-content[
  #poster-header[Context and study contract]
  #focus-box[One large, bounded result]
  #poster-footer[Interpretation, release, and limitation]
]
```

The Better Poster center field should remain the page's dominant conclusion. If methods, references,
or figures require equal prominence, select another theme or package rather than weakening the
composition into three generic columns.

### E.2 Content hierarchy

Recommended order of visual weight:

1. Primary result, decision, or research question.
2. Title and short claim-level subtitle.
3. Defining evidence: figure, comparison, table, or key metric.
4. Method and sample details required to interpret the result.
5. Limitations, unsupported claims, and decision/stop rule.
6. Authors, affiliations, citations, acknowledgments, contact, and QR code.

Academic labels such as “Introduction,” “Methods,” and “Results” are optional. Prefer headings that
state the section's job or conclusion when the source supports them: “The queue has a signature,”
“Evidence that could change the decision,” or “What the pilot supports.”

### E.3 Tables and charts

- Show units and denominators next to values.
- Use direct labels where practical; do not rely on color alone.
- Use three-line tables or light row rules instead of dense full-grid borders.
- Highlight the decision-relevant comparison, not every cell.
- Include uncertainty, exclusions, and sample size near the result.
- Keep the visual and its interpretation in the same reading region.
- Use native Typst geometry for simple bars and timelines; use a verified figure for complex plots.

### E.4 Typography and color

Choose physical sizes from paper dimensions and viewing distance. A0, A1, 75 × 100 cm, and
24 × 18 inch posters cannot share one fixed pixel or point minimum. As a starting range, many A0/A1
posters use roughly 24–40 pt body text and substantially larger headings, but the rendered distance
test is authoritative.

- Limit the hierarchy to a small number of clearly distinct roles.
- Avoid justified text when it creates rivers or stretched word spacing in narrow columns.
- Verify every package-requested font and the actual fallback used by Typst.
- Use one dominant field color, one supporting neutral, and one or two semantic accents.
- Reserve status colors for stable meanings such as benefit, caution, failure, or comparison.
- Do not decorate every card differently; repeated geometry should reveal the information system.

## Full-canvas composition without forced equal columns

### The actual rule

The **page**, not every column, must feel complete. A complete page has a deliberate lower-edge
resolution and no accidental void that reads as missing content. Valid lower-edge resolutions
include:

- a footer or full-width decision band;
- aligned final evidence or conclusion regions;
- a visual field, background plane, or image continuing to the edge;
- a clearly framed quiet zone in an asymmetric billboard composition;
- a baseline or rule that visually closes the page while the preceding whitespace remains
  deliberate.

The following are **not** universal requirements:

- every column reaching the same y-coordinate;
- every final card using the same height;
- `stretch-to-next: true` in all columns;
- filling quiet space with references, logos, decorative icons, or repeated prose;
- increasing padding until the page appears occupied.

### Recomposition sequence

When the bottom feels unfinished, work in this order:

1. Confirm that required evidence, limitations, citations, and contact material are not missing.
2. Give the primary result or figure more useful area.
3. Move complete semantic sections between columns.
4. Change column ratios, column count, or page orientation.
5. Merge short related sections or split an overlong section at a semantic boundary.
6. Use the package's meaningful stretch option on a final region that can genuinely own the space.
7. Add or strengthen a footer, decision band, or continuing visual field.
8. Adjust gaps and padding modestly.
9. Reduce type only after the composition is sound and the distance test still passes.

If the layout still requires filler, the template or narrative route is wrong.

### Package-specific lower-edge tactics

- `peace-of-posters`: use `stretch-to-next` selectively on a substantive final box, or close with
  `bottom-box`.
- `placard`: rely on coherent card rhythm and its footer; columns may have different internal ends.
- `pollux`: keep the package boxes, but use a verified in-flow or full-width bottom band when its
  optional footer would be pushed to a second page.
- `pasquino`: use paired editorial sections and a compact page footer; framed quiet space is valid.
- `postercise`: preserve the central full-height focus field; the narrow interpretation rail may
  intentionally begin lower on the page.

## Step F: Compile, inspect, and validate

### F.1 Compile the active entry

For a project or prepared workspace:

```bash
python3 ${SKILL_DIR}/scripts/typst_compiler.py WORKSPACE --entry main.typ --format pdf
python3 ${SKILL_DIR}/scripts/typst_compiler.py WORKSPACE --entry main.typ --format png --ppi 144
python3 ${SKILL_DIR}/scripts/typst_quality_checker.py WORKSPACE --entry main.typ --expected-pages 1
python3 ${SKILL_DIR}/scripts/validate_project.py WORKSPACE --entry main.typ --mode quick
```

For a standalone scenario example:

```bash
typst compile demo.typ output.pdf
typst compile demo.typ output-full.png --ppi 72
typst compile demo.typ output-thumbnail.png --ppi 16
```

The package downloader may need network access on the first build. Pin the complete preview version
and ensure it is cached for reproducible or offline delivery.

### F.2 Verify exactly one physical page

A PNG exporter that demands a `{p}` output pattern has detected multiple pages. A second blank or
footer-only page is still a blocker. Find the overflowing element; do not simply discard the extra
page. Typical causes include:

- a footer placed after already-full columns;
- a fixed-height bottom band that exceeds the remaining page height;
- a font fallback with wider or taller metrics;
- an oversized table, unbreakable image, or late vertical spacer;
- page configuration applied inside a package container.

### F.3 Full-size review

Inspect the highest practical render and verify:

- no clipped glyphs, hidden rows, cropped legends, or text beneath the footer;
- body text and citations remain readable at intended print scale;
- figures are sharp and captions are attached to the correct visual;
- all values, units, labels, and colors match the source ledger;
- the title and primary result have sufficient contrast;
- columns follow a clear reading path;
- the lower edge is deliberate and not an accidental empty strip;
- font warnings have been resolved or explicitly reviewed against the rendered fallback.

### F.4 Thumbnail review

At roughly 12–20 PPI or overview scale, verify:

- the primary result or question is obvious before body text is read;
- title, result, and final decision form a coherent visual path;
- the page is not a uniform wall of similarly weighted boxes;
- one column does not appear abandoned;
- quiet space reads as a framed design choice, not missing content;
- footer or lower visual field visibly closes the composition.

Repeat compile and visual review after every meaningful typography, geometry, figure, or font
change. A source-only review is not sufficient for poster delivery.

## Quality gates

### P0: blocker

- More or fewer than one physical page.
- Any clipped, overlapping, off-canvas, or footer-obscured content.
- Invented, unsourced, or mislabeled claim, value, citation, author, affiliation, logo, or link.
- Missing primary result, limitation, required figure, required logo, or contact route.
- Unreadable body text or evidence at the intended viewing distance.
- Broken image, missing glyph, or unreviewed font fallback that changes the design materially.
- Accidental bottom void or stranded region that makes the page look unfinished.

### P1: review required

- Primary result is not distinguishable at thumbnail size.
- Dense equal-weight boxes obscure the reading path.
- Figure labels, units, uncertainty, or captions are separated from the visual.
- Color is the only carrier of meaning.
- Tables use cramped full-grid styling or contain more detail than the decision needs.
- A stretched final region contains little real content.
- Negative space is present but lacks a framing field, grid, or compositional purpose.
- Package font or bibliography warnings have not been inspected in the output.

### P2: refinement

- Improve heading wording from generic paper labels to claim- or job-based language.
- Align repeated rules, card insets, baselines, and caption spacing.
- Reduce decorative color variation and strengthen semantic accent consistency.
- Replace complex `place` mosaics with one non-semantic inline SVG visual field where that improves
  maintainability without hiding information.
- Tighten acknowledgments and references while keeping required citations legible.

## Common failures

| Failure | Likely cause | Correct response |
|---|---|---|
| Footer appears on page 2 | Main flow already consumes the page | Shorten/reallocate content or integrate a bottom band inside the remaining page field |
| All columns are equal but the poster feels padded | Equal-height rule was applied mechanically | Remove empty stretch; let a meaningful footer, field, or asymmetric rail close the page |
| One column looks abandoned | Missing section, weak allocation, or no framing field | Restore evidence, move a complete section, enlarge a real figure, change ratios, or frame the quiet zone |
| Body suddenly wraps differently | Package font is unavailable | Install the documented font or review and retune with the actual fallback |
| Visual-first poster is inaccessible | Labels and facts were baked into SVG | Move authoritative text and data back into native Typst; keep SVG non-semantic |
| Better Poster becomes three generic columns | Central conclusion was weakened by method text | Restore billboard focus or choose a conventional package |
| Dense table dominates the result | Paper table was copied without editorial reduction | Keep decision-relevant rows/columns and link to the full source |
| Page is full but unreadable | Density was solved by shrinking type | Remove secondary material, enlarge the primary evidence, or change canvas/template |

## Quick Mode defaults

When the user requests fast poster generation and provides no design preferences:

- obey the venue size; otherwise start with A1 portrait for a conventional research poster;
- use `peace-of-posters` for a flexible two-column route;
- switch to `postercise` only when one clear quantitative conclusion can dominate the page;
- use a restrained light field, dark title/result color, and one semantic accent;
- build the route as question → method contract → primary evidence → interpretation → limitation →
  decision/contact;
- keep all exact information native in Typst and use inline SVG only for non-semantic visual fields;
- close the canvas with a meaningful footer, final result region, or continuing visual field;
- compile to exactly one page and review both full-size and thumbnail renders before delivery.
