// Herbarium Theme Demo
// Botanical science / museum collection / natural history aesthetic
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: herbarium-theme.with(
  aspect-ratio: "16-9",
  footer: [Herbarium Nationale],
  preset: "herbarium",
  config-info(
    title: [Flora of the Western Palearctic],
    subtitle: [A systematic survey of vascular plant specimens],
    author: [Dr. M. Linnaeus-Chen],
    date: datetime.today(),
    institution: [Royal Botanical Institute],
  ),
  config-common(breakable: false),
)

#set text(font: _serif-font, size: 18pt)

// ─── Title Slide ───
#title-slide()

// ─── Section 1 ───
= Taxonomy and Classification

== The Herbarium as Scientific Instrument

#cols(columns: (3fr, 2fr))[
  The herbarium sheet is both archive and instrument -- a permanent record of morphological variation, geographic distribution, and phenological timing.

  #v(0.6em)
  #genus-tag[Systematic Botany]
  #h(4pt)
  #genus-tag[Morphometrics]
  #h(4pt)
  #genus-tag[Biogeography]

  #v(0.8em)
  #field-quote(cite: "C. Darwin, 1859")[
    A well-prepared herbarium specimen preserves not merely the plant, but the ecological moment of its collection.
  ]
][
  #collection-label(
    [A. von Humboldt],
    [HBN-4472],
    [Andes, 3200m elev.],
    date: [1802-VI-14],
  )
  #v(0.6em)
  #pressed-specimen(
    [_Gentiana lutea_ L.],
    [Perennial herb, 60--120 cm. Basal leaves elliptic, 15--30 cm. Flowers yellow, in dense axillary whorls. Calyx membranous, split to base.],
  )
]

#speaker-note[Introduce the herbarium as both a repository and a research tool. Emphasize the dual nature of preservation and scientific inquiry.]

== Specimen Statistics: The Collection

#cols(columns: (1fr, 1fr, 1fr, 1fr))[
  #taxonomy-stat([2.4M], [Specimens])
][
  #taxonomy-stat([187K], [Species], accent: palette.secondary)
][
  #taxonomy-stat([412], [Type Specimens])
][
  #taxonomy-stat([1753], [Founded], accent: palette.ink-light)
]

#v(0.6em)
#vein-divider()
#v(0.4em)

#cols(columns: (1fr, 1fr))[
  #catalog-panel([CAT-001], [Angiosperms], [
    Flowering plants comprising 85% of the collection. Families represented: Asteraceae, Fabaceae, Poaceae, Orchidaceae, Rosaceae. Specimens span all continents except Antarctica.
  ])
][
  #catalog-panel([CAT-002], [Pteridophytes], [
    Ferns and fern allies. Notable holdings include complete series of _Dryopteris_ from the British Isles and Southeast Asian _Cyathea_ tree ferns. 12,400 sheets total.
  ], accent: palette.secondary)
]

#speaker-note[Present the scale of the collection. Use the numbers to convey institutional authority and scientific breadth.]

== Morphological Key: Leaf Venation

#herbarium-table(
  ([Pattern], [Description], [Example Families], [Diagnostic Value]),
  ([Pinnate], [Single midrib with lateral veins], [Fagaceae, Betulaceae], [High]),
  ([Palmate], [Multiple primary veins from base], [Aceraceae, Malvaceae], [Moderate]),
  ([Parallel], [Veins running longitudinally], [Poaceae, Liliaceae], [Family-level]),
  ([Reticulate], [Net-like venation pattern], [Most dicots], [Low]),
  ([Dichotomous], [Forking without midrib], [Ginkgoaceae], [Very high]),
)

#v(0.5em)
#std.align(right, accession-number([REF-VEN-2024-A]))

#speaker-note[Walk through the morphological key. Emphasize that venation is one of the most useful characters for determination, even from fragmentary material.]

// ─── Section 2 ───
= Field Collection Methods

== Equipment and Protocols

#cols(columns: (2fr, 3fr))[
  #specimen-card([Essential Equipment], [
    - Plant press (hardwood frames)
    - Corrugated ventilators
    - Blotting paper (acid-free)
    - Field notebook (waterproof)
    - GPS unit (sub-meter)
    - Hand lens (10x, 20x)
    - Secateurs and trowel
  ])
][
  #catalog-panel([PROT-A], [Collection Protocol], [
    *Step 1* -- Select representative individual showing diagnostic features (flowers, fruits if possible).

    *Step 2* -- Record field data: habitat, altitude, associated species, soil type, aspect.

    *Step 3* -- Press immediately between absorbent sheets. Change papers daily for first 72 hours.

    *Step 4* -- Assign field number sequentially. Cross-reference with GPS coordinates.
  ])

  #v(0.4em)
  #collection-label(
    [Standard Protocol],
    [ISO-13028],
    [Kew Royal Botanic Gardens],
    date: [Rev. 2023],
  )
]

#speaker-note[Detail the standardized collection methods. Emphasize that proper technique ensures long-term specimen quality -- poorly pressed material loses scientific value.]

== Geographic Distribution: Collection Sites

#cols(columns: (1fr, 1fr), column-gutter: 16pt, lazy-layout: true,
  {
    specimen-card([Tropical Lowlands], [
      Primary collection regions: Amazon Basin, Congo Basin, Borneo lowlands. Specimens require rapid drying to prevent fungal degradation. Average pressing time: 2--4 days with artificial heat.

      #v(0.4em)
      #genus-tag[0--500m a.s.l.]
      #h(4pt)
      #accession-number([ZONE-T1])
    ], accent: palette.secondary)
  },
  {
    specimen-card([Alpine and Arctic], [
      High-altitude sites: Alps, Himalayas, Andes above treeline. Specimens typically small, compact growth forms. Cushion plants, rosette herbs. Cold-air drying preferred.

      #v(0.4em)
      #genus-tag[2500--5000m a.s.l.]
      #h(4pt)
      #accession-number([ZONE-A3])
    ])
  },
)

#vein-divider()

#std.align(center)[
  #text(size: typo.small, fill: palette.ink-muted, style: "italic")[
    Total geographic coverage: 142 countries, 6 continents, 847 distinct bioregions
  ]
]

#speaker-note[Compare collection challenges across biomes. The contrast between tropical and alpine material highlights the importance of adapted preservation techniques.]

// ─── Dark Slide ───
#dark-slide(title: [The Archive as Living Memory])[
  #v(0.8em)
  #text(size: 1.3em, weight: "regular", style: "italic")[
    Every specimen sheet is a frozen moment in ecological time -- a record of what grew where, and when.
  ]

  #v(1.2em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 20pt,
    {
      set text(fill: palette.bg.transparentize(20%))
      text(size: typo.tiny, fill: palette.accent-on-dark, weight: "medium", tracking: 1pt, font: _mono-font)[OLDEST SHEET]
      v(0.3em)
      text(size: 28pt, weight: "bold")[1697]
      v(0.2em)
      text(size: typo.small, style: "italic")[_Verbascum thapsus_ L.]
    },
    {
      set text(fill: palette.bg.transparentize(20%))
      text(size: typo.tiny, fill: palette.accent-on-dark, weight: "medium", tracking: 1pt, font: _mono-font)[COLLECTORS]
      v(0.3em)
      text(size: 28pt, weight: "bold")[3,847]
      v(0.2em)
      text(size: typo.small, style: "italic")[contributing botanists]
    },
    {
      set text(fill: palette.bg.transparentize(20%))
      text(size: typo.tiny, fill: palette.accent-on-dark, weight: "medium", tracking: 1pt, font: _mono-font)[TYPE SPECIMENS]
      v(0.3em)
      text(size: 28pt, weight: "bold")[412]
      v(0.2em)
      text(size: typo.small, style: "italic")[nomenclatural standards]
    },
  )
]

#speaker-note[This dark slide creates a moment of reflection. The archive is not merely storage -- it is an active instrument of scientific memory.]

// ─── Section 3 ───
= Nomenclature and Types

== Type Specimen Categories

#cols(lazy-layout: true)[
  #catalog-panel([NOM-I], [Holotype], [
    The single specimen designated by the original author as the nomenclatural type. Irreplaceable. Stored in climate-controlled vault at 18 C, 45% RH.
  ])
][
  #catalog-panel([NOM-III], [Lectotype], [
    A specimen selected from original material when no holotype was designated. Requires formal publication with justification.
  ], accent: palette.secondary)
]

#cols(lazy-layout: true)[
  #catalog-panel([NOM-II], [Isotype], [
    A duplicate of the holotype, collected at the same time and place by the same collector. Distributed to other institutions for verification.
  ])
][
  #catalog-panel([NOM-IV], [Neotype], [
    A newly designated type when all original material is lost or destroyed. Rare; requires extensive documentation of loss.
  ], accent: palette.secondary)
]

#speaker-note[Explain the hierarchy of type specimens. Emphasize that nomenclatural types are the foundation of all biological naming -- without them, taxonomy collapses into ambiguity.]

== Determination History: _Quercus robur_

#cols[
  #determination-label([Quercus], [robur], authority: [L., Sp. Pl. 996. 1753])

  #v(0.4em)
  #vein-divider()
  #v(0.4em)

  #grid(columns: (2fr, 3fr), column-gutter: 16pt,
    {
      collection-label(
        [J. Ray],
        [RAY-1677-042],
        [Essex, England],
        date: [1677-IX-03],
      )
      v(0.6em)
      collection-label(
        [C. Linnaeus],
        [LINN-1106.1],
        [Uppsala, Sweden],
        date: [1748-VII-21],
      )
      v(0.6em)
      collection-label(
        [A.P. de Candolle],
        [G-DC-00312],
        [Geneva, Switzerland],
        date: [1819-X-15],
      )
    },
    {
      pressed-specimen(
        [Diagnostic Characters],
        [
          *Habit*: Deciduous tree to 40m. *Leaves*: Obovate, 10--12 cm, with 4--5 pairs of rounded lobes, sessile or nearly so, auriculate at base. *Fruit*: Acorn 2--2.5 cm, on peduncle 4--8 cm. Cupule with appressed scales.

          #v(0.4em)
          *Distribution*: Throughout Europe from Norway to Mediterranean. Dominant in lowland mixed deciduous forest.

          #v(0.3em)
          #genus-tag[Fagaceae]
          #h(4pt)
          #genus-tag[Sect. Quercus]
          #h(4pt)
          #accession-number([HOLOTYPE])
        ],
      )
    },
  )
]

#speaker-note[Walk through a specific example of determination history. Show how multiple collections across centuries build understanding of a single species.]

// ─── Focus Slide ───
#focus-slide[
  _Nomina si nescis, perit et cognitio rerum._

  If you know not the names of things, the knowledge of things themselves perishes.
]

#speaker-note[A moment of reflection using Linnaeus's famous motto. This connects the practical work of taxonomy to its philosophical foundations.]

// ─── Section 4 ───
= Conservation and Digitization

== Digital Preservation Pipeline

#cols(columns: (2fr, 3fr))[
  #cols(columns: (1fr,))[
    #taxonomy-stat([94%], [Digitized], accent: palette.accent)
  ]

  #v(0.4em)

  #specimen-card([Imaging Standards], [
    - Resolution: 600 DPI minimum
    - Color calibration: X-Rite target
    - File format: TIFF (archival)
    - Metadata: Darwin Core schema
    - Georeferencing: WGS84 datum
  ])
][
  #catalog-panel([DIG-001], [Workflow Stages], [
    *1. Preparation* -- Select sheet, verify label legibility, repair fragile attachments with acid-free tissue.

    *2. Imaging* -- Flatbed scanning at 600 DPI. Include color bar and scale. Capture both recto and verso.

    *3. Transcription* -- OCR + manual verification of label data. Georeferencing from locality descriptions.

    *4. Publication* -- Upload to GBIF portal. Assign persistent DOI. Link to IPNI nomenclatural record.
  ])

  #v(0.4em)
  #std.align(right)[
    #accession-number([GBIF-2024])
    #h(6pt)
    #accession-number([DOI-10.5281])
  ]
]

#speaker-note[Explain the digitization pipeline. Emphasize that digitization democratizes access -- a researcher in Nairobi can now examine type specimens held in London or Paris.]

== Threat Assessment: At-Risk Collections

#herbarium-table(
  ([Risk Factor], [Severity], [Affected Sheets], [Mitigation]),
  ([Insect damage], [High], [~12,000], [IPM, nitrogen atmosphere]),
  ([Acidic paper], [Medium], [~45,000], [Deacidification bath]),
  ([Label fading], [Medium], [~8,500], [UV-filtered lighting]),
  ([Physical damage], [Low], [~3,200], [Archival repair tissue]),
  ([Fungal growth], [Low], [~1,800], [Climate control, 45% RH]),
)

#v(0.4em)
#field-quote(cite: "Bridson & Forman, 1998")[
  The greatest threat to herbarium collections is not dramatic catastrophe, but the slow accumulation of neglect.
]

#speaker-note[Present conservation challenges frankly. The table format suits the systematic, data-driven nature of conservation assessment.]

// ─── Another Dark Slide ───
#dark-slide(title: [The Future of Collections])[
  #v(0.5em)
  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    {
      set text(fill: palette.bg.transparentize(10%))
      text(size: typo.tiny, fill: palette.accent-on-dark, weight: "medium", tracking: 1pt, font: _mono-font)[MACHINE LEARNING]
      v(0.4em)
      text(size: typo.body)[
        Convolutional neural networks now achieve 92% accuracy in automated species identification from herbarium sheet images. Training data: 1.2M annotated specimens.
      ]
    },
    {
      set text(fill: palette.bg.transparentize(10%))
      text(size: typo.tiny, fill: palette.accent-on-dark, weight: "medium", tracking: 1pt, font: _mono-font)[GENOMIC HERBARIUM]
      v(0.4em)
      text(size: typo.body)[
        Ancient DNA extraction from specimens up to 200 years old. Phylogenomic reconstruction using museomics protocols. Connecting morphology to molecular systematics.
      ]
    },
  )

  #v(0.8em)
  #std.align(center)[
    #text(size: typo.small, fill: palette.bg.transparentize(40%), style: "italic")[
      The herbarium of the future integrates specimen, sequence, and satellite.
    ]
  ]
]

#speaker-note[Look forward to emerging technologies. The dark slide signals a shift in register -- from historical documentation to future vision.]

// ─── Ending Slide ───
#ending-slide[Finis Collectionis]

#speaker-note[Close with the Latin phrase appropriate to a natural history institution. The ending slide should feel like closing a catalog volume.]
