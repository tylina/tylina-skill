#import "statements.typ": definition, lemma, theorem, proof

#set page(paper: "a4", margin: (x: 26mm, y: 24mm), numbering: "1")
#set text(font: ("Libertinus Serif", "New Computer Modern"), size: 11pt)
#set par(justify: true, leading: 0.7em)
#set heading(numbering: "1.1")

= Proof note

State every assumption before the first result and keep notation stable throughout the argument.

#definition(title: [Arithmetic progression])[
  A sequence $(a_k)_(k=1)^n$ is an arithmetic progression when there is a constant $d$ such that
  $a_(k+1) - a_k = d$ for every valid $k$.
] <def:progression>

#lemma(title: [Paired terms])[
  For the progression in @def:progression, $a_k + a_(n+1-k) = a_1 + a_n$.
] <lem:pairs>

#proof[
  By the definition, $a_k = a_1 + (k-1)d$ and
  $a_(n+1-k) = a_1 + (n-k)d$. Their sum is
  $2a_1 + (n-1)d = a_1 + a_n$.
]

#theorem(title: [Finite arithmetic sum])[
  If $(a_k)_(k=1)^n$ is an arithmetic progression, then
  $ sum_(k=1)^n a_k = n(a_1 + a_n) / 2. $
] <thm:sum>

#proof[
  Pair the first and last terms, then apply @lem:pairs to every pair. If $n$ is odd, the middle
  term equals $(a_1 + a_n)/2$, so the same expression remains valid.
]

== Review checklist

- Are all quantifiers, domains, and boundary cases explicit?
- Does every inference use a stated assumption or previously established result?
- Does the proof establish exactly @thm:sum, without silently changing its claim?
