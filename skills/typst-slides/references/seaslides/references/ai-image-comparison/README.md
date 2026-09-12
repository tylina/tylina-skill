# AI Image Comparison — Style Anchor Reference Gallery

Reference images for each Style Anchor, used by the agent to visually ground its understanding of each rendering style. Images are organized as `{anchor}_{type}.png`.

## Purpose

This gallery provides controlled-variable comparison images — one per anchor-type combination — so the agent (and human reviewers) can see exactly what each Style Anchor produces across different image types.

## Structure

| Subdirectory / File | Description |
|---|---|
| `_index.md` | Gallery manifest listing all reference images with generation status |
| `{anchor}_{type}.png` | Generated reference image for a specific anchor + type pair |

## Naming Convention

```
{style-anchor}_{image-type}.png
```

Examples:
- `editorial-photo_background.png`
- `flat-vector_hero.png`
- `ink-sketch_side-illustration.png`

## Controlled Variables

All images in this gallery use:
- **Subject**: "a team collaborating around a central idea, with one dominant focal element"
- **Palette**: primary #1E3A5F (deep navy), secondary #F8F9FA (off-white), accent #D97706 (warm amber)
- **Variable**: Style Anchor (8 values) x Image Type (3 representative types)

This keeps palette and subject constant so differences are attributable solely to rendering style and compositional type.

## Generation

To generate or regenerate reference images:

```bash
python3 ${SKILL_DIR}/scripts/image_gen.py \
    --manifest skills/seaslides-typst-slides-skill/references/ai-image-comparison/_index.json \
    -o skills/seaslides-typst-slides-skill/references/ai-image-comparison/ \
    --backend openai
```

Items with `status: "pending-generation"` will be generated. Items already marked `"generated"` are skipped.
