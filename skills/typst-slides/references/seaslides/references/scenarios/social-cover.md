# Scenario: Social Covers and Cards (Typst)

Use this workflow for social covers, article headers, thumbnails, share squares, vertical stories,
and same-ratio card sequences. Treat the artifact as a fixed-canvas publication graphic, not a
shortened presentation deck.

The authoritative Typst canvas definitions live in
[`../../scripts/config.py`](../../scripts/config.py). Follow
[`../shared-standards.md`](../shared-standards.md) for general source, asset, compilation, and
delivery rules. The ready-to-copy implementations live in
[`../../templates/scenarios/social-cover/`](../../templates/scenarios/social-cover/README.md).

This workflow adapts useful planning and composition ideas from the
[Guizang social-card skill](https://github.com/op7418/guizang-social-card-skill) and the social
canvas model in PPT Master, but SeaSlides dimensions, build commands, project structure, and
quality gates remain authoritative here.

## Contents

1. [Scenario contract](#scenario-contract)
2. [Route the deliverable](#route-the-deliverable)
3. [Run the end-to-end workflow](#run-the-end-to-end-workflow)
4. [Build a content system](#build-a-content-system)
5. [Plan a card sequence](#plan-a-card-sequence)
6. [Choose the exact canvas](#choose-the-exact-canvas)
7. [Define safe zones](#define-safe-zones)
8. [Rewrite titles across ratios](#rewrite-titles-across-ratios)
9. [Choose a visual stance](#choose-a-visual-stance)
10. [Compose the whole vertical page](#compose-the-whole-vertical-page)
11. [Select a layout recipe](#select-a-layout-recipe)
12. [Handle images](#handle-images)
13. [Treat screenshots as evidence](#treat-screenshots-as-evidence)
14. [Use generated imagery safely](#use-generated-imagery-safely)
15. [Implement in Typst](#implement-in-typst)
16. [Build multiple ratios](#build-multiple-ratios)
17. [Compile exact outputs](#compile-exact-outputs)
18. [Run visual and factual QA](#run-visual-and-factual-qa)
19. [Correct problems proportionally](#correct-problems-proportionally)
20. [Deliver and record provenance](#deliver-and-record-provenance)
21. [Quick Mode defaults](#quick-mode-defaults)
22. [Non-negotiables](#non-negotiables)

## Scenario contract

- Keep `.typ` as the editable source of truth. Do not introduce a YAML, TOML, or JSON content
  layer merely to populate the graphic.
- Author one fixed canvas or a sequence whose pages all share exactly one canvas. A deliberately
  paired preview may contain independently composed mixed-size pages, but production entries and
  automated QA should still be run once per canvas.
- Give every additional ratio its own entry and composition. Shared copy, tokens, and assets are
  welcome; shared coordinates are not.
- Do not require Touying, slide masters, speaker notes, transitions, or presentation pacing.
- Preserve every factual claim, name, number, date, quotation, screenshot state, and call to
  action. Social compression is not permission to invent or exaggerate.
- Keep audience-facing copy free of production labels such as `page 1`, `social cover`, `draft`,
  `placeholder`, or prompt instructions.
- Compile and inspect every exported page. A successful Typst compile proves syntax, not design.
- Approve at both full output size and feed size. A page can look balanced at 1242 px and fail at
  360 px.
- Make the entire canvas feel resolved through the lower edge. Do not leave an accidental blank
  bottom band. This does not require every column, card, or module to have equal height.

### Divide responsibility across the reference systems

Use the local references as complementary layers instead of treating one repository as a template
to copy wholesale.

| Reference | Take from it | Do not import blindly |
|---|---|---|
| [`local/guizang-social-card-skill`](../../../../local/guizang-social-card-skill/SKILL.md) | Content-first hook design, editorial and Swiss identity tests, recipe selection, atmosphere with a communicative job, and lower-edge resolution | Platform-specific implementation, licensed source code, or decorative motifs detached from their content job |
| [`local/ppt-master` canvas formats](../../../../local/ppt-master/skills/ppt-master/references/canvas-formats.md) | Exact social canvases, ratio-specific reading direction, safe-zone thinking, and the rule that same ratio does not mean the same coordinate system | PowerPoint Master/Layout metadata or 16:9 coordinates |
| [`local/ppt-master` image-layout catalog](../../../../local/ppt-master/skills/ppt-master/references/image-layout-patterns.md) | Full-bleed title fields, side-image fields, negative-space covers, image bands, image-as-canvas overlays, and deliberate crop/contrast decisions | Pattern-ID coverage for its own sake or an unavailable image treated as a placeholder frame |
| [`local/ppt-master` visual review](../../../../local/ppt-master/skills/ppt-master/references/visual-review.md) | Full-size inspection, collision and contrast checks, focal-point/centroid review, and a separate thumbnail pass | Its SVG/PPTX-specific export mechanics |
| SeaSlides themes and scenario demos | Palette, type roles, reusable components, Typst APIs, compile commands, and verified fixed-canvas implementations | Touying runtime or slide coordinates in a non-deck artifact |

The practical sequence is: derive the content job with Guizang-style reasoning, choose the
canvas and image relationship with PPT Master-style planning, adapt a mature SeaSlides visual
system, then compile and judge the actual social output. A reference is successful only when the
result still works after its style name is removed.

## Route the deliverable

Classify the request before writing copy.

| Deliverable | Structure | Communication job | Typical output |
|---|---|---|---|
| Cover or thumbnail | One page | Stop the scroll and make one accurate promise | PNG, optional PDF |
| Article header | One wide page | Establish subject and tone without becoming a mini article | PNG |
| Share square | One square page | Preserve the core object and action at small scale | PNG |
| Carousel or card set | Several pages at one ratio | Move from hook to explanation, evidence, and action | Ordered PNGs plus PDF |
| Story or vertical cover | One 9:16 page | Work inside interface-safe top, bottom, and side zones | PNG |
| Cross-platform family | Sibling entries, one per ratio | Preserve the message while recomposing hierarchy | Separate builds |

A cover normally contains one hook, one supporting cue, and optional identity metadata. It is not
the article abstract. A carousel can carry a fuller argument, but each card must advance one idea
or one audience move.

Do not use a carousel merely because the platform supports swiping. Use several pages when the
reader benefits from sequence: problem to explanation, claim to evidence, before to after, or
steps to action.

## Run the end-to-end workflow

### 1. Prepare the project and source

Reuse the current SeaSlides project when one exists. Otherwise initialize a project through the
normal project manager. Keep original source material under `sources/`; never overwrite it during
conversion.

Convert PDF, DOCX, PPTX, spreadsheet, or URL input with the standard source tools before extracting
hooks. Preserve links, captions, page references, and asset provenance alongside the converted
text.

Choose an explicit scenario entry such as `social-cover.typ`. Use one entry for a same-ratio
carousel. Use sibling entries such as `wechat-header.typ` and `wechat-square.typ` for mixed ratios.

### 2. Resolve only artifact-changing decisions

Lock these items before layout:

- deliverable type, platform, and exact dimensions;
- page count only when the user or platform requires it;
- required names, dates, logos, handles, calls to action, and legal text;
- brand palette, type restrictions, and forbidden treatments;
- asset route: supplied, sourced, generated, screenshot-led, or type-led;
- language variants and whether each needs a separate composition;
- required delivery formats and naming convention.

Bundle genuine blockers into one question. In Quick Mode, use the defaults near the end of this
file and record assumptions instead of asking a long style questionnaire.

### 3. Audit source truth

Create a small fact ledger before writing social copy.

| Item | Exact source-backed value | Source location | Allowed rewrite | Risk |
|---|---|---|---|---|
| Main claim | Verbatim meaning | Page, URL, or user message | Shorten without changing scope | High |
| Number | Value, unit, denominator, period | Table, figure, or record | Preserve definition | High |
| Quote | Speaker and context | Transcript or article | Paraphrase unless exact wording matters | High |
| Feature state | Product/version/date | Screenshot or release note | State visible behavior only | High |
| Identity | Name, title, handle, logo | Approved source | Preserve spelling and marks | Medium |
| Call to action | Destination and label | Approved URL or brief | Shorten label, not destination | Medium |

If a number cannot be defined, omit it. If a screenshot does not prove the stated feature, do not
use it as proof. If a source conflict remains, show the conflict to the user rather than choosing
the more promotional value.

### 4. Compress before composing

Use the compression ladder in [Build a content system](#build-a-content-system). Do not pour a full
article into a fixed canvas and then solve overflow with smaller type.

### 5. Plan page roles and assets

Write a page plan with audience moves, not only topics. Pair every evidence page with the exact
asset or source it needs. Decide the crop, quiet zone, and screenshot treatment before authoring.

### 6. Choose a visual stance and recipe

Select Editorial, Swiss/system-led, image-led, or brand-led as a communication stance. Then select
a recipe for each page role. Avoid repeating `title + three cards` across the whole set.

### 7. Author the smallest coherent build

Build the cover and one representative dense page first. Compile them with the longest real title,
longest label, and actual font. Fix the system before filling every page.

### 8. Compile, inspect, and revise

Export at the exact target dimensions. Inspect full size, feed size, and as a sequence. Run at least
one measured correction pass for a new design.

## Build a content system

### Use a five-level compression ladder

Start from the complete source and compress in this order:

1. **Core claim** — one accurate sentence the complete set must preserve.
2. **Viewer promise** — what the reader will understand, verify, or be able to do after swiping.
3. **Section map** — usually four to eight ideas; fewer for a cover-only request.
4. **Page hooks** — short, concrete lines that carry one audience move each.
5. **Body fragments** — only the words needed to explain the visual or evidence on that page.

The card set is a visual outline, not the full article. Put context that does not need to be on the
image in the accompanying post, caption, or linked source.

### Write plain, consequential hooks

Prefer verbs, results, tensions, mistakes, or decisions:

- what changed for the user;
- what to do or avoid;
- what a number means;
- what the common misconception misses;
- what becomes easier, safer, faster, or more reliable;
- what the reader can verify in the next pages.

Avoid vague labels such as `Background`, `Introduction`, `Solution`, `Insights`, or `New Feature`
unless the page genuinely needs that framing. `Why the square needs a new title` is stronger than
`Cross-platform design` because it states the consequence.

### Separate the hook from support

Use three copy levels:

| Level | Job | Typical length |
|---|---|---|
| Display hook | Carries the page at feed size | One to four short lines |
| Support line | Clarifies object, scope, or promise | One sentence |
| Metadata | Orients source, issue, page, date, or identity | A few compact labels |

If the support line merely repeats the display hook, delete it. If metadata competes with the hook,
reduce its contrast or remove it.

### Add semantic line breaks

Insert breaks at phrase boundaries. Keep the verb with its object and a number with its unit. Do
not let automatic wrapping isolate a particle, punctuation mark, unit, brand suffix, or one-letter
English word.

Test the longest likely translation. Chinese and English versions need separate line-break and
spacing decisions even when they share a grid.

For a short CJK serif display hook, inspect the actual rendered font before accepting default
spacing. If two to eight large glyphs look cramped, test a small positive `tracking` value around
`0.02em-0.06em`; longer lines usually need less. Keep body copy at normal spacing, and do not copy
the same value onto bold sans or mono text. When CJK and italic Latin form one title, give the two
phrases an explicit gap of roughly `0.25em-0.35em` instead of relying on a typed space.

## Plan a card sequence

Use a sequence table before writing Typst:

| Page | Role | Audience move | Hook or claim | Evidence | Recipe | Asset and safe-zone note |
|---:|---|---|---|---|---|---|
| 1 | Hook cover | Stop | Strongest source-backed promise | Optional cue | Cover | Protect title and subject |
| 2 | Problem or context | Recognize | Concrete tension | Scene, quote, or fact | Essay or scene | Keep context readable |
| 3 | Explanation | Understand | One mechanism | Diagram or short fragments | Pipeline or split | One path only |
| 4 | Evidence | Believe | One defined claim | Screenshot, table, or comparison | Evidence feature | Proof remains legible |
| 5 | Application | Act | What to do next | Checklist or example | Ledger or checklist | Keep action verbs visible |
| N | Close | Remember | Summary, question, or action | Source and identity | Closing note | Resolve the lower edge |

Useful page roles include:

- hook cover;
- embodied problem or scene;
- misconception versus reality;
- one big number with definition;
- screenshot evidence;
- comparison or before/after;
- checklist or buying guide;
- three-to-five-step pipeline;
- pull quote or thesis;
- section divider for a long sequence;
- closing summary, question, or action.

Five to nine pages is a useful planning range for a substantial carousel, not a quota. Let the
source determine length. Merge two weak pages; split one overloaded page; do not pad to a fashionable
count.

### Build rhythm across the set

For a seven-page set, aim for at least four or five distinct shapes. Alternate dense and quiet
pages, type and evidence, wide blocks and stacked rows. Do not place two full-bleed image covers
back-to-back; after a strong image page, give the eye a text, evidence, or structured page.

Keep recurring orientation elements stable: issue row, page number, category, source label, and
footer position. Stable metadata makes varied layouts feel like one publication.

## Choose the exact canvas

Use the named Typst formats in `scripts/config.py` unless the user or platform specifies another
exact size.

| Format key | Typst page | Ratio | Typical use |
|---|---:|---:|---|
| `xiaohongshu` | 1242 pt × 1660 pt | 3:4 | Cover or same-ratio carousel |
| `square` | 1080 pt × 1080 pt | 1:1 | Moments, share square, social post |
| `story` | 1080 pt × 1920 pt | 9:16 | Story or vertical video cover |
| `wechat` | 900 pt × 383 pt | 2.35:1 | WeChat article header |

For a requested landscape banner, declare the exact requested width and height directly rather
than silently substituting a presentation format. A 1920 × 1080 banner and a 1920 × 1080 slide may
share dimensions but still have different safe zones, content hierarchy, and delivery semantics.

At 72 PPI, one Typst point maps to one output pixel. Therefore a 1242 pt × 1660 pt page produces a
1242 px × 1660 px PNG. Use 72 PPI for platform delivery; use a higher PPI preview only when you
intentionally need a larger raster.

Platform requirements override presets. If the user specifies 1080 × 1440, author that exact
canvas instead of substituting 1242 × 1660 because both are 3:4.

## Define safe zones

Safe zones protect essential copy, faces, logos, product proof, handles, and calls to action. A
background field, photograph, or texture may bleed to the edge.

Use these conservative starting points, then verify in the actual platform preview:

| Canvas | Starting safe zone | Common overlay risk |
|---|---|---|
| Xiaohongshu 3:4 | 7–9% left/right, 6–8% top, 8–12% bottom | Feed crop, account chrome, action area |
| Square 1:1 | 7–9% on all sides; reserve more at bottom for UI | Share preview and action row |
| Story 9:16 | 10% top, 18–20% bottom, 10% right | Account header, reply field, side controls |
| WeChat header 2.35:1 | 5–7% left/right | Small preview crop and title collision |

Treat these as starting guides, not universal platform law. Do not put a face or CTA exactly on a
guide line. Give essential elements their own breathing room.

Keep safe-zone values as named tokens. For example:

```typst
#let canvas = (width: 1242pt, height: 1660pt)
#let safe = (x: 96pt, top: 108pt, bottom: 150pt)
```

## Rewrite titles across ratios

Cross-platform work is recomposition, not cropping. Preserve the core object, action, result, or
number while changing line count and hierarchy.

### Derive the short title

Start from the accurate long title and try these routes in order:

1. **Verb plus object** — remove setup and modifiers.
2. **Object plus change** — keep the thing and what happened to it.
3. **Number-led** — keep a meaningful number and its object.
4. **Two-clause cut** — retain only the clause that carries the promise.
5. **One strong noun or verb** — use only when the surrounding metadata restores context.

For a Chinese square title, four to ten characters or two short lines is a useful target, not a
hard limit. Meaning and recognizability come first. For English, prefer two to six stressed words
and intentional line breaks.

Example:

```text
Wide title: Design for the ratio, not for the crop
Square hook: Recompose the message
Support: One promise. A new hierarchy for every ratio.
```

Do not copy the full wide title into the square and shrink it. Do not crop the wide artboard. Do not
let the square become a logo plus unreadable sentence.

### Audit title quality

- Does the shortened line still identify the core object?
- Does it preserve the source claim without adding certainty or hype?
- Can it be read at approximately 360 px preview width?
- Are line breaks semantic?
- Does the support line restore necessary context without repeating the title?
- Does each ratio look intentionally composed when viewed beside its siblings?

### Audit text flow, not only font size

Treat wrapping, column rhythm, and empty space as part of the copy edit. A card can use generous
type and still fail because its sentences break badly or its paragraphs have been forced into an
artificial layout.

- Give prose paragraphs natural-height rows or a normal `stack`. Do not assign one `1fr` row to
  every paragraph merely to fill the column; that turns continuous reading into isolated text
  islands. Reserve equal flexible rows for genuinely parallel cards, stages, or time slots.
- Read every rendered line. Rewrite or add an intentional `linebreak()` when a wrap strands a
  short CJK fragment, punctuation mark, unit, particle, or half of a mixed-language phrase.
- In a narrow rail, add real inset after an accent bar, rule, or panel edge. A visible stroke is not
  padding; confirm that two-digit markers, opening quotation marks, and first glyphs remain intact.
- If secondary copy disappears at feed size, first widen its measure, shorten the sentence, raise
  contrast, or simplify the hierarchy. A global font-size increase is only one possible repair.
- Let unused height become intentional quiet space only when it is held between meaningful
  anchors. A pull quote, decision follow-up, evidence caption, or closing strip is preferable to
  stretching unrelated paragraphs apart.

Review the full-resolution render for exact line endings, then review the same page around 360 px
wide for hierarchy. Both views must pass; full-size legibility does not excuse a feed-size rail that
visually vanishes.

## Choose a visual stance

Style is a communication stance, not a rigid topic classifier. The same technical subject can be
Editorial when it needs authored depth or Swiss when it needs system clarity.

### Editorial

Use an authored hierarchy with serif or Songti display type, paper or ink atmosphere, strong image
wells, marginal notes, pull quotes, rules, folios, and captions. Editorial does not mean adding a
serif font to a generic card grid. It needs at least one real editorial structure: photo well,
ledger, marginalia column, pull quote, essay split, or controlled atmosphere layer.

Good uses:

- cultural, field-note, travel, craft, food, or human stories;
- nuanced product or research essays;
- supplied documentary photography;
- a thesis that benefits from deliberate quiet space.

#### Light Editorial and marginalia

A light page is not a low-contrast page. Build it from warm paper, decisive ink, one restrained
accent, and a clear publication structure.

- Let one large photograph occupy roughly half the active page when imagery is the subject. Put
  the title above or beside the image when the photo has no safe quiet zone.
- Pair Chinese serif display type with italic Latin only when the two parts form one phrase. The
  italic word is rhythmic emphasis, not a style sticker.
- Use fine rules, folios, captions, and issue metadata to establish publication order; keep them
  small enough to remain secondary but dark enough to survive export.
- A marginalia page needs two genuine reading speeds: a main essay or evidence column and a narrow
  column containing useful schedule, source, caption, or observation notes. Empty sidebars fail.
- Resolve the lower edge with a caption, closing thought, image continuation, or issue strip. Do
  not leave a large white tail merely because the upper half already looks elegant.
- Keep paper atmosphere subtle. Grain and fibers should be felt at full size and nearly disappear
  at feed size; they must not become a visible wallpaper pattern.

### Swiss or system-led

Use a strict underlying grid, sans-serif hierarchy, large light-weight display type, one accent
color, hairlines, straight modules, explicit numbering, and disciplined alignment. The grid does
not need to be drawn across the background; show rules only when they organize content or encode a
diagram. Avoid default shadows, inflated rounded cards, dashboard ornament, and several competing
accent colors.

Good uses:

- releases, tools, workflows, systems, comparisons, and checklists;
- screenshot-led product evidence;
- short instructional sequences;
- type-led covers with strong structure.

### Image-led

Use the image as the composition. Map the subject and quiet zone first, then place restrained copy.
The crop must change by ratio. A photo is not a background afterthought and should not carry text
where its detail, face, or product feature makes reading unsafe.

### Brand-led or expressive

Use approved brand color, type, logos, illustration, and repeatable graphic devices. Preserve the
brand system without turning every element into a logo-shaped decoration. If brand assets are
missing, do not fabricate them.

### Identity tests

An Editorial page should not be only flat cream, mono labels, and a serif headline. A Swiss page
should not be a bold sans title inside rounded SaaS cards. If the design still reads the same after
removing the claimed style label, strengthen the actual structure rather than adding ornaments.

## Compose the whole vertical page

Portrait social canvases expose under-filled layouts. A 16:9 slide composition copied into 3:4
often becomes a thin band with an abandoned lower quarter.

### Use vertical zones

For a 1242 × 1660 card, plan these zones as a diagnostic model:

| Zone | Approximate share | Role |
|---|---:|---|
| Header and metadata | 5–8% | Category, issue, page, date |
| Display title and lead | 18–30% | Hook and promise |
| Evidence or main body | 40–55% | Image, screenshot, ledger, comparison, or diagram |
| Closing or consequence | 8–15% | Takeaway, CTA, caption, or issue strip |
| Footer and safety | 4–8% | Identity, source, page number, platform clearance |

Not every page needs five visible bands. The model exists to reveal where the reading path stops.

### Resolve the lower edge without mechanical fill

The complete page must feel designed through the bottom. An empty lower band with no purpose is a
failure. Resolve it with real content or structure:

- a conclusion, consequence, or action;
- a large evidence image or screenshot;
- a caption or source band;
- a continuing background field or crop;
- stable identity and page metadata;
- deliberate alignment between upper and lower anchors;
- a semantically rich module that can legitimately grow.

Do **not** require every column or card to fill mechanically. Unequal internal heights are valid.
Do not stretch a short reference row into an empty panel, inflate padding, enlarge decorative
shapes, or invent prose merely to occupy space.

As diagnostics, active composition around 75–78% of the height is usually healthy for a dense 3:4
card, and an unexplained blank band larger than roughly 15% deserves revision. These are review
triggers, not quotas. A thesis page can be intentionally airy when top, middle, and bottom anchors
make the pause obvious.

### Recognize under-filled smells

Revise when:

- the lower 20–25% is empty and has no footer, image field, or intentional pause;
- a short table occupies only the middle third;
- a screenshot is small even though it is the proof;
- four list items are rendered as tiny rows above a large void;
- body copy is vertically centered with no upper or lower anchor;
- a footer floats far below content with no visual relationship;
- every page uses the same shallow `title + cards` structure.

## Select a layout recipe

Use the matrix to route content. The recipe codes are local planning shorthand, not required Typst
APIs.

### Editorial recipe matrix

| Code | Recipe | Best for | Minimum meaningful content |
|---|---|---|---|
| M01 | Issue cover | Carousel opening | Hook, cue or image, bottom issue strip |
| M02 | Field-note photo | Place, object, hardware, observation | One evidence photo, caption, takeaway |
| M03 | Essay split | Nuanced explanation | Title plus two or three short fragments |
| M04 | Pull quote or thesis | One core sentence | Thesis, context/source, top and bottom anchors |
| M05 | Checklist or buying guide | Practical advice | Four to six consequential rows |
| M06 | Evidence wall | Several screenshots or references | Readable grid plus interpretation |
| M07 | Closing note | Final summary | Takeaway, four to six substantive rows, closing block |
| M08 | Tall ledger | Roles, pros/cons, capabilities | Four to six full-height rows |
| M09 | Atmospheric thesis | Sparse but important point | Large thesis, one or two notes, visible field |
| M10 | Evidence feature | One decisive screenshot or photo | Large proof, headline, caption band |
| M11 | Marginalia essay | Moderate explanatory text | Main column plus real marginal evidence |
| M12 | Section divider | Mid-sequence pause | Section name, promise, issue metadata |
| M13 | Hero question | Closing or pivot | Short question, prompt, top/bottom anchors |
| M14 | Vertical pipeline | Three-to-five-step process | Step title and one-line consequence per step |
| M15 | Before and after | Old/new or misconception/reality | Two comparable states with matched fields |
| M16 | Image-led cover | One excellent photograph | Subject map, restrained title, identity cue |

### Swiss recipe matrix

| Code | Recipe | Best for | Minimum meaningful content |
|---|---|---|---|
| S01 | Accent cover | Product, method, release, or system opening | One hook, system cue, metadata strip |
| S02 | Two signals | Two sources, options, or directions | Two matched modules and one explicit difference |
| S03 | Data layer | File, state, memory, or source of truth | One object plus three or four properties |
| S04 | Interface frame | UI, interaction, or output layer | One readable interface and two or three functional cues |
| S05 | Trap rows | Problems and anti-patterns | Three consequential warning rows |
| S06 | Pipeline | Workflow or layered architecture | Three stages with action and consequence |
| S07 | Takeaway ledger | Final page or operational summary | Thesis plus three substantive ledger rows |
| S08 | Image hero | One strong photo, object, or product render | Large asset, overlay title, two or three defined cues |
| S09 | KPI tower | Three or four comparable measures | Defined numbers, units, proportional encoding |
| S10 | Horizontal bars | Five to ten ranked items | Real or normalized values and consistent scale |
| S11 | Stacked ledger | Quantified inventory or expense rollup | Four to six number-label rows |
| S12 | Matrix and hero stat | Capability inventory | Eight to twelve cells and one supported total |

### Recipe: type-led cover

Use M01 or S01 when no image is needed for meaning.

1. Put a compact issue or category row in the top safe zone.
2. Give the display hook the largest optical mass.
3. Add one supporting line only when it clarifies scope.
4. Use one graphic field, rule, index, or accent to connect the middle and lower page.
5. Close with identity, page metadata, or a promise of what follows.

Do not scatter several decorative pills around an otherwise empty canvas.

### Recipe: tall ledger or checklist

Use M05 or M08 for an Editorial list. In Swiss, use S05 for warning rows, S07 for a closing
takeaway ledger, or S11 when every row is genuinely quantified.

- Give each row a number or category, a direct title, and a consequence or example.
- Let row height respond to content while maintaining a stable rhythm.
- Use rules and alignment before rounded containers.
- If there are only two or three short items, switch to a thesis, split, or comparison recipe.
- If there are more than six dense items, split the page rather than shrinking type.

### Recipe: vertical pipeline

Use M14 or S06 for three to five steps. Each step needs a verb-led title and one explanatory line.
Connect the steps with alignment, a rail, or numbering; avoid a complicated flowchart when the path
is linear. Six or more steps should become two pages or a condensed phase map.

### Recipe: before and after

Stack states vertically on 3:4 unless the content is short enough for balanced side-by-side fields.
Use identical labels and evidence types so the comparison is fair. Dim the earlier state through
contrast, not unreadable opacity. State what changed and what remained constant.

### Recipe: evidence feature

Give the screenshot, photograph, or chart 45–65% of the active page when it is the proof. Place one
claim above or beside it and two or three interpretation points below. Do not shrink the evidence
to make room for explanatory prose that belongs in the caption.

### Recipe: pull quote, thesis, or question

Airy pages need anchors. Use a small top kicker, one large statement, a source or prompt near the
bottom, and a rule or issue strip. Intentional quiet space is valid; an unanchored void is not.

## Handle images

### Qualify the asset before layout

Record:

- subject and focal point;
- face, hand, product feature, or text that must not be covered;
- quiet zones and low-detail bands;
- crop tolerance by ratio;
- minimum useful resolution;
- intended role: atmosphere, evidence, identity, or illustration;
- source, creator, license, and required attribution.

Reject an image as a text background when it has no stable quiet zone or when the only copy area
crosses the subject.

### Map the subject and crop

Choose crop and `fit` intentionally:

- use `cover` for a photographic field only after selecting a focal position;
- use `contain` when the complete image, diagram, UI, or captioned evidence matters;
- use a framed image when the subject fills the source and leaves no safe text region;
- re-crop for every ratio; do not inherit the wide crop in portrait or square.

Never distort aspect ratio. Do not let automatic center crop remove a face, hand, title, chart
label, hardware control, or product state.

### Try no mask first

Place text in a genuine quiet zone. If contrast fails, use a localized, image-toned tint near the
copy. Avoid a default full-canvas black gradient that flattens the photograph. Keep the subject
unmasked and inspect at thumbnail size.

When no safe area wider than roughly one third of the canvas exists, move the title outside the
image, use a smaller image well, or build a diptych. Do not make text fight the photograph.

### Use recurring image treatment consistently

If a set uses framed documentary photos, keep frame stroke, corner logic, captions, and crop method
stable. If it uses full-bleed images, do not switch randomly to floating SaaS cards. Variation
should come from page role, not inconsistent asset styling.

## Treat screenshots as evidence

Clean the source before styling it. Remove accidental desktop background, partial neighboring
windows, notification fragments, cursor trails, irrelevant browser tabs, and status chrome unless
that chrome is the subject.

### Default screenshot contract

- Preserve the screenshot orthographically: no perspective, tilt, skew, or 3D mockup unless the
  user explicitly requests a scene.
- Use `contain` by default so interface labels remain visible.
- Use `cover` only when the cropped pixels are irrelevant or the user requests a hero crop.
- Allocate enough area for the proof to be read at output size.
- Add one concise callout rather than shrinking the full UI beside a paragraph.
- Use straight padding and a quiet stage. Device chrome is optional, not mandatory.
- Use the same treatment for before/after screenshots.

Typst pattern:

```typst
#let screenshot(path, caption: none) = block(
  width: 100%,
  fill: rgb("#E9ECEF"),
  inset: 28pt,
)[
  #image(path, width: 100%, height: 620pt, fit: "contain")
  #if caption != none {
    v(18pt)
    text(size: 24pt, fill: rgb("#5E6875"), caption)
  }
]
```

Do not use an AI-generated interface as evidence. If the real screenshot is unavailable, use a
labeled schematic and state that it is illustrative.

## Use generated imagery safely

Generated imagery may supply atmosphere, a conceptual illustration, texture, or a missing
non-factual scene. It must not fabricate:

- product UI or release state;
- metrics, charts, maps, dashboards, or test results;
- testimonials, people presented as real users, or documentary events;
- logos, certificates, publications, tickets, receipts, or evidence screenshots;
- text that the audience may mistake for verified source content.

Keep prompts role-specific and request no embedded text or logos. Store the prompt and generation
route with asset provenance. Inspect hands, faces, product geometry, unwanted text, watermarks, and
crop suitability before use.

Prefer type-led design when an image would be decorative rather than explanatory.

## Implement in Typst

### Start from a reviewed demo

Use the local demo catalog when it fits:

| Demo | Canvas | Pattern |
|---|---:|---|
| [`guizang-magazine`](../../templates/scenarios/social-cover/guizang-magazine/README.md) | 1242 × 1660, one page | Editorial field-note cover with an inline-SVG atmosphere and lower observation ledger |
| [`guizang-swiss`](../../templates/scenarios/social-cover/guizang-swiss/README.md) | 1080 × 1080, four pages | Accent cover, trap rows, timed pipeline, and decision-ledger close |
| [`indie-bookstore`](../../templates/scenarios/social-cover/indie-bookstore/README.md) | 900 × 383 + 1080 × 1080 | Separately composed RISO WeChat header and share square |
| [`editorial-grid`](../../templates/scenarios/social-cover/editorial-grid/README.md) | 1080 × 1350, one page | Publication cover with a dark semantic rail and four-step reading sequence |
| [`pritzker`](../../templates/scenarios/social-cover/pritzker/README.md) | 1242 × 1660, one page | Architecture cover with an axonometric SVG field and a resolved lower conclusion zone |
| [`newspaper`](../../templates/scenarios/social-cover/newspaper/README.md) | 900 × 383, one page | Brutalist press header with a three-question editorial sidebar |
| [`guizang-field-journal`](../../templates/scenarios/social-cover/guizang-field-journal/README.md) | 1242 × 1660, one page | Light photo-editorial journal with a large image well, asset provenance, and resolved closing note |
| [`guizang-marginalia`](../../templates/scenarios/social-cover/guizang-marginalia/README.md) | 1242 × 1660, one page | Warm-paper long-form essay with a functional marginal schedule and closing strip |

Each example is `template.typ + demo.typ + README.md`. Copy the complete leaf directory.
`template.typ` owns the visual system and fixed-canvas page functions; `demo.typ` owns sample copy
and sequence. No package manifest or external data layer is required.

The example names match the mature local theme families they adapt from. Reuse their hierarchy and
component logic, not the 16:9 slide coordinates or Touying runtime.

### Define the canvas and tokens explicitly

```typst
#set page(
  width: 1242pt,
  height: 1660pt,
  margin: 0pt,
  numbering: none,
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 30pt)
#set par(leading: 0.2em)

#let color = (
  paper: rgb("#F4F1E8"),
  ink: rgb("#141C2B"),
  muted: rgb("#687080"),
  accent: rgb("#2458F5"),
  rule: rgb("#AEB4BE"),
)

#let space = (
  safe-x: 96pt,
  safe-top: 108pt,
  safe-bottom: 150pt,
  gap: 30pt,
)
```

Keep palette, type, spacing, rules, and reusable components above the page content. Use semantic
names rather than a scatter of inline RGB values.

### Build a full-page shell

```typst
#let social-page(
  body,
  background: color.paper,
) = rect(
  width: 100%,
  height: 100%,
  fill: background,
  inset: 0pt,
)[
  #block(
    width: 100%,
    height: 100%,
    inset: (
      left: space.safe-x,
      right: space.safe-x,
      top: space.safe-top,
      bottom: space.safe-bottom,
    ),
  )[#body]
]
```

Use `grid`, `stack`, `block`, and `align` for the main composition. Use `place` only for deliberate
overlays, fixed metadata, or full-bleed fields. An absolutely placed footer must not collide with
growing body content.

### Put complex non-semantic art in inline SVG

Do not assemble a poster illustration from dozens of page-level `place` calls. When a visual field
contains many paths, folds, contour lines, registration marks, or diagram segments, define it once
as SVG and render it through `image(bytes(...))`:

```typst
#let atmosphere-svg = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 1242 1660'><rect width='1242' height='1660' fill='#F1EEE5'/><path d='M680 1500C760 1240 720 960 980 640' fill='none' stroke='#B94B37' stroke-width='12'/></svg>"

#place(
  top + left,
  image(bytes(atmosphere-svg), width: 100%, height: 100%, fit: "stretch"),
)
```

SVG is the visual layer, not the content layer. Keep titles, labels, numbers, evidence, sources, and
calls to action as Typst content. Do not hide editable copy inside SVG paths or `<text>` nodes. A
schematic SVG must not impersonate a real map, screenshot, chart, or measured result.

Choose the smallest authoring layer that preserves both appearance and meaning:

| Need | Preferred layer | Reason |
|---|---|---|
| Safe zones, columns, rules, cards, and simple geometric fields | Typst `grid`, `stack`, `block`, `line`, and basic shapes | Layout remains inspectable and content-responsive |
| Contour atmosphere, paper grain, RISO registration, architectural linework, path-heavy diagrams | One template-owned inline SVG rendered with `image(bytes(...))` | Complex vector geometry stays coherent and avoids dozens of page-level `place` calls |
| Titles, labels, quotations, metrics, sources, UI copy, and calls to action | Native Typst content | Copy remains editable, searchable, accessible to review, and fact-auditable |
| Real photographs, screenshots, or approved generated illustrations | Local image asset with provenance | The asset is evidence or imagery, not reconstructed decoration |
| Data-bearing diagram | Typst labels and values over a reusable SVG or Typst skeleton | Geometry may be reusable; exact information must remain explicit and verifiable |

Do not flatten the entire card into one SVG merely because Typst can embed SVG. A good default is
one full-canvas atmosphere/diagram placement plus normal-flow Typst content. Add another overlay
only when it has a distinct compositional job and cannot be expressed clearly in the main grid.

### Create small semantic helpers

```typst
#let kicker(body) = text(
  size: 22pt,
  weight: "semibold",
  tracking: 1.5pt,
  fill: color.accent,
  body,
)

#let display(body, size: 126pt) = text(
  size: size,
  weight: "light",
  fill: color.ink,
  body,
)

#let footer(left, right) = [
  #line(length: 100%, stroke: 1.5pt + color.rule)
  #v(18pt)
  #grid(
    columns: (1fr, auto),
    text(size: 22pt, fill: color.muted, left),
    text(size: 22pt, fill: color.muted, right),
  )
]
```

Helpers should express repeated visual semantics. Do not build a component abstraction for every
one-off coordinate.

### Author same-ratio sequences directly

```typst
#social-page[
  #kicker[DESIGN SYSTEM · 01]
  #v(70pt)
  #display[DESIGN FOR\ THE RATIO]
  #v(1fr)
  #footer[SEASLIDES][01 / 03]
]

#pagebreak()

#social-page[
  // Evidence or explanation page at the same 1242 × 1660 canvas.
]
```

Use `v(1fr)` only when the page has meaningful top and bottom anchors and the flexible region is
part of the composition. Do not use it to hide an otherwise unexplained missing lower half.

### Manage fonts deterministically

Check the build environment before relying on a face:

```bash
typst fonts | rg 'IBM Plex Sans|Noto Sans SC|Noto Serif SC'
```

Specify fallbacks explicitly for mixed scripts. Compile the longest CJK line, bold face, numeral,
punctuation, and English product name. Missing-font warnings require a visual check; a produced PDF
does not prove the intended metrics rendered.

### Keep assets local

Store approved images and screenshots under `assets/`. Use stable relative paths. Record external
source and license details in an asset manifest. Do not make final builds depend on remote image
URLs.

## Build multiple ratios

Use one entry per canvas:

```text
project/
├── assets/
├── social-tokens.typ
├── xhs-carousel.typ
├── wechat-header.typ
└── wechat-square.typ
```

`social-tokens.typ` may share palette, font families, rules, and metadata helpers. Each entry owns
its page dimensions, title wording, line breaks, crop, safe zones, and layout.

Production builds should treat each ratio as a sibling artifact because the SeaSlides compiler and
quality checker validate one canvas at a time. A direct Typst demo may emit a mixed-size WeChat pair
for side-by-side review, as `indie-bookstore/demo.typ` does; before delivery, export and verify each
page at its own dimensions and keep ratio-specific filenames.

For a WeChat pair:

- write the accurate long header title first;
- derive a short square title through the compression rules;
- reposition or re-crop imagery independently;
- build each entry separately;
- create a comparison preview only after both individual artifacts pass.

## Compile exact outputs

For a 1242 × 1660 carousel:

```bash
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project> --all --ppi 72 --entry xhs-carousel.typ
python3 ${SKILL_DIR}/scripts/typst_quality_checker.py <project> --expected-pages <N> --entry xhs-carousel.typ --json output/xhs-audit.json
```

For sibling mixed-ratio entries, compile one at a time and preserve the outputs before compiling
the next entry, or use sibling project directories with separate `output/` folders.

The PNG dimensions must equal the Typst point dimensions at 72 PPI. Verify with an image metadata
tool rather than trusting the filename.

PDF is useful for sequence review and archive. PNG is the primary social delivery artifact. Create
PPTX only when the user explicitly requests it and accepts that fixed-canvas effects may not remain
fully editable.

## Run visual and factual QA

### Check dimensions, page count, and sequence

- exact pixel dimensions for every PNG;
- expected page count with no missing or accidental blank page;
- stable ordered filenames;
- one ratio only within each build;
- no crop or scale difference caused by a wrong PPI;
- no repeated cover or duplicated page.

### Check full-size rendering

Inspect the overview, then every page PNG at full resolution. Verify:

- no overflow, clipping, collision, or text touching an edge;
- intentional line breaks and complete glyph rendering;
- readable evidence, labels, sources, and calls to action;
- preserved faces, product features, and screenshot state;
- stable rules, alignment, spacing, and metadata;
- sufficient contrast without a heavy default overlay;
- one clear focal point and one audience move per page;
- a lower edge that feels resolved, not abandoned.

Do not approve from the overview alone; it can hide small text and crop defects.

### Check feed size

View each page around 360 px wide. The display hook, number, object, or subject must still be clear.
Body copy may invite zoom, but the main promise cannot. If the title requires effort, shorten it
before shrinking supporting elements.

### Run a four-band composition check

Mentally divide a portrait page into four horizontal bands. Mark each as:

- **active** — contains text, evidence, image, rule, or a meaningful field;
- **intentional quiet** — supports a hero statement, image breathing, or platform-safe area and is
  anchored by the surrounding composition;
- **accidental empty** — has no communicative or compositional role.

Any accidental empty lower band fails. An unexplained void larger than roughly 15% of the canvas
requires revision. Do not convert a small overflow into a large blank area during correction.

This check evaluates the whole page, not whether every internal column reaches the same baseline.

### Check factual integrity

Compare every claim and page against the fact ledger:

- names, spelling, dates, version numbers, units, denominators, and time periods;
- quote wording and attribution;
- screenshot state and feature claims;
- chart or table labels and sources;
- destination and visible label of links or QR codes;
- page-to-page consistency;
- long and short title equivalence across ratios.

### Check style coherence

- one visual stance across the set;
- one Swiss accent, if Swiss;
- actual Editorial structure, if Editorial;
- no random decorative blobs, stickers, nested cards, or excessive rounding;
- image and screenshot treatment consistent with the selected stance;
- no page that looks like a generic presentation slide placed on a tall canvas.

### Check assets and privacy

- local file exists and has sufficient resolution;
- aspect ratio preserved;
- source, license, creator, and attribution recorded;
- no unintended face, notification, private account, browser tab, path, or document metadata;
- generated imagery clearly non-evidentiary;
- no watermark, unwanted generated text, or fake logo.

## Correct problems proportionally

Measure before editing. Use this ladder:

| Problem | First correction | Escalation |
|---|---|---|
| Title wraps poorly | Rewrite or insert semantic break | Reduce size modestly, then change recipe |
| Small local overflow | Tighten one local gap or inset | Shorten one support line |
| Moderate overflow | Compress fragments and nonessential metadata | Move to a higher-capacity recipe |
| Large overflow | Split the page or reduce scope | Replan sequence |
| Thin ledger | Increase meaningful row depth and consequences | Switch to thesis, split, or evidence recipe |
| Small screenshot | Remove adjacent prose and enlarge proof | Give screenshot its own page |
| Empty lower band | Add real conclusion, evidence, caption, or footer anchor | Change recipe or merge pages |
| Heavy image mask | Move copy into a quiet zone | Local tint, new crop, or framed image |
| Square title too small | Derive a shorter hook | Recompose square from scratch |

Change one measured cause per render pass when practical. Rebuild and inspect after every structural
change. Do not globally shrink type to solve a single page.

## Deliver and record provenance

Deliver:

- editable `.typ` entries and any shared token module;
- final ordered PNGs at exact dimensions;
- PDF sequence when useful;
- local asset directory and source/license manifest;
- assumptions, package/font requirements, and known limitations;
- a note identifying every sibling ratio and its independently written title.

Name files predictably, for example:

```text
xhs-01-cover.png
xhs-02-problem.png
xhs-03-evidence.png
xhs-04-close.png
wechat-header.png
wechat-square.png
```

State the verification performed: dimensions, page count, full-size review, feed-size review,
source check, and any device or platform preview.

## Quick Mode defaults

When the user requests a fast social graphic without specifying platform or style:

1. Produce one Xiaohongshu cover at 1242 × 1660.
2. Derive one accurate hook from the supplied source or topic.
3. Use a type-led composition when imagery is not required for meaning.
4. Choose Swiss/system-led for structured or product content and Editorial for authored or
   atmospheric content; do not ask unless the choice materially changes the request.
5. Start from the closest demo in `templates/scenarios/social-cover/`.
6. Export PNG and PDF at 72 PPI.
7. Inspect at full size and approximately 360 px wide.
8. Make at least one correction pass and report assumptions.

Quick Mode reduces discovery and iteration count. It does not waive source truth, exact dimensions,
compilation, or visual review.

## Non-negotiables

- Keep `.typ` as the editable authoring source.
- Use the requested or configured dimensions exactly.
- Use one canvas per production QA run and recompose every additional ratio. A mixed-size pair is
  acceptable only as an explicit preview/export convenience with each page verified separately.
- Write one accurate hook for a cover and one audience move per content card.
- Shorten and rewrite before shrinking display type.
- Preserve source truth; never invent evidence, product states, metrics, or testimonials.
- Give images a mapped subject and crop; never cover a face or essential feature.
- Treat screenshots as legible evidence, not decoration.
- Make the complete page feel resolved through the lower edge without forcing every internal module
  to equal height or adding filler.
- Inspect every page at full size and feed size.
- Deliver source, exact exports, and asset provenance together.
