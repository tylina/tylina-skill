---
name: typst-poster
description: Create or improve a one-page academic, research, public-evidence, or Better Poster artifact in Typst using reviewed poster templates and exact physical-output checks.
---

# Typst Poster

Compose this Skill with Typst Authoring. A poster is one physical document page, not a slide deck.

## Entry Mode

- `create`: create or improve a conference poster, research poster, public evidence board,
  field-study summary, or Better Poster. The shared workspace intent gate owns mutation scope.

## Domain Information

- A poster is normally one deliberate physical page, governed by paper size, orientation, viewing
  distance, and the amount of evidence that remains readable at that distance.
- Claims, measurements, citations, authors, affiliations, logos, and contact routes must remain
  source-backed. Reader-visible text and evidence stay editable rather than flattened into images.
- Continue an existing poster scaffold when present. Reviewed candidates are indexed at
  `_shared/scenarios/poster/index.json`; use `template.list`, `template.inspect`, and
  `template.create` for the chosen exact entry.
- The extended SeaSlides poster reference is useful for evidence-heavy research posters, imported
  assets, variants, or genuinely complex compositions, not for every one-page poster.
- A clear result or question should survive thumbnail viewing; supporting detail must remain
  readable at the intended physical viewing distance. Global shrinking is not an overflow fix.

## Adaptive Workflow

1. Establish audience, viewing distance, physical size, orientation, evidence, assets, citations,
   logos, and requested delivery formats.
2. Continue an existing poster scaffold. Otherwise select and inspect one exact reviewed entry
   from `_shared/scenarios/poster/index.json`, materialize its complete workspace, and select the
   returned entrypoint through `document.setMain`.
3. Read the extended poster reference only for evidence-heavy research, imported assets, variants,
   or another genuinely complex composition.
4. Preserve the template's supported API and design language while replacing sample content with
   source-backed, editable material.
5. Establish the primary result or question at thumbnail scale, then fit supporting evidence for
   the intended physical viewing distance without global shrinking.
6. Validate the physical dimensions and one-page contract, inspect full-size and thumbnail views,
   and export only the requested formats.

## Verification Information

Use the render summary to verify physical dimensions and page count. Inspect the page both at a
readable size and as a thumbnail for overflow, typography, charts, captions, citations, contrast,
asset provenance, and an accidental empty lower edge. Export only when requested.

## Progressive Resources

- Reviewed templates: `_shared/scenarios/poster/index.json`.
- Complex poster composition:
  `typst-slides/references/seaslides/references/scenarios/poster.md`.
