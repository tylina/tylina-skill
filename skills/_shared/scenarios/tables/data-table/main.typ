#import "table-style.typ": data-table

#set page(paper: "a4", margin: (x: 23mm, y: 22mm), numbering: "1")
#set text(size: 10.5pt)
#set par(leading: 0.65em)

= Data table

Replace the illustrative content below with supplied data. State the unit in each header when a
column does not share one unit, and retain the source's missing-value convention.

#data-table(
  caption: [Illustrative comparison — replace every value before use],
  columns: (1.35fr, 0.8fr, 0.8fr, 0.8fr, 1.8fr),
  align: (left, right, right, right, left),
  header: (
    [Measure],
    [Baseline],
    [Current],
    [Change],
    [Method or qualification],
  ),
  rows: (
    ([Sample A], [12.4], [11.8], [-0.6], [Illustrative values only]),
    ([Sample B], [8.1], [8.9], [+0.8], [Illustrative values only]),
    ([Sample C], [—], [4.2], [—], [No baseline was supplied]),
  ),
  source: [Source: replace with the supplied dataset, table, or record.],
  note: [Note: define units, abbreviations, uncertainty, rounding, and missing values.],
) <tab:data>

Refer to @tab:data by its semantic label. If the real table spans pages, verify that the header
repeats and that a row is not visually detached from the context needed to interpret it.
