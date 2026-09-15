#import "paper.typ": research-paper

#show: research-paper.with(
  title: [Evidence-Aligned Paper Title],
  authors: ([Author One], [Author Two]),
  date: datetime.today().display("[month repr:long] [day], [year]"),
  abstract: [State the question, supplied method, supported result, and limitation in a compact paragraph.],
)

= Introduction <sec:introduction>

Describe the problem, audience, and contribution using only supplied or verified evidence.
The Typst documentation is cited here solely to demonstrate a real bibliography workflow
@typst-docs.

= Method <sec:method>

Define notation before use. For example, a measured quantity can be related to observations by

$ y_i = beta_0 + beta_1 x_i + epsilon_i. $ <eq:model>

Replace @eq:model with the actual model and assumptions. Keep implementation details sufficient
for another reader to reproduce the supplied procedure.

= Results <sec:results>

#figure(
  table(
    columns: (1.4fr, 1fr, 1fr),
    align: (left, right, right),
    table.header([Measure], [Estimate], [Uncertainty]),
    [Replace with a supplied measure], [—], [—],
    [Replace with a second measure], [—], [—],
  ),
  caption: [A semantic placeholder table. Replace every value and caption with supplied evidence.],
) <tab:results>

Explain what @tab:results supports, what it does not support, and how uncertainty was determined.

= Discussion <sec:discussion>

Separate supported interpretation from limitations, alternative explanations, and future work.
Do not turn missing evidence into a conclusion.

= Conclusion <sec:conclusion>

Restate only the contribution established by the preceding evidence.

#bibliography("references.bib", title: "References")

#pagebreak()
#set heading(numbering: "A.1")
= Reproducibility notes <sec:reproducibility>

List supplied data versions, code versions, parameters, exclusions, and unresolved provenance.
