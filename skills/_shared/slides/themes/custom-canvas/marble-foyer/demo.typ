#import "@preview/touying:0.7.4": *
#import "template.typ": *

// Font configuration
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

// Build palette for inline use
#let pal = build-palette("classic")

#show: marble-foyer-theme.with(
  aspect-ratio: "16-9",
  preset: "classic",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Grand Atelier Collection],
    subtitle: [Luxury Hospitality Design Portfolio 2026],
    author: [Victoria Ashworth-Laurent],
    date: datetime.today(),
    institution: [Atelier Pierre & Associates],
  ),
)

// ============================================================
// Cover
// ============================================================

#title-slide()

// ============================================================
// Section 1: Vision
// ============================================================

= Design Philosophy

== Our Approach to Luxury Spaces

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[ARCHITECTURAL VISION]

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 24pt)[
  #stack(spacing: .8em,
    [#text(size: typo.body, fill: pal.body-text, font: _sans-font)[
      Every space we design begins with the materials. We source marble from Carrara,
      onyx from Pakistan, travertine from Tivoli. The stone speaks first -- its veining,
      its warmth, its weight -- and the architecture follows.
    ]],
    [#text(size: typo.body, fill: pal.body-text, font: _sans-font)[
      Our philosophy merges classical proportion with contemporary restraint. The golden
      ratio governs our column spacing. Natural light choreographs the daily experience.
      Every foyer is a threshold between the ordinary world and the extraordinary.
    ]],
  )
][
  #stack(spacing: .8em,
    [#pediment-stat([PROJECTS COMPLETED], [147], description: [Luxury hospitality venues across 28 countries since founding in 2004], pal: pal)],
    [#pediment-stat([AVERAGE INVESTMENT], [24M], description: [USD per project, reflecting our commitment to uncompromising material quality], pal: pal)],
  )
]


// ============================================================
// Slide: Dark -- Key Statement
// ============================================================

#dark-slide(
  title: none,
  header-left: [DESIGN PHILOSOPHY],
  header-right: [MATERIAL EXCELLENCE],
)[
  #text(size: 36pt, weight: "bold")[Marble Is Not a Material. It Is a Conversation with Time.]

  #v(0.2em)

  #text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[MATERIAL SOURCING PRINCIPLES]

  #v(0.6em)

  #cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
    #stack(spacing: .8em,
      [#text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[CARRARA WHITE]],
      [#text(size: 38pt, weight: "bold")[Italy]],
      [#text(size: 11pt, fill: rgb("#FAFAF8").transparentize(25%), font: _sans-font)[
        Statuario marble from the Apuan Alps. Grey-gold veining on pure white ground.
        Each slab hand-selected for consistency and character. Used exclusively in primary foyers.
      ]],
    )
  ][
    #stack(spacing: .8em,
      [#text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[VERDE ALPI]],
      [#text(size: 38pt, weight: "bold")[Alps]],
      [#text(size: 11pt, fill: rgb("#FAFAF8").transparentize(25%), font: _sans-font)[
        Deep forest green with white calcite veins. Reserved for accent walls and
        reception desks. The darkness provides gravitas against lighter marble surrounds.
      ]],
    )
  ][
    #stack(spacing: .8em,
      [#text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[CALACATTA GOLD]],
      [#text(size: 38pt, weight: "bold")[Tuscany]],
      [#text(size: 11pt, fill: rgb("#FAFAF8").transparentize(25%), font: _sans-font)[
        The rarest Italian marble. Bold gold and grey veining on warm white.
        Limited to signature feature walls. Current inventory: 340 slabs reserved.
      ]],
    )
  ]

  #v(0.4em)

  #block(
    width: 100%,
    stroke: (left: 1.5pt + rgb("#FAFAF8").transparentize(60%)),
    inset: (left: 1.2em, y: 0.4em),
  )[
    #text(size: 12pt, style: "italic", fill: rgb("#FAFAF8").transparentize(15%))[
      "We reject the notion of 'luxury marble finish.' The marble is the architecture itself."
    ]
  ]
]


// ============================================================
// Slide: Cards -- Service Areas
// ============================================================

== Service Portfolio

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[PRACTICE AREAS]

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true)[
  #plinth-card([Hotel Lobby Design], [
    Grand foyer spaces for five-star properties. From intimate boutique hotels (20 keys)
    to landmark palaces (500+ keys). Specializing in arrival sequences, reception volumes,
    and transitional architecture.
  ], pal: pal)
][
  #plinth-card([Museum & Gallery Spaces], [
    Entrance halls and atrium designs for cultural institutions. We create spaces where
    the architecture prepares visitors emotionally for the art within. Acoustic
    engineering integrated from concept stage.
  ], pal: pal)
][
  #plinth-card([Private Residences], [
    Entrance foyers and reception rooms for ultra-high-net-worth clients. Bespoke
    material palettes, commissioned artwork integration, and smart home concealment
    within classical architectural language.
  ], pal: pal)
]


// ============================================================
// Section 2: Portfolio
// ============================================================

= Featured Projects

== The Aurelius, Rome

#cols(columns: (2fr, 1fr), gutter: 24pt)[
  #colonnade-box([Project Overview], [
      A 220-key luxury hotel in a restored 18th-century palazzo near Piazza Navona.
      The grand foyer features a 12-meter barrel-vaulted ceiling with restored frescoes,
      a Calacatta Oro marble reception desk weighing 4.2 tonnes, and a bespoke Murano
      glass chandelier comprising 1,400 hand-blown elements.

      #v(0.4em)
      *Timeline:* 2021--2024 #h(1em) *Investment:* EUR 38M (interior only) \
      *Architect of record:* Studio Farnese, Rome \
      *Awards:* Wallpaper\* Design Award 2025, AHEAD Global 2025 (Lobby & Public Spaces)
    ], pal: pal)
][
  #stack(spacing: .8em,
    [#keystone-tag([Hospitality], pal: pal)],
    [#keystone-tag([Heritage], pal: pal)],
    [#keystone-tag([Restoration], pal: pal)],
    [#block(
      width: 100%,
      fill: pal.ink.transparentize(95%),
      inset: 10pt,
      stroke: 0.4pt + pal.secondary-faint,
    )[
      #text(size: 11pt, fill: pal.body-text, font: _sans-font)[
        Barrel vault span: 12m. Column height: 9.6m. Marble sourced from original quarry.
      ]
    ]],
  )
]


// ============================================================
// Slide: Quote
// ============================================================

== Client Testimonial

#atrium-note([
  Working with Atelier Pierre transformed our vision into something far grander than
  we imagined possible. The foyer alone has become a destination -- guests arrive early
  simply to sit in the space. It is architecture that makes people feel important.
], cite: "Marco Bellini, CEO, Aurelius Hotel Group", pal: pal)

#v(0.5em)

#cols(columns: (1fr, 1fr), gutter: 24pt, lazy-layout: true)[
  #colonnade-box([Recognition], [
      - *Wallpaper\** Design Award 2025 -- Best Hotel Lobby
      - *AHEAD Global* 2025 -- Lobby & Public Spaces
      - *Dezeen Awards* 2024 -- Hospitality Interior (shortlist)
      - *Frame Awards* 2025 -- Spatial Practitioner of the Year
    ], pal: pal)
][
  #colonnade-box([Press Coverage], [
      - _Architectural Digest_ -- "The New Roman Grand Tour"
      - _Monocle_ -- "Hotels That Feel Like Home (If Home Were a Palace)"
      - _Financial Times_ -- "How to Spend It: The Aurelius"
      - _Wallpaper\*_ -- "Pierre & Associates: Masters of the Threshold"
    ], pal: pal)
]


// ============================================================
// Slide: Focus -- Key Insight
// ============================================================

#focus-slide[
  #stack(spacing: .8em,
    ["A great foyer does not welcome you into a building. It transforms you into the person who belongs there."],
    [#text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink-muted)[
      -- Victoria Ashworth-Laurent, Founder
    ]],
  )
]


// ============================================================
// Section 3: Process & Investment
// ============================================================

= Process & Investment

== Our Six-Phase Methodology

#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: pal.accent, font: _mono-font)[ENGAGEMENT STRUCTURE]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt)[
  #pediment-stat([PHASE 1-2], [6mo], description: [Discovery and concept: site analysis, material sourcing, design development], pal: pal)
][
  #pediment-stat([PHASE 3-4], [12mo], description: [Technical design and procurement: engineering, manufacturing, coordination], pal: pal)
][
  #pediment-stat([PHASE 5], [8mo], description: [Installation and finishing: on-site supervision, quality control, commissioning], pal: pal)
][
  #pediment-stat([PHASE 6], [2mo], description: [Handover and legacy: documentation, maintenance protocols, staff training], pal: pal)
]

#v(0.4em)
#cornice-divider(total-width: 100%, pal: pal)
#v(0.4em)

#text(size: 13pt, fill: pal.body-text, font: _sans-font)[
  Total engagement duration: 28 months average. We maintain a maximum of four concurrent
  projects to ensure undivided creative attention. Current availability: Q3 2027.
]


// ============================================================
// Slide: Investment Overview
// ============================================================

== Investment Framework

#marble-highlight(pal: pal)[
  #cols(columns: (1fr, 1fr), gutter: 24pt)[
    #stack(spacing: .8em,
      [#text(size: 14pt, weight: "bold", fill: pal.ink)[Fee Structure]],
      [#text(size: 13pt, fill: pal.body-text, font: _sans-font)[
        - *Design fees:* 12--18% of construction value
        - *Material procurement:* At cost + 8% management fee
        - *Project supervision:* Monthly retainer (site-dependent)
        - *Post-completion:* 2-year maintenance consultancy included
      ]],
    )
  ][
    #stack(spacing: .8em,
      [#text(size: 14pt, weight: "bold", fill: pal.ink)[Typical Investment Range]],
      [#text(size: 13pt, fill: pal.body-text, font: _sans-font)[
        - *Boutique hotel (50 keys):* EUR 8--15M
        - *Palace hotel (200+ keys):* EUR 25--60M
        - *Museum/cultural:* EUR 12--40M
        - *Private residence:* EUR 2--8M
      ]],
    )
  ]
]

#v(0.4em)

#frieze-list(pal: pal)[
  All engagements begin with a non-refundable feasibility study (EUR 75,000) to establish
  material availability, structural constraints, and preliminary design direction. This investment
  is credited against the full design fee upon engagement confirmation.
]


// ============================================================
// Dark slide -- Comparative
// ============================================================

#dark-slide(
  title: none,
  header-left: [COMPETITIVE POSITION],
  header-right: [MARKET ANALYSIS],
)[
  #text(size: 28pt, weight: "bold")[Why Clients Choose Atelier Pierre]
  #v(0.15em)
  #block(width: 50pt, height: 1.5pt, fill: pal.accent)
  #v(0.5em)

  #cols(columns: (1fr, 1fr), gutter: 28pt)[
    #block(width: 100%, stroke: (left: 1.5pt + pal.accent), inset: (left: 1em, y: 0.4em))[
      #stack(spacing: .8em,
        [#text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[OUR DIFFERENTIATION]],
        [#text(size: 14pt, weight: "bold", fill: rgb("#FAFAF8"))[Material-First Design]],
        [#text(size: 12pt, fill: rgb("#FAFAF8").transparentize(25%), font: _sans-font)[
        We own exclusive quarry relationships in Italy, Greece, and Turkey.
        Our material library contains 2,400+ unique stone samples. We design
        around specific slabs, not generic material specifications. Each project
        receives a unique material palette that cannot be replicated.
        ]],
      )
    ]
  ][
    #block(width: 100%, stroke: (left: 1.5pt + rgb("#FAFAF8").transparentize(60%)), inset: (left: 1em, y: 0.4em))[
      #stack(spacing: .8em,
        [#text(size: typo.tiny, weight: "medium", tracking: 1.2pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[TYPICAL COMPETITORS]],
        [#text(size: 14pt, weight: "bold", fill: rgb("#FAFAF8"))[Specification-Based Approach]],
        [#text(size: 12pt, fill: rgb("#FAFAF8").transparentize(25%), font: _sans-font)[
        Standard practice specifies materials by grade and type, sourcing from
        distributors. This produces beautiful but reproducible interiors.
        The same Calacatta specification yields different results each time.
        Clients receive quality without uniqueness.
        ]],
      )
    ]
  ]

  #v(0.6em)
  #text(size: 11pt, fill: rgb("#FAFAF8").transparentize(20%), font: _sans-font)[
    Client retention rate: 92%. Average client engages us for 3.4 projects over a 10-year relationship.
    Our waiting list currently extends 18 months.
  ]
]


// ============================================================
// Section 4: Team & Legacy
// ============================================================

= Team & Legacy

== Leadership

#grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 14pt,
  plinth-card([Victoria Ashworth-Laurent], [
    *Founder & Creative Director* \
    RIBA Part III, Ecole des Beaux-Arts Paris. 22 years in luxury hospitality design.
    Former Head of Design at Aman Resorts. Published: _The Architecture of Arrival_ (Phaidon, 2022).
  ], pal: pal),
  plinth-card([Pierre Demarais], [
    *Managing Partner & Technical Director* \
    Polytechnique Paris, MIT M.Arch. Structural engineering specialization in historic buildings.
    Leads all restoration projects. Former structural lead at Foster + Partners.
  ], pal: pal),
  plinth-card([Alessandra Conti], [
    *Material Curator* \
    Geology PhD (ETH Zurich). Manages our quarry relationships and material library.
    Personally visits every quarry annually. Publishes the annual _Stone Atlas_ catalogue.
  ], pal: pal),
  plinth-card([James Okonkwo], [
    *Director of Installations* \
    20 years on-site luxury fit-out experience. Manages our network of 40+ specialist
    craftsmen. Oversees all marble cutting, finishing, and installation globally.
  ], pal: pal),
)


// ============================================================
// Dark slide -- Transition
// ============================================================

#dark-slide(
  title: none,
  header-left: [SECTION 05],
  header-right: [NEXT STEPS],
)[
  #v(1fr)

  #stack(spacing: .8em,
    [#text(size: typo.tiny, weight: "medium", tracking: 1.8pt, fill: rgb("#FAFAF8").transparentize(50%), font: _mono-font)[ENGAGEMENT INVITATION]],
    [#text(size: 34pt, weight: "bold")[
      The Foyer Begins#linebreak()With a Conversation.
    ]],
    [#block(width: 60pt, height: 1.5pt, fill: pal.accent)],
  )

  #v(2fr)
]


// ============================================================
// Slide: Contact
// ============================================================

== Begin Your Project

#cols(columns: (2fr, 1fr), gutter: 24pt)[
  #colonnade-box([Next Steps], [
      1. *Discovery call* -- 45-minute consultation to discuss vision and constraints
      2. *Site visit* -- Our team visits the location within 14 days
      3. *Feasibility study* -- 6-week material and structural assessment
      4. *Concept presentation* -- Three design directions with material samples
      5. *Engagement letter* -- Full scope, timeline, and investment confirmed
    ], pal: pal)
][
  #stack(spacing: .8em,
    [#pilaster-badge([London], pal: pal)],
    [#pilaster-badge([Paris], pal: pal)],
    [#pilaster-badge([Rome], pal: pal)],
    [#pilaster-badge([Dubai], pal: pal)],
    [#block(
      width: 100%,
      fill: pal.ink.transparentize(95%),
      inset: 10pt,
      stroke: 0.4pt + pal.secondary-faint,
    )[
      #text(size: 11pt, fill: pal.body-text, font: _sans-font)[
        studio\@atelierpierre.com \
        +44 20 7946 0958
      ]
    ]],
  )
]


// ============================================================
// Focus: Key insight
// ============================================================

#focus-slide[
  #stack(spacing: .8em,
    ["The difference between a lobby and a foyer is intention. A lobby processes arrivals. A foyer elevates them."],
    [#text(size: 0.5em, style: "normal", weight: "medium", fill: pal.ink-muted)[
      -- Pierre Demarais, Managing Partner
    ]],
  )
]


// ============================================================
// Ending
// ============================================================

#ending-slide[Thank You]
