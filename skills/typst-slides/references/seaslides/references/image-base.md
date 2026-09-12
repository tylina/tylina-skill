# Image Acquisition — Shared Framework

## Overview

This document defines the shared dispatch mechanism for image acquisition. Both paths (AI generation and web search) inherit these rules.

## Path Dispatch

For each row in the Image Resource List (§V of `content_design_spec.md`):

| Status | Acquire Via | Action | Success Status |
|--------|-------------|--------|----------------|
| `pending-generation` | `ai` | Load `image-generator.md`, run `image_gen.py` | `ready` |
| `pending-generation` | `web` | Load `image-searcher.md`, run `image_search.py` | `ready` |
| `ready` | `user` | Already provided by user | — |
| `ready` | `placeholder` | Skipped, Executor uses placeholder | — |

**Lazy loading**: An all-web deck never reads `image-generator.md`. An all-AI deck never reads `image-searcher.md`. Only load what's needed.

## Resilience Rules

1. **Never halt on failure**: Image acquisition failures MUST NOT stop the pipeline. Mark as `Needs-Manual` and continue.
2. **Retry once**: On first failure, retry with broadened parameters (simplified query for web, alternative backend for AI).
3. **Terminal states**: `ready`, `Needs-Manual` — no row should remain `pending-generation` after the image step.

## Verification Phase

After all rows processed:
- [ ] Every non-placeholder row has a file in `project/assets/` OR is `Needs-Manual`
- [ ] No `pending-generation` rows remain
- [ ] Manifest files exist (`image_prompts.json` for AI, `image_sources.json` for web)
- [ ] All `attribution-required` images have credit metadata in manifest

## Handoff

| From | To | Artifacts |
|------|-----|-----------|
| Strategist | Image roles | `content_design_spec.md` §V (resource list) |
| Image roles | Executor | Image files in `assets/` + manifest JSON(s) |

The Executor does NOT invoke generation/search scripts. It reads the resource list and manifest to embed images.

## Credits — Single Source of Truth

License/attribution data lives ONLY in `project/assets/image_sources.json`. Do NOT place credits in:
- Speaker notes (TTS would read them aloud)
- Separate "credits" slides (unless explicitly requested)
- Hidden metadata fields

For `attribution-required` images, the Executor renders inline credits per `image-searcher.md` §6.

## Image Usage Enforcement Rules

The following table defines WHEN images are required in the slide deck. This is enforced during the Strategist phase (Step 4) and verified during Quality Review (Step 7.4).

| Condition | Requirement | Action |
|-----------|-------------|--------|
| Source materials contain relevant or user-required images | **MUST** use the images that support the narrative or that the user requires | Extract → inspect → copy selected images to `assets/` → reference in `main.typ` |
| Non-academic presentation with no source images | **Use when the design specification gives the image a concrete explanatory, evidentiary, or atmospheric job** | Use `image_search.py` only for assets with a planned page role; do not add filler |
| Academic presentation | **Optional** | Images enhance but are not required; focus on content/data |
| User explicitly says "no images" / "text only" | **Skip** | Respect user preference; do not force images |

### Source Image Workflow (from imported PDFs/documents)

When `pdf_to_md.py --images filtered` extracts images from source materials:

1. **Extract**: Images are saved to `sources/` directory during PDF conversion
2. **Inventory**: Run `source_inventory.py` to catalog extracted images with layout hints
3. **Copy to assets**: Copy relevant images to `<project_path>/assets/` so they can be referenced in slides
4. **Reference in main.typ**: Use `#image("assets/filename.png", width: 80%)` or source path `#image("sources/figure_p3_0.png", height: 1fr)`

```bash
# Step 1: Extract images during conversion
python3 ${SKILL_DIR}/scripts/source_to_md/pdf_to_md.py source.pdf --images filtered

# Step 2: Inventory extracted images
python3 ${SKILL_DIR}/scripts/source_inventory.py <project_path>/sources

# Step 3: Analyze images for content understanding
python3 ${SKILL_DIR}/scripts/analyze_images.py <project_path>/assets

# Step 4 (if web search needed): Search for supplementary images
python3 ${SKILL_DIR}/scripts/image_search.py "search query" \
    --filename result.jpg --orientation landscape \
    -o <project_path>/assets
```

### Enforcement During Quality Review

During Step 7.4 (Code Quality Review), verify:
- Non-academic decks use relevant imagery where it materially improves explanation, atmosphere, or evidence
- All source-material images referenced in the design spec are actually used
- No `pending-generation` rows remain unresolved

## Related Documents

- `image-generator.md` — AI generation path
- `image-searcher.md` — Web search path
- `strategist.md` §h — Where acquisition method is decided
