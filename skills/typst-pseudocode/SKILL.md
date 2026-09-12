---
name: typst-pseudocode
description: Typeset and review readable pseudocode in Typst while preserving the algorithm's inputs, outputs, control flow, invariants, and complexity claims.
---

# Typst Pseudocode

Compose this Skill with Typst Authoring.

## Entry Modes

- `write`: create or improve pseudocode while preserving algorithm semantics. A blank target
  still requires a supplied algorithm, inputs, outputs, or precise behavior. Run the Typst
  Authoring workspace intent gate before creating a whole document.

## Workflow

1. Read the complete algorithm and identify inputs, outputs, state, loops, branches,
   invariants, termination, and stated complexity.
2. Preserve semantics. Do not translate ambiguous prose into a stronger algorithm without
   explaining the assumption.
3. Reuse the workspace's existing pseudocode style or package. If none exists and a reusable
   algorithm environment is useful, read
   `_shared/packages/lovelace/README.md` and `_shared/packages/lovelace/demo.typ` before using
   the pinned recipe.
4. Keep identifiers and notation consistent with surrounding prose and equations. Add line
   numbers or labels only when they support explanation or cross-reference.
5. Validate and visually inspect indentation, wrapping, long conditions, comments, line
   numbers, and page or slide fit.

Use a raw code block only when the document is intentionally presenting executable source.
Pseudocode should remain language-neutral unless the user requests a specific notation.
