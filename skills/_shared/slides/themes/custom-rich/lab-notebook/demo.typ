// Lab Notebook Theme Demo — Cellular Metabolism Research
// Academic research presentation in lab notebook style
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show: lab-notebook-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [BIO 440 -- Cellular Metabolism Lab],
  config-info(
    title: [Mitochondrial Dynamics in Stress Response],
    subtitle: [Fission, Fusion, and Metabolic Adaptation],
    author: [Dr. Sarah Chen],
    institution: [Molecular Biology Lab, Pacific Institute of Science],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// Document fonts belong in the deck, not the reusable theme entry point.
#set text(font: ("Arial", "Noto Sans SC"))
#show raw: set text(font: "IBM Plex Mono")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Background
// ══════════════════════════════════════
= Background

== Mitochondrial Overview

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  entry-card([Structure], [
    Mitochondria are double-membrane organelles:
    - *Outer membrane*: permeable to small molecules
    - *Inner membrane*: highly folded (cristae), houses ETC
    - *Matrix*: contains mtDNA, ribosomes, enzymes
    - *Intermembrane space*: proton gradient reservoir
  ], accent: palette.teal),
  entry-card([Function], [
    Primary roles in cellular metabolism:
    - *Oxidative phosphorylation*: ATP synthesis
    - *Beta-oxidation*: fatty acid degradation
    - *Calcium buffering*: signaling regulation
    - *Apoptosis*: programmed cell death initiation
  ], accent: palette.orange),
)

#v(0.5em)

#margin-note[
  Note: Mitochondrial morphology is highly dynamic and varies between cell types. Neurons maintain elongated networks while hepatocytes show fragmented patterns.
]

== Key Proteins

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  specimen-box([DRP1], [
    Dynamin-related GTPase responsible for mitochondrial fission. Recruited to OMM by adaptor proteins (MFF, MiD49/51).
  ]),
  specimen-box([MFN1/2], [
    Mitofusins mediate outer membrane fusion. MFN2 also tethers mitochondria to ER at MAM contact sites.
  ]),
  specimen-box([OPA1], [
    Inner membrane fusion GTPase. Long/short isoforms regulate cristae remodeling and apoptotic resistance.
  ]),
)

#v(0.4em)

#stack(dir: ltr, spacing: 0.6em,
  sample-tag([Fission], color: palette.orange),
  sample-tag([Fusion], color: palette.teal),
  sample-tag([Mitophagy], color: palette.specimen-green),
  sample-tag([Biogenesis], color: palette.margin-red),
)

// ══════════════════════════════════════
// Section 2: Methods
// ══════════════════════════════════════
= Experimental Methods

== Cell Culture Protocol

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  protocol-card([Cell Line Preparation], [
    + Thaw HeLa cells from liquid nitrogen
    + Culture in DMEM + 10% FBS at 37C / 5% CO2
    + Passage at 80% confluency (every 48h)
    + Seed at $2 times 10^5$ cells/well for experiments
    + Treat with CCCP (10 uM) for stress induction
    + Harvest at 0, 2, 6, 12, 24h time points
  ]),
  protocol-card([Imaging Protocol], [
    + Fix cells with 4% PFA for 15 minutes
    + Permeabilize with 0.1% Triton X-100
    + Block with 3% BSA in PBS for 1 hour
    + Primary antibody incubation overnight at 4C
    + Secondary antibody (Alexa Fluor 488/594) 1h RT
    + Mount with DAPI and image on confocal
  ]),
)

#v(0.5em)

#sticky-note([Important], [
  Always include vehicle control (DMSO) alongside CCCP treatment. Maintain consistent passage numbers (P5-P15) across replicates to avoid senescence artifacts.
])

== Measurements and Controls

#cols[
  #data-table-card([Experimental Conditions], [
    #table(
      columns: (1.1fr, 1.35fr, 0.95fr, 1fr),
      stroke: 0.5pt + palette.grid-blue,
      inset: 6pt,
      align: (left, center, center, center),
      [*Condition*], [*Concentration*], [*Duration*], [*Replicates*],
      [Control (DMSO)], [0.1%], [24h], [n=6],
      [CCCP (low)], [5 uM], [2-24h], [n=6],
      [CCCP (high)], [20 uM], [2-24h], [n=6],
      [Mdivi-1 + CCCP], [50 uM + 10 uM], [6h], [n=4],
    )
  ])
][
  #entry-card([Quality Controls], [
    - *Positive control*: Staurosporine (apoptosis)
    - *Negative control*: Vehicle only (DMSO 0.1%)
    - *Imaging control*: Secondary-only (no primary Ab)
    - *Loading control*: Beta-actin for Western blots
  ], accent: palette.specimen-green)

  #v(0.4em)

  #observation-log([Technical Note -- May 15], [
    Batch #3 cells showed unexpected morphology at baseline. Suspected mycoplasma contamination. Re-tested with MycoAlert kit: negative. Likely passage-dependent variation.
  ])
]

// ══════════════════════════════════════
// Section 3: Results
// ══════════════════════════════════════
= Results

== Morphological Changes

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  entry-card([Fission Dominance Under Stress], [
    CCCP treatment induced rapid mitochondrial fragmentation:
    - *2h*: Initial network breakdown, punctate structures appear
    - *6h*: Peak fragmentation, >80% cells affected
    - *12h*: Partial recovery in low-dose group
    - *24h*: Sustained fragmentation in high-dose

    DRP1 recruitment to OMM increased 3.2-fold by 2h.
  ], accent: palette.orange),
  entry-card([Fusion Rescue Dynamics], [
    Mdivi-1 co-treatment partially preserved networks:
    - Fragmentation reduced by ~45% at 6h
    - MFN2 protein levels maintained
    - Cristae structure better preserved (TEM)
    - Mitophagy markers (PINK1/Parkin) reduced

    Suggests fission is upstream of mitophagy activation.
  ], accent: palette.teal),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  reading-stat([Fission rate], [3.2x]),
  reading-stat([Fragmented], [83%], color: palette.orange),
  reading-stat([Recovery], [47%], color: palette.specimen-green),
  reading-stat([Mitophagy], [2.1x], color: palette.margin-red),
)

== Protein Expression

#cols[
  #data-table-card([Western Blot Quantification (fold change vs control)], [
    #table(
      columns: (auto, auto, auto, auto, auto),
      stroke: 0.5pt + palette.grid-blue,
      inset: 6pt,
      align: (left, center, center, center, center),
      [*Protein*], [*2h*], [*6h*], [*12h*], [*24h*],
      [DRP1 (mito)], [2.1], [3.2], [2.8], [2.5],
      [MFN2], [0.9], [0.6], [0.5], [0.4],
      [OPA1 (long)], [0.8], [0.4], [0.3], [0.2],
      [PINK1], [1.5], [2.8], [3.4], [3.1],
      [Parkin (mito)], [1.2], [2.4], [3.0], [2.8],
    )
  ])
][
  #observation-log([Key Finding -- Exp. 7], [
    OPA1 long-form processing correlates inversely with DRP1 recruitment. Proteolytic cleavage by OMA1 precedes fragmentation, suggesting OPA1 processing is the initiating event.
  ])

  #v(0.4em)

  #specimen-box([Statistical Note], [
    All values represent mean of n=6 biological replicates. Error bars: SEM. Significance tested via Student's t-test with Bonferroni correction (p values shown in manuscript).
  ])
]

// ══════════════════════════════════════
// Section 4: Analysis
// ══════════════════════════════════════
= Analysis

== Mechanistic Model

#cols(
  entry-card([Proposed Pathway], [
    Based on our temporal data, we propose:

    + *Stress signal* (membrane depolarization)
    + *OPA1 cleavage* by OMA1 (minutes)
    + *DRP1 recruitment* via MFF/MiD49 (1-2h)
    + *Fission execution* and network fragmentation
    + *PINK1 stabilization* on depolarized fragments
    + *Parkin recruitment* and ubiquitination
    + *Mitophagy* of damaged units
  ], accent: palette.teal),
  {
    sticky-note([Hypothesis], [
      Fission acts as a "quality control checkpoint" -- isolating damaged segments for selective removal while preserving functional network regions.
    ])
    v(0.6em)
    margin-note[
      Alternative: Fission may be a passive consequence of bioenergetic failure rather than an active quality control mechanism. Need FRAP experiments to distinguish.
    ]
  },
)

#v(0.4em)

#binding-divider(width: 60%)

== Comparison with Literature

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  entry-card([Consistent Findings], [
    - DRP1-dependent fission precedes mitophagy (Twig et al., 2008)
    - PINK1/Parkin pathway for damaged mitochondria (Narendra et al., 2010)
    - MFN2 degradation during prolonged stress (Chen & Dorn, 2013)
  ], accent: palette.teal),
  entry-card([Novel Observations], [
    - OPA1 processing as earliest event (pre-DRP1)
    - Dose-dependent recovery capacity
    - Mdivi-1 protective effect extends to cristae
    - Non-linear temporal dynamics of Parkin
  ], accent: palette.orange),
)

// ══════════════════════════════════════
// Section 5: Conclusions
// ══════════════════════════════════════
= Conclusions

== Summary and Future Work

#cols[
  #entry-card([Key Conclusions], [
    + Mitochondrial fission is an early, active response to stress
    + OPA1 processing initiates the fission cascade
    + Fission-mitophagy axis serves as quality control
    + Pharmacological fission inhibition preserves function
    + Recovery is possible at sub-lethal stress levels
  ], accent: palette.teal)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    sample-tag([Validated], color: palette.teal),
    sample-tag([Published], color: palette.specimen-green),
    sample-tag([In revision], color: palette.orange),
  )
][
  #protocol-card([Next Steps], [
    + Live-cell imaging with Mito-GFP reporters
    + CRISPR knockout of OMA1 to test model
    + Primary neuron cultures (disease relevance)
    + Metabolomics profiling during fission
    + In vivo validation in mouse model
  ])

  #v(0.4em)

  #sticky-note([Lab Meeting Action Items], [
    - Submit revised manuscript by June 1
    - Order new CRISPR constructs (OMA1-KO)
    - Book confocal time for live imaging
    - Train new student on Western blot protocol
  ])
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"Mitochondria are not merely the powerhouses of the cell -- they are its quality control inspectors, deciding the fate of damaged components through an elegant fission-fusion cycle."_
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
