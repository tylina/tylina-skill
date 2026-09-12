// Quill Ink Theme — Demo Presentation
// Topic: The Philosophy of Language — From Aristotle to Wittgenstein

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "template.typ": *

#set text(font: ("Baskerville", "Songti SC", "Arial Unicode MS"))

#show: quill-ink-theme.with(
  aspect-ratio: "16-9",
  footer: [Department of Philosophy],
  config-common(breakable: false),
  config-info(
    title: [The Philosophy of Language],
    subtitle: [From Aristotle's Categories to Wittgenstein's Language Games],
    author: [Prof. Eleanor Ashworth],
    date: datetime.today(),
    institution: [Faculty of Arts & Humanities, King's College London],
  ),
)

// === Cover Page ===

#title-slide()

#speaker-note[Welcome the audience. Introduce the scope: a survey of how philosophers have understood the relationship between language, thought, and reality across two millennia.]

// === Outline ===

#outline-slide(title: [Table of Contents])

#speaker-note[Walk through the four major sections: Classical foundations, Medieval contributions, Modern turning point, and Contemporary debates.]

// === Chapter 1: Classical Foundations ===

= Classical Foundations

== Aristotle's Categories

#cols(columns: (3fr, 2fr))[
  === The Organon

  Aristotle's _Categories_ (c. 350 BCE) established the first systematic account of predication. Every meaningful statement attributes a predicate to a subject:

  - *Substance* (ousia): "Socrates is a man"
  - *Quantity*: "The line is two cubits long"
  - *Quality*: "Knowledge is a virtue"
  - *Relation*: "Double is greater than half"

  #quill-tag[Ontology] #quill-tag[Predication] #quill-tag[Logic]
][
  #theorem-block[Aristotle's Square of Opposition][
    The logical relationships between categorical propositions:

    $ A: forall x (S x -> P x) $
    $ E: forall x (S x -> not P x) $
    $ I: exists x (S x and P x) $
    $ O: exists x (S x and not P x) $
  ]
]

#speaker-note[Explain that Aristotle was the first to systematically classify the ways we can speak about things. The ten categories are substance, quantity, quality, relation, place, time, position, state, action, passion.]

== The Stoic Contribution

#cols[
  #manuscript-card[Lekta (Sayables)][
    The Stoics distinguished between:

    - The *signifier* (phone) --- the sound
    - The *signified* (lekton) --- the meaning
    - The *referent* (tynchanon) --- the thing

    This tripartite analysis anticipates Frege's distinction between sign, sense, and reference by two millennia.
  ]
][
  #stack(
    spacing: .8em,
    ink-quote(
      [The limits of my language mean the limits of my world.],
      [Ludwig Wittgenstein, _Tractatus_ 5.6],
    ),
    annotation-card(
      [Historical Note],
      [Though often attributed to modern philosophy of language, the Stoic theory of _lekta_ represents the first purely semantic theory --- distinguishing meaning from both sound and object.],
    ),
  )
]

#speaker-note[Emphasize the Stoic innovation: they were the first to isolate meaning as a distinct category, neither physical sound nor physical object.]

= Medieval Developments

== The Problem of Universals

#stack(
  spacing: .8em,
  cols(
    columns: (1fr, 1fr, 1fr),
    lazy-layout: true,
    [#stat-card[3][Major Positions]],
    [#stat-card[2,300+][Years of Recorded Debate]],
    [#stat-card[$infinity$][Implications]],
  ),
  cols(
    columns: (1fr, 1fr),
    lazy-layout: true,
    [
      #codex-box[The Realist Position][
        *Universals exist independently of minds and language.*

        When we say "Socrates is wise," the predicate "wise" names a real universal --- Wisdom itself --- that exists in a Platonic realm and is _instantiated_ in particular wise individuals.

        Chief defenders: Plato, William of Champeaux, Duns Scotus.
      ]
    ],
    [
      #codex-box[The Nominalist Position][
        *Only particulars exist; universals are mere names.*

        "Wisdom" is not a thing but a word (_nomen_) we apply to similar particulars. The resemblance between wise people is explained without positing a shared universal entity.

        Chief defenders: Roscelin, William of Ockham, Hobbes.
      ]
    ],
  ),
)

#speaker-note[This debate shaped all subsequent philosophy of language. The question is whether general terms refer to real entities or are merely convenient labels for groups of similar individuals.]

== Ockham's Razor & Supposition Theory

#cols(columns: (3fr, 2fr))[
  === Supposition Theory

  William of Ockham (c. 1287--1347) developed _suppositio_ theory --- perhaps the most sophisticated medieval semantics:

  #comparison-table(
    ([Type], [Definition], [Example]),
    (
      ([Personal], [Term stands for its referents], ["Man is mortal"]),
      ([Simple], [Term stands for concept], ["Man is a species"]),
      ([Material], [Term stands for itself], ["Man is a monosyllable"]),
    ),
  )
][
  #theorem-block[Ockham's Razor][
    _Entia non sunt multiplicanda praeter necessitatem._

    Entities must not be multiplied beyond necessity.

    $ P(H|E) = frac(P(E|H) dot P(H), P(E)) $

    Applied to semantics: do not posit real universals when mental concepts suffice.
  ]
]

#speaker-note[Ockham's supposition theory is remarkably sophisticated. It distinguishes three ways a term can function in a proposition, anticipating modern distinctions between use and mention.]

= The Modern Turn

== Frege's Revolution

#stack(
  spacing: .8em,
  cols(
    columns: (1fr, 1fr),
    lazy-layout: true,
    [
      #manuscript-card[Sense and Reference (1892)][
        Gottlob Frege's _Uber Sinn und Bedeutung_ introduced the foundational distinction:

        - *Sense* (Sinn): the mode of presentation
        - *Reference* (Bedeutung): the object denoted

        "The Morning Star" and "The Evening Star" share a reference (Venus) but differ in sense.
      ]
    ],
    [
      #manuscript-card[The Compositionality Principle][
        The meaning of a complex expression is determined by:

        + The meanings of its constituent parts
        + The syntactic rules combining them

        #mi(`\text{M}(\alpha \circ \beta) = f(\text{M}(\alpha), \text{M}(\beta))`)

        This principle remains the cornerstone of formal semantics.
      ]
    ],
  ),
  marginalia([Frege's insight resolved a puzzle that had troubled logicians since Leibniz: how can identity statements be informative? If $a = b$, why does "$a = a$" differ cognitively from "$a = b$"?]),
)

#speaker-note[Frege's 1892 paper is arguably the founding document of analytic philosophy of language. The sense-reference distinction resolves the puzzle of informative identity statements.]

== Russell & Definite Descriptions

#cols(columns: (2fr, 3fr))[
  #stack(
    spacing: .8em,
    annotation-card(
      [The King of France],
      [
        Consider: "The present King of France is bald."

        Is this true? False? Neither?

        Russell's analysis: it is _false_, because it asserts existence claims that fail.
      ],
    ),
    [#quill-tag[Analysis] #quill-tag[Logic] #quill-tag[Ontology]],
  )
][
  #theorem-block[Russell's Theory of Descriptions (1905)][
    "The F is G" is analyzed as the conjunction:

    $ exists x [F(x) and forall y (F(y) -> y = x) and G(x)] $

    This eliminates apparent reference to non-existent entities. The sentence "The present King of France is bald" is simply _false_ because nothing satisfies $F(x)$ where $F$ = "is presently King of France."
  ]
]

#speaker-note[Russell's 1905 paper On Denoting showed how logical analysis could dissolve philosophical puzzles. The theory eliminates the need to posit non-existent objects as referents of empty descriptions.]

= Language Games & Beyond

== Wittgenstein's Later Philosophy

#focus-slide[
  #stack(
    spacing: .8em,
    [_"For a large class of cases --- though not for all ---\
    in which we employ the word 'meaning'\
    it can be defined thus:\
    the meaning of a word is its use in the language."_],
    {
      set text(size: 0.5em, weight: "regular")
      [— Ludwig Wittgenstein, _Philosophical Investigations_ \u{00A7}43]
    },
  )
]

#speaker-note[This is the pivotal transition from the Tractatus to the Investigations. Wittgenstein moved from a picture theory of meaning to a use theory, fundamentally reshaping philosophy of language.]

== The Concept of Language Games

#cols[
  #codex-box[Language Games][
    Wittgenstein introduced _Sprachspiel_ to emphasize that meaning emerges from rule-governed social practices:

    - Giving orders and acting on them
    - Describing an object by appearance
    - Reporting an event
    - Forming and testing hypotheses
    - Making up a story
    - Asking, thanking, cursing, greeting, praying
  ]
][
  #stack(
    spacing: .8em,
    annotation-card(
      [Family Resemblance],
      [There is no single essence shared by all "games." Rather, games form a network of overlapping similarities --- like the resemblances among family members.],
    ),
    ink-quote(
      [What we do is to bring words back from their metaphysical to their everyday use.],
      [Wittgenstein, PI \u{00A7}116],
    ),
  )
]

#speaker-note[Language games are not just an analogy. Wittgenstein means that language is a form of activity, inseparable from the forms of life in which it is embedded.]

== Contemporary Formal Semantics

#stack(
  spacing: .8em,
  cols(
    columns: (1fr, 1fr),
    lazy-layout: true,
    [
      #manuscript-card[Montague Grammar][
        Richard Montague (1970) showed that natural language can be given a rigorous semantics using:

        - Typed lambda calculus
        - Intensional logic
        - Model-theoretic interpretation

        #mi(`\llbracket \text{every man} \rrbracket = \lambda P.\forall x[\text{man}(x) \to P(x)]`)
      ]
    ],
    [
      #manuscript-card[Possible Worlds Semantics][
        Modal operators receive truth conditions via Kripke semantics:

        $ square phi "is true at" w "iff" forall v (w R v -> phi "at" v) $

        $ diamond phi "is true at" w "iff" exists v (w R v and phi "at" v) $

        This framework enabled precise analysis of necessity, possibility, knowledge, belief, and tense.
      ]
    ],
  ),
  colophon([These formal approaches fulfill Leibniz's dream of a _calculus ratiocinator_ --- a symbolic system for reasoning about meaning with mathematical precision.]),
)

#speaker-note[Montague's famous claim was that there is no important theoretical difference between natural languages and formal languages. His work showed how compositionality could be implemented formally.]

== Key Debates Today

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #manuscript-card[Externalism][
    Meaning is not "in the head." Twin Earth thought experiments (Putnam 1975) show that reference is determined partly by the external environment.

    #quill-tag[Putnam] #quill-tag[Burge]
  ]
][
  #manuscript-card[Contextualism][
    Truth conditions of sentences vary with context beyond obvious indexicals. "Tall," "ready," "knows" --- nearly all expressions are context-sensitive.

    #quill-tag[Travis] #quill-tag[Recanati]
  ]
][
  #manuscript-card[Expressivism][
    Not all meaningful speech is descriptive. Moral, aesthetic, and modal language may express attitudes rather than describe facts.

    #quill-tag[Gibbard] #quill-tag[Yalcin]
  ]
]

#speaker-note[These three debates define the current landscape. Externalism challenges the Fregean picture, contextualism challenges compositionality, and expressivism challenges the primacy of truth conditions.]

// === Focus Slide ===

#focus-slide[
  #stack(
    spacing: .8em,
    [_"Philosophy is a battle against the bewitchment\
    of our intelligence by means of language."_],
    {
      set text(size: 0.5em, weight: "regular")
      [— Wittgenstein, _Philosophical Investigations_ \u{00A7}109]
    },
  )
]

#speaker-note[This quote encapsulates the therapeutic conception of philosophy that characterizes the later Wittgenstein. Philosophy does not solve problems but dissolves them by showing how language misled us.]

// === Ending Slide ===

#ending-slide[Thank You]

#speaker-note[Thank the audience. Invite questions. Mention that handouts with the formal derivations and full bibliography are available.]
