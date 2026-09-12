// ═══════════════════════════════════════════════════════════════
// Clean Math Presentation Theme Demo
// Universe package: @preview/clean-math-presentation:0.1.1
// Built for mathematical presentations with theorem support
// NOTE: This package depends on touying 0.5.5 (not 0.7.4)
// ═══════════════════════════════════════════════════════════════

#import "@preview/touying:0.5.5": *
#import "@preview/clean-math-presentation:0.1.1": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: clean-math-presentation-theme.with(
  config-info(
    title: [Introduction to Real Analysis],
    short-title: [Real Analysis],
    subtitle: [Continuity, Compactness, and Convergence],
    // Multi-author system with affiliation linking
    authors: (
      (name: "Alice Smith", affiliation-id: 1),
      (name: "Bob Johnson", affiliation-id: 2),
      (name: "Carol Williams", affiliation-id: 1),
    ),
    affiliations: (
      (id: 1, name: "Department of Mathematics, University of Somewhere"),
      (id: 2, name: "Institute of Applied Sciences, Nice University"),
    ),
    // Presenting author — will be underlined on the title slide
    author: "Alice Smith",
    date: datetime.today(),
  ),
  config-colors(
    primary: rgb("#6068d6"),
    secondary: rgb("#2f1971"),
  ),
  config-common(
    new-section-slide-fn: new-section-slide,
  ),
  // Set to true to show a progress bar below the footer.
  progress-bar: true,
)

// Keep document fonts in the presentation entry, not in the package theme.
#set text(font: ("IBM Plex Sans", "PingFang SC"))

// --- Title Slide ---
#title-slide()

// ═══════════════════════════════════════════════════
// = heading creates a new section with an outline slide because the
// new-section-slide function is registered above.
// ═══════════════════════════════════════════════════

= Foundations

== Overview

#slide(title: "About This Presentation")[
  This demo showcases all features of the *Clean Math Presentation* theme:

  - *Theorem environments*: theorem, definition, lemma, corollary, example, proof
  - *Custom blocks*: generic `tblock` for any named environment
  - *Multi-author system*: three authors across two affiliations
  - *Progress bar*: visible at the top of each slide
  - *Special slides*: title, focus, ending, and outline slides
  - *Equations*: labeled (numbered) and unlabeled display math
]

== Core Definitions

#slide(title: "Metric Spaces and Continuity")[
  #stack(
    spacing: 0.8em,
    definition(title: "Metric Space")[
      A _metric space_ is a pair #mi(`(X, d)`) where #mi(`X`) is a set and #mi(`d: X \times X \to \mathbb{R}`) is a function satisfying for all #mi(`x, y, z \in X`):
      + #mi(`d(x, y) \geq 0`) and #mi(`d(x, y) = 0 \iff x = y`) #h(1em) (positive definiteness)
      + #mi(`d(x, y) = d(y, x)`) #h(1em) (symmetry)
      + #mi(`d(x, z) \leq d(x, y) + d(y, z)`) #h(1em) (triangle inequality)
    ],
    definition(title: "Continuity")[
      A function #mi(`f: (X, d_X) \to (Y, d_Y)`) is _continuous_ at #mi(`x_0 \in X`) if
      #mitex(`\forall \epsilon > 0, \quad \exists \delta > 0: \quad d_X(x, x_0) < \delta \implies d_Y(f(x), f(x_0)) < \epsilon.`)
    ],
  )
]

= Key Results

== Theorems and Proofs

#slide(title: "The Mean Value Theorem")[
  #stack(
    spacing: 0.8em,
    theorem(title: "Mean Value Theorem")[
      Let #mi(`f: [a, b] \to \mathbb{R}`) be continuous on #mi(`[a, b]`) and differentiable on #mi(`(a, b)`).
      Then there exists #mi(`c \in (a, b)`) such that:
      #mitex(`f'(c) = \frac{f(b) - f(a)}{b - a}.`)
    ],
    proof[
      Define #mi(`g(x) = f(x) - f(a) - \frac{f(b) - f(a)}{b - a} (x - a)`).
      Then #mi(`g(a) = g(b) = 0`), so by Rolle's theorem there exists #mi(`c \in (a, b)`)
      with #mi(`g'(c) = 0`), which gives #mi(`f'(c) = \frac{f(b) - f(a)}{b - a}`).
    ],
  )
]

== Compactness

#slide(title: "Bolzano--Weierstrass and Heine--Borel")[
  #theorem(title: "Bolzano--Weierstrass")[
    Every bounded sequence in #mi(`\mathbb{R}^n`) has a convergent subsequence.
  ]

  #pause

  #theorem(title: "Heine--Borel")[
    A subset of #mi(`\mathbb{R}^n`) is compact if and only if it is closed and bounded.
  ]

  #corollary[
    Every continuous function on a compact set attains its maximum and minimum.
  ]
]

== Lemmas and Corollaries

#slide(title: "Number Theory Essentials")[
  #lemma(title: "Euclid's Lemma")[
    If #mi(`p`) is a prime number and #mi(`p | ab`), then #mi(`p | a`) or #mi(`p | b`).
  ]

  #proof[
    Since #mi(`p`) is prime and #mi(`p \nmid a`), we have #mi(`\gcd(p, a) = 1`).
    By Bezout's identity, there exist integers #mi(`x, y`) with #mi(`px + ay = 1`).
    Multiplying by #mi(`b`): #mi(`pxb + aby = b`). Since #mi(`p | ab`), we get #mi(`p | b`).
  ]

  #corollary(title: "Fundamental Theorem of Arithmetic")[
    Every integer #mi(`n > 1`) has a unique factorization into prime numbers.
  ]
]

= Examples and Applications

== Worked Examples

#slide(title: "Examples in Analysis")[
  #example[
    The function #mi(`f(x) = x^2`) is uniformly continuous on any bounded interval #mi(`[a, b]`)
    but _not_ uniformly continuous on #mi(`\mathbb{R}`).
  ]

  #example[
    Consider the sequence #mi(`a_n = (1 + 1/n)^n`). This is monotonically increasing
    and bounded above by #mi(`e`), so by the Monotone Convergence Theorem it converges:
    #mitex(`\lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = e \approx 2.71828.`)
  ]
]

== Custom Theorem Blocks

#slide(title: "Using Generic tblock")[
  The `tblock` function lets you create any named environment:

  #tblock(blocktitle: "Conjecture", title: "Goldbach")[
    Every even integer greater than 2 can be expressed as the sum of two primes.
  ]

  #tblock(blocktitle: "Remark")[
    This conjecture has been verified for all even integers up to #mi(`4 \times 10^{18}`)
    but remains unproven.
  ]

  #tblock(blocktitle: "Axiom", title: "Completeness")[
    Every non-empty subset of #mi(`\mathbb{R}`) that is bounded above has a least upper bound.
  ]
]

== Equations

#slide(title: "Labeled and Unlabeled Equations")[
  Labeled equations are automatically numbered:
  #mitex(`\int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}`) <eq:gaussian>

  We can reference @eq:gaussian in the text.

  Unlabeled equations have no number:
  #mitex(`\sum_{n=0}^\infty x^n = \frac{1}{1 - x}, \quad |x| < 1.`)

  Inline math: #mi(`e^{i\pi} + 1 = 0`) (Euler's identity).
]

= Conclusion

== Summary

#slide(title: "Summary")[
  The *Clean Math Presentation* theme provides everything needed for mathematical talks:

  - Six theorem environments: `theorem`, `definition`, `lemma`, `corollary`, `example`, `proof`
  - Generic `tblock` for custom named blocks (conjectures, axioms, remarks, ...)
  - Multi-author title slide with affiliation superscripts
  - Progress bar, focus slides, ending slides
  - Automatic equation numbering for labeled equations
]

// --- Focus Slide ---
#focus-slide[
  #stack(
    spacing: 0.8em,
    [*Key Insight*],
    [Clean design lets the mathematics speak for itself.],
  )
]

// --- Chrome-free Ending Slide ---
// Package 0.1.1's ending-slide retains the preceding header/footer state.
#slide(
  title: none,
  header: none,
  footer: none,
  align: horizon + center,
  config: config-page(header: none, footer: none, margin: 2em),
)[
  #stack(
    spacing: 0.8em,
    text(size: 1.8em, weight: "bold", fill: tertiary-color)[Thank You],
    [Questions and discussion welcome.],
  )
]
