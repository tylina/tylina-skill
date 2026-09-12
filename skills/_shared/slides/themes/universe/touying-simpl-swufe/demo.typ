// ===============================================================
// SWUFE Simpl Theme Demo
// Universe package: @preview/touying-simpl-swufe:0.2.1
// Touying version: 0.7.4 (owned by the Universe package)
// Theme for Southwestern University of Finance and Economics
// (西南财经大学)
// ===============================================================

#import "@preview/touying-simpl-swufe:0.2.1": *
#import "@preview/mitex:0.2.7": *

#show: swufe-theme.with(
  aspect-ratio: "16-9",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Kaiti SC",
    "STKaiti",
    "Noto Serif SC",
  ),
  config-info(
    title: [Machine Learning Approaches for Credit Risk Assessment],
    short-title: [ML Credit Risk],
    subtitle: [School of Finance — Fintech Research Center],
    author: [Prof. Lei Chao],
    date: datetime.today(),
    institution: [Southwestern University of Finance and Economics, Chengdu],
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

== Research Motivation

Traditional credit risk models face challenges in the evolving financial landscape:

- *Data complexity* — Millions of loan applications with hundreds of features
- *Non-linear relationships* — Borrower behavior exhibits complex interaction effects
- *Class imbalance* — Default events are rare (#mi(`< 3\%`) of observations)
- *Regulatory requirements* — Basel III mandates robust risk quantification

SWUFE's Fintech Research Center addresses these challenges through interdisciplinary collaboration between finance, statistics, and computer science.

== Problem Definition

Let #mi(`D = \{(\mathbf{x}_i, y_i)\}_{i=1}^N`) be a dataset of #mi(`N`) loan applications where #mi(`\mathbf{x}_i \in \mathbb{R}^d`) represents borrower features and #mi(`y_i \in \{0, 1\}`) indicates default status.

The goal is to estimate the probability of default (PD):

#mitex(`\text{PD}(\mathbf{x}) = P(Y = 1 | X = \mathbf{x}) = f_\theta(\mathbf{x})`)

subject to the constraint that the model must satisfy regulatory interpretability requirements.

The expected loss for a portfolio is:

#mitex(`\text{EL} = \sum_{i=1}^N \text{PD}_i \times \text{LGD}_i \times \text{EAD}_i`)

where LGD is loss given default and EAD is exposure at default.

// ---------------------------------------------------------------
// Section 2: Methodology
// ---------------------------------------------------------------
= Methodology

== Model Architecture

We propose a hybrid interpretable-ensemble framework:

+ *Feature Engineering Module*
  - Domain-specific features (debt-to-income, utilization ratios)
  - Temporal behavioral features from transaction sequences
  - Network features from co-borrower/guarantor graphs
+ *Ensemble Prediction Module*
  - LightGBM for tabular feature interactions
  - Temporal CNN for transaction sequence patterns
  - Graph attention network for relationship features
+ *Interpretability Layer*
  - SHAP values for global feature importance
  - Counterfactual explanations for individual decisions
  - Regulatory compliance scoring

== Loss Function

The training objective incorporates both prediction accuracy and fairness:

#mitex(`\mathcal{L} = \underbrace{-\frac{1}{N} \sum_{i=1}^N [y_i \log \hat{y}_i + (1-y_i) \log(1-\hat{y}_i)]}_{\text{Binary Cross-Entropy}} + \lambda \underbrace{\sum_{g \in \mathcal{G}} |\text{FPR}_g - \overline{\text{FPR}}|}_{\text{Fairness Penalty}}`)

where #mi(`\mathcal{G}`) represents protected demographic groups and #mi(`\text{FPR}_g`) is the false positive rate for group #mi(`g`).

// ---------------------------------------------------------------
// Section 3: Empirical Analysis
// ---------------------------------------------------------------
= Empirical Analysis

== Dataset Description

We evaluate on three benchmark credit datasets:

#figure[
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header([*Dataset*], [*Samples*], [*Features*], [*Default Rate*], [*Period*]),
    [SWUFE-Credit], [1.2M], [186], [2.8%], [2019--2023],
    [Lending Club], [2.3M], [142], [5.1%], [2015--2020],
    [Home Credit], [307K], [122], [8.1%], [2016--2018],
  )
]

== Performance Comparison

Model performance measured by AUC-ROC and KS statistic:

#shadow-figure(
  figure(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: center,
      table.header([*Model*], [*AUC-ROC*], [*KS Stat*], [*Gini*]),
      [Logistic Regression], [0.721], [0.342], [0.442],
      [XGBoost], [0.789], [0.418], [0.578],
      [LightGBM], [0.793], [0.425], [0.586],
      [Our Hybrid Model], [*0.814*], [*0.457*], [*0.628*],
    ),
  ),
)

== Feature Importance Analysis

Top predictive features identified by SHAP analysis:

- *Credit utilization ratio* — Strongest predictor across all datasets
- *Payment history (12-month)* — Number of late payments in rolling window
- *Debt-to-income ratio* — Total monthly obligations vs. income
- *Account age* — Length of credit history in months
- *Transaction velocity* — Rate of spending changes (novel feature)

// ---------------------------------------------------------------
// Section 4: Risk Management Applications
// ---------------------------------------------------------------
= Applications

== Portfolio Risk Management

Our model enables dynamic portfolio optimization:

- *Real-time scoring* — Processing 50,000+ applications per hour
- *Stress testing* — Scenario analysis under macroeconomic shocks
  - GDP decline of 2%: Portfolio PD increases from 2.8% to 4.1%
  - Interest rate hike of 200 bps: PD increases to 3.5%
- *Capital allocation* — Risk-weighted asset optimization under Basel III

The value-at-risk (VaR) of the credit portfolio at confidence level #mi(`\alpha`) is:

#mitex(`\text{VaR}_\alpha = \inf \{x \in \mathbb{R} : P(\text{Loss} > x) \leq 1 - \alpha\}`)

== Regulatory Compliance

#tblock(title: "Compliance Requirements")[
  The interpretability layer satisfies three core obligations:

  + *Model Risk Management (SR 11-7)* — Full audit trail of model decisions
  + *Fair Lending (ECOA)* — Demonstrated fairness across protected classes
  + *Basel III IRB Approach* — PD estimates calibrated to long-run average default rates
]

// ---------------------------------------------------------------
// Focus Slide
// ---------------------------------------------------------------
#focus-slide[
  Interpretable AI bridges the gap between\
  predictive accuracy and regulatory compliance.
]

// ---------------------------------------------------------------
// Section 5: Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Future Work

#slide(align: top, composer: (1fr, 1fr))[
  #pad(top: 0.7em)[
    *Key contributions:*

    - 0.814 AUC-ROC credit-risk model
    - Fairness-aware training objective
    - Basel III-ready SHAP explanations
  ]
][
  #pad(top: 0.7em)[
    #stack(
      spacing: 0.8em,
      [
        *Future directions:*

        + Online learning
        + Digital RMB signals
        + Regional credit research
      ],
      [
        *Acknowledgments:*

        #text(size: 0.8em)[
          - NSFC Grant No. 72171206
          - SWUFE Fintech Research Center
          - CCB Sichuan Branch
        ]
      ],
    )
  ]
]

== References

+ Lessmann, S. et al. (2015). "Benchmarking classification models for credit scoring." _European Journal of Operational Research_, 247(1), 124--136.
+ Lundberg, S. & Lee, S. (2017). "A unified approach to interpreting model predictions." _NeurIPS_, 30.
+ Lei, C. et al. (2024). "Fairness-aware credit scoring with hybrid ensembles." _J. Banking & Finance_, 158, 107052.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
#ending-slide[
  Thank you for your attention!
]
