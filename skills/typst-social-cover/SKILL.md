---
name: typst-social-cover
description: Create or improve fixed-canvas social covers, cards, carousels, and platform graphics in Typst with exact dimensions, source-backed copy, and full-size plus feed-size review.
---

# Typst Social Cover

Compose this Skill with Typst Authoring. A social graphic is a fixed-canvas document,
not a slide deck.

## Entry Mode

- `create`: create or improve a cover, social card, carousel, WeChat header, or sibling-ratio
  campaign asset. Run the shared workspace intent gate before writing.

## Workflow

1. Confirm the platform, exact dimensions, page or card count, required copy, assets, identity,
   call to action, privacy boundaries, and output formats. Never invent evidence or product state.
2. If the user named a reviewed entry, query that entry directly once with
   `template.list({query: "<entry id>", limit: 5})`. Otherwise read
   `_shared/scenarios/social-cover/index.json`, choose one declared canvas and visual stance, then
   make the same single bounded query. Inspect the exact returned
   `tylina:scenario/social-cover/...` spec; do not list the whole category before or afterward.
3. For a carousel, multiple ratios, imported assets, a brand system, or another genuinely complex
   campaign, also read
   `typst-slides/references/seaslides/references/scenarios/social-cover.md`; resolve its
   `templates/scenarios/social-cover` paths as `_shared/scenarios/social-cover`. A straightforward
   single cover does not need that extended reference.
4. Materialize the complete leaf directory with `template.create`, then select its
   relative entrypoint with `document.setMain`. Reuse its `template.typ`, entrypoint, and
   local assets; do not resize a 16:9 slide theme into a card.
5. Compress the source into one accurate hook and one audience move per page. Recompose each
   additional ratio in a sibling entry rather than mechanically scaling or cropping the first.
6. Validate each production canvas separately. Render at exact dimensions and inspect full size,
   around 360 px feed width, and in sequence. Check clipping, safe zones, glyphs, contrast, assets,
   factual integrity, and lower-edge resolution. Creating a cover means editable Typst source,
   not an implicit exported artifact; call an export tool only when the user explicitly requests
   an export.
   Template README compile commands document upstream development only; do not run them. Use
   Tylina validation and rendering so the current main and visible preview are verified together.
   For one final page revision, request one render summary and render that page once at review
   size and once at feed size. Re-render only after the source changes; do not repeat an unchanged
   template query, validation, page, and PPI combination. Each `render.page` result already
   includes the inspectable PNG; inspect that response directly instead of calling it again to
   view the same page. Run the review-size and feed-size calls sequentially: inspect the first
   returned image before requesting the second. Do not batch or parallelize image renders.

   Derive PPI from the render summary instead of guessing:
   `ppi = target_pixel_width * 72 / page_width_points`. For a 1080 pt-wide canvas, use 72 PPI for
   a 1080 px review and 24 PPI for a 360 px feed check. Confirm `imageSizePixels` in both receipts.

For an optional upstream helper, resolve the upstream reference's scripts directory to
`<skillsRoot>/typst-slides/scripts`, read `typst-slides/scripts/TYLINA.md`, and keep all work
inside the current workspace. Prefer Tylina MCP validation, rendering, and main-file selection.

## Non-negotiables

- Use exact requested dimensions and independently compose each production ratio.
- Keep copy editable and source-backed; do not hide meaningful text inside SVG paths or images.
- Preserve asset provenance, privacy, and the distinction between evidence and decoration.
- Inspect every page at full and feed size; compilation alone is insufficient.
