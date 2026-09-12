# Style Anchors — Index

A **Style Anchor** is a deck-wide visual rendering locked during the Strategist phase. Every AI-generated image in the deck shares one anchor — ensuring visual cohesion across slides.

> **HEX values live in the deck palette, not here.** Style Anchors describe *how* the image is rendered; the deck's color scheme determines *which colors* appear. See [`image-generator.md`](../image-generator.md) §1 and §3.

---

## 1. Catalog (8 anchors)

Each anchor has its own file with: visual characteristics, prompt fragment, color behavior, and a fewshot example. **Read only the file for the anchor you pick** — never glob the directory.

| Anchor | One-liner | Best For |
|--------|-----------|----------|
| [`editorial-photo`](./editorial-photo.md) | Documentary/editorial photography with film grain and natural light | Case studies, corporate narratives, editorial |
| [`flat-vector`](./flat-vector.md) | Geometric illustration, limited palette, sharp edges, no shadows | Tech explainers, SaaS, training decks |
| [`ink-sketch`](./ink-sketch.md) | Hand-drawn pen strokes on paper, monochrome + one accent | Creative pitches, academic, notebook-style |
| [`3d-render`](./3d-render.md) | Soft isometric/perspective 3D, studio lighting, smooth surfaces | Product showcases, architecture, data |
| [`abstract-geometric`](./abstract-geometric.md) | Pure shapes, bold saturated colors, Bauhaus-inspired asymmetry | Brand identity, festivals, editorial covers |
| [`data-viz`](./data-viz.md) | Chart/diagram focus, labeled data, minimal decoration | Consulting, research, analytical reports |
| [`watercolor`](./watercolor.md) | Soft pigment edges, paper bleed, organic hand-painted shapes | Cultural, art, wellness, storytelling |
| [`collage-editorial`](./collage-editorial.md) | Mixed media, cut-paper layers, overlapping textures | Fashion, culture, experimental decks |

---

## 2. Auto-selection table — user intent to anchor

Match the deck's stated objective and content vibe against this table. First match wins. If no row matches, default to `flat-vector`.

| Style Objective / Content Vibe | Recommended Anchor | Alternates |
|---|----|---|
| Corporate / case study / annual report | `editorial-photo` | `flat-vector`, `data-viz` |
| Tech / SaaS / product explainer / training | `flat-vector` | `3d-render`, `data-viz` |
| Creative / design / portfolio / notebook | `ink-sketch` | `collage-editorial`, `watercolor` |
| Product launch / architecture / systems | `3d-render` | `flat-vector`, `abstract-geometric` |
| Brand identity / festival / bold campaign | `abstract-geometric` | `collage-editorial`, `flat-vector` |
| Consulting / research / data-heavy report | `data-viz` | `editorial-photo`, `flat-vector` |
| Cultural / wellness / art / personal story | `watercolor` | `ink-sketch`, `collage-editorial` |
| Fashion / experimental / magazine editorial | `collage-editorial` | `abstract-geometric`, `watercolor` |
| Academic / methodology / tutorial | `ink-sketch` | `flat-vector`, `data-viz` |
| Startup pitch / investor deck | `flat-vector` | `editorial-photo`, `3d-render` |

---

## 3. Anchor x Image Type compatibility

Not every anchor works equally well with every image type. Use this matrix when the Strategist's image list contains uncommon type/anchor pairings.

| Anchor | background | hero | side-illustration | diagram | grid-asset | cinematic-band | decorative |
|--------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| `editorial-photo` | ++ | ++ | ++ | -- | + | ++ | -- |
| `flat-vector` | ++ | ++ | ++ | ++ | ++ | + | ++ |
| `ink-sketch` | + | ++ | ++ | + | + | + | ++ |
| `3d-render` | ++ | ++ | ++ | + | ++ | + | + |
| `abstract-geometric` | ++ | ++ | + | -- | ++ | ++ | + |
| `data-viz` | -- | + | ++ | ++ | + | -- | -- |
| `watercolor` | ++ | ++ | ++ | -- | + | ++ | + |
| `collage-editorial` | ++ | ++ | + | -- | + | ++ | -- |

Legend: `++` excellent fit, `+` workable, `--` avoid (style conflicts with type requirements).

---

## 4. How to use

1. From the Strategist Confirmation §h, read the chosen Style Anchor.
2. Find the anchor in the catalog above; open its dedicated file.
3. Use the **prompt fragment** from that file as the opening sentences of every assembled prompt (per [`image-generator.md`](../image-generator.md) §3).
4. Check compatibility (§3 above) if the image type is unusual for that anchor.

**Lock for the whole deck.** Never change anchor between images in the same deck.
