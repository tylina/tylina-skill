#import "report.typ": report, callout

#show: report.with(
  title: [Report title],
  subtitle: [Purpose, scope, and reporting period],
  author: [Prepared by],
  organization: [Organization or team],
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#outline(title: [Contents], indent: auto)
#pagebreak()

= Executive summary <sec:summary>

#callout([Decision context])[
  State the decision, audience, supplied evidence, and material limitations in a short paragraph.
]

Summarize only findings established later in the report. Keep recommendations visibly distinct
from completed decisions or observed facts.

= Scope and method <sec:method>

Describe inputs, dates, inclusion criteria, exclusions, and how uncertainty was handled. Link each
method claim to a supplied record or clearly mark it unresolved.

#include "sections/findings.typ"

= Recommendations <sec:recommendations>

For each supported recommendation, name the owner, dependency, expected outcome, and evidence that
would trigger revision. Keep proposals distinct from already approved actions.

#pagebreak()
#set heading(numbering: "A.1")
= Appendix: provenance <sec:provenance>

List exact source files, versions, interview dates, transformations, and unresolved gaps. Do not
invent missing provenance.
