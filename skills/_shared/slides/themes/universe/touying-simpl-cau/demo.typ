// ===============================================================
// CAU Simpl Theme Demo
// Universe package: @preview/touying-simpl-cau:0.2.1
// Touying version: 0.6.1 (required by the universe package)
// Theme for China Agricultural University (中国农业大学)
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-cau:0.2.1": *
#import "@preview/mitex:0.2.7": *

#show: cau-theme.with(
  aspect-ratio: "16-9",
  font: ("Libertinus Serif", "Noto Sans SC"),
  config-info(
    title: [Advances in Crop Genome Editing for Climate Resilience],
    subtitle: [Annual Research Symposium 2025],
    author: [Dr. Zhang Wei],
    date: datetime.today(),
    institution: [College of Agronomy and Biotechnology, China Agricultural University],
  ),
)

// ---------------------------------------------------------------
// Title Slide
// ---------------------------------------------------------------
#title-slide()

// ---------------------------------------------------------------
// Outline
// ---------------------------------------------------------------
#outline-slide()

// ---------------------------------------------------------------
// Section 1: Introduction
// ---------------------------------------------------------------
= Introduction

== Research Background

Climate change poses significant challenges to global food security. Key concerns include:

- *Rising temperatures* accelerating crop phenology
- Increased frequency of drought and flooding events
- Shifts in pest and disease distribution patterns
- Declining soil fertility in major agricultural regions

At China Agricultural University, our research focuses on developing *climate-resilient crop varieties* through advanced genome editing techniques.

== Research Objectives

Our study addresses three core objectives:

+ Identify drought-tolerance genes in major cereal crops
+ Develop CRISPR-Cas9 protocols optimized for wheat and maize
+ Evaluate field performance of edited varieties under stress conditions

The expected outcomes will contribute to China's national food security strategy.

// ---------------------------------------------------------------
// Section 2: Methodology
// ---------------------------------------------------------------
= Methodology

== Experimental Design

We employ a multi-stage experimental pipeline:

- *Stage 1* — Transcriptomic screening of drought-responsive genes
  - RNA-seq analysis across 12 genotypes
  - Differential expression profiling under water deficit
- *Stage 2* — CRISPR construct design and transformation
  - Guide RNA optimization via computational tools
  - Agrobacterium-mediated transformation of wheat callus
- *Stage 3* — Controlled-environment phenotyping
  - Growth chamber trials at 40% field capacity
  - Physiological measurements (stomatal conductance, WUE)

== Mathematical Framework

The crop water use efficiency (WUE) is modeled as:

#mitex(`\text{WUE} = \frac{Y}{\text{ET}} = \frac{\int_0^T A(t) \, dt}{\int_0^T E(t) + T_r(t) \, dt}`)

where #mi(`A(t)`) is assimilation rate, #mi(`E(t)`) is soil evaporation, and #mi(`T_r(t)`) is transpiration.

The selection index for multi-trait genomic selection follows:

#mitex(`I = \sum_{i=1}^n b_i \cdot \hat{g}_i, \quad \text{where} \quad \mathbf{b} = \mathbf{P}^{-1} \mathbf{G} \mathbf{a}`)

// ---------------------------------------------------------------
// Section 3: Results
// ---------------------------------------------------------------
= Results

== Gene Expression Analysis

Key findings from the transcriptomic study:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header([*Gene*], [*Log2FC*], [*p-value*], [*Function*]),
  [_TaDREB1_], [4.7], [< 0.001], [Transcription factor],
  [_TaLEA3_], [3.2], [< 0.01], [Desiccation tolerance],
  [_TaP5CS_], [5.1], [< 0.001], [Proline biosynthesis],
  [_TaWRKY40_], [2.8], [< 0.05], [Stress signaling],
)

== Field Trial Performance

Edited lines showed significant improvement over wild-type controls:

- *Grain yield under drought*: +23% (p < 0.01)
- *Water use efficiency*: +31% compared to parental lines
- *Days to maturity*: No significant change (#mi(`p = 0.42`))
- *Grain quality parameters*: Maintained within acceptable ranges

// ---------------------------------------------------------------
// Section 4: Discussion & Conclusion
// ---------------------------------------------------------------
= Discussion

== Implications for Breeding Programs

These results demonstrate that targeted genome editing can improve drought tolerance *without* yield penalties under normal conditions. This approach offers advantages over conventional breeding:

+ *Precision* — Single-gene modifications with minimal off-target effects
+ *Speed* — Reduces breeding cycle from 8--12 years to 2--3 years
+ *Traceability* — Edits are fully characterized at the molecular level

Future work will extend to heat tolerance genes and multi-gene stacking strategies.

// ---------------------------------------------------------------
// Focus Slide
// ---------------------------------------------------------------
#focus-slide[
  Genome editing enables a new paradigm for\
  climate-resilient agriculture.
]

// ---------------------------------------------------------------
// Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Acknowledgments

*Key contributions:*

- Identified 4 high-confidence drought-tolerance genes in wheat
- Established optimized CRISPR protocols for CAU wheat varieties
- Demonstrated 23% yield improvement under field drought conditions

*Acknowledgments:*
- National Natural Science Foundation of China (Grant No. 32071234)
- CAU College of Agronomy and Biotechnology
- Collaborative partners at CAAS and CIMMYT

== References

+ Wang, X. et al. (2024). "CRISPR-mediated drought tolerance in wheat." _Nature Plants_, 10, 234--248.
+ Li, J. & Chen, H. (2023). "Genomic selection for stress resistance." _Crop Science_, 63(4), 1567--1582.
+ Zhang, W. et al. (2025). "Multi-trait improvement via gene stacking." _Plant Cell_, 37(1), 89--105.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
#ending-slide(
  config: config-page(header: none, footer: none),
  title: [Thank You],
)[
  Questions and discussion\
  College of Agronomy and Biotechnology
]
