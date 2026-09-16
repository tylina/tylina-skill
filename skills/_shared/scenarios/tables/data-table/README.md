# Data Table

`table-style.typ` owns reusable presentation; `main.typ` owns the canonical headers, rows,
caption, source, and notes. Keep every supplied value, unit, label, order, missing-value meaning,
and attribution intact. Never calculate, interpolate, normalize, or reorder data unless the user
explicitly requests it.

After materialization:

1. Replace every illustrative header, value, source, and note.
2. Keep numeric columns right-aligned and descriptive columns left-aligned.
3. Use an em dash only when it matches the source's missing-value convention.
4. Compile with the longest real labels and inspect wrapping, repeated headers, and page breaks.
5. Confirm that the caption and notes explain units, methods, and abbreviations without changing
   what the data claims.
