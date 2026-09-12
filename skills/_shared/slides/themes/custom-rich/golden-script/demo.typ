// Golden-Script Theme Demo — Foundations of Real Analysis
// Mathematical elegance presentation with proof notation aesthetics
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "template.typ": *

#set text(font: ("Helvetica Neue", "Arial"), size: 18pt)
#show raw: set text(font: "DejaVu Sans Mono")

#show: golden-script-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [MATH 401 -- Real Analysis],
  config-info(
    title: [Foundations of Real Analysis],
    subtitle: [Sequences, Limits, and Continuity],
    author: [Prof. Alexander Grothendieck],
    institution: [Department of Pure Mathematics, Institute for Advanced Study],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ==========================================
// Title Slide
// ==========================================
#title-slide()

// ==========================================
// Section 1: The Real Numbers
// ==========================================
= The Real Numbers

== Completeness Axiom

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  definition-box([Complete Ordered Field], [
    The real numbers $RR$ form a *complete ordered field*, meaning every non-empty subset of $RR$ that is bounded above has a least upper bound (supremum).

    This axiom distinguishes $RR$ from $QQ$.
  ]),
  theorem-box([Archimedean Property], [
    For any $x, y in RR$ with $x > 0$, there exists $n in NN$ such that $n x > y$.
  ], number: "1.1"),
)

#v(0.5em)

#proof-block[
  Let $S = {n x : n in NN}$. Suppose for contradiction that $n x <= y$ for all $n$. Then $S$ is bounded above by $y$. By completeness, $sup S$ exists. But $(sup S) - x$ is not an upper bound, so there exists $m$ with $m x > (sup S) - x$, giving $(m+1)x > sup S$. Contradiction.
]

== Density of Rationals

#cols[
  #theorem-box([Density of $QQ$ in $RR$], [
    Between any two distinct real numbers, there exists a rational number. That is, if $a < b$ are real, then there exists $q in QQ$ with $a < q < b$.
  ], number: "1.2")

  #v(0.4em)

  #remark-note[
    This theorem, combined with completeness, reveals the subtle interplay between $QQ$ and $RR$: rationals are "dense" yet $RR without QQ$ is uncountable.
  ]
][
  #lemma-card([Nested Intervals], [
    If $I_n = [a_n, b_n]$ is a sequence of nested closed intervals with $|I_n| -> 0$, then $inter.big_(n=1)^oo I_n$ contains exactly one point.
  ], number: "1.1")

  #v(0.4em)

  #corollary-note([Uncountability of $RR$], [
    The real numbers are uncountable. This follows from Cantor's diagonal argument or from the nested intervals lemma applied to any proposed enumeration.
  ])
]

// ==========================================
// Section 2: Sequences and Limits
// ==========================================
= Sequences & Limits

== Convergence

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  definition-box([Limit of a Sequence], [
    A sequence $(a_n)$ *converges* to $L in RR$ if for every $epsilon > 0$, there exists $N in NN$ such that for all $n >= N$:

    $ |a_n - L| < epsilon $

    We write $lim_(n -> oo) a_n = L$.
  ]),
  example-box([Classic Example], [
    Show that $lim_(n -> oo) 1/n = 0$.

    _Solution._ Given $epsilon > 0$, choose $N > 1/epsilon$ (Archimedean property). Then for $n >= N$:
    $ |1/n - 0| = 1/n <= 1/N < epsilon $
  ]),
)

#v(.8em)

#stack(dir: ltr, spacing: 0.6em,
  axiom-tag([Boundedness], number: "1"),
  axiom-tag([Monotonicity], number: "2"),
  axiom-tag([Completeness], number: "3"),
)

== Cauchy Sequences

#cols[
  #definition-box([Cauchy Sequence], [
    A sequence $(a_n)$ is *Cauchy* if for every $epsilon > 0$, there exists $N in NN$ such that for all $m, n >= N$:

    $ |a_m - a_n| < epsilon $
  ])

  #theorem-box([Cauchy Completeness], [
    A sequence of real numbers converges if and only if it is a Cauchy sequence.
  ], number: "2.1")
][
  #proof-block[
    ($=>$) If $a_n -> L$, given $epsilon > 0$, choose $N$ so $|a_n - L| < epsilon/2$ for $n >= N$. Then for $m, n >= N$: $|a_m - a_n| <= |a_m - L| + |L - a_n| < epsilon$.

    ($arrow.l.double$) A Cauchy sequence is bounded. By Bolzano-Weierstrass, it has a convergent subsequence $a_(n_k) -> L$. Then $a_n -> L$.
  ]

  #remark-note[
    This characterization verifies convergence without first knowing the limit.
  ]
]

// ==========================================
// Section 3: Continuity
// ==========================================
= Continuity

== Epsilon-Delta Definition

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  definition-box([$epsilon$-$delta$ Continuity], [
    A function $f: D -> RR$ is *continuous at* $c in D$ if for every $epsilon > 0$, there exists $delta > 0$ such that:

    $ |x - c| < delta ==> |f(x) - f(c)| < epsilon $
  ]),
  stack(
    spacing: .8em,
    proposition-card([Sequential Criterion], [
      $f$ is continuous at $c$ if and only if for every sequence $(x_n)$ in $D$ with $x_n -> c$, we have $f(x_n) -> f(c)$.
    ], number: "3.1"),
    remark-note[
      The sequential criterion often simplifies proofs of discontinuity: find one sequence where the criterion fails.
    ],
  ),
)

== MiTeX: Key Formulas

This slide demonstrates MiTeX integration for LaTeX-style math rendering.

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  theorem-box([Intermediate Value Theorem], [
    If $f: [a,b] -> RR$ is continuous and $f(a) < 0 < f(b)$, then there exists $c in (a,b)$ with $f(c) = 0$.

    In MiTeX notation:

    #mi(`\exists\, c \in (a,b) : f(c) = 0`)
  ], number: "3.1"),
  lemma-card([Extreme Value Theorem], [
    A continuous function on a closed bounded interval $[a,b]$ attains its maximum and minimum.

    #mi(`\max_{x \in [a,b]} f(x) = f(c)`)

    for some $c in [a,b]$.
  ], number: "3.1"),
)

// ==========================================
// Section 4: Series
// ==========================================
= Infinite Series

== Convergence Tests

#cols[
  #definition-box([Convergent Series], [
    The series $sum_(n=1)^oo a_n$ *converges* if the sequence of partial sums $S_N = sum_(n=1)^N a_n$ converges. The value is $sum_(n=1)^oo a_n = lim_(N -> oo) S_N$.
  ])

  #v(0.3em)

  #theorem-box([Comparison Test], [
    If $0 <= a_n <= b_n$ for all $n$ and $sum b_n$ converges, then $sum a_n$ converges.
  ], number: "4.1")
][
  #example-box([Basel Problem], [
    Euler proved in 1734:

    #mitex(`\sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}`)

    This was a famous open problem for nearly a century.
  ])

  #v(0.3em)

  #conjecture-card([Riemann Hypothesis], [
    All non-trivial zeros of $zeta(s) = sum_(n=1)^oo n^(-s)$ have real part $1/2$.

    Millennium Prize Problem -- still open since 1859.
  ])
]

== Power Series and Taylor Expansion

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  theorem-box([Taylor's Theorem], [
    If $f$ has $n+1$ continuous derivatives on $[a,b]$, then for $x in (a,b)$:

    #mi(`f(x) = \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!}(x-a)^k + R_n(x)`)

    where $R_n$ is the remainder term.
  ], number: "4.2"),
  {
    example-box([Exponential Series], [
      The exponential function has the Maclaurin series:

      #mitex(`e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \cdots`)

      This converges for all $x in RR$ with infinite radius.
    ])
  },
)

#v(0.3em)

#qed-divider(width: 60%)

// ==========================================
// Section 5: Topology of R
// ==========================================
= Topology of $RR$

== Compactness

#cols[
  #definition-box([Compact Set], [
    A set $K subset.eq RR$ is *compact* if every open cover of $K$ has a finite subcover. Equivalently (Heine-Borel): $K$ is compact iff $K$ is closed and bounded.
  ])

  #v(0.3em)

  #theorem-box([Bolzano-Weierstrass], [
    Every bounded sequence in $RR$ has a convergent subsequence.
  ], number: "5.1")

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.6em,
    axiom-tag([Closed], number: "1"),
    axiom-tag([Bounded], number: "2"),
    axiom-tag([Sequentially Compact], number: "3"),
  )
][
  #proof-block[
    We prove Bolzano-Weierstrass via nested intervals. Let $(a_n)$ be bounded, say $a_n in [A, B]$ for all $n$. Bisect $[A,B]$; at least one half contains infinitely many terms. Choose that half as $[a_1', b_1']$ and pick $a_(n_1)$ from it. Repeat: bisect and choose, obtaining a nested sequence $[a_k', b_k']$ with $|b_k' - a_k'| = (B-A)/2^k -> 0$. The subsequence $(a_(n_k))$ converges to the unique point in $inter I_k$.
  ]

  #v(0.3em)

  #corollary-note([Sequential Compactness], [
    $K subset.eq RR$ is compact if and only if every sequence in $K$ has a subsequence converging to a point in $K$.
  ])
]

// ==========================================
// Focus Slide
// ==========================================

#focus-slide[
  _"God made the integers; all else is the work of man."_

  #text(size: 0.6em, weight: "regular", fill: palette.text-muted)[-- Leopold Kronecker, 1886]
]

// ==========================================
// Ending Slide
// ==========================================

#ending-slide[Q.E.D.]
