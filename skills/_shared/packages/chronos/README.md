# Chronos — Typst-native Sequence Diagrams

**Package**: `@preview/chronos:0.3.0`  
**Category**: Diagram  
**Typst Universe**: <https://typst.app/universe/package/chronos>  
**Repository**: <https://git.kb28.ch/HEL/chronos>  
**License**: Apache-2.0

## Verified Boundary

Chronos 0.3.0 draws sequence diagrams through a Typst function DSL backed by CeTZ. It supports
participants, messages, self-calls, lifelines, creation and destruction, groups, separators,
gaps, and notes.

Chronos does not parse PlantUML syntax. It also does not recover participants or message order
from prose. Preserve supplied names, aliases, order, direction, synchronization, and activation
semantics.

## Minimal Usage

```typst
#import "@preview/chronos:0.3.0"

#chronos.diagram({
  import chronos: *
  _par("Browser")
  _par("Tylina")
  _par("Compiler")

  _seq("Browser", "Tylina", comment: "edit")
  _seq("Tylina", "Compiler", comment: "compile", enable-dst: true)
  _seq("Compiler", "Tylina", comment: "diagnostics", disable-src: true, dashed: true)
  _seq("Tylina", "Browser", comment: "preview", dashed: true)
})
```

The leading underscores are part of the 0.3.0 public DSL. Keep the block in code context and use
`import chronos: *` inside it as shown.

## Selection Guidance

- Use Chronos when participants, ordered messages, lifelines, and activation are the real model.
- Use Fletcher for a general graph, flowchart, state machine, tree, or commutative diagram.
- Use Merman when existing Mermaid source must remain the interchange form or when another
  Mermaid diagram family is required.
- Do not add Chronos for a two-column request/response table that is clearer as ordinary content.

## Authoring and Verification

- Participant IDs are semantic identifiers. Use `display-name` when the visible label differs;
  do not rename IDs merely to improve typography.
- Dashed returns, self-calls, activation, creation, and destruction carry meaning. Do not infer
  them from visual convention when the source is ambiguous.
- Long comments can widen or crowd the diagram. Inspect message labels, note overlap, lifeline
  alignment, page breaks, and text size in the final output.
- Chronos 0.3.0 requires Typst 0.14.2 or newer. Inspect exact versioned documentation before using
  groups, notes, custom participant shapes, or style dictionaries not shown here.
