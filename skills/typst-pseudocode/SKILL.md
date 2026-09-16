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

## Domain and Package Information

- Inputs, outputs, state, branches, loops, invariants, termination, and complexity claims belong
  to the algorithm, not the layout. Preserve ambiguity rather than silently strengthening it.
- Reuse the workspace's established style. When a reusable algorithm environment is useful,
  `_shared/packages/lovelace/README.md` and its `demo.typ` document the pinned recipe.
- Keep identifiers and notation consistent with surrounding prose and equations. Line numbers and
  labels are useful only when the document explains or cross-references them.
- Inspect affected pseudocode for indentation, wrapping, long conditions, comments, numbering,
  and page or slide fit.

Use a raw code block only when the document is intentionally presenting executable source.
Pseudocode should remain language-neutral unless the user requests a specific notation.

## Adaptive Workflow

1. Identify inputs, outputs, state, branches, loops, invariants, termination, and stated complexity
   from the supplied algorithm or behavior.
2. Preserve ambiguous semantics instead of silently strengthening the algorithm.
3. Reuse the document's current style; read the Lovelace recipe and demo only when a reusable
   algorithm environment is useful.
4. Keep identifiers and notation aligned with surrounding prose and equations, adding labels or
   line numbers only when they support explanation or references.
5. Validate and inspect indentation, wrapping, long conditions, comments, numbering, and page or
   slide fit.
