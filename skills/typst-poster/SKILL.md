---
name: typst-poster
description: Create or improve a one-page academic, research, public-evidence, or Better Poster artifact in Typst using reviewed poster templates and exact physical-output checks.
---

# Typst Poster

Compose this Skill with Typst Authoring. A poster is one physical document page, not a slide deck.

## Entry Mode

- `create`: create or improve a conference poster, research poster, public evidence board,
  field-study summary, or Better Poster. Run the shared workspace intent gate before writing.

## Workflow

1. Confirm the audience, viewing distance, physical size, orientation, required evidence, assets,
   citations, logos, and delivery formats. Preserve all claims, numbers, authors, and affiliations.
2. If the user named a reviewed entry, query that entry directly once with
   `template.list({query: "<entry id>", limit: 5})`. Otherwise read
   `_shared/scenarios/poster/index.json`, choose one entry whose declared paper and orientation
   match the brief, then make the same single bounded query. Inspect the exact returned
   `tylina:scenario/poster/...` spec; do not list the whole category before or afterward.
3. For an evidence-heavy research poster, imported assets, variants, or another genuinely complex
   composition, also read
   `typst-slides/references/seaslides/references/scenarios/poster.md`; resolve its
   `templates/scenarios/poster` paths as `_shared/scenarios/poster`. A straightforward one-page
   poster does not need that extended reference.
4. Materialize it with `template.create`, author the returned entrypoint, and select
   that relative entrypoint with `document.setMain`. Preserve the reviewed package API and
   useful design language instead of rebuilding it locally.
5. Build one clear result or question at thumbnail scale, readable evidence at viewing distance,
   and an intentional lower edge. Do not fill space with unsupported content or global shrinking.
6. Validate exactly one physical page. Render and inspect full size plus a thumbnail; verify paper
   dimensions from the render summary, plus overflow, typography, charts, captions, citations,
   and asset provenance. Creating a poster means an editable Typst document, not an implicit
   exported artifact; call an export tool only when the user explicitly requests an export.
   Template README compile commands document upstream development only; do not run them. Use
   Tylina validation and rendering so the current main and visible preview are verified together.
   For one final page revision, request one render summary and render that page once at review
   size and once at thumbnail size. Re-render only after the source changes; do not repeat an
   unchanged template query, validation, page, and PPI combination.

For an optional upstream helper, resolve the upstream reference's scripts directory to
`<skillsRoot>/typst-slides/scripts`, read `typst-slides/scripts/TYLINA.md`, and keep all work
inside the current workspace. Prefer Tylina MCP validation, rendering, and main-file selection.

## Non-negotiables

- Produce exactly one deliberate physical poster page unless the user changes the deliverable.
- Keep evidence and reader-visible text in editable Typst content, not flattened imagery.
- Never invent claims, measurements, citations, affiliations, logos, or contact routes.
- Inspect the real-size page and thumbnail; compilation alone is insufficient.
