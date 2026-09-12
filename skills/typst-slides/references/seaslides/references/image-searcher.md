# Image Searcher Reference

## Contents

- [Core mission and pipeline context](#core-mission)
- [License tiers](#1-license-tier-system)
- [Providers](#2-providers)
- [Query simplification](#3-query-simplification)
- [CLI usage](#4-cli-usage)
- [Source manifest](#5-manifest-format-imagesourcesjson)
- [On-slide attribution](#6-on-slide-attribution)
- [Web search versus AI generation](#7-when-to-use-web-search-vs-ai-generation)
- [Failure handling](#8-failure-handling)
- [Related documents](#related-documents)

## Core Mission

Search openly-licensed web image providers and download the best match for each `Acquire Via: web` row in the image resource list. Complementary to AI generation — use web search for real photography, landmarks, historical images, and documentary visuals.

## Pipeline Context

| Previous Step | Current Step | Next Step |
|---|---|---|
| Strategist (§V Image Resource List) | **Image Searcher**: Query + download | Executor (embeds images in slides) |

---

## 1. License Tier System

Two-tier classification:

| Tier | Licenses | Downstream Impact |
|------|----------|-------------------|
| `no-attribution` | CC0, Public Domain, Pexels License, Pixabay Content License | Embed freely, no credit needed |
| `attribution-required` | CC BY, CC BY-SA | Must render inline credit on slide |

**Auto-rejected** (never download): CC BY-NC, CC BY-NC-SA, CC BY-ND, CC BY-NC-ND, All Rights Reserved, Unknown.

---

## 2. Providers

| Provider | Config | Best For |
|----------|--------|----------|
| **Openverse** | Zero-config | Aggregator (Wikimedia + Flickr + museums + rawpixel) |
| **Wikimedia Commons** | Zero-config | Educational, scientific, geographic, historical |
| **Pexels** | `PEXELS_API_KEY` | Modern stock photography, people, workplace |
| **Pixabay** | `PIXABAY_API_KEY` | Broad coverage (photos + illustrations) |

Default chain: openverse → wikimedia → pexels (if key set) → pixabay (if key set). Missing keys silently skipped.

---

## 3. Query Simplification

The Strategist's `Description` field is intent (free-form prose), NOT a search query. The script's `simplify_query` algorithm:

1. Strip HEX codes and parentheticals
2. Drop noise words (`professional`, `editorial`, `photo`, `background`, `ai`, `tech`, `platform`) when concrete nouns remain
3. Cap at 4 words
4. Fail-open: if filtering empties the query, use original

**Good reference descriptions** (Strategist writes these):
- "Offshore wind turbines at sunset, wide angle, documentary feel"
- "Dense Asian city skyline at night with neon signage"
- "Close-up of hands assembling electronics on workbench"

**Forbidden in queries**: Negative prompts (APIs search them literally), HEX color codes, style directives.

---

## 4. CLI Usage

```bash
# Default: zero-config, quality-first across allowed licenses
python3 ${SKILL_DIR}/scripts/image_search.py "offshore wind farm" \
    --filename cover_bg.jpg --slide 01 \
    --orientation landscape -o project/assets

# Strict mode: only no-attribution images
python3 ${SKILL_DIR}/scripts/image_search.py "abstract gradient" \
    --filename hero.jpg --strict-no-attribution \
    -o project/assets

# Pin a specific provider
python3 ${SKILL_DIR}/scripts/image_search.py "executive meeting" \
    --filename team.jpg --provider pexels \
    --orientation landscape -o project/assets

# Batch mode via manifest
python3 ${SKILL_DIR}/scripts/image_search.py --manifest project/assets/image_sources.json
```

### Parameters

| Flag | Description |
|------|-------------|
| `query` (positional) | Search query (simplified from description) |
| `--filename` | Output filename |
| `-o` / `--output` | Output directory (default: `project/assets`) |
| `--slide` | Target slide number (for manifest tracking) |
| `--purpose` | Image purpose description |
| `--orientation` | `any` / `landscape` / `portrait` / `square` |
| `--provider` | Pin to specific provider |
| `--strict-no-attribution` | Only download no-attribution images |
| `--manifest` | Batch mode: process all pending rows in manifest |

---

## 5. Manifest Format (`image_sources.json`)

```json
{
  "filename": "cover_bg.jpg",
  "slide": 1,
  "purpose": "Cover background — wind energy documentary",
  "search_query": "offshore wind farm",
  "orientation": "landscape",
  "provider": "pexels",
  "title": "Wind Turbines in Ocean",
  "author": "Tom Fisk",
  "source_page_url": "https://www.pexels.com/photo/...",
  "download_url": "https://images.pexels.com/...",
  "license_name": "Pexels License",
  "license_tier": "no-attribution",
  "attribution_required": false,
  "width": 4000,
  "height": 2250,
  "status": "Sourced"
}
```

---

## 6. On-Slide Attribution

For `attribution-required` images, render inline credit in Typst:

```typst
// Bottom-right, small, semi-transparent
#place(bottom + right, dx: -12pt, dy: -8pt,
  text(size: 7pt, fill: luma(150))[Photo: Tom Fisk / Wikimedia / CC BY 4.0]
)
```

**Rules:**
- Font size: 7-8pt, grey or semi-transparent
- Position: bottom-right of the image container (not the page)
- Format: `Photo: {author} / {provider} / {license_short}`
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
1. Try primary provider → retry with broadened query (3 words → 2 words)
2. Fall through to next provider in chain
3. If all providers fail: mark `Needs-Manual` and continue
4. Never block the Executor from proceeding with available images

---

## Related Documents

- `image-generator.md` — AI image generation path (complementary)
- `image-layout-patterns.md` — 72 layout patterns for placing images on slides
- `shared-standards.md` §2 — Page dimensions, image embedding syntax
- `strategist.md` §h — Image strategy selection (where `web` vs `ai` is decided)
