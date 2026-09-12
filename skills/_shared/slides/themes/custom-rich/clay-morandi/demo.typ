#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Arial", "Noto Sans SC"), size: 20pt)

#show: clay-morandi-theme.with(
  aspect-ratio: "16-9",
  footer: [Sustainable Interior Design],
  config-info(
    title: [Sustainable Interior Design & Material Innovation],
    subtitle: [Natural Materials, Biophilic Design, and Craft],
    author: [Elena Vasquez],
    date: datetime.today(),
    institution: [Studio Terra Interiors],
  ),
  config-common(breakable: false),
)

#title-slide()

#outline-slide()

= Natural Materials

== The Return to Earth

#cols[
  #stack(spacing: 0.8em,
    morandi-card([Clay and Ceramics], [
      Handmade ceramic tiles and earthenware bring warmth and texture to modern interiors. Each piece carries the maker's touch.
    ], shade: 0),
    morandi-card([Raw Wood], [
      Unfinished timber, reclaimed beams, and live-edge surfaces celebrate natural grain patterns and the passage of time.
    ], shade: 1),
  )
][
  #stack(spacing: 0.8em,
    morandi-card([Natural Stone], [
      Limestone, travertine, and terrazzo connect spaces to geological history. Muted tones harmonize with earth-based palettes.
    ], shade: 2),
    morandi-card([Plant Fibers], [
      Jute, sisal, hemp, and linen textiles introduce organic softness while maintaining sustainability credentials.
    ], shade: 3),
  )
]

== Material Impact by the Numbers

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #vessel-stat([72%], [Lower Carbon Footprint], shade: 0)
][
  #vessel-stat([3x], [Longer Lifespan], shade: 1)
][
  #vessel-stat([89%], [Client Satisfaction], shade: 2)
][
  #vessel-stat([45%], [Waste Reduction], shade: 3)
]

== Material Sourcing Philosophy

#linen-quote([The most sustainable material is one that was already here -- reclaimed, repurposed, and given new meaning through thoughtful design.], author: [Elena Vasquez], shade: 2)

#v(0.8em)

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.5em,
  align: center + horizon,
  earth-tag([Local Sourcing], shade: 0),
  earth-tag([Biodegradable], shade: 3),
  earth-tag([Low VOC], shade: 4),
  earth-tag([Reclaimed], shade: 0),
  earth-tag([Hand Finished], shade: 1),
  earth-tag([Zero Waste], shade: 1),
  earth-tag([Artisan Made], shade: 2),
  earth-tag([Certified], shade: 5),
  earth-tag([Carbon Neutral], shade: 3),
)

= Biophilic Design

== Principles of Biophilic Design

#cols[
  #stack(spacing: 0.8em,
    morandi-card([Direct Nature Connection], [
      Living walls, indoor gardens, water features, and natural daylight create tangible connections to the natural world within built environments.
    ], shade: 1),
    morandi-card([Indirect Nature Connection], [
      Natural materials, earth tones, organic shapes, and biomimetic patterns evoke nature without requiring living elements.
    ], shade: 4),
  )
][
  #stack(spacing: 0.8em,
    morandi-card([Space & Place], [
      Prospect and refuge, organized complexity, and sensory variability satisfy deep evolutionary preferences for spatial experience.
    ], shade: 5),
    linen-quote([Biophilic design is not decoration -- it is architecture that remembers we are biological beings.], author: [Stephen Kellert], shade: 3),
  )
]

== Wellness Outcomes

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #vessel-stat([32%], [Stress Reduction], shade: 1)
][
  #vessel-stat([15%], [Productivity Gain], shade: 3)
][
  #vessel-stat([6x], [ROI on Wellness], shade: 5)
]

#v(0.8em)

#ceramic-divider(shade: 4)

#v(0.4em)

Research from the International WELL Building Institute demonstrates measurable health benefits from biophilic interventions in workspace environments.

#focus-slide[
  Nature is not something we visit.\
  It is something we are.
]

= Craft & Artisan Practice

== The Value of Handmade

#cols(columns: (2fr, 3fr))[
  #morandi-card([Wabi-Sabi], [
    Japanese aesthetic philosophy embracing imperfection, transience, and the beauty of things incomplete. Cracks are not flaws but records of life.
  ], shade: 0)
][
  #morandi-card([Slow Design Principles], [
    - Reveal: making processes visible
    - Expand: beyond the object to context
    - Reflect: encouraging contemplation
    - Engage: inviting participation
    - Participate: sharing authorship
    - Evolve: designing for change over time
  ], shade: 4)
]

== Artisan Partnerships

#cols(columns: (1fr, 1fr, 1fr), lazy-layout: true)[
  #morandi-card([Ceramic Studios], [
    Bespoke tile work, vessel lighting, and sculptural installations crafted by regional ceramicists.
  ], shade: 0)
][
  #morandi-card([Textile Weavers], [
    Hand-loomed fabrics, natural dyes, and custom upholstery from traditional weaving cooperatives.
  ], shade: 1)
][
  #morandi-card([Woodworkers], [
    Joinery-focused furniture, turned vessels, and architectural millwork from sustainably managed forests.
  ], shade: 2)
]

== Project Showcase

#linen-quote([Every surface in this space tells a story of making -- the hand of the potter in the tiles, the rhythm of the weaver in the curtains, the patience of the joiner in the shelving.], author: [Project Narrative, Villa Terra], shade: 5)

#v(0.6em)

#palette-strip()

#v(0.6em)

#cols(columns: (1fr, 1fr), lazy-layout: true)[
  #morandi-card([Villa Terra Residence], [
    Full interior renovation using 94% locally sourced materials. Ceramic floors by Atelier Argile, linen walls by Fibre Collective.
  ], shade: 3)
][
  #morandi-card([Seed Wellness Retreat], [
    Biophilic spa design featuring living moss walls, stone soaking tubs, and handwoven hemp privacy screens.
  ], shade: 5)
]

= Implementation

== Design Process Framework

#cols(columns: (1fr, 1fr, 1fr, 1fr), lazy-layout: true)[
  #morandi-card([1. Discover], [
    Site analysis, material archaeology, local craft mapping, client values workshop.
  ], shade: 0)
][
  #morandi-card([2. Design], [
    Palette development, material testing, artisan selection, sustainability auditing.
  ], shade: 1)
][
  #morandi-card([3. Develop], [
    Prototype review, sample approval, timeline coordination, waste planning.
  ], shade: 2)
][
  #morandi-card([4. Deliver], [
    Installation oversight, craft documentation, maintenance guidance, impact reporting.
  ], shade: 3)
]

== Sustainability Metrics

#cols(columns: (1fr, 1fr))[
  #stack(spacing: 0.8em,
    vessel-stat([94%], [Materials Locally Sourced], shade: 4),
    vessel-stat([Zero], [Landfill Waste Target], shade: 0),
  )
][
  #stack(spacing: 0.8em,
    vessel-stat([12 yr], [Average Material Lifespan], shade: 2),
    vessel-stat([28], [Artisan Partners], shade: 5),
  )
]

== Looking Forward

#morandi-card([Our Commitment], [
  By 2030, every Studio Terra project will achieve full circularity -- every material either biodegradable, recyclable, or designed for indefinite reuse. We are building spaces that give back more than they take.
], shade: 4)

#v(0.8em)

#ceramic-divider(shade: 2)

#v(0.4em)

#palette-strip()

#ending-slide[Thank You]
