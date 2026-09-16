# Image Searcher Reference

## Contents

- [Core mission and pipeline context](#core-mission)
- [License tiers](#1-license-tier-system)
- [Provider boundary](#2-provider-boundary)
- [Exact queries](#3-exact-queries)
- [Tylina commands](#4-tylina-commands)
- [Review record](#5-review-record)
- [On-slide attribution](#6-on-slide-attribution)
- [Web search versus AI generation](#7-when-to-use-web-search-vs-ai-generation)
- [Failure handling](#8-failure-handling)
- [Related documents](#related-documents)

## Core Mission

Find reviewable Openverse candidates for each `Acquire Via: web` row, inspect the selected work
page and license, then import the bounded preview through Tylina. Use web search for real
photography, landmarks, historical images, and documentary visuals.

## Pipeline Context

| Previous Step | Current Step | Next Step |
|---|---|---|
| Strategist (§V Image Resource List) | **Image Searcher**: Search, review, import | Executor (embeds images in slides) |

---

## 1. License Tier System

Two-tier classification:

| Tier | Licenses | Downstream Impact |
|------|----------|-------------------|
| `public-domain` | CC0, Public Domain Mark | Prefer when attribution licenses are unacceptable |
| `adaptable` | CC0, Public Domain Mark, CC BY, CC BY-SA | Render and preserve required attribution |

**Auto-rejected** (never download): CC BY-NC, CC BY-NC-SA, CC BY-ND, CC BY-NC-ND, All Rights Reserved, Unknown.

---

## 2. Provider Boundary

`image.search` uses Tylina's fixed Openverse API boundary. The Skill does not collect provider
credentials, call arbitrary download URLs, or imply support for Pexels, Pixabay, or a hidden
fallback chain. Search results are discovery metadata; Openverse does not prove the cataloged
license is correct, so the selected work page must be reviewed before import.

---

## 3. Exact Queries

The Strategist's `Description` field is visual intent, not automatically a search query. Form one
concise query that preserves proper names and technical terms. Tylina sends it unchanged. If the
results fail, formulate and record a materially different query instead of silently rewriting it.

**Good reference descriptions** (Strategist writes these):
- "Offshore wind turbines at sunset, wide angle, documentary feel"
- "Dense Asian city skyline at night with neon signage"
- "Close-up of hands assembling electronics on workbench"

**Forbidden in queries**: Negative prompts (APIs search them literally), HEX color codes, style directives.

---

## 4. Tylina Commands

Call `image.search` with the exact query, an explicit license policy, and an aspect ratio only when
the layout requires it. Review a short list by relevance, dimensions, crop, creator, source page,
attribution, and license. Open the chosen source page before importing it.

```json
{
  "command": "image.search",
  "args": {
    "query": "offshore wind farm",
    "licensePolicy": "adaptable",
    "aspectRatio": "wide"
  }
}
```

Import the selected candidate by its exact ID. Tylina refetches current metadata and applies the
requested license policy, so the import does not depend on hidden search-session state:

```json
{
  "command": "image.import",
  "args": {
    "id": "candidate-id",
    "licensePolicy": "adaptable",
    "destination": "assets/cover-bg.jpg"
  }
}
```

Use `public-domain` when attribution licenses are unacceptable. Use `adaptable` only when CC BY or
CC BY-SA is acceptable in addition to CC0 and PDM. The destination must be new and its extension
must match the imported bytes.

---

## 5. Review Record

Keep the selected candidate's purpose, query, creator, work page, license URL and version,
attribution, dimensions, and final workspace path beside its row in `content_design_spec.md`.
Do not invent a private manifest as the only copy of this information. Search metadata is not proof
of legal reuse; preserve uncertainty when the work page is unavailable or contradictory.

---

## 6. On-Slide Attribution

For `attribution-required` images, render inline credit in Typst:

```typst
// Bottom-right, small, semi-transparent
#place(bottom + right, dx: -12pt, dy: -8pt,
  text(size: 7pt, fill: luma(150))[Photo: Jane Doe / Wikimedia Commons / CC BY 4.0]
)
```

**Rules:**
- Font size: 7-8pt, grey or semi-transparent
- Position: bottom-right of the image container (not the page)
- Format: `Photo: {author} / {source} / {license_short}`
- For full-bleed/hero: use scrim overlay + white semi-transparent text

---

## 7. When to Use Web Search vs AI Generation

| Use Case | Acquire Via |
|----------|-------------|
| Real photography (people, places, events) | `web` |
| Landmarks, geographic locations | `web` |
| Historical images, archival | `web` |
| Scientific/medical imagery | `web` |
| Abstract backgrounds, custom illustrations | `ai` |
| Brand-specific visuals, custom compositions | `ai` |
| Diagrams, infographics, data visualizations | `ai` |
| Stylized/artistic interpretations | `ai` |

> The Strategist decides per-image in §V. A single deck can mix both paths.

---

## 8. Failure Handling

Failures MUST NOT halt the pipeline:
1. Review the error and try one deliberately reformulated query when useful.
2. If no acceptable reviewed candidate exists, mark the item `Needs-Manual` and continue.
3. Never substitute an unreviewed URL or block the Executor from proceeding with available images.

---

## Related Documents

- `image-generator.md` — AI image generation path (complementary)
- `image-layout-patterns.md` — 72 layout patterns for placing images on slides
- `shared-standards.md` §2 — Page dimensions, image embedding syntax
- `strategist.md` §h — Image strategy selection (where `web` vs `ai` is decided)
