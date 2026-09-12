---
name: typst-tables
description: Build and clarify semantic Typst tables while preserving every supplied value, header, unit, label, grouping, and source attribution.
---

# Typst Tables

Compose this Skill with Typst Authoring.

## Entry Modes

- `build`: create a semantic table from supplied data and the intended comparison. Choose
  headers, grouping, alignment, caption, labels, and spans without changing data meaning.
  A blank target still requires supplied data and a comparison goal.
- `clarify`: improve an existing table's hierarchy, scan path, wrapping, and presentation.
  Preserve every value, unit, ordering constraint, missing-value meaning, and attribution.
  If no table or table-like source was supplied, ask for it instead of creating unrelated data.

## Contract

1. Use `table` for related data and `grid` only for layout.
2. Preserve every value, unit, header, label, order, missing-value meaning, and source.
   Never invent, interpolate, aggregate, or normalize data without explicit approval.
3. Use `table.header` for semantic headers. Use `table.cell(colspan:)` and
   `table.cell(rowspan:)` for spans, and keep cell order consistent with the declared columns.
4. Wrap a table in `figure` when it needs a caption, label, or document reference.
5. Reuse a custom table wrapper only when the real provider confirms its compiled table structure
   and exact source mapping. Never infer table semantics from a function-name suffix.
6. Preserve each cell's real markup, script, or math mode. Do not stringify script expressions,
   duplicate quotes, or expose `table.cell(...)` wrappers as reader-visible cell text.
7. Respect the owning syntax context: use `#table(...)` in markup and `table(...)` inside a
   function argument list or other code context. Never insert `#` mechanically.
8. Validate and visually inspect width, wrapping, alignment, spans, repeated headers,
   captions, and page breaks.

Read `_shared/docs/typst/tables.md` before a structural edit. Use
`_shared/packages/index.json` to locate and then read one package recipe only when native
`table` cannot express the requested input or the workspace already uses that package.
