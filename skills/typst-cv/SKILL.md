---
name: typst-cv
description: Create or improve truthful, editable professional resumes and academic CVs in Typst using reviewed templates, real source material, and document-level visual and extraction checks.
---

# Typst CV

Compose this Skill with Typst Authoring. A CV is a print document, not a slide deck.

## Entry Mode

- `write`: create or improve a professional resume, student resume, research-industry CV, or
  academic CV. Run the shared workspace intent gate first. Preserve existing authored content by
  default; a populated source may be continued, explicitly overwritten, or left intact while a
  distinct entry is created and selected through `document.setMain`.

## Workflow

1. Establish the target role or application, document type, allowed length, language, and supplied
   evidence. Never invent dates, credentials, metrics, publications, affiliations, or skills.
2. Read `_shared/scenarios/cv/index.json`. If the user named one of its reviewed entries, use that
   entry directly. Otherwise choose from its declared metadata. Query only that template with
   `template.list({query: "<entry id>", limit: 5})`, then inspect the exact returned spec;
   do not list the full CV category or infer an API from a name or screenshot.
3. For an ordinary one-page CV, continue with this workflow. Read the extended
   `typst-slides/references/seaslides/references/scenarios/cv.md` only for an academic or
   multi-page CV, imported source material, variants, or another genuinely complex case. In that
   reference, resolve `templates/scenarios/cv` as `_shared/scenarios/cv`.
4. Materialize the selected template with `template.create`. Use its returned
   destination and entrypoint; do not transcribe the demo or claim that inspection applied it.
   Treat the materialized demo as the version-matched API reference. Do not search outside the
   workspace, packaged Skills root, or exact imported package version to rediscover its API.
5. Replace sample facts in that entrypoint with verified user material while preserving the
   package's documented API and design language. Keep editable facts and ordering in Typst source,
   not YAML or generated code. Do not add hidden keywords or invisible text. If an API requires
   precision the evidence does not provide, use source-native Typst layout inside the template
   instead of inventing it. Never encode a year-only date as an arbitrary month or day. If a
   package heading requires `datetime`, do not probe it with a fictional date. Reproduce the row
   with the template's typography and a visible year string. For
   `simple-technical-resume`, keep `resume.with` and `custom-title`, but replace
   `work-heading` / `education-heading` with a direct grid such as:

   ```typst
   #custom-title(section-title)[
     #grid(columns: (1fr, auto),
       role-and-organization, year-range)
     #achievement-content
   ]
   ```
6. Select the entrypoint with `document.setMain({file: "<entrypoint>"})`, validate it, render
   every page, and inspect links and page flow. A request to
   create a CV means an editable Typst document, not an implicit PDF deliverable. Do not call an
   export tool or create a PDF unless the user explicitly requests an export or PDF; only then
   check extracted PDF text order. Report unresolved facts, fonts, packages, page count, and the
   checks actually completed.

If a SeaSlides helper is useful, the upstream reference's scripts directory means
`<skillsRoot>/typst-slides/scripts`. Read `typst-slides/scripts/TYLINA.md` first and use the
current workspace only. Tylina MCP validation, rendering, and main-file selection remain primary.

## Non-negotiables

- Keep `.typ` files as the editable source of truth; do not default to a YAML-first CV system.
- Preserve approved personal data and source truth. Never add fabricated or hidden content.
- Prefer a clear logical reading order unless the application explicitly favors a visual layout.
- Compile and inspect every page; compilation alone does not prove readable layout or extraction.
