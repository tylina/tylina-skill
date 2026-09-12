#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "template.typ": *

#show raw: set text(font: ("IBM Plex Mono", "Menlo", "Courier"))
#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 20pt)

#show: terrace-garden-theme.with(
  aspect-ratio: "16-9",
  footer: [Mediterranean Architecture],
  config-info(
    title: [The Villa Rustica],
    subtitle: [Architectural Form and Agricultural Function in Roman Italy],
    author: [Prof. Elena Marchetti],
    date: datetime.today(),
    institution: [Department of Classical Archaeology, Universita di Roma],
  ),
  config-common(breakable: false),
)

#title-slide()

#speaker-note[Welcome the audience. Frame the presentation as an interdisciplinary study bridging architecture, agriculture, and social history of Roman Italy.]

#outline-slide()

#speaker-note[Preview the three-part progression from architectural context through materials to archaeological evidence.]

= Architectural Context

== The Roman Villa Tradition

#cols[
  The *villa rustica* paired agricultural production with Hellenistic architectural ambition. Unlike the residential _villa urbana_, it joined productive and elite retreat spaces.

  #terrace-box([Key Distinction], [
    Vitruvius (_De Architectura_, VI.6) distinguishes the _pars urbana_ (living quarters) from the _pars rustica_ (working areas) -- a duality that shaped villa design for three centuries.
  ])
][
  #stone-card([Chronological Range], [
    - *3rd c. BCE*: Early farmstead models
    - *1st c. BCE*: Hellenistic influence peaks
    - *1st c. CE*: Imperial expansion
    - *3rd c. CE*: Decline and transformation
  ])
]

#speaker-note[Establish the temporal and typological framework. Emphasize that the villa rustica is NOT simply a farmhouse but a sophisticated architectural program.]

== Structural Analysis

#cols[
  #arch-card([Peristyle Courtyard], [
    The central organizer: a local-limestone Tuscan colonnade framed an open court for light, air, and the visual axis from _pars urbana_ to _pars rustica_.
  ])

  #v(8pt)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
    garden-tag([Tuscan Order]),
    garden-tag([Opus Reticulatum]),
    garden-tag([Opus Signinum], color: palette.secondary),
  )
][
  The proportional system follows Vitruvian principles:

  #mi(`
    \frac{h_{\text{column}}}{d_{\text{base}}} = 7:1
  `)

  For the intercolumniation spacing:

  #mi(`
    s = \frac{5}{2} d \quad \text{(eustyle)}
  `)

  where $d$ is the column diameter and $s$ the spacing between column centers.
]

#speaker-note[Introduce the mathematical proportional systems used by Roman architects. The Vitruvian ratios are critical for understanding how these structures achieved visual harmony.]

== Villa Typology

#stack(
  spacing: .8em,
  comparison-table(
    ([Type], [Plan Form], [Primary Function]),
    ([Villa Rustica], [Courtyard-centered], [Agricultural production]),
    ([Villa Urbana], [Axial peristyle], [Residential retreat]),
    ([Villa Maritima], [Terraced, coastal], [Leisure and display]),
  ),
  inscription[Villa est quae habet provisionem et conditionem fructuum],
)

#speaker-note[Present the three-part typology. The inscription is from Varro, De Re Rustica -- a villa is defined by its provision for and storage of produce.]

= Material Culture

== Construction Techniques

#cols[
  #stack(
    spacing: .8em,
    column-box([Opus Caementicium], [
      Roman concrete -- the revolutionary material that enabled vaulted spaces, terracing, and durable agricultural infrastructure. Composed of _pozzolana_ (volcanic ash), lime, and aggregate.
    ]),
    column-box([Opus Testaceum], [
      Brick-faced concrete. The terracotta facing (_testae_) provided weather protection while the concrete core bore structural loads.
    ]),
  )
][
  #stack(
    spacing: .8em,
    stone-card([Material Longevity], [
      Studies at Boscoreale (Campania) show that opus caementicium retains 92% compressive strength after 2000 years -- a testament to the empirical knowledge of Roman builders.
    ]),
    grid(columns: (1fr, 1fr), column-gutter: 10pt,
      stat-card([2000], [Years Durability]),
      stat-card([92%], [Strength Retained]),
    ),
  )
]

#speaker-note[Discuss Roman construction materials. Emphasize that these are not primitive technologies but sophisticated empirical engineering with remarkable longevity.]

== The Terrace as Architectural Element

#cols(columns: (1.5fr, 1fr))[
  The Mediterranean terrace (_solarium_ or _ambulatio_) served multiple functions:

  #cols(columns: (1fr, 1fr), column-gutter: 14pt,
    terrace-box([Agricultural], [
      Terracing maximized cultivable area on hillsides. Retaining walls of _opus incertum_ created level platforms for olive groves and vineyards.
    ]),
    terrace-box([Social], [
      The upper terrace provided a space for _otium_ -- leisured philosophical discourse among the educated elite. Pliny describes his Tuscan villa's terrace as a place of intellectual retreat.
    ]),
  )
][
  #olive-quote(
    [The terrace commands a view of the meadows and the countryside beyond; from the windows you see on one side the terrace, on the other the meadows.],
    [Pliny the Younger, _Epistulae_ V.6],
  )
]

#speaker-note[Connect the physical terrace to its dual agricultural and social functions. The Pliny quote is essential for showing how Romans conceptualized these spaces.]

= Archaeological Evidence

== Excavation at Settefinestre

#cols[
  #stack(
    spacing: .8em,
    stone-card([Site Overview], [
      Settefinestre (Cosa, Etruria), excavated 1976-1981 by Andrea Carandini, is the best-published villa rustica and a standard reference for Italian villa archaeology.
    ]),
    mosaic-divider(),
    grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
      stat-card([25], [Hectares Estate]),
      stat-card([1st], [Century BCE]),
      stat-card([40+], [Rooms Excavated]),
    ),
  )
][
  #stack(
    spacing: .8em,
    timeline-point([1976], [Initial survey and surface collection by Carandini team]),
    timeline-point([1978], [Excavation of _pars urbana_ reveals peristyle with Corinthian columns]),
    timeline-point([1980], [_Pars rustica_ uncovered: oil press, wine vats, granary]),
    timeline-point([1981], [Publication of final excavation report]),
  )
]

#speaker-note[Settefinestre is the gold standard for villa archaeology. The timeline shows the progressive excavation revealing the dual nature of the villa.]

== Finds and Interpretation

#cols[
  #stack(
    spacing: .8em,
    [The ceramic assemblage from Settefinestre reveals trade connections across the Mediterranean:],
    comparison-table(
      ([Ware Type], [Origin], [Date Range]),
      ([Terra Sigillata], [Arezzo workshops], [30 BCE -- 50 CE]),
      ([African Red Slip], [Tunisia], [2nd -- 5th c. CE]),
      ([Dressel 1 Amphora], [Local Campanian], [2nd -- 1st c. BCE]),
    ),
  )
][
  #stack(
    spacing: .8em,
    terrace-box([Interpretive Framework], [
      Following Carandini's Marxist analysis, the villa represents the _mode of production_ specific to Republican Italy: slave-based agriculture organized for market surplus.
    ]),
    inscription[Latifundia perdidere Italiam],
    grid(columns: (1fr, 1fr, 1fr), column-gutter: 8pt,
      garden-tag([Marxist Archaeology]),
      garden-tag([Trade Networks], color: palette.secondary),
      garden-tag([Ceramics]),
    ),
  )
]

#speaker-note[The ceramic evidence connects local production to Mediterranean trade. Carandini's interpretive framework remains influential though debated.]

== Quantitative Analysis

#cols[
  Across 47 villa plans, spatial analysis reveals consistent proportions using the _modulus_ (base column diameter) as unit:

  #grid(columns: (1fr, 1fr), column-gutter: 14pt,
    arch-card([Courtyard Ratio], [
      #mi(`
        A_{\text{court}} = (5m)^2 \cdot \pi \cdot k
      `)

      where $k$ ranges from 0.85 to 1.15 across 47 excavated villas.
    ]),
    arch-card([Room Module], [
      #mi(`
        L_{\text{room}} = n \cdot m + \epsilon
      `)

      where $m$ is the modulus, $n in {3,4,5}$, and $epsilon$ represents construction tolerance.
    ]),
  )
][
  #stone-card([Statistical Summary], [
    Analysis of 47 villa plans (dataset: De Franceschini 2005):
    - Mean courtyard area: $mu = 342 "m"^2$
    - Standard deviation: $sigma = 89 "m"^2$
    - Coefficient of variation: $"CV" = 0.26$

    The low CV confirms standardization of spatial planning despite local variation.
  ])
]

#speaker-note[Introduce quantitative spatial analysis. The mathematical formalization shows how archaeological evidence can be subjected to rigorous statistical treatment.]

#focus-slide[
  Architecture is the learned game, correct and magnificent, \
  of forms assembled in the light.

  -- Le Corbusier, _Vers une Architecture_ (1923)
]

#speaker-note[A contemplative transition. Le Corbusier's definition echoes Vitruvian principles, connecting ancient and modern architectural theory.]

#ending-slide[Gratias Vobis Ago]

#speaker-note[Thank the audience. The Latin closing reinforces the classical theme and scholarly register of the presentation.]
