# Image Acquisition — Shared Framework

## Overview

This document defines the shared dispatch mechanism for image acquisition. Both paths (AI generation and web search) inherit these rules.

## Path Dispatch

For each row in the Image Resource List (§V of `content_design_spec.md`):

| Status | Acquire Via | Action | Success Status |
|--------|-------------|--------|----------------|
| `pending-generation` | `ai` | Load `image-generator.md`; use an available host image-generation capability | `ready` |
| `pending-generation` | `web` | Load `image-searcher.md`; use `image.search` and `image.import` | `ready` |
| `ready` | `user` | Already provided by user | — |
| `ready` | `placeholder` | Skipped, Executor uses placeholder | — |

**Lazy loading**: An all-web deck never reads `image-generator.md`. An all-AI deck never reads `image-searcher.md`. Only load what's needed.

## Resilience Rules

1. **Never halt on failure**: Image acquisition failures MUST NOT stop the pipeline. Mark as `Needs-Manual` and continue.
2. **Retry deliberately**: Change a failed search query or generation prompt only when the new intent is explicit.
3. **Terminal states**: `ready`, `Needs-Manual` — no row should remain `pending-generation` after the image step.

## Verification Phase

After all rows processed:
- [ ] Every non-placeholder row has a file in `project/assets/` OR is `Needs-Manual`
- [ ] No `pending-generation` rows remain
- [ ] Every sourced image records its work page, author, license, and required attribution

## Handoff

| From | To | Artifacts |
|------|-----|-----------|
| Strategist | Image roles | `content_design_spec.md` §V (resource list) |
| Image roles | Executor | Image files in `assets/` + reviewed source and attribution notes |

The Executor embeds only reviewed files that already exist in the canonical workspace.

## Credits — Single Source of Truth

Keep license and attribution beside the corresponding row in `content_design_spec.md` and render
the required credit with the image. Do not hide the only copy in private metadata or speaker notes.

For `attribution-required` images, the Executor renders inline credits per `image-searcher.md` §6.

## Image Usage Enforcement Rules

The following table defines WHEN images are required in the slide deck. This is enforced during the Strategist phase (Step 4) and verified during Quality Review (Step 7.4).

| Condition | Requirement | Action |
|-----------|-------------|--------|
| Source materials contain relevant or user-required images | **MUST** use the images that support the narrative or that the user requires | Extract → inspect → copy selected images to `assets/` → reference in `main.typ` |
| Non-academic presentation with no source images | **Use when the design specification gives the image a concrete explanatory, evidentiary, or atmospheric job** | Search only for assets with a planned page role; do not add filler |
| Academic presentation | **Optional** | Images enhance but are not required; focus on content/data |
| User explicitly says "no images" / "text only" | **Skip** | Respect user preference; do not force images |

### Source Image Workflow (from imported PDFs/documents)

Use `document.import` for a PDF or Office source and inspect its receipt and warnings. Only treat
an image as imported when the command actually publishes that resource. Inspect available images,
copy or create an explicitly selected asset under `assets/`, then reference it from `main.typ` with
an explicit width or height. If the importer reports an omitted image, preserve that limitation
rather than inventing a filename or silently substituting a search result.

### Enforcement During Quality Review

During Step 7.4 (Code Quality Review), verify:
- Non-academic decks use relevant imagery where it materially improves explanation, atmosphere, or evidence
- All source-material images referenced in the design spec are actually used
- No `pending-generation` rows remain unresolved

## Related Documents

- `image-generator.md` — AI generation path
- `image-searcher.md` — Web search path
- `strategist.md` §h — Where acquisition method is decided
