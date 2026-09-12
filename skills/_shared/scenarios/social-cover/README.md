# Social-Cover Templates

These examples are fixed-canvas publication graphics built from mature SeaSlides theme systems.
They are not Touying decks and they are not shortened slide themes.

Every example separates the reusable visual system from the sample content:

- `template.typ` owns the canvas, palette, typography, reusable layouts, and SVG/image treatment.
- `demo.typ` imports the template and supplies audience-facing copy, page order, and factual content.
- `README.md` records the intended format, adaptation boundary, and compile command.

## Catalog

| Example | Output | Visual system | Best use |
|---|---:|---|---|
| [guizang-magazine](guizang-magazine/README.md) | 1242 × 1660, one page | Editorial magazine / e-ink with an inline-SVG city field | Reflective features, field notes, cultural or human-centered covers |
| [guizang-swiss](guizang-swiss/README.md) | 1080 × 1080, four pages | IKB Swiss grid, light display type, system diagrams | Methods, product explanations, decisions, structured carousels |
| [indie-bookstore](indie-bookstore/README.md) | 900 × 383 + 1080 × 1080 | RISO zine, hard edges, misregistration, inline-SVG paper object | WeChat article-header and share-square pairs |
| [editorial-grid](editorial-grid/README.md) | 1080 × 1350, one page | Publication grid with a dark reading rail and semantic four-step sequence | Research notes, explainers, content-method covers |
| [pritzker](pritzker/README.md) | 1242 × 1660, one page | Architectural serif system, axonometric SVG field, full-height conclusion zone | Architecture, culture, public-space, and design essays |
| [newspaper](newspaper/README.md) | 900 × 383, one page | Brutalist press texture with a compact three-question sidebar | Weekly reviews, commentary, reports, article headers |
| [guizang-field-journal](guizang-field-journal/README.md) | 1242 × 1660, one page | Light photo-editorial journal with a large framed image and evidence-aware closing | Travel, nature, culture, slow observation, image-led features |
| [guizang-marginalia](guizang-marginalia/README.md) | 1242 × 1660, one page | Warm-paper essay with long-form serif copy and a functional marginal schedule | Reflective essays, routines, work notes, literary cards |

The names intentionally match the mature theme families they adapt from under
`templates/themes/custom-canvas/`. The scenario templates are independent fixed-canvas APIs; they
do not import Touying or the presentation themes at runtime.

## Use an example

1. Read the scenario reference and the example README.
2. Copy the entire selected example directory so `demo.typ` keeps its local `template.typ` import.
3. Replace the demo copy and every sample label before changing the visual system.
4. If the target ratio changes, create a sibling page function in `template.typ`; do not crop or
   scale the existing composition.
5. Compile every page at the exact target size and inspect it both full-size and at 360 px feed
   width.

Direct compilation:

```bash
typst compile guizang-magazine/demo.typ cover.png --ppi 72
typst compile guizang-swiss/demo.typ 'carousel-{p}.png' --ppi 72
typst compile indie-bookstore/demo.typ 'wechat-cover-{p}.png' --ppi 72
typst compile editorial-grid/demo.typ editorial-grid.png --ppi 72
typst compile pritzker/demo.typ pritzker.png --ppi 72
typst compile newspaper/demo.typ newspaper.png --ppi 72
typst compile guizang-field-journal/demo.typ guizang-field-journal.png --ppi 72
typst compile guizang-marginalia/demo.typ guizang-marginalia.png --ppi 72
```

The SVG layers carry atmosphere or diagram geometry only. Keep titles, labels, evidence, numbers,
and calls to action as Typst content so they remain editable, searchable, and auditable.
