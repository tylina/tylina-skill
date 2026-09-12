// ===============================================================
// MUW Touying Community Theme Demo
// Universe package: @preview/muw-touying-community:0.1.0
// Touying version: 0.6.1
// Medizinische Universität Wien — Corporate Design Theme
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/muw-touying-community:0.1.0": *
#import "@preview/mitex:0.2.7": *

#set text(lang: "en")

// --- Theme Configuration ---
#show: muw-slides.with(
  config-common(slide-level: 2, breakable: false),
  config-info(
    title: [Immunotherapy Response Prediction Using Radiomics],
    author: [Univ. Prof. Dr. Maria Hofer],
    institution: [Universitätsklinik für Innere Medizin I],
    organization: [Medizinische Universität Wien],
  ),
  footer-title: [Immunotherapy Response Prediction Using Radiomics],
  footer-orga: [Universitätsklinik für Innere Medizin I],
  page-numbering-start: 2,
)

// === Title Slide ===
#title-slide-dunkelblau()

// ============================================================
= Clinical Background
// ============================================================

== Immunotherapy in Oncology

Immune checkpoint inhibitors (ICIs) have *revolutionised* cancer treatment
across multiple tumour types:

- Anti-PD-1 / PD-L1 antibodies (pembrolizumab, nivolumab)
- Anti-CTLA-4 therapy (ipilimumab)
- Combination regimens for advanced melanoma and NSCLC
- Durable responses in a subset of patients (20--40%)

However, reliable *predictive biomarkers* remain an unmet clinical need.

== The Biomarker Challenge

=== Current Limitations

Existing biomarkers have limited predictive accuracy:

- PD-L1 expression: sensitivity #mi(`\approx`) 60%, specificity #mi(`\approx`) 55%
- Tumour mutational burden (TMB): threshold-dependent, no consensus cutoff
- Microsatellite instability (MSI): relevant only in specific tumour types

=== Our Hypothesis

Quantitative imaging features (radiomics) extracted from baseline CT scans
can complement molecular biomarkers to improve response prediction:

#mitex(`\text{AUC}_{\text{combined}} > \text{AUC}_{\text{PD-L1}}`)

// ============================================================
= Methods
// ============================================================

== Study Design

A retrospective cohort study conducted at the Vienna General Hospital
(AKH Wien), part of MedUni Wien:

- *Cohort*: 342 patients with advanced NSCLC (Stage III--IV)
- *Treatment*: First-line pembrolizumab monotherapy or combination
- *Imaging*: Baseline contrast-enhanced chest CT (≤4 weeks before treatment)
- *Endpoint*: Best overall response (RECIST v1.1) at 12 weeks

== Feature Extraction Pipeline

=== Radiomic Features

We extracted 1,218 radiomic features per patient:

+ *Shape features*: Tumour volume, surface area, sphericity (#mi(`n = 14`))
+ *First-order statistics*: Mean, variance, skewness, kurtosis (#mi(`n = 18`))
+ *Texture features*: GLCM, GLRLM, GLSZM, NGTDM (#mi(`n = 75`))
+ *Wavelet decompositions*: Multi-scale filtered variants (#mi(`n = 1{,}111`))

=== Statistical Model

The prediction model uses elastic net regularisation:

#mitex(`\hat{\beta} = \arg\min_\beta \left\{ \frac{1}{2n} \|\mathbf{y} - \mathbf{X}\beta\|_2^2 + \lambda \left( \alpha \|\beta\|_1 + \frac{1-\alpha}{2} \|\beta\|_2^2 \right) \right\}`)

with #mi(`\alpha = 0.5`) (equal L1/L2 penalty) and #mi(`\lambda`) selected via
10-fold cross-validation.

== Patient Demographics

#table(
  columns: (2fr, 1fr, 1fr),
  align: center + horizon,
  inset: 0.5em,
  table.header(
    [*Characteristic*],
    [*Responders* \ #mi(`n = 124`)],
    [*Non-responders* \ #mi(`n = 218`)],
  ),
  [Median age (years)], [64 (IQR: 57--71)], [66 (IQR: 58--73)],
  [Male sex (%)], [58.1], [62.4],
  [ECOG PS 0--1 (%)], [89.5], [78.4],
  [PD-L1 $>= 50%$ (%)], [41.9], [22.0],
  [Median TMB (mut/Mb)], [11.2], [7.8],
)

// ============================================================
= Results
// ============================================================

== Prediction Performance

The combined radiomics + PD-L1 model significantly outperformed
PD-L1 expression alone:

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center + horizon,
  inset: 0.5em,
  table.header[*Model*][*AUC*][*Sensitivity*][*Specificity*],
  [PD-L1 alone], [0.64], [0.61], [0.58],
  [TMB alone], [0.59], [0.55], [0.62],
  [Radiomics alone], [0.72], [0.68], [0.71],
  [*Combined*], [*0.81*], [*0.76*], [*0.79*],
)

== Key Radiomic Features

The top discriminative features identified by the elastic net model:

+ *GLCM Contrast* (wavelet HHL): captures intra-tumoral heterogeneity
+ *First-order Entropy*: reflects complexity of intensity distribution
+ *Shape Sphericity*: irregular tumour morphology predicts poor response
+ *GLSZM Zone Entropy*: spatial distribution of grey-level zones

The hazard ratio for the radiomics risk score:

#mitex(`\text{HR} = 0.54 \quad (95\% \text{ CI}: 0.41 - 0.72, \quad p < 0.001)`)

== Survival Analysis

Patients stratified by the combined model showed significantly different
progression-free survival (PFS) outcomes:

- *High-score group*: Median PFS = 11.4 months (95% CI: 9.2--14.1)
- *Low-score group*: Median PFS = 4.8 months (95% CI: 3.6--6.1)
- Log-rank test: #mi(`p < 0.0001`)

// ============================================================
= Discussion and Conclusions
// ============================================================

== Clinical Implications

=== Strengths

- Non-invasive biomarker derivable from routine imaging
- Complements existing molecular markers (PD-L1, TMB)
- Applicable in real-world clinical settings at AKH Wien

=== Limitations

- Retrospective single-centre design
- CT acquisition protocol variability
- External validation in multi-centre cohort pending

== Summary and Future Directions

*Key findings:*
- Radiomic features significantly improve ICI response prediction
- Combined model achieves AUC = 0.81 vs. 0.64 for PD-L1 alone
- Intra-tumoral heterogeneity is the strongest predictive signal

*Next steps:*
- Prospective validation study at MedUni Wien (planned Q3 2025)
- Multi-centre collaboration with the Austrian Lung Cancer Group
- Integration with deep learning-based tumour segmentation

== Acknowledgements

This work was supported by the Austrian Science Fund (FWF) and the
Comprehensive Cancer Center Vienna (CCC). We thank the Department of
Radiology at AKH Wien for imaging data access and the MedUni Wien
IT team for computational infrastructure.
