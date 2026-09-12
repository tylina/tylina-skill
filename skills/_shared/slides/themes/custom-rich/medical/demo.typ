// Medical Theme Demo — Precision Medicine Annual Research Review 2024
// Demonstrates all slide types and reusable components
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *

#show: medical-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Precision Medicine Research Center],
  config-info(
    title: [Advances in Precision Medicine],
    subtitle: [Annual Research Review 2024],
    author: [Dr. Sarah Chen, MD, PhD],
    institution: [Dept. of Molecular Oncology, University Medical Center],
    date: datetime(year: 2024, month: 12, day: 15),
  ),
)

// ═══ Title Slide ═══
#title-slide()

// ═══ Section 1: Clinical Overview ═══
= Clinical Overview

== Research Portfolio Summary

#cols(columns: (1fr,) * 4, gutter: 12pt, lazy-layout: true,
  stat-card([Active Trials], [47], unit: [studies], accent: palette.blue),
  stat-card([Patients Enrolled], [3,842], unit: [total], accent: palette.green),
  stat-card([Response Rate], [68.3%], unit: [overall], accent: palette.orange),
  stat-card([Publications], [124], unit: [peer-reviewed], accent: palette.deep),
)

#v(0.6em)

#finding-box([Year-over-Year Progress], [
  Our precision medicine program has expanded to cover 12 cancer types with genomic-guided treatment selection. The overall response rate improved by 14.2% compared to 2023, with particularly strong results in non-small cell lung cancer (NSCLC) and triple-negative breast cancer (TNBC).
])

== Genomic Profiling Pipeline

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  case-card([Next-Generation Sequencing (NGS)], [
    - *Panel size:* 523 genes, expanded from 468
    - *Turnaround time:* 7 business days (median)
    - *Success rate:* 96.8% of specimens
    - *Variants detected:* SNVs, indels, CNVs, fusions
    - *TMB and MSI:* Integrated assessment
  ], accent: palette.blue),
  case-card([Liquid Biopsy Program], [
    - *ctDNA detection:* 89.2% sensitivity
    - *Concordance with tissue:* 91.5%
    - *Monitoring frequency:* Every 6-8 weeks
    - *Resistance mutations:* Detected 2.3 months earlier
    - *Cost reduction:* 40% vs. repeat tissue biopsy
  ], accent: palette.green),
)

// ═══ Section 2: Key Findings ═══
= Key Findings

== Biomarker-Driven Outcomes

#clinical-table(
  ([Biomarker], [Cancer Type], [Therapy], [ORR], [mPFS (mo)], [p-value]),
  (
    ([EGFR L858R], [NSCLC], [Osimertinib], [*78.4%*], [18.9], [< 0.001]),
    ([HER2 amp.], [Breast], [T-DXd], [*61.3%*], [16.4], [< 0.001]),
    ([BRAF V600E], [Melanoma], [Encorafenib + Binimetinib], [*64.9%*], [14.9], [0.002]),
    ([KRAS G12C], [NSCLC], [Sotorasib], [*37.1%*], [6.8], [0.014]),
    ([FGFR2 fusion], [Cholangiocarcinoma], [Futibatinib], [*42.0%*], [9.0], [0.008]),
  ),
)

#v(0.15em)

#warning-box([Important Limitation], [
  KRAS G12C cohort ORR (37.1%) was lower than projected. Resistance via KRAS amplification and MET bypass seen in 43% at progression. Combinations under investigation in PRISM-2.
])

== Immunotherapy Response Predictors

#cols(columns: (1fr, 1fr), gutter: 16pt,
  finding-box([TMB-High Responders], [
    Patients with TMB ≥ 10 mut/Mb showed significantly higher response rates to immune checkpoint inhibitors (ICI):
    - *ORR:* 52.1% vs. 18.7% (TMB-low)
    - *12-month OS:* 71.3% vs. 48.6%
    - *Duration of response:* 14.2 months (median)

    Combined TMB + PD-L1 scoring improved predictive accuracy to AUC 0.84. The Kaplan--Meier survival estimator:
    #mitex(`\hat{S}(t) = \prod_{t_i \leq t} \left(1 - \frac{d_i}{n_i}\right)`)
  ]),
  warning-box([Adverse Event Alert], [
    Grade 3+ immune-related adverse events (irAEs) occurred in 23.4% of ICI-treated patients. Key findings:
    - Colitis: 8.2% (most common grade 3+)
    - Hepatitis: 5.1%
    - Pneumonitis: 4.7%
    - Early detection protocol reduced ICU admissions by 31%.
  ]),
)

// ═══ Section 3: Case Studies ═══
= Case Studies

== Case 1: Exceptional Responder -- NSCLC

#cols(columns: (3fr, 2fr))[
  #case-card([Patient Profile], [
    - *Age/Sex:* 58F, never-smoker
    - *Diagnosis:* Stage IV NSCLC, adenocarcinoma
    - *Prior therapy:* Platinum-doublet (PD after 4 cycles)
    - *Genomic finding:* _ROS1_ rearrangement (CD74-ROS1)
    - *Treatment:* Entrectinib 600 mg daily

    *Outcome:* Complete metabolic response at 6 months. Ongoing response at 18 months with no detectable ctDNA. Quality of life score improved from 45 to 82 (EORTC QLQ-C30).
  ], accent: palette.blue)
][
  #stat-card([Time to Response], [6], unit: [weeks], accent: palette.blue)
  #stat-card([PFS Duration], [18+], unit: [months], accent: palette.green)
  #stat-card([ctDNA Clearance], [100%], accent: palette.orange)
]

== Case 2: Resistance & Adaptation

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  case-card([Initial Response Phase], [
    - *Patient:* 45M, BRAF V600E+ metastatic melanoma
    - *Treatment:* Dabrafenib + Trametinib
    - *Best response:* Partial response (-62% by RECIST)
    - *Duration:* 11 months before progression

    ctDNA monitoring detected rising VAF at month 9, two months before radiographic progression.
  ], accent: palette.blue),
  case-card([Adaptation Strategy], [
    - *Resistance mechanism:* MEK2 Q60P mutation identified via liquid biopsy
    - *Switch therapy:* Anti-PD-1 + anti-LAG-3 combination
    - *Second response:* Stable disease for 8 months
    - *Lesson:* Serial ctDNA enabled early therapeutic pivot

    This case illustrates the value of continuous molecular monitoring in targeted therapy management.
  ], accent: palette.orange),
)

== Multi-Omics Integration --- Rare Tumor

#case-card([Complex Diagnostic Workup: Cancer of Unknown Primary], [
  #grid(columns: (1fr, 1fr), column-gutter: 16pt,
    [
      *Presentation:*
      - 52F with liver and peritoneal masses
      - Pathology: poorly differentiated carcinoma
      - IHC inconclusive (CK7+, CK20-, TTF-1-)

      *Multi-Omics Approach:*
      - WGS: _NRG1_ fusion identified
      - RNA-seq: Matched pancreatic origin
      - Methylation array: Confirmed lineage (0.94)
    ],
    [
      *Treatment Decision:*
      - Reclassified as pancreatic adenocarcinoma
      - Enrolled in NRG1-targeted trial (Zenocutuzumab)
      - Partial response at 12-week assessment

      *Outcome:*
      - Ongoing response at 9 months
      - Multi-omics reclassified 23% of CUP cases
      - Median survival: 8 → 16 months for reclassified patients
    ],
  )
], accent: palette.green)

// ═══ Section 4: Future Directions ═══
= Future Directions

== Strategic Priorities 2025

#cols(columns: (1fr,) * 3, gutter: 12pt, lazy-layout: true,
  case-card([AI Diagnostics], [
    - Deep learning pathology models
    - Automated variant interpretation
    - *Target:* 50% faster turnaround
  ], accent: palette.blue),
  case-card([Novel Therapeutics], [
    - ADC combos for resistance
    - Bispecific antibody trials (×3)
    - *Target:* 8 new trial activations
  ], accent: palette.green),
  case-card([Data Infrastructure], [
    - Federated learning (12 sites)
    - Real-world evidence platform
    - *Target:* 50k-patient data commons
  ], accent: palette.orange),
)

#v(0.1em)

#finding-box([Funding Secured], [
  \$24.5M secured for 2025 — \$12M NIH U01 (AI diagnostics) and \$8.5M pharma partnerships (biomarker trials).
])

== Clinical Trial Pipeline

#figure(
  clinical-table(
    ([Trial ID], [Phase], [Target], [Indication], [Status], [Enrollment]),
    (
      ([PRISM-3], [II], [KRAS G12C + SHP2], [NSCLC], [Enrolling], [45/120]),
      ([BEACON-2], [III], [HER2-low ADC], [Breast], [Enrolling], [210/400]),
      ([ILLUMINATE], [I/II], [TIL + anti-PD-1], [Melanoma], [Activated], [12/60]),
      ([CLARITY], [II], [ctDNA-guided], [CRC (MRD)], [Enrolling], [88/200]),
      ([NEXUS-AI], [II], [AI-selected Tx], [Pan-cancer], [Planning], [0/500]),
    ),
  )
)

== Key Takeaways

#focus-slide()[
  #stack(
    spacing: .8em,
    [Precision medicine is transforming oncology --\
    from one-size-fits-all to molecularly guided care.],
    [#text(size: 0.6em, weight: "regular")[
      47 active trials | 3,842 patients | 68.3% overall response rate
    ]],
  )
]

// ═══ Ending Slide ═══
#ending-slide()[Thank You]
