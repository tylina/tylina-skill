# Typst Table Authoring

Use this reference for semantic table structure and syntax context. It is distilled from Typst's
official table guide at revision `2924ba908b7e535ef6166a8b1731d400b694e9d9`.

## Structure First

- Use `table` for related data and `grid` for visual layout.
- Use `table.header` for semantic headers and `table.footer` when a repeated footer is meaningful.
- Use `table.cell(colspan:)` and `table.cell(rowspan:)` for spans.
- Wrap a table in `figure` when it needs a caption, label, placement, or document reference.
- Preserve values, units, missing-value meaning, ordering, labels, and attribution.

```typ
#table(
  columns: (2fr, 1fr, 1fr),
  align: (left, center, right),
  table.header([Item], [Count], [Status]),
  [Draft], [8], [Ready],
  table.cell(colspan: 2)[Total], [8],
)
```

## Respect the Owning Mode

A top-level call in markup starts with `#`. A table passed inside another function's argument list
is already in code mode and must not:

```typ
#figure(
  table(
    columns: 2,
    table.header([Item], [Value]),
    [Voltage], [220 V],
  ),
  caption: [Probe results],
) <probe-results>
```

Never generate `figure(#table(...))` or `#figure(#table(...))`. Determine the owning mode from the
real source AST/provider, not from indentation, line shape, or a guessed wrapper name.

## Cell Content Modes

A visual table cell can preserve one of three source forms:

- **Markup:** `[A *styled* value]`
- **Script:** `qty(70, "cm")`, `num(1000)`, or another code expression
- **Math:** `$x^2$`

Do not stringify script expressions or double their quotes. Do not expose the structural
`table.cell(...)` wrapper as cell text. When merging cells with different source modes, create one
markup cell and embed each code expression with `#(...)`:

```typ
[#(qty(1, "kV")) \ #(qty(3, "kV"))]
```

Keep `table.cell` properties such as `colspan`, `rowspan`, `align`, `fill`, and `stroke` in the
structural wrapper while the grid editor shows only the reader-visible cell body.

## Source-Styled and Custom Tables

Preserve existing `columns`, `align`, `inset`, `stroke`, `fill`, caption, label, and package-owned
style unless the user explicitly chooses a standard preset. A custom function is editable as a
table only after the real provider confirms its compiled table structure and exact source mapping;
never infer table ownership from a name suffix.

Allow row, column, merge, and split operations only when the provider can map the resulting cells
back to source without discarding unrelated expressions. Otherwise keep the source intact and
explain the precise unsupported structure.

## Verification

1. Call the `tylina` tool with `{"command":"document.validate","args":{}}` after every structural edit.
2. Inspect the affected rendered page for width, wrapping, alignment, spans, repeated headers,
   caption placement, and pagination.
3. Recheck every value and unit against the supplied data.

## Authoritative Sources

- <https://typst.app/docs/guides/tables/>
- <https://typst.app/docs/reference/model/table/>
- `_shared/docs/typst/docs/content/guides/tables.typ`
