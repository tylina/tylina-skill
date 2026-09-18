#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [A Small Typst Experiment],
  abstract: [This compile-verified example demonstrates a source-controlled IEEE-style layout.],
  authors: (
    (
      name: "Example Author",
      department: [Document Systems],
      organization: [Tylina],
      location: [Online],
      email: "author@example.invalid",
    ),
  ),
  index-terms: ("Typst", "document systems"),
  bibliography: bibliography("refs.bib"),
)

= Introduction
This paragraph cites a deliberately synthetic record @example. The source stays ordinary
Typst so the template controls the page geometry without changing the document model.

== A small equation
The example keeps a labelled equation semantic:

$ a + b = c $ <eq:demo>

The reference @eq:demo remains available to the surrounding document.

== A small table
#figure(
  table(
    columns: (1fr, 1fr),
    table.header[*Input*][*Output*],
    [source], [semantic layout],
    [review], [visible evidence],
  ),
  caption: [A source-controlled table],
) <tab:demo>

The table is cited as @tab:demo, and the synthetic bibliography is emitted by the template.
