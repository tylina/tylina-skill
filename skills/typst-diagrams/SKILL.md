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

Reuse the workspace's existing diagram package and version. `_shared/packages/index.json` routes
to pinned recipes when a new package is needed. Preserve supplied entities, relationships,
direction, grouping, and labels, and keep semantic diagram source editable rather than flattening
it into an image. Inspect affected diagrams for missing nodes, edge crossings or clipping, label
overlap, direction, scale, contrast, and export-safe rendering.

For Mermaid, prefer ordinary Mermaid source that Tylina's visual editor can reopen. Preserve
unsupported directives and syntax verbatim instead of normalizing them through a smaller UI
model.

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
