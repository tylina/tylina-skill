// Fossil Amber Theme Demo — Paleontological Research Presentation
// Warm amber tones with geological strata aesthetic
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show raw: set text(font: "IBM Plex Mono")
#show: fossil-amber-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Deep Time Symposium 2026],
  config-info(
    title: [Preserving the Record: Amber Deposits of the Cretaceous],
    subtitle: [New Insights from Baltic and Burmese Amber Lagerstatte],
    author: [Dr. Helena Marchetti],
    institution: [Institute for Earth Sciences, University of Geneva],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)
#set text(font: ("IBM Plex Serif", "Noto Serif SC"))

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: Introduction
// ======================================
= Introduction

== Research Context

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    stratum-card([Amber as a Time Capsule], [
      Amber preserves biological inclusions with extraordinary fidelity. Unlike compression fossils, three-dimensional cellular structures remain intact, allowing morphological analysis at sub-micron resolution.

      Recent CT scanning techniques reveal internal anatomy previously invisible to light microscopy.
    ], accent: palette.accent),
    stratum-card([Geographic Distribution], [
      Major Cretaceous amber deposits span three continents:

      - *Baltic Region*: 44 Mya, largest commercial source
      - *Myanmar (Burmese)*: 99 Mya, exceptional arthropod diversity
      - *New Jersey*: 90 Mya, unique Laurentian fauna
      - *Spanish*: 105-110 Mya, earliest known social insects
    ], accent: palette.secondary),
  ),
  inclusion-box([Key Discovery], [
    Our 2025 field season recovered *2,847 inclusions* from a Hukawng Valley outcrop, revealing 14 previously undescribed arthropod families.
  ]),
)

== Study Objectives

#cols[
  #stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, align: top,
      amber-stat([Specimens], [2,847], color: palette.accent),
      amber-stat([New Taxa], [14], color: palette.secondary),
      amber-stat([CT Scans], [892], color: palette.resin),
      amber-stat([Publications], [6], color: palette.sediment),
    ),
    discovery-note([Methodological Innovation], [
      We combine phase-contrast synchrotron micro-CT with machine learning segmentation to achieve *automated taxonomic classification* of amber inclusions. This pipeline reduces identification time from 4 hours to 12 minutes per specimen while maintaining 94% accuracy against expert consensus.
    ]),
  )
][
  #stack(spacing: 0.8em,
    specimen-card([Research Questions], [
      + What is the true arthropod diversity of mid-Cretaceous tropical forests?
      + How do amber taphonomic biases affect our understanding of ancient ecosystems?
      + Can molecular phylogenetics be reconciled with morphological data from amber fossils?
      + What role did resin-producing trees play in Cretaceous forest ecology?
    ], accent: palette.accent),
    stack(dir: ltr, spacing: 0.5em,
      fossil-tag([Cretaceous], color: palette.accent),
      fossil-tag([Taphonomy], color: palette.secondary),
      fossil-tag([Micro-CT], color: palette.resin),
    ),
  )
]

// ======================================
// Section 2: Methods
// ======================================
= Methods

== Field Collection Protocol

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    epoch-card([Phase I], [Outcrop Mapping], [
      High-resolution drone photogrammetry combined with stratigraphic logging. Each amber-bearing horizon is individually mapped with GPS coordinates and sedimentological context recorded.

      - 3D outcrop models at 2cm resolution
      - Stratigraphic columns every 5 meters
      - Taphonomic facies classification
    ], accent: palette.accent),
    epoch-card([Phase II], [Specimen Recovery], [
      Systematic excavation following geological bedding planes. All amber pieces greater than 5mm are catalogued in situ before extraction. Dark-field illumination is used to assess inclusion presence in the field.

      - Standardized extraction protocols
      - Chain-of-custody documentation
      - Environmental monitoring (T, RH)
    ], accent: palette.secondary),
  ),
  strata-divider(width: 60%),
  cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1em,
    amber-stat([Field Days], [127], color: palette.accent),
    amber-stat([Area Mapped], [4.2 km\u{00B2}], color: palette.secondary),
  ),
)

== Imaging Pipeline

#cols(align: top)[
  #stack(spacing: 0.8em,
    resin-box([Synchrotron Protocol], [
      ```
      Beamline:    TOMCAT (SLS, PSI)
      Energy:      18-25 keV (tunable)
      Resolution:  0.65 um/voxel
      Scan time:   12 min / specimen
      Projections: 3001 over 180 deg
      Phase:       Paganin (delta/beta=200)
      ```
      Propagation-based phase contrast enhances soft tissue visibility within the amber matrix.
    ], accent: palette.resin),
    resin-box([ML Segmentation], [
      ```
      Model:    3D U-Net (ResNet backbone)
      Training: 450 manually segmented volumes
      Dice:     0.94 (arthropod body)
      Dice:     0.87 (appendages)
      Dice:     0.91 (wings)
      Inference: 3.2 min / volume (A100)
      ```
    ], accent: palette.accent),
  )
][
  #stack(spacing: 0.8em,
    stratum-card([Automated Classification], [
      *Architecture*: Vision transformer trained on 12,000 annotated inclusion images.

      *Training*: Self-supervised pre-training followed by expert-verified fine-tuning.

      *Performance*: Order 97.2% · Family 94.1% · Genus 78.4%
    ], accent: palette.secondary),
    inclusion-box([Validation], [
      Eight specialists independently validated the labels (Cohen's kappa = 0.91), indicating near-perfect agreement.
    ]),
  )
]

// ======================================
// Section 3: Results
// ======================================
= Results

== Taxonomic Diversity

#stack(spacing: 0.8em,
  sediment-grid((
    (label: "Orders", value: "23", desc: "Arthropod orders"),
    (label: "Families", value: "142", desc: "Including 14 new"),
    (label: "Species", value: "380+", desc: "Estimated minimum"),
    (label: "Completeness", value: "72%", desc: "Specimens with appendages"),
  )),
  cols(lazy-layout: true, columns: (1fr, 1fr), gutter: 1.2em,
    stratum-card([Dominant Groups], [
      - *Hymenoptera* (38%): Predominantly parasitoid wasps and early ants
      - *Diptera* (24%): Diverse nematocerans, brachycerans
      - *Coleoptera* (15%): Weevils, bark beetles, rove beetles
      - *Hemiptera* (8%): Scale insects, plant hoppers
      - *Araneae* (6%): Web-building and cursorial spiders
      - *Other* (9%): Myriapods, crustaceans, vertebrate remains
    ], accent: palette.accent),
    stratum-card([Notable Discoveries], [
      - *Protoformicidae* sp. nov.: Transitional ant morphology with wasp-like wing venation
      - *Cretaraneus burmiticus*: Oldest known orb-weaving spider with preserved silk
      - *Palaeomyrmex sociabilis*: First definitive eusocial behavior in Cretaceous ants
      - *Hukawngia pterophylla*: Winged seed preserved mid-dispersal in resin
      - *Burmacoccus giganteus*: Largest known Cretaceous scale insect (12mm)
    ], accent: palette.secondary),
  ),
)

== Ecological Reconstruction

#cols[
  #stack(spacing: 0.8em,
    specimen-card([Forest Structure Analysis], [
      Combining inclusion data with associated plant macrofossils and palynology reveals a multi-layered tropical forest ecosystem:

      *Canopy layer* (30-40m): Araucariaceae, early angiosperms
      *Understory* (5-15m): Ferns, cycads, gnetales
      *Ground layer*: Mosses, liverworts, fungi

      The resin-producing trees occupied emergent canopy positions, creating a taphonomic bias toward canopy-dwelling arthropods.
    ], accent: palette.accent),
    stack(dir: ltr, spacing: 0.5em,
      fossil-tag([Paleoecology], color: palette.accent),
      fossil-tag([Taphonomy], color: palette.secondary),
      fossil-tag([Resin Bias], color: palette.leaf-green),
    ),
  )
][
  #stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr), gutter: 0.8em, align: top,
      amber-stat([Tree Height], [35m est.], color: palette.accent),
      amber-stat([Temp.], [28-32 C], color: palette.resin),
    ),
    cols(columns: (1fr, 1fr), gutter: 0.8em, align: top,
      amber-stat([Rainfall], [2400mm/yr], color: palette.secondary),
      amber-stat([Diversity], [H' = 4.2], color: palette.sediment),
    ),
    discovery-note([Paleoclimate Signal], [
      Oxygen isotope analysis of the amber itself yields paleotemperature estimates consistent with greenhouse Earth conditions: mean annual temperature *28.4 +/- 1.2 C* with minimal seasonal variation.
    ]),
  )
]

// ======================================
// Section 4: Taphonomy
// ======================================
= Taphonomy

== Preservation Quality Assessment

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, align: top,
    epoch-card([Grade A], [Exceptional (18%)], [
      Complete 3D preservation with cellular detail. Internal organs visible. Suitable for high-resolution CT. Often small specimens (< 3mm) fully encapsulated.
    ], accent: palette.accent),
    epoch-card([Grade B], [Good (45%)], [
      Complete external morphology with minor deformation. Some appendage loss during entrapment. Cuticle texture preserved. Diagnostic features accessible.
    ], accent: palette.secondary),
    epoch-card([Grade C], [Partial (37%)], [
      Fragmentary remains or significant deformation. Often larger organisms that were not fully engulfed. Identifiable to order/family level only.
    ], accent: palette.sediment),
  ),
  inclusion-box([Taphonomic Bias Correction], [
    #set text(size: 0.72em)
    We apply a size-frequency correction factor derived from extant resin trapping experiments. Small-bodied taxa (< 2mm) are over-represented by *3.4x* relative to their true ecological abundance, while organisms greater than 10mm are under-represented by *8.1x*. This correction significantly alters diversity estimates.
  ]),
)

== Diagenesis and Chemistry

#cols(align: top)[
  #stratum-card([FTIR Spectral Analysis], [
    FTIR spectroscopy distinguishes the amber resin's maturation pathways:

    - *Baltic amber*: Class Ia, high succinic acid
    - *Burmese amber*: Class Ib, low succinic acid, high terpenoids
    - *Diagenetic alteration*: Progressive polymer cross-linking

    Thermal history indicates shallow burial (Tmax < 90 C).

    U-Pb age of associated zircons:
    #mitex(`
      t = \frac{1}{\lambda}\ln\!\left(1 + \frac{^{206}\mathrm{Pb}}{^{238}\mathrm{U}}\right)
    `)
  ], accent: palette.accent)
][
  #stack(spacing: 0.8em,
    resin-box([Spectral Signatures], [
      ```
      Peak (cm-1)  Assignment        Status
      ─────────────────────────────────────
      3400         O-H stretch       Present
      2930         C-H stretch       Strong
      1740         C=O ester         Moderate
      1640         C=C aromatic      Weak
      1460         CH2 deformation   Strong
      1380         CH3 symmetric     Moderate
      1175         C-O-C stretch     Present
      1040         Succinic acid     Absent*
      ```
      \*Absence confirms Burmese (non-Baltic) origin.
    ], accent: palette.resin),
    amber-stat([Tmax], [< 90 C], color: palette.accent),
  )
]

// ======================================
// Section 5: Implications
// ======================================
= Implications

== Evolutionary Significance

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, align: top,
    stratum-card([Molecular Clock Calibration], [
      Our newly described ant lineage provides a critical calibration point for hymenopteran molecular phylogenetics. The morphological transition from solitary wasp-like ancestors to eusocial forms is now documented with *5 intermediate morphotypes* spanning approximately 15 million years.

      This resolves a long-standing discrepancy between molecular divergence estimates and the fossil record.
    ], accent: palette.accent),
    stratum-card([Biogeographic Implications], [
      Faunal similarity analysis between Burmese and coeval deposits reveals:

      - *82% family-level overlap* with Spanish amber
      - *67% overlap* with New Jersey amber
      - *Only 34% overlap* with Lebanese amber (20 Myr older)

      This pattern supports a connected Laurasian arthropod fauna during the mid-Cretaceous, despite continental fragmentation.
    ], accent: palette.secondary),
  ),
  sediment-grid((
    (label: "Calibration Points", value: "5", desc: "New molecular clock nodes"),
    (label: "Divergence", value: "99 Mya", desc: "Ant-wasp split confirmed"),
    (label: "Overlap", value: "82%", desc: "Pan-Laurasian fauna"),
  )),
)

== Future Directions

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, align: top,
    specimen-card([Phase III Field Work], [
      Expand excavation to three additional horizons identified via drone survey. Target: 5,000+ additional specimens over 2027-2028 field seasons.
    ], accent: palette.accent),
    specimen-card([Ancient DNA Attempts], [
      Collaborate with aDNA labs to attempt short-fragment recovery from Grade A specimens. Novel extraction protocols minimize amber contamination.
    ], accent: palette.secondary),
    specimen-card([Open Data Initiative], [
      All CT volumes and taxonomic data to be deposited in MorphoBank. Training datasets for ML pipeline released under CC-BY license.
    ], accent: palette.resin),
  ),
  discovery-note([Funding Secured], [
    ERC Consolidator Grant (2027-2032) awarded for continued excavation and analysis. Total budget: EUR 2.4M covering field operations, synchrotron beamtime, and two postdoctoral positions.
  ]),
)

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  #stack(spacing: 0.8em,
    [_"Amber is not merely a preservational medium -- it is a window into deep time, offering direct observation of ecological interactions frozen at the moment of occurrence."_],
    text(size: 0.6em, weight: "regular", fill: palette.cream)[-- Marchetti et al., Nature (2025)],
  )
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]
