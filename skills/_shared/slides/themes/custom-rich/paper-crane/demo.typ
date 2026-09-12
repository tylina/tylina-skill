#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#show: paper-crane-theme.with(
  aspect-ratio: "16-9",
  footer: [Paper Crane],
  config-info(
    title: [The Geometry of Ideas],
    subtitle: [How Structured Thinking Creates Beautiful Outcomes],
    author: [Origami Design Institute],
    date: datetime.today(),
    institution: [School of Creative Strategy],
  ),
  config-common(breakable: false),
)

#title-slide()

= Foundations

== The Art of Folding Ideas

#cols[
  Every great strategy begins with a single fold -- a decision that constrains possibilities and creates structure from formlessness.

  #insight-box([Core Principle], [
    Constraints are not limitations. Each fold reduces degrees of freedom while revealing new dimensions of possibility. The best frameworks are elegant because they are simple.
  ])
][
  #concept-card([Three Laws of Structured Thinking], [
    - *Reduction*: eliminate the unnecessary
    - *Precision*: every fold is intentional
    - *Emergence*: complexity arises from simplicity

    Interior angle of a regular #mi(`n`)-gon: #mi(`\theta = \frac{(n-2) \cdot 180^\circ}{n}`)
  ])
]

== Measuring Impact

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
  stat-card([Teams Transformed], [127]),
  stat-card([Efficiency Gain], [3.4×], accent: palette.primary),
  stat-card([Ideas Shipped], [890]),
)

#v(10pt)
#crane-divider()
#v(10pt)

#quote-card(
  [The most elegant solution is the one where nothing can be removed without breaking everything.],
  author: [Antoine de Saint-Exupéry (paraphrased)],
)

== Framework Comparison

#comparison-card(
  [Traditional Approach], [Linear planning with fixed milestones. Heavy documentation upfront. Assumes predictability.],
  [Origami Method], [Iterative folding with adaptive checkpoints. Lightweight structure. Embraces emergence.],
)

#v(12pt)

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  fold-card([When to Use Traditional], [
    Regulatory environments, safety-critical systems, or when requirements are truly fixed and well-understood.
  ]),
  fold-card([When to Use Origami], [
    Innovation projects, product discovery, or any domain where learning happens faster than planning.
  ]),
)

= Process

== The Five Folds of Strategy

#cols(columns: (2fr, 3fr))[
  #stack(
    spacing: .8em,
    stat-card([Sequential Folds], [5]),
    quote-card(
      [A crane requires exactly 24 folds. Not 23. Not 25. Precision is not perfectionism -- it is respect for the medium.],
    ),
  )
][
  #stack(
    spacing: .8em,
    timeline-entry([1], [Observe], [Gather signals from the environment without judgment. Map the landscape of possibilities before making any commitments.]),
    timeline-entry([2], [Frame], [Define the problem space. Every fold begins with choosing where to place the crease -- the framing IS the strategy.]),
    timeline-entry([3], [Fold], [Execute the first structural move. Make it reversible if possible. Commit fully when irreversible.]),
    timeline-entry([4], [Inspect], [Assess the result. Does the fold create the geometry you intended? Adjust before the next fold.]),
    timeline-entry([5], [Emerge], [The final form appears not from any single fold, but from the accumulated precision of all folds together.]),
  )
]

== Design Principles in Practice

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  origami-box([Intentionality], [
    Every element serves a purpose. If you cannot articulate why something exists, it should not exist. Decoration without function is clutter.
  ]),
  origami-box([Structural Integrity], [
    The strength of the whole depends on the precision of each part. One sloppy fold weakens the entire form.
  ], accent: palette.dark),
)

#v(10pt)

#grid(columns: (1fr, 1fr), column-gutter: 16pt,
  origami-box([Negative Space], [
    What you leave out matters as much as what you include. The gaps between folds define the form as much as the folds themselves.
  ], accent: palette.primary),
  origami-box([Reversibility], [
    Design for undo. The best systems allow you to unfold a decision and try a different crease without destroying the whole.
  ], accent: palette.accent),
)

== Adoption Metrics

#figure[
  #table(
    columns: (auto, 1fr, 1fr, auto),
    inset: 10pt,
    stroke: 0.5pt + palette.border,
    fill: (x, y) => if y == 0 { palette.card } else { none },
    [*Quarter*], [*Teams Onboarded*], [*Satisfaction*], [*Output*],
    [Q1 2025], [12 teams], [78%], [+15%],
    [Q2 2025], [28 teams], [84%], [+23%],
    [Q3 2025], [45 teams], [91%], [+34%],
    [Q4 2025], [67 teams], [94%], [+41%],
  )
]

= Applications

== Case Study: Product Innovation

#cols[
  #insight-box([Challenge], [
    A mature SaaS platform needed to reinvent its core workflow without disrupting 50K active users. Traditional roadmapping had failed three times.
  ])

  #v(8pt)

  #fold-tag([Product Strategy]) #h(4pt) #fold-tag([User Research]) #h(4pt) #fold-tag([Incremental Delivery]) #h(4pt) #fold-tag([A/B Testing], color: palette.sage)
][
  #concept-card([Solution: Iterative Folding], [
    Applied the five-fold method:
    - *Observed* usage patterns for 6 weeks
    - *Framed* the problem as "workflow friction"
    - *Folded* a parallel track (shadow mode)
    - *Inspected* with 5% canary group
    - *Emerged* with 40% faster task completion
  ], accent: palette.dark)
]

== Building Creative Teams

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  concept-card([Psychological Safety], [
    Teams fold better when they know a mis-fold will not end their career. Create space for experimentation.
  ]),
  concept-card([Diverse Perspectives], [
    The same paper can become a crane, a flower, or a dragon. Diverse teams see more possible folds.
  ], accent: palette.dark),
  concept-card([Shared Language], [
    When everyone understands fold vocabulary, collaboration becomes effortless. Invest in training.
  ], accent: palette.sage),
)

#v(8pt)
#crane-divider()
#v(8pt)

#insight-box([Key Takeaway], [
  The strongest teams are not those with the most talent, but those with the most trust. Trust enables bold folds.
])

== Scaling the Method

#cols(columns: (1fr, 1fr), gutter: 16pt)[
  #stack(
    spacing: .8em,
    timeline-entry([A], [Individual], [Start with personal practice. Master the five folds on solo projects before teaching others.]),
    timeline-entry([B], [Team], [Introduce shared fold reviews. Weekly sessions where the team inspects and adjusts together.]),
    timeline-entry([C], [Organization], [Establish fold patterns as organizational memory. Document what works. Share across teams.]),
  )
][
  #stack(
    spacing: .8em,
    origami-box([Anti-Patterns to Avoid], [
      - Folding without observing first
      - Too many folds at once (batch risk)
      - Ignoring the inspect step
      - Optimizing individual folds over whole-form coherence
    ], accent: palette.primary),
    fold-card([Success Metric], [
      When teams naturally think in folds without being prompted, the method has been internalized. This typically takes 3-4 months of consistent practice.
    ]),
  )
]

#focus-slide[
  The goal is not to fold faster. \
  The goal is to fold with such precision \
  that the final form appears inevitable.
]

#ending-slide[Thank You]
