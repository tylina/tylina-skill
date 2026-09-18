---
name: typst-diagrams
description: Create and refine editable Typst diagrams with Mermaid, Fletcher, CeTZ, or native structures while preserving nodes, labels, edges, and direction.
---

# Typst Diagrams

Compose this Skill with Typst Authoring.

## Entry Modes

- `build`: create or improve a diagram from supplied relationships. A blank target still
  requires entities and relationships from the request or supplied material. Preserve semantic
  direction when it exists; layout direction may be chosen when it is unspecified. Adding a
  diagram to the current document stays at that target; it does not authorize a new document or
  main-file switch.

## Representation Guide

- Mermaid/merman suits common declarative flowcharts, sequences, states, ER diagrams, journeys,
  Gantt diagrams, and mind maps.
- Fletcher suits graph-like nodes and edges that need Typst-native layout control.
- CeTZ suits custom drawing and geometric illustration.
- Native Typst is sufficient for simple boxes, arrows, or layout that does not justify a package.

Reuse the workspace's existing diagram package and version. `package.list` returns direct pinned
recipe and demo paths when a new package is needed. Preserve supplied entities, relationships,
direction, grouping, and labels, and keep semantic diagram source editable rather than flattening
it into an image. Inspect affected diagrams for missing nodes, edge crossings or clipping, label
overlap, direction, scale, contrast, and export-safe rendering.

For Mermaid, prefer ordinary Mermaid source that Tylina's visual editor can reopen. Preserve
unsupported directives and syntax verbatim instead of normalizing them through a smaller UI
model. Merman keeps that source editable in Typst even though its renderer emits SVG; the SVG is a
rendering boundary, not a reason to replace the source with a bitmap. Fletcher, CeTZ, and native
Typst remain source-native representations.

## Adaptive Workflow

1. Extract the actual entities, relationships, grouping, labels, and semantic direction from the
   request or supplied source.
2. Reuse the current diagram representation when it works; otherwise select native Typst,
   Mermaid/merman, Fletcher, or CeTZ by the representation guide above.
3. For a new package, read the exact returned recipe or versioned package evidence before using
   its API.
4. Keep the diagram source editable and preserve unsupported Mermaid syntax verbatim.
5. Validate and inspect every affected diagram for missing elements, crossed or clipped edges,
   label overlap, direction, scale, contrast, and export-safe rendering.

## Progressive Resources

- Editable general graphs, flowcharts, state machines, trees, and commutative diagrams:
  `_shared/packages/fletcher/README.md` and `_shared/packages/fletcher/demo.typ`.
- Sequence diagrams with participants, messages, and lifelines:
  `_shared/packages/chronos/README.md` and `_shared/packages/chronos/demo.typ`.
- Existing Mermaid source and supported Mermaid families:
  `_shared/packages/merman/README.md` and `_shared/packages/merman/demo.typ`.
- Custom geometry and source-controlled illustrations:
  `_shared/packages/cetz/README.md` and `_shared/packages/cetz/demo.typ`.
- Package selection beyond these reviewed routes: use `package.list`, then read its exact returned
  recipe and demo paths. Inspect package source only when those focused resources are insufficient.
