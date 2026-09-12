---
name: typst-diagrams
description: Create and refine editable Typst diagrams with Mermaid, Fletcher, CeTZ, or native structures while preserving nodes, labels, edges, and direction.
---

# Typst Diagrams

Compose this Skill with Typst Authoring.

## Entry Modes

- `build`: create or improve a diagram from supplied relationships. A blank target still
  requires supplied entities, relationships, and direction. Adding a diagram to the current
  document stays at that target; it does not authorize a new document or main-file switch.

## Workflow

1. Extract the actual entities, relationships, direction, grouping, and labels from the
   supplied source. Do not add plausible-looking nodes or edges.
2. Reuse the workspace's existing diagram package and version.
3. Choose the representation by semantics:
   - Mermaid/merman for common declarative flowcharts, sequences, states, ER diagrams,
     journeys, Gantt diagrams, and mind maps.
   - Fletcher for graph-like nodes and edges needing Typst-native layout control.
   - CeTZ for custom drawing and geometric illustration.
   - Native Typst for simple boxes, arrows, and layout that does not justify a dependency.
4. Before adding a package, use `_shared/packages/index.json` to locate one pinned recipe,
   then read its exact README and demo paths and preserve the demonstrated import.
5. Keep the source editable and round-trippable. Do not replace semantic diagram source with
   a screenshot or a flattened generated image.
6. Validate and visually inspect every affected diagram. Check missing nodes, crossed or
   clipped edges, label overlap, direction, scale, contrast, and export-safe rendering.

For Mermaid, prefer ordinary Mermaid source that Tylina's visual editor can reopen. Preserve
unsupported directives and syntax verbatim instead of normalizing them through a smaller UI
model.
