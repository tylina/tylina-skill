#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"))

#show: silk-ribbon-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Maison Élégance\ Spring Collection 2026],
    subtitle: [Luxury Brand Strategy & Creative Direction],
    author: [Camille Beaumont, Creative Director],
    date: datetime.today(),
    institution: [Maison Élégance Paris],
  ),
)

// === Cover Page ===

#title-slide()

// === Chapter 1: Brand Vision ===

= Brand Vision

== Collection Philosophy

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #concept-card([Ethereal Femininity])[
    The Spring 2026 collection draws from the language of *silk ribbons* — fluid, graceful, and inherently luxurious. Each piece embodies movement and softness while maintaining structural elegance.
  ]
][
  #concept-card([Craftsmanship Heritage])[
    Over 140 years of atelier expertise inform every stitch. Our artisans in Lyon combine traditional *jacquard weaving* with contemporary draping techniques to create pieces that transcend seasons.
  ]
]

#v(0.3em)

#callout-box([Creative Direction])[
  This season's palette centers on *champagne gold*, *dusty rose*, and *ivory* — colors that evoke warmth, intimacy, and timeless sophistication. The silhouette language moves between structured tailoring and flowing drapery.
]

== Key Metrics at a Glance

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #stat-card([Revenue Growth], [+27%], color: palette.champagne)
][
  #stat-card([New Markets], [12], color: palette.rose)
][
  #stat-card([Pieces in Collection], [84], color: palette.champagne)
][
  #stat-card([Celebrity Placements], [36], color: palette.mauve)
]

= Creative Direction

== Signature Silhouettes

#cols(columns: (3fr, 2fr), lazy-layout: true)[
  #feature-box[Spring 2026 Silhouettes][
    - *Column Gown* — Floor-length silk charmeuse with bias-cut draping
    - *Ribbon Blazer* — Structured shoulders with trailing silk sash
    - *Petal Skirt* — Layered organza panels with champagne edging
    - *Bow Blouse* — Oversized pussy-bow in washed silk crêpe
    - *Cascade Dress* — Asymmetric hemline with ribbon-wrapped bodice
  ]
][
  #insight-box([Design Principle])[
    Every garment must pass the *"movement test"* — when the wearer walks, the fabric should create a sense of flowing choreography. Static beauty is not enough; our pieces must come alive in motion.

    #v(.8em)
    #silk-tag([Haute Couture]) #silk-tag([Prêt-à-Porter]) #silk-tag([Bridal])
  ]
]

== Fabric Innovation

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #ribbon-card([Silk Charmeuse])[
    Sourced from our exclusive partnership with *Maison Perrin* in Lyon. Double-faced satin with a luminous champagne finish.

    Weight: 19 momme \
    Origin: Lyon, France
  ]
][
  #ribbon-card([Organza Pétale])[
    A proprietary blend of silk and recycled polyester — ethereal transparency with *enhanced durability*. Perfect for our layered petal constructions.

    Weight: 6 momme \
    Origin: Como, Italy
  ]
][
  #ribbon-card([Crêpe de Soie])[
    Hand-finished matte silk with subtle texture. The foundation of our *tailored pieces* — drapes beautifully while holding structure.

    Weight: 14 momme \
    Origin: Hangzhou, China
  ]
]

= Market Strategy

== Global Expansion

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr), lazy-layout: true,
    [#showcase-card([Asia-Pacific Growth])[
      Opening *8 flagship boutiques* across Tokyo, Seoul, Shanghai, and Singapore in Q2 2026. Each location designed by architect Kengo Miyamoto with bespoke ribbon-motif interiors.

      Target revenue: *€42M* by year-end \
      VIP client acquisition: 2,400 new accounts
    ]],
    [#showcase-card([Middle East Presence])[
      Exclusive partnership with *Al Tayer Group* for GCC distribution. Launching dedicated Ramadan and Eid capsule collections with region-specific modest luxury pieces.

      Target revenue: *€28M* by year-end \
      Boutique locations: Dubai, Riyadh, Doha
    ]],
  ),
  quote-card(
    [Fashion is not something that exists in dresses only. Fashion is in the sky, in the street. Fashion has to do with ideas, the way we live, what is happening.],
    attribution: [Coco Chanel],
  ),
)

== Digital & Sustainability

#cols[
  #cols(columns: (1fr, 1fr), lazy-layout: true)[
    #concept-card([Digital Experience], accent: palette.mauve)[
      Our new *virtual atelier* allows clients to customize pieces in real-time — selecting ribbon placements, choosing from 24 colorways, and viewing 3D renders before ordering.

      Launch: March 2026 \
      Platform: iOS & Web
    ]
  ][
    #concept-card([Sustainability Pledge], accent: palette.rose)[
      By 2027, *100% of silk* sourced from certified sustainable farms. Carbon-neutral shipping across all markets. Introducing our *Ribbon Return* program — clients return pieces for resale credit.

      Current sustainable sourcing: 72%
    ]
  ]
]

= Financial Outlook

== Revenue Projections

#stack(
  spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), lazy-layout: true,
    [#stat-card([FY2025 Revenue], [€186M], color: palette.champagne)],
    [#stat-card([FY2026 Target], [€236M], color: palette.rose)],
    [#stat-card([5-Year CAGR], [22.4%], color: palette.champagne)],
  ),
  cols(columns: (1fr, 1fr), lazy-layout: true,
    [#insight-box([Growth Drivers])[
      - *Asia-Pacific expansion*: +€54M contribution
      - *Digital commerce*: +€32M (47% YoY growth)
      - *Bridal collection*: +€18M (new category)
      - *Fragrance line*: +€12M (licensing)
    ]],
    [#callout-box([Investment Required], accent: palette.champagne)[
      Total capital deployment of *€45M* across:
      - Retail buildout: €22M
      - Digital platform: €12M
      - Supply chain: €8M
      - Marketing: €3M
    ]],
  ),
)

== Brand Partnerships

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #showcase-card([Swarovski])[
    Exclusive crystal embellishment partnership for our *Gala Collection*. Custom-cut champagne crystals woven into ribbon motifs.

    Revenue share: 60/40
  ]
][
  #showcase-card([Four Seasons])[
    Bespoke robes and loungewear for *12 luxury properties*. Champagne silk with our signature ribbon embroidery.

    Contract value: €4.2M annually
  ]
][
  #showcase-card([Rolls-Royce])[
    Interior silk panels for the *Spectre Luminary Edition*. Hand-embroidered ribbon motifs on headliner and door cards.

    Limited to 25 vehicles
  ]
]

// === Focus Slide ===

#focus-slide[
  _"Elegance is not about being noticed,\ it is about being remembered."_

  #v(0.4em)
  #set text(size: 0.5em, weight: "regular")
  -- Giorgio Armani
]

// === Ending Slide ===

#ending-slide[Merci]
