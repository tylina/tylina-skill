// ===============================================================
// SDU Touying Simpl Theme Demo
// Universe package: @preview/sdu-touying-simpl:1.1.0
// Touying version: 0.7.3 (owned by the Universe package)
// Theme for Shandong University (山东大学)
// Features SDU Red (#880000) branding and academic layout
// ===============================================================

#import "@preview/sdu-touying-simpl:1.1.0": *
#import "@preview/mitex:0.2.7": *

#let demo-author = [赵德明]
#let demo-short-title = [土壤修复微生物组学]

// --- Theme Configuration ---
#show: sdu-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  config-info(
    title: [微生物组学在土壤修复中的应用研究],
    short-title: demo-short-title,
    subtitle: [基于宏基因组学的功能菌群解析],
    author: demo-author,
    date: datetime.today(),
    institution: [山东大学],
  ),
)

// =========================================================
// Title Slide
// =========================================================
#title-slide()

// =========================================================
// Outline
// =========================================================
#outline-slide("Outline")

// =========================================================
// Section 1: Introduction
// =========================================================
= Research Background

== Soil Contamination in China

Soil pollution is a critical environmental challenge in China:

- *Heavy metal contamination* — Cd, Pb, Cr, As from industrial activities
- *Organic pollutants* — PAHs, PCBs, pesticide residues
- *Combined pollution* — co-occurrence of metals and organics at 67% of sites

Current remediation challenges:
+ High cost of physicochemical methods (\$50--200/m#super[3])
+ Secondary pollution from chemical amendments
+ Limited effectiveness for mixed contamination
+ Need for sustainable, eco-friendly alternatives

== Microbial Bioremediation

Microorganisms offer promising bioremediation pathways:

#mitex(`R_{\text{deg}} = \frac{V_{\text{max}} \cdot S}{K_m + S} \cdot f(T) \cdot f(\text{pH}) \cdot f(\theta)`)

where:
- #mi(`R_{\text{deg}}`) is the biodegradation rate
- #mi(`V_{\text{max}}`) is the maximum reaction velocity
- #mi(`K_m`) is the Michaelis-Menten constant
- #mi(`f(T), f(\text{pH}), f(\theta)`) are environmental correction factors

The community diversity index (Shannon-Wiener):

#mitex(`H' = -\sum_{i=1}^S p_i \ln(p_i)`)

// =========================================================
// Section 2: Methods
// =========================================================
= Methodology

== Metagenomic Analysis Pipeline

#tblock(title: [Sequencing Strategy])[
  We employ shotgun metagenomic sequencing (Illumina NovaSeq 6000, 150 bp paired-end) combined with long-read sequencing (Oxford Nanopore) for hybrid assembly of metagenome-assembled genomes (MAGs).
]

The bioinformatics pipeline:
+ Quality control (fastp, Q30 > 85%)
+ Assembly (MEGAHIT, k-mer: 21--141)
+ Binning (MetaBAT2 + MaxBin2 + CONCOCT)
+ Refinement (DAS Tool, completeness > 70%, contamination < 10%)
+ Taxonomic classification (GTDB-Tk)
+ Functional annotation (eggNOG-mapper, KEGG, CAZy)

== Experimental Design

#block(width: 100%)[
  #grid(columns: (1fr, 1fr), column-gutter: 1.5em)[
    === Field Sites

    - Yellow River Delta saline soils
    - Shandong industrial brownfield
    - Agricultural soils (Tai'an)
    - Mining-impacted sites (Zibo)
    - 3 sampling depths per site
  ][
    === Treatments

    - Control (untreated soil)
    - Bioaugmentation (consortium A)
    - Biostimulation (nutrient amendment)
    - Combined treatment (A + nutrients)
    - Sampling: 0, 30, 60, 90 days
  ]
]

== Functional Gene Analysis

Key functional genes involved in heavy metal resistance:

#figure[
  #table(
    columns: (1fr, 1.5fr, 1fr, 1fr),
    align: center,
    table.header(
      [*Gene*], [*Function*], [*Target Metal*], [*Mechanism*],
    ),
    [_merA_], [Mercuric reductase], [Hg], [Reduction],
    [_arsC_], [Arsenate reductase], [As], [Reduction],
    [_chrA_], [Chromate efflux], [Cr], [Efflux],
    [_cadA_], [Cd-transporting ATPase], [Cd], [Efflux],
    [_copA_], [Cu-transporting ATPase], [Cu], [Efflux],
  )
]

// =========================================================
// Section 3: Results
// =========================================================
= Results and Discussion

== Community Composition Shifts

Major phyla abundance changes after 90-day treatment:

- *Proteobacteria*: 32% → 45% (enriched by biostimulation)
- *Actinobacteria*: 18% → 12% (decreased under treatment)
- *Firmicutes*: 8% → 15% (enriched in bioaugmentation)
- *Acidobacteria*: 15% → 8% (sensitive to nutrient amendment)

The combined treatment showed the highest functional diversity:
#mitex(`\Delta H' = H'_{\text{treated}} - H'_{\text{control}} = +0.85 \text{ nats}`)

== Remediation Efficiency

Pollutant removal rates after 90 days:

#figure[
  #set text(size: 0.9em)
  #table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    align: center,
    table.header(
      [*Pollutant*], [*Bioaugmentation*], [*Biostimulation*], [*Combined*],
    ),
    [Cd (mg/kg)], [35%], [22%], [*52%*],
    [Pb (mg/kg)], [28%], [18%], [*41%*],
    [PAHs (mg/kg)], [42%], [38%], [*65%*],
    [Total petroleum], [55%], [48%], [*78%*],
  )
]

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary and Outlook

#block(width: 100%)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    [#block(width: 100%)[
      #set align(left)
      *Key findings:*

      - Combined bioaugmentation-biostimulation achieves 52--78% pollutant removal
      - Functional gene abundance correlates with remediation efficiency (#mi(`r^2 = 0.87`))
      - 15 novel MAGs identified with multi-metal resistance gene clusters
    ]],
    [#block(width: 100%)[
      #set align(left)
      *Future research:*

      - Synthetic microbial consortia design using metabolic modeling
      - Field-scale pilot studies at contaminated industrial sites
      - Integration of metatranscriptomics for gene expression dynamics
      - Long-term ecological risk assessment post-remediation
    ]],
  )
]

// =========================================================
// Focus Slide
// =========================================================
#focus-slide[
  Thank You! \
  Questions & Discussion
]

// =========================================================
// Ending Slide
// =========================================================
#ending-slide(title: [Thank You for Listening!])[]
