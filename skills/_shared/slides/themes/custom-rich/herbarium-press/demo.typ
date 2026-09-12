// Herbarium Press Theme Demo — Botanical Research & Specimen Preservation
// Demonstrates all slide types and all 9 reusable components
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: herbarium-press-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Herbarium Nationale Botanica],
  config-info(
    title: [Flora of the Western Highlands],
    subtitle: [A Systematic Survey of Alpine Vascular Plants, 2024--2026],
    author: [Dr. Margaret Ashworth, FLS],
    institution: [Department of Botany, Royal Botanical Institute],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: "Libertinus Serif")

// ═══ Title Slide ═══
#title-slide()

// ═══ Section 1: Survey Overview ═══
= Survey Overview

== Programme Summary

#stack(
  spacing: 0.8em,
  cols(
    lazy-layout: true,
    columns: (1fr,) * 4,
    gutter: 12pt,
    collection-stat([Specimens Collected], [2,847], note: [+680 from 2025], accent: palette.primary),
    collection-stat([Species Identified], [412], note: [34 new records], accent: palette.secondary),
    collection-stat([Elevation Range], [820--3,140m], note: [alpine to subalpine], accent: palette.accent),
    collection-stat([Survey Sites], [28], note: [across 6 regions], accent: palette.primary),
  ),
  botanical-box([Research Objectives], [
    This survey documents the vascular plant diversity of the Western Highland region, focusing on alpine communities above 1,500m elevation. Our objectives include establishing baseline distribution data, identifying populations under climate stress, and creating a comprehensive pressed specimen collection for long-term morphological reference.
  ]),
)

== Core Research Areas

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 14pt,
  specimen-card([Taxonomic Inventory], [
    - Complete floristic survey above treeline
    - Verification of historical records (1890--1960)
    - Voucher specimens for all taxa
    - DNA barcoding for cryptic species
    - Phenological observations
  ], accent: palette.primary),
  specimen-card([Conservation Assessment], [
    - Population size estimation (IUCN criteria)
    - Threat mapping (grazing, climate, tourism)
    - Red List status recommendations
    - Seed collection for ex-situ conservation
    - Habitat quality metrics
  ], accent: palette.secondary),
  specimen-card([Climate Monitoring], [
    - Altitudinal range shift detection
    - Snowmelt timing correlation
    - Drought stress indicators
    - Phenological advancement tracking
    - Microclimate data logger network
  ], accent: palette.accent),
)

// ═══ Section 2: Key Findings ═══
= Key Findings

== Notable Discoveries

#cols(columns: (3fr, 2fr), gutter: 16pt)[
  #petal-card([New Species Description], [
    A previously undescribed _Saxifraga_ was collected at 2,870m on north-facing scree slopes. Morphological analysis and molecular phylogenetics confirm it as distinct from _S. oppositifolia_ and _S. retusa_:

    - *Habit:* Compact cushion, 2--4cm diameter
    - *Petals:* 5, deep magenta with white basal spots
    - *Leaves:* Opposite, encrusted, 3mm long
    - *Proposed name:* _Saxifraga boreomontana_ Ashworth
    - *Holotype:* Deposited at BM (BM001234567)
  ])
][
  #stack(
    spacing: 0.8em,
    collection-stat([Type Specimens], [1], note: [holotype deposited], accent: palette.accent),
    collection-stat([Known Populations], [3], note: [all above 2,800m], accent: palette.primary),
    genus-tag([Saxifraga sect. Porphyrion]),
    genus-tag([Saxifragaceae]),
  )
]

== Altitudinal Range Shifts

#cols(columns: (1fr, 1fr), gutter: 16pt,
  botanical-box([Upward Migration Evidence], [
    Comparison with historical herbarium records (Balfour 1923, Raven 1968) reveals significant upward range shifts in 67% of surveyed species:

    - *Mean shift:* +142m elevation since 1960
    - *Maximum shift:* _Silene acaulis_ -- +310m (now at 3,050m)
    - *Rate:* 2.3m per year (accelerating since 2010)
    - *Correlation:* Strong (r=0.84) with July mean temperature

    Elevation--temperature lapse rate (standard atmosphere):
    #mitex(`\frac{dT}{dz} \approx -\Gamma_m = -6.5 \; \mathrm{^\circ C \, km^{-1}}`)
  ], accent: palette.primary),
  field-note([Field Observation, 14 Aug 2025], [
    Summit cairn at Site 17 (2,940m): _Draba aizoides_ flowering 3 weeks earlier than Balfour's 1923 notes. Snowpatch duration reduced -- bare ground now exposed by late June rather than mid-July. Adjacent _Salix herbacea_ mats show desiccation stress at margins.
  ]),
)

== Specimen Collection Summary

#stack(
  spacing: 0.8em,
  figure(
    classification-table(
      ([Family], [Species], [Specimens], [New Records], [Conservation Status]),
      (
        ([Saxifragaceae], [_Saxifraga_ spp.], [142], [*2*], [1 CR, 3 VU]),
        ([Caryophyllaceae], [_Silene_ / _Cerastium_], [98], [*1*], [2 VU]),
        ([Asteraceae], [_Erigeron_ / _Antennaria_], [76], [*0*], [1 EN]),
        ([Poaceae], [_Festuca_ / _Poa_], [124], [*3*], [2 NT]),
        ([Salicaceae], [_Salix_ spp.], [45], [*1*], [1 VU]),
      ),
    ),
  ),
  pressed-quote(
    [The herbarium is a library of pressed plants -- each sheet a page of evolutionary history, each specimen a witness to the flora of its time and place.],
    attribution: [Agnes Arber, The Mind and the Eye, 1954],
  ),
)

// ═══ Section 3: Methods & Techniques ═══
= Methods \& Techniques

== Specimen Preparation Protocol

#cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 16pt,
  specimen-card([Field Collection Standards], [
    All specimens prepared following international herbarium standards (Bridson \& Forman 1998):

    - *Pressing:* Within 2 hours of collection in field press
    - *Drying:* Corrugated cardboard method, 48--72 hours
    - *Mounting:* Acid-free card (300gsm), linen tape adhesive
    - *Labels:* Archival paper, laser-printed, ISO 8601 dates
    - *Duplicates:* Minimum 3 sets per novel taxon
  ], accent: palette.primary),
  specimen-card([Digital Documentation], [
    Every specimen receives comprehensive digital capture:

    - *Photography:* 50MP RAW, calibrated colour target
    - *Georeferencing:* RTK-GPS to \u{00B1}10cm accuracy
    - *DNA sampling:* Silica-dried leaf tissue (20mg)
    - *Database:* BRAHMS v8.1 with Darwin Core export
    - *Imaging:* Flatbed scan at 600dpi for type material
  ], accent: palette.secondary),
)

== Taxonomic Verification Workflow

#cols(columns: (2fr, 1fr), gutter: 16pt)[
  #botanical-box([Identification Pipeline], [
    Multi-evidence approach to species determination:

    + *Morphological keying* -- Flora of the region (3rd ed.)
    + *Comparison with type material* -- BM, E, K herbaria
    + *Molecular confirmation* -- ITS2 + matK barcoding
    + *Expert review* -- Specialist taxonomists consulted
    + *Nomenclatural check* -- IPNI + World Flora Online

    Uncertain determinations marked _cf._ or _aff._ pending resolution.
  ], accent: palette.primary)
][
  #stack(
    spacing: 0.8em,
    genus-tag([ITS2 barcoding]),
    genus-tag([matK region]),
    genus-tag([rbcL backup]),
    collection-stat([Barcoded], [89%], note: [of total collection], accent: palette.primary),
  )
]

// ═══ Section 4: Conservation ═══
= Conservation

== Threatened Species Assessment

#stack(
  spacing: 0.8em,
  cols(
    lazy-layout: true,
    columns: (1fr, 1fr),
    gutter: 16pt,
    petal-card([Critically Endangered], [
      - *_Saxifraga boreomontana_* -- 3 populations, \<500 individuals
      - *_Artemisia norvegica_* -- 1 site, declining due to erosion
      - Immediate ex-situ conservation initiated
      - Seed banking at Millennium Seed Bank, Wakehurst
      - Monitoring plots established at all known localities
    ]),
    field-note([Conservation Priority Action], [
      Urgent need to fence Site 12 summit area (2,890m) before next grazing season. _Saxifraga boreomontana_ population of ~180 individuals directly threatened by sheep trampling. Landowner engagement meeting scheduled for November 2026.
    ]),
  ),
  botanical-box([Ex-Situ Conservation Summary], [
    #set text(size: 0.75em)
    Seeds from 78 species (representing 94% of threatened taxa) successfully banked. Germination trials confirm viability for 71 species. Tissue culture protocols established for 3 recalcitrant species where seed banking is insufficient.
  ], accent: palette.primary),
)

== Regional Distribution Patterns

#figure(
  classification-table(
    ([Region], [Sites], [Species], [Endemics], [Threat Level]),
    (
      ([Northern Corries], [8], [187], [*2*], [High]),
      ([Western Ridges], [6], [156], [*1*], [Moderate]),
      ([Central Plateau], [5], [98], [*0*], [Low]),
      ([Eastern Gullies], [4], [134], [*1*], [High]),
      ([Southern Slopes], [5], [112], [*0*], [Moderate]),
    ),
  )
)

// ═══ Section 5: Future Work ═══
= Future Work

== Priorities 2026--2028

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr), gutter: 12pt,
  specimen-card([Systematic Revision], [
    - Complete monograph of highland _Saxifraga_
    - Resolve _Alchemilla_ microspecies complex
    - Describe 2 additional probable new taxa
    - Phylogenomic analysis (target capture)
    - *Timeline:* 18 months
  ], accent: palette.primary),
  specimen-card([Climate Adaptation Study], [
    - Install 50 additional microclimate loggers
    - Annual resurvey of permanent plots
    - Reciprocal transplant experiments
    - Phenological camera network
    - *Timeline:* 3-year monitoring cycle
  ], accent: palette.secondary),
  specimen-card([Herbarium Digitisation], [
    - Scan all 2,847 mounted specimens
    - Georeference historical collections
    - Open data via GBIF and iDigBio
    - 3D photogrammetry of type material
    - *Timeline:* 12 months
  ], accent: palette.accent),
)

== Key Takeaway

#focus-slide()[
  Every pressed specimen is a permanent record --\
  a witness to the flora of its time,\
  preserved for the botanists of tomorrow.
]

// ═══ Ending Slide ═══
#ending-slide()[Thank You]
