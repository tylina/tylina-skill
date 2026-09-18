# Fletcher — Editable Node-and-Edge Diagrams

**Package**: `@preview/fletcher:0.5.8`  
**Category**: Diagram  
**Typst Universe**: <https://typst.app/universe/package/fletcher>  
**Repository**: <https://github.com/Jollywatt/typst-fletcher>  
**License**: MIT

## Verified Boundary

Fletcher 0.5.8 draws Typst-native diagrams from nodes, edges, labels, coordinates, and shapes.
It is a strong default for flowcharts, state machines, commutative diagrams, graphs, trees, and
small architecture diagrams that need editable source and precise Typst layout control.

Fletcher does not infer a graph from prose, import Mermaid or PlantUML, or choose the semantic
direction of an edge. Preserve supplied node identities, edge direction, multiplicity, labels,
and grouping.

## Minimal Usage

```typst
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#diagram(
  node-stroke: 0.8pt,
  spacing: 4em,
  node((0, 0), [Draft], radius: 1.8em),
  edge([validate], "-|>"),
  node((1, 0), [Review], radius: 1.8em),
  edge([publish], "-|>"),
  node((2, 0), [Release], radius: 1.8em),
)
```

Math-mode grids are concise for commutative diagrams:

```typst
#diagram(cell-size: 13mm, $
  A edge(f, ->) & B \
  C edge(g, ->) & D
$)
```

## Selection Guidance

- Keep native Typst for a few boxes that ordinary layout already expresses clearly.
- Use Fletcher for editable node-and-edge diagrams and mathematical diagrams.
- Use Chronos for sequence diagrams with participants, messages, activations, and lifelines.
- Use Merman when the source is already Mermaid or a Mermaid family is the best interchange form;
  its result is embedded SVG rather than Typst-native shapes.
- Use CeTZ directly for custom geometry or illustration that does not fit a graph model.

## Authoring and Verification

- Import only the public names needed by the diagram. Import `fletcher.shapes` only when a
  non-default shape is required.
- String route syntax such as `"d,r,u,l"` describes layout, while arrow mark syntax such as
  `"-|>"` describes the drawn edge. Do not exchange them.
- Labels affect bounds and can change routing. Inspect long labels, self-loops, crossings, groups,
  and diagrams near page or slide edges at final size.
- A visually plausible result does not prove that edge direction or graph semantics survived;
  compare the rendered diagram with the supplied relationships.
- For an unfamiliar shape, anchor, mark, or coordinate expression, inspect the exact 0.5.8
  package documentation instead of recalling a newer API.
