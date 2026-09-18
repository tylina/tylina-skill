---
name: typst-social-cover
description: Create or improve fixed-canvas social covers, cards, carousels, and platform graphics in Typst with exact dimensions, source-backed copy, and full-size plus feed-size review.
---

# Typst Social Cover

Compose this Skill with Typst Authoring. A social graphic is a fixed-canvas document,
not a slide deck.

## Entry Mode

- `create`: create or improve a cover, social card, carousel, WeChat header, or sibling-ratio
  campaign asset. The shared workspace intent gate owns mutation scope.

## Domain Information

- Platform dimensions, safe zones, card count, copy, identity, call to action, and privacy boundary
  determine the artifact. Do not infer evidence or product state from a visual reference.
- Keep meaningful copy editable and source-backed; do not hide it only inside SVG paths or raster
  images. Preserve asset provenance and distinguish evidence from decoration.
- Each production ratio needs its own composition; mechanically scaling or cropping a 16:9 slide
  or another ratio commonly breaks hierarchy and safe zones.
- A useful default is one clear hook and one intended audience move per card. In a carousel, each
  page should have a distinct role while the sequence retains a coherent hierarchy.
- Continue an existing scaffold when present. Reviewed candidates are indexed at
  `_shared/scenarios/social-cover/index.json`; use `template.list`, `template.inspect`, and
  `template.create` for the chosen exact entry.
- When a cover or card includes a QR code or barcode, use the Tiaoma recipe with an explicitly
  supplied payload; preserve the code as source-backed content and review its quiet zone and
  machine readability independently of feed-size composition.
- The extended SeaSlides reference is useful for carousels, multiple ratios, imported assets,
  brand systems, or other genuinely complex campaigns.

## Adaptive Workflow

1. Establish platform, exact dimensions, page or card count, copy, assets, identity, call to action,
   privacy boundary, and requested formats.
2. Continue an existing scaffold. Otherwise select and inspect one reviewed entry from
   `_shared/scenarios/social-cover/index.json`, materialize its complete workspace, and select the
   returned entrypoint through `document.setMain`.
3. Read the extended reference for carousels, sibling ratios, imported assets, brand systems, or
   another genuinely complex campaign.
4. Keep copy and assets editable and source-backed. Compose each production ratio independently
   rather than resizing or cropping a different canvas.
5. Give each card a clear role, and verify that the hook, hierarchy, and audience move survive at
   approximate feed size.
6. Validate every production canvas, inspect exact and feed-size renders, and export only the
   requested formats.

## Verification Information

Validate each production canvas and inspect it at its exact dimensions and an approximate feed
size. Check clipping, safe zones, glyphs, contrast, assets, factual integrity, sequence, and the
lower edge. When a target pixel width matters, derive PPI from the render summary:
`ppi = target_pixel_width * 72 / page_width_points`. For a 1080 pt-wide canvas, 72 PPI produces a
1080 px review and 24 PPI produces a 360 px feed check; confirm the returned pixel dimensions.

## Progressive Resources

- Reviewed templates: `_shared/scenarios/social-cover/index.json`.
- Complex campaign composition:
  `typst-slides/references/seaslides/references/scenarios/social-cover.md`.
- QR codes and barcodes (only when explicitly required): `_shared/packages/tiaoma/README.md` and
  `_shared/packages/tiaoma/demo.typ`.
