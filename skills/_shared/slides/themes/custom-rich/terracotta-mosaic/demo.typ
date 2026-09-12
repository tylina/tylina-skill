// Terracotta Mosaic Theme — Demo Presentation
// Topic: Mediterranean Architecture & Moorish Design Heritage

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Serif", "Georgia", "Times New Roman"), size: 18pt)

#show: terracotta-mosaic-theme.with(
  aspect-ratio: "16-9",
  footer: [Mediterranean Architecture Studies],
  config-info(
    title: [Mediterranean Architecture],
    subtitle: [Moorish Geometry, Terracotta Craft & Cultural Exchange],
    author: [Dr. Elena Vasquez],
    date: datetime.today(),
    institution: [Institute of Architectural Heritage],
  ),
  config-common(breakable: false),
)

#title-slide()

// ════════════════════════════════════════
= Moorish Heritage

== The Alhambra Palace

#cols[
  #stack(
    spacing: .8em,
    arabesque-quote(
      [Architecture should speak of its time and place, but yearn for timelessness.],
      author: [Frank Gehry],
    ),
    grid(columns: (1fr, 1fr), column-gutter: 16pt,
      tile-card([Court of the Lions], [
        Built in the 14th century under Muhammad V, this courtyard features 124 marble columns supporting muqarnas arches -- a masterpiece of Nasrid architecture.
      ]),
      tile-card([Hall of the Ambassadors], [
        The largest room in the Alhambra has a wooden ceiling representing the seven heavens of Islamic cosmology.
      ]),
    ),
  )
][
  #grid(
    columns: (1fr,),
    row-gutter: 9pt,
    courtyard-stat([Year Completed], [1370], color: palette.primary),
    courtyard-stat([UNESCO World Heritage], [1984], color: palette.secondary),
    courtyard-stat([Annual Visitors], [2.7M], color: palette.accent),
  )
]

#speaker-note[Discuss the Alhambra's significance as the finest example of Moorish architecture in Europe.]

== Geometric Patterns in Islamic Art

#cols(columns: (1fr, 1fr, 1fr), column-gutter: 12pt,
  zellige-box([Zellige Tilework], [
    Hand-cut mosaic tiles arranged in complex geometric patterns. Each piece is individually chiseled from larger glazed tiles, creating infinite tessellations.
  ], accent: palette.primary),
  zellige-box([Muqarnas], [
    Three-dimensional stalactite vaulting that creates a honeycomb effect. Used to decorate domes, half-domes, and the undersides of arches.
  ], accent: palette.secondary),
  zellige-box([Arabesque], [
    Flowing interlaced patterns of scrolling vines and geometric forms. Represents the infinite nature of creation through endless repetition.
  ], accent: palette.tile-blue),
)

#speaker-note[Explain how geometric patterns reflect Islamic philosophy of the infinite.]

// ════════════════════════════════════════
= Terracotta Traditions

== The Art of Clay

#cols[
  #stack(
    spacing: .8em,
    arch-highlight([Sun-Dried Bricks], [
      Adobe walls use thermal mass to regulate temperature -- cool in summer and warm in winter.
    ]),
    arch-highlight([Glazed Ceramics], [
      Tin-glazed pottery spread from Moorish Spain across the Mediterranean, with Valencia, Deruta, and Delft developing distinct styles.
    ]),
    arch-highlight([Terracotta Roofing], [
      Barrel-shaped roof tiles have crowned Mediterranean buildings since Roman times; iron-rich clay gives them their warm hue.
    ]),
  )
][
  #stack(
    spacing: .8em,
    sunbaked-card([Material Properties], [
      - *Thermal mass*: 0.8 kJ/kg per degree C
      - *Strength*: 10-40 MPa
      - *Fire resistance*: Class A1
      - *Lifespan*: 100+ years
      - *Recyclable*: 100%
    ]),
    stack(dir: ltr, spacing: 6pt,
      mosaic-tag([Sustainable]),
      mosaic-tag([Traditional], color: palette.secondary),
      mosaic-tag([Local Materials], color: palette.accent),
    ),
  )
]

#speaker-note[Terracotta is both ancient and surprisingly modern in sustainable architecture.]

== Historical Timeline

#stack(
  spacing: .8em,
  timeline-entry([711 CE], [Moorish Conquest of Iberia], [
    The Umayyad Caliphate crosses the Strait of Gibraltar, bringing Islamic architectural techniques to Iberia.
  ]),
  timeline-entry([785 CE], [Great Mosque of Cordoba], [
    Construction begins on the Mezquita, with double arches of alternating red brick and white stone.
  ], color: palette.secondary),
  timeline-entry([1238], [Alhambra Construction Begins], [
    The Nasrid dynasty begins the palace complex that becomes the pinnacle of Moorish architecture in Europe.
  ]),
  timeline-entry([1492], [Fall of Granada], [
    The Reconquista concludes; Moorish craftsmen remain and shape the hybrid Mudejar style.
  ], color: palette.secondary),
)

#speaker-note[The timeline shows 800 years of Islamic architectural influence in Europe.]

// ════════════════════════════════════════
= Mediterranean Exchange

== Trade Routes & Cultural Diffusion

#cols(columns: (2fr, 3fr))[
  #grid(
    columns: (1fr,),
    row-gutter: 8pt,
    courtyard-stat([Trade Routes], [12+], color: palette.primary),
    courtyard-stat([Port Cities], [47], color: palette.secondary),
    courtyard-stat([Centuries Active], [VIII-XV], color: palette.accent),
  )
][
  #stack(
    spacing: .8em,
    tile-card([Maritime Networks], [
      Ceramic techniques moved from Baghdad to Toledo, Cairo to Palermo, and Istanbul to Venice. Every port became a laboratory of hybrid architecture.
    ], accent: palette.secondary),
    grid(columns: (1fr, 1fr), column-gutter: 12pt,
      sunbaked-card([Eastern Influence], [
        Persian iwan halls, Syrian pointed arches, and Egyptian geometric woodwork.
      ]),
      sunbaked-card([Western Adaptation], [
        Mudejar brickwork, Norman-Arab fusion, and Venetian Gothic-Islamic hybrids.
      ]),
    ),
  )
]

#speaker-note[Mediterranean trade created the conditions for unprecedented architectural cross-pollination.]

== Key Architectural Sites

#cols(columns: (1fr, 1fr), column-gutter: 16pt,
  tile-card([Iberian Peninsula], [
    - *Alhambra*, Granada -- Nasrid palace complex
    - *Mezquita*, Cordoba -- Great Mosque-Cathedral
    - *Alcazar*, Seville -- Mudejar royal palace
    - *Sintra*, Portugal -- Moorish castle ruins
  ], accent: palette.primary),
  tile-card([North Africa & Eastern Med], [
    - *Fes Medina*, Morocco -- Living zellige tradition
    - *Kairouan*, Tunisia -- Great Mosque (670 CE)
    - *Topkapi Palace*, Istanbul -- Ottoman synthesis
    - *Dome of the Rock*, Jerusalem -- Umayyad jewel
  ], accent: palette.secondary),
)

#speaker-note[Each site represents a different chapter in Mediterranean architectural history.]

// ════════════════════════════════════════
= Modern Legacy

== Contemporary Terracotta Architecture

#stack(
  spacing: .8em,
  cols(
    arabesque-quote(
      [The future of architecture is not about invention but about rediscovery -- finding what our ancestors knew about light, material, and human comfort.],
      author: [Renzo Piano],
    ),
    sunbaked-card([Notable Projects], [
      - *Masdar City*, Abu Dhabi -- Neo-mashrabiya screens
      - *Museum of Islamic Art*, Doha -- I.M. Pei
      - *Institut du Monde Arabe*, Paris -- Nouvel
      - *Louvre Abu Dhabi* -- Rain of light dome
      #stack(dir: ltr, spacing: 6pt,
        mosaic-tag([Sustainability]),
        mosaic-tag([Innovation], color: palette.secondary),
      )
    ]),
  ),
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 10pt,
    zellige-box([Passive Cooling], [
      Terracotta screens provide natural ventilation without mechanical systems.
    ], accent: palette.primary),
    zellige-box([3D Printing], [
      Robotic clay extrusion creates facades inspired by muqarnas vaulting.
    ], accent: palette.secondary),
    zellige-box([Biomimetic Forms], [
      Algorithms generate geometric patterns that optimize structural performance.
    ], accent: palette.tile-blue),
  ),
)

#speaker-note[Traditional Mediterranean techniques inform cutting-edge sustainable design.]

#focus-slide[
  Every geometric pattern in Islamic architecture encodes a philosophical truth: that the infinite can be glimpsed through the finite, that unity underlies all diversity.
]

#speaker-note[A moment of reflection on the philosophical depth of geometric art.]

== Preservation Challenges

#cols[
  #stack(
    spacing: .8em,
    arch-highlight([Climate Change Threats], [
      Heat and extreme weather accelerate decay in earthen structures; rising damp destroys centuries-old mosaics.
    ]),
    arch-highlight([Tourism Pressure], [
      Crowds bring vibration and humidity to delicate stucco work, demanding more sustainable visitor models.
    ]),
    arch-highlight([Knowledge Transmission], [
      Zellige requires 8-10 years of apprenticeship, yet fewer than 300 master craftspeople remain in Fes.
    ]),
  )
][
  #grid(
    columns: (1fr,),
    row-gutter: 8pt,
    courtyard-stat([Sites at Risk], [142], color: palette.primary),
    courtyard-stat([Craftspeople Remaining], [\< 300], color: palette.secondary),
    courtyard-stat([Funding Gap], [\$2.1B], color: palette.accent),
  )
]

#speaker-note[Preservation is both a cultural imperative and a technical challenge.]

#ending-slide[Thank You]

#speaker-note[Closing slide -- invite questions about Mediterranean architectural heritage.]
