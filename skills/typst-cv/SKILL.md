---
name: typst-cv
description: Create or improve truthful, editable professional resumes and academic CVs in Typst using reviewed templates, real source material, and document-level visual and extraction checks.
---

# Typst CV

Compose this Skill with Typst Authoring. A CV is a print document, not a slide deck.

## Entry Mode

- `write`: create or improve a professional resume, student resume, research-industry CV, or
  academic CV. The shared workspace intent gate owns whether this edits the current document or
  creates a distinct artifact.

## Domain Information

- A resume and an academic CV differ in expected length, evidence density, publication detail,
  and audience. Use the user's target role or application rather than treating them as one format.
- Dates, credentials, metrics, publications, affiliations, and skills must come from supplied or
  verified material. Preserve the precision of a date; a year-only record must not acquire an
  invented month or day merely to satisfy a template API. A requested blank template may use
  clearly labeled fields, not fictional achievements presented as real.
- Keep reader-visible facts and ordering in canonical, editable workspace source. Preserve an
  existing data-driven scaffold when it is intentional, but do not impose a new YAML-first system
  merely for convenience. Hidden keywords and invisible text are not substitutes for truthful
  content or logical reading order.
- Continue a working CV scaffold when one exists. For a new scaffold, the reviewed candidates are
  indexed at `_shared/scenarios/cv/index.json`; use `template.list`, `template.inspect`, and
  `template.create` for the chosen exact entry. The materialized demo is the version-matched API
  example.
- Read the extended SeaSlides CV reference only for an academic or multi-page CV, imported source,
  variants, or another genuinely complex case.

## Adaptive Workflow

1. Establish the target role or application, resume or academic-CV form, useful length, language,
   and available evidence.
2. Continue a working scaffold. Otherwise select one reviewed entry from
   `_shared/scenarios/cv/index.json`, inspect its exact template, and materialize the complete
   result with the returned entrypoint.
3. Read the extended CV reference only when the document is multi-page, academic, source-imported,
   variant-heavy, or otherwise needs its deeper composition guidance.
4. Replace sample facts with verified material while preserving the selected design language and
   documented API. If the API demands unsupported precision, use a verified source-native row or
   another suitable template rather than inventing a value.
5. Select a newly created entrypoint through `document.setMain`, validate it, and inspect every
   page, link, wrap, and page break. Export only when requested. When the host exposes PDF text
   extraction, inspect reading order; otherwise report it as unverified. Report unresolved facts,
   fonts, packages, page count, and checks actually completed.

## Verification Information

Validate and inspect every affected page, links, line wrapping, page flow, and missing fonts.
Creating a CV means editable Typst source, not an implicit PDF. When PDF export is requested and
the host exposes text extraction, check reading order because a visually plausible multi-column
layout can read poorly. If extraction is unavailable, state that accessibility/ATS reading order
was not verified instead of inferring it from appearance.

## Progressive Resources

- Reviewed templates: `_shared/scenarios/cv/index.json`.
- Complex CV composition:
  `typst-slides/references/seaslides/references/scenarios/cv.md`.
