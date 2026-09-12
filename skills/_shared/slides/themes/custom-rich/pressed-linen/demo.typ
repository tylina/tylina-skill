#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Georgia", "Noto Serif SC"), size: 20pt)

#show: pressed-linen-theme.with(
  aspect-ratio: "16-9",
  footer: [Botanical Studio],
  config-common(breakable: false),
  config-info(
    title: [The Art of Botanical Illustration],
    subtitle: [Preserving Nature Through Pressed Specimens],
    author: [Eleanor Ashworth],
    date: datetime.today(),
    institution: [Royal Botanical Society],
  ),
)

#title-slide()

#outline-slide()

= Foundations of Pressing

== Why We Press Plants

The practice of pressing botanical specimens dates back centuries -- a meditative act of preservation that captures fleeting beauty in permanent form.

- *Archival preservation*: specimens last hundreds of years
- *Scientific documentation*: morphological detail retained
- *Artistic expression*: nature as collaborator in design
- *Mindful practice*: slowing down to observe closely

#petal-divider()

#linen-tag[Herbarium] #linen-tag[Washi] #linen-tag[Conservation] #linen-tag[Craft]

== Core Principles

#cols(columns: (1fr, 1fr))[
  #concept-card([Material Selection], [
    Choose specimens at peak bloom with minimal moisture. Flat-faced flowers like pansies and ferns press best. Avoid thick, fleshy succulents that resist flattening.
  ])
][
  #concept-card([Pressing Technique], [
    Layer specimens between absorbent paper -- washi or blotting paper. Apply even weight of 10-15 kg. Change papers every 2-3 days until fully dry.
  ], accent: palette.rose)
]

== The Linen Paper Process

#cols(columns: (1fr, 1fr, 1fr))[
  #stat-card([14], [Days Average\ Drying Time])
][
  #stat-card([200+], [Specimens Per\ Collection], accent: palette.rose)
][
  #stat-card([97%], [Color Retention\ Rate], accent: palette.brown)
]

= Japanese Washi Traditions

== Washi Paper Heritage

#insight-box([Living Tradition], [
  Japanese washi paper-making is a UNESCO Intangible Cultural Heritage. Made from kozo (mulberry), gampi, and mitsumata fibers, each sheet carries the maker's intention and the water's memory.
])

#v(0.5em)

#figure[
  #comparison-table(
    ([Fiber Type], [Origin], [Texture], [Best Use]),
    (
      ([Kozo], [Paper mulberry], [Strong, fibrous], [Backing, mounting]),
      ([Gampi], [Wikstroemia], [Smooth, lustrous], [Fine illustration]),
      ([Mitsumata], [Edgeworthia], [Soft, absorbent], [Pressing, drying]),
    ),
  )
]

== East Meets West

#cols(columns: (3fr, 2fr))[
  The convergence of Japanese washi technique and Western herbarium practice creates a unique preservation method.

  - *Kozo fiber papers*: stronger than wood-pulp alternatives
  - *Natural sizing*: neri (tororo-aoi root mucilage) prevents bleeding
  - *pH neutral*: preserves archival stability

  #callout-box([Practitioner Note], [
    Always test adhesives on a sample sheet first. Wheat starch paste remains the gold standard for reversible mounting.
  ])
][
  #quote-card(
    [In pressing a flower, we do not diminish it -- we translate its language from three dimensions into two, from days into centuries.],
    author: [Makoto Azuma],
  )

  #concept-card([Workshop Insight], [
    Morning-gathered specimens contain less moisture and press with superior color fidelity.
  ], accent: palette.brown)
]

= Studio Practice

== Our Creative Process

#timeline-entry([01], [Forage], [Walk local meadows and gardens at dawn. Collect with intention -- never more than 10\% of any population.])
#timeline-entry([02], [Press], [Arrange specimens between washi sheets. Apply weight evenly. Label with date, location, species.])
#timeline-entry([03], [Mount], [After 14 days, carefully lift dried specimens. Mount on acid-free linen board with wheat paste.])
#timeline-entry([04], [Compose], [Arrange mounted pieces into final compositions. Consider negative space, rhythm, and botanical narrative.])

== Design Applications

#cols(columns: (1fr, 1fr))[
  #feature-card([Textile Design], [
    Pressed specimens become patterns for hand-printed linen fabrics. Each print run captures a specific season's harvest.
  ])

  #v(0.6em)

  #feature-card([Stationery], [
    Wedding invitations, botanical greeting cards, and journals incorporating real pressed elements under translucent vellum overlays.
  ], accent: palette.sage)
][
  #feature-card([Interior Spaces], [
    Framed herbarium sheets bring organic tranquility to living spaces. Groupings of 3-5 specimens create gallery walls.
  ], accent: palette.brown)

  #v(0.6em)

  #feature-card([Brand Identity], [
    Botanical studios use pressed specimens as the foundation for logo design, packaging illustration, and visual identity systems.
  ])
]

== Measuring Our Impact

#cols(columns: (1fr, 1fr))[
  #stat-card([340], [Species Documented])

  #v(0.6em)

  #stat-card([12], [Regional Collections], accent: palette.rose)
][
  #insight-box([Conservation Outcome], [
    Our herbarium records have contributed to identifying 3 previously undocumented wildflower populations in the region, leading to protected habitat designation.
  ])

  #v(0.6em)

  #linen-tag[Biodiversity] #linen-tag[Habitat] #linen-tag[Heritage]
]

= Seasonal Collections

== Spring Specimens

#cols(columns: (1fr, 1fr, 1fr))[
  #concept-card([Cherry Blossom], [
    Prunus serrulata -- press individual florets between tissue. The delicate pink fades to a romantic blush over time.
  ])
][
  #concept-card([Fiddlehead Fern], [
    Matteuccia struthiopteris -- the spiral unfurling captures beautifully when pressed at the tight-coil stage.
  ], accent: palette.sage)
][
  #concept-card([Wild Violet], [
    Viola odorata -- tiny blooms that retain remarkable purple depth. Press face-down for best petal spread.
  ], accent: palette.rose)
]

== Autumn Archive

#figure[
  #comparison-table(
    ([Specimen], [Collection Date], [Press Duration], [Color Grade]),
    (
      ([Japanese Maple Leaf], [October 5], [10 days], [Excellent]),
      ([Ginkgo Fan Leaf], [November 2], [7 days], [Outstanding]),
      ([Oak Leaf Cluster], [October 18], [14 days], [Good]),
      ([Silver Birch Catkin], [September 28], [12 days], [Very Good]),
    ),
  )
]

#v(0.5em)

#callout-box([Seasonal Wisdom], [
  Autumn leaves press most successfully when collected just after peak color but before brittleness sets in. A light frost the previous night often enhances pigmentation.
])

#focus-slide[
  Every pressed leaf is a letter\ from a season that has passed --\ preserved in linen and light.
]

= Looking Forward

== Studio Roadmap

#cols(columns: (1fr, 1fr))[
  #concept-card([This Year], [
    - Complete regional wildflower atlas
    - Launch pressing workshop series
    - Partner with local conservation trust
    - Develop seed-paper product line
  ])
][
  #concept-card([Long Horizon], [
    - Digital herbarium archive (high-res scans)
    - Traveling exhibition of pressed collections
    - Community pressing circles in 5 cities
    - Published field guide with pressed plates
  ], accent: palette.rose)
]

== A Closing Reflection

#quote-card(
  [To press a plant is to enter into conversation with time itself. We become archivists of ephemeral beauty, translators between the living world and the page.],
  author: [Eleanor Ashworth],
)

#v(0.8em)

#cols(columns: (1fr, 1fr, 1fr))[
  #linen-tag[Patience]
][
  #linen-tag[Observation]
][
  #linen-tag[Reverence]
]

#ending-slide[Thank You]
