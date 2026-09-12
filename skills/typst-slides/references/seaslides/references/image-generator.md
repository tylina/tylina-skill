# Image Generator Reference

## Contents

- [Core mission and pipeline context](#core-mission)
- [Style anchor](#1-style-anchor-deck-wide)
- [Image types](#2-image-types-per-image)
- [Prompt assembly](#3-prompt-assembly)
- [Prompt refinement](#4-prompt-refinement)
- [Manifest format](#5-manifest-format)
- [Generation workflow](#6-generation-workflow)
- [Group consistency](#7-group-consistency)
- [Analyzing user-provided images](#8-analyzing-user-provided-images)
- [Related documents](#related-documents)

## Core Mission

Receive the image resource list from the Strategist's `content_design_spec.md`, compose optimized prompts, and generate images using AI tools. Every generated image must feel like it belongs to the same visual family — coherent in style, palette, and composition.

## Pipeline Context

| Previous Step | Current Step | Next Step |
|---------------|--------------|-----------|
| Strategist (§V Image Resource List) | **Image Generator**: Prompt assembly + generation | Executor (uses generated images in slides) |

---

## 1. Style Anchor (Deck-Wide)

The **Style Anchor** is a deck-wide visual identity that ensures all generated images feel cohesive. Choose ONE anchor per deck during the Strategist phase (Confirmation §h).

| Anchor | Visual Character | Best For |
|--------|-----------------|----------|
| `editorial-photo` | Documentary/editorial photography. Natural light, film grain, Fujifilm/Leica aesthetic, slightly desaturated, real-world subjects. | Case studies, corporate, editorial |
| `flat-vector` | Clean geometric illustration, limited palette (3-4 colors), no shadows, no gradients, sharp edges. | Tech explainers, SaaS, training |
| `ink-sketch` | Hand-drawn feel, paper texture, pen strokes, monochrome + one accent color. | Creative, academic, notebooks |
| `3d-render` | Soft isometric or perspective 3D, pastel or muted gradients, studio lighting, smooth surfaces. | Product, architecture, data |
| `abstract-geometric` | Pure shapes, bold saturated colors, Bauhaus-inspired, asymmetric compositions. | Brand, festival, editorial |
| `data-viz` | Chart/diagram focus, clean axes, labeled data, minimal decoration, information-first. | Consulting, research, reports |
| `watercolor` | Soft pigment edges, paper bleed, warm tones, organic shapes, hand-painted feel. | Cultural, art, wellness |
| `collage-editorial` | Mixed media, cut-paper layers, magazine clippings, overlapping textures. | Fashion, culture, experimental |

> **Enforcement**: The Style Anchor description is prepended to every image prompt. Without it, images will have inconsistent rendering styles, creating visual dissonance across the deck.

> **Detailed reference**: See `image-renderings/_index.md` for auto-selection tables and `image-renderings/{anchor}.md` for per-style prompt fragments and visual characteristics.

---

## 2. Image Types (Per-Image)

Each image in the resource list has a **type** that determines its compositional requirements.

| Type | Aspect Ratio | Composition Requirements |
|------|-------------|------------------------|
| `background` | 16:9 | Full-bleed. Must have a calm/empty center zone (~60% of area) for text overlay. Low-contrast center, detail at edges. |
| `hero` | 16:9 or 3:2 | Main visual, high detail. Subject fills 60-80% of frame. No text overlay zone needed — image IS the content. |
| `side-illustration` | 4:3 or 3:2 | Companion to text block. Subject fills frame with tight crop. Works at 40-50% page width. |
| `diagram` | 4:3 or 16:9 | Process/flow/comparison structure. Clear labeled nodes/arrows. Generous margins inside frame. |
| `grid-asset` | 1:1 | One of N uniform items in a gallery grid. Consistent framing, margins, and visual weight across set. |
| `cinematic-band` | 21:9 or 3:1 | Ultra-wide strip for top/bottom of page. Core subject in center 70% safe zone. |
| `decorative` | 1:1 | Small accent, icon-scale. Simple symbolic representation. Works at 48-80pt embedding size. |

### Text Policy (Per-Image)

Each image has a `text_policy` that determines whether text should be embedded in the AI-generated image or overlaid as native Typst elements:

| Policy | Meaning | When to Use |
|--------|---------|-------------|
| `none` | No text of any kind in the image | Default. Text is overlaid via Typst `place()` |
| `embedded` | Designed typography is part of the image | Artistic title cards, hand-lettered quotes, infographic labels that are integral to the composition |

> **Default**: Always `none` unless the Strategist explicitly marks an image as `embedded`. Native Typst text is always preferred for readability, accessibility, and theme consistency.

### Aspect Ratio Lookup Table

When the Strategist's image resource list specifies a layout pattern (from `image-layout-patterns.md`), use this mapping:

| Layout Pattern | Required Ratio | Notes |
|----------------|---------------|-------|
| #1 Full-bleed background | 16:9 | Leave center-calm zone for overlaid text |
| #2, #3 Side-by-side (image + text) | 4:3 or 3:2 | Match the column width:height proportion |
| #4 Full-bleed hero (no text) | 16:9 | Subject fills entire frame |
| #11, #12 Cinematic band | 21:9 | Subject in center 70% |
| #13, #18 Split columns | 4:3 | Vertical emphasis for narrow column |
| #38-#46 Image-as-canvas + overlays | 16:9 | Leave calm regions at overlay positions |
| Gallery grid patterns | 1:1 | Uniform square assets |

> When the design spec does not specify a pattern, default to 16:9 for backgrounds/heroes, 4:3 for illustrations, 1:1 for grid assets.

---

## 3. Prompt Assembly

### Format: One Prose Paragraph

Every image prompt is assembled as **one coherent prose paragraph** (100-200 words). Never use tag-soup, comma-separated keyword lists, or numbered component fields.

The paragraph follows this assembly order:

```
[Style anchor — 1-2 sentences describing the rendering style from §1]
[Subject and scene — 2-3 sentences with concrete visual nouns, spatial relationships, and compositional structure]
[Color behavior — how the deck's palette manifests in this image; reference HEX values as rendering guidance]
[Hard constraints — aspect ratio, no slide chrome, no text unless specified, figure treatment]
```

### Assembly Example

**Input**: Style Anchor = `flat-vector`, Type = `side-illustration`, Subject = "team collaboration on code review", Deck palette: primary #1A365D, accent #2B6CB0.

**Assembled prompt**:

> Clean flat vector illustration with sharp geometric shapes, limited to 3-4 colors, no shadows, no gradients, crisp edges on a white background. Three simplified human figures (faceless, geometric silhouettes) gathered around a large screen displaying abstract code blocks, one figure pointing at highlighted lines while others observe — the screen dominates the right half of the frame, figures arranged at left, creating a natural left-to-right reading flow. Color palette uses deep navy (#1A365D) for the figures and screen frame, medium blue (#2B6CB0) for the highlighted code elements and pointing gesture, with warm grey (#E2E8F0) for secondary elements. Aspect ratio 4:3, landscape orientation. No text of any kind in the image — no labels, no code characters, no UI chrome. Human figures are simplified geometric silhouettes, not photorealistic.

### Hard Rules (Appended to Every Prompt)

These constraints apply to ALL generated images regardless of style:

1. **No slide chrome**: No page headers, footers, page numbers, corner marks, title bars, or decorative borders.
2. **No visible text** (unless `text_policy: embedded`): No letters, numbers, watermarks, labels, or written symbols.
3. **Simplified figures**: Human figures as stylized silhouettes or symbolic shapes — no photorealistic faces or detailed anatomy (exception: `editorial-photo` anchor where documentary subjects are expected).
4. **HEX is guidance, not content**: Color values in the prompt are rendering guidance for the AI model — they must NOT appear as visible text in the generated image.
5. **No brand names or trademarks** in generated imagery.

### Explicitly Forbidden Prompt Words

These words produce generic, undifferentiated "AI slop" results. Never use them in prompts:

> modern, flat design, gradient, vibrant, professional, clean, 4K, high quality, high resolution, 8K, ultra-detailed, masterpiece, best quality, photorealistic (unless editorial-photo anchor), cinematic lighting (unless justified by scene), award-winning

Instead, use **specific descriptive language** tied to the Style Anchor:
- Not "professional quality" → "precise line weight, consistent 2pt strokes, deliberate negative space"
- Not "clean design" → "uncluttered composition with 40% whitespace, 3-color maximum"
- Not "vibrant colors" → "saturated cobalt (#002FA7) and warm amber (#D97706) at full chroma"
- Not "high quality" → describe the specific quality markers: "sharp vector edges", "fine crosshatch texture", "crisp film grain at ISO 400"

---

## 4. Prompt Refinement

### When Results Are Unsatisfactory

| Problem | Fix Strategy |
|---------|-------------|
| Wrong rendering style | Rewrite the Style Anchor sentences with more specific references (e.g., "Monocle Magazine editorial" instead of just "editorial") |
| Colors don't match | Repeat HEX values, add "dominant color is X, supporting color is Y, accent sparingly at Z" |
| Wrong composition | Add explicit spatial language: "subject occupies left third, right two-thirds are negative space" |
| Too busy / cluttered | Add "generous negative space, maximum 3 distinct elements, no background detail" |
| Too generic | Add concrete noun specificity: "a vintage brass microscope" not "a science tool" |
| Figures look wrong | Specify figure treatment explicitly: "geometric silhouette figures, no facial features, body proportions 7-head canon" |

### Negative Prompts

Use negative prompts to exclude specific failure modes:

| Category | Negative Prompt |
|----------|----------------|
| Text artifacts | "no text, no words, no letters, no labels, no watermarks, no signatures" |
| Slide chrome | "no page headers, no footers, no page numbers, no borders, no title bars" |
| Style conflicts | "no cartoon" (for photo), "no photorealistic" (for illustration), "no 3D" (for flat) |
| Quality issues | "no blur, no noise, no artifacts, no pixelation, no compression" |
| Composition | "no cropped limbs, no cut-off elements, no cramped margins" |

---

## 5. Manifest Format

For batch generation, create a manifest file at `project/assets/image_prompts.json`:

```json
{
  "project": "<project_name>",
  "style_anchor": "flat-vector",
  "color_scheme": {
    "primary": "#1A365D",
    "secondary": "#E2E8F0",
    "accent": "#2B6CB0"
  },
  "items": [
    {
      "filename": "cover_bg.png",
      "slide": 1,
      "purpose": "Cover background with abstract pattern",
      "type": "background",
      "aspect_ratio": "16:9",
      "layout_pattern": "#1 full-bleed background + #27 linear gradient mask",
      "text_policy": "none",
      "prompt": "<assembled prose paragraph>",
      "status": "pending"
    }
  ]
}
```

### Manifest Fields

| Field | Required | Description |
|-------|----------|-------------|
| `filename` | Yes | Output filename (e.g., `cover_bg.png`) |
| `slide` | Yes | Target slide number |
| `purpose` | Yes | One-line description of the image's role |
| `type` | Yes | One of: `background`, `hero`, `side-illustration`, `diagram`, `grid-asset`, `cinematic-band`, `decorative` |
| `aspect_ratio` | Yes | Target ratio (e.g., `16:9`, `4:3`, `1:1`, `21:9`) |
| `layout_pattern` | Yes | Pattern ID(s) from `image-layout-patterns.md` |
| `text_policy` | Yes | `none` (no text in image) or `embedded` (designed text is part of the image) |
| `prompt` | Yes | The fully assembled prose paragraph |
| `status` | Yes | `pending` → `generating` → `done` / `failed` |

### Human-Readable Companion

Also generate `project/assets/image_prompts.md` with the same content in markdown format for easy review:

```markdown
# Image Prompts — {project_name}

**Style Anchor**: flat-vector
**Palette**: primary #1A365D, accent #2B6CB0, secondary #E2E8F0

## Images

### 1. cover_bg.png (Slide 1)
- **Type**: background | **Ratio**: 16:9 | **Layout**: #1 full-bleed background
- **Prompt**: [full paragraph here]
```

---

## 6. Generation Workflow

### Step 1: Check Backend Availability

```bash
python3 ${SKILL_DIR}/scripts/image_gen.py --check-available
```

This reports which backends have valid API keys. If no backends are available:
- Skip AI generation entirely
- Use `[Placeholder: description]` blocks in the Typst code
- Note in the design spec that images are pending

### Step 2: Compose Prompts

For each image in §V of the content design spec:

1. Read the deck's Style Anchor from §I or §V header
2. Identify the image type and layout pattern
3. Look up the required aspect ratio (§2 table above)
4. Assemble the prose paragraph following the §3 template
5. Append hard constraints
6. Write to `image_prompts.json` manifest

### Step 3: Generate

**Batch mode** (preferred for 3+ images):
```bash
python3 ${SKILL_DIR}/scripts/image_gen.py --manifest project/assets/image_prompts.json --concurrency 3
```

**Single image mode**:
```bash
python3 ${SKILL_DIR}/scripts/image_gen.py "prompt text here" \
  --aspect_ratio 16:9 \
  --image_size 1K \
  -o project/assets/cover_bg.png
```

### Step 4: Verify

After generation, verify each image:
- [ ] Aspect ratio matches target (±5%)
- [ ] No text or slide chrome visible
- [ ] Color palette is consistent with deck scheme
- [ ] Style anchor is consistent across all generated images
- [ ] Composition leaves appropriate zones for text overlay (if type = background)
- [ ] Figures are appropriately simplified (no photorealistic faces unless editorial-photo)

### Step 5: Handle Failures

If a backend fails:
1. Retry with same prompt on the same backend (automatic with exponential backoff)
2. If persistent failure, try an alternative backend: `--backend gemini` → `--backend qwen` → `--backend zhipu`
3. If all backends fail, mark the item as `failed` in the manifest and proceed with a placeholder

---

## 7. Group Consistency

When generating multiple images for the same page or same visual group:

**Append this suffix to each prompt in the group:**

> "This is one image in a set of N. Maintain identical visual scale, line weight, margin density, color saturation, and annotation style as other images in this group."

**Grid assets** (for gallery/mosaic patterns):
- All images in the grid MUST use the same aspect ratio
- All must have the same visual density and margin treatment
- Generate them in sequence with the group suffix

---

## 8. Analyzing User-Provided Images

When the image strategy is "user-provided", analyze existing assets:

```bash
python3 ${SKILL_DIR}/scripts/analyze_images.py <project_path>/assets
```

**Output**: Per-image metadata (dimensions, dominant colors, detected content category).

**Use this to determine**:
- Whether cropping/resizing is needed for target layout patterns
- How the existing color palette aligns with the deck scheme
- Which layout patterns best suit the image proportions

---

## Related Documents

- `image-layout-patterns.md` — 72 named layout patterns; determines composition requirements and aspect ratios for each image
- `shared-standards.md` §2 — Page dimensions, image embedding syntax, source image handling
- `design-guide.md` §9c — Aesthetic rules for Canvas-level image generation
- `strategist.md` §h — Image Strategy confirmation (where Style Anchor is chosen)
