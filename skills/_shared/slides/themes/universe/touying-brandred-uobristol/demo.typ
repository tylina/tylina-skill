// ===============================================================
// UoBristol Brandred Theme Demo
// Universe package: @preview/touying-brandred-uobristol:0.2.0
// Touying version: 0.5.2
// University of Bristol — Institutional Presentation Theme
// ===============================================================

#import "@preview/touying:0.5.2": *
#import "@preview/touying-brandred-uobristol:0.2.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: uobristol-theme.with(
  aspect-ratio: "16-9",
  footer-progress: true,
  config-common(breakable: false),
  config-info(
    title: [Machine Learning for Climate Science],
    subtitle: [Scalable Methods for Atmospheric Modelling],
    author: [Dr. Eleanor Ashworth],
    date: datetime.today(),
    institution: [University of Bristol],
  ),
)

// === Title Slide ===
#title-slide()

// === Outline ===
#outline-slide()

// ============================================================
= Introduction
// ============================================================

== Research Motivation

Climate modelling requires *scalable computational methods* that can process
vast quantities of observational data in real time.

- Global surface temperature records span 170+ years
- Satellite observations generate terabytes daily
- Traditional numerical methods face resolution bottlenecks

Our goal: leverage machine learning to augment physics-based models.

== Problem Statement

Given a spatiotemporal dataset #mi(`\mathbf{X} \in \mathbb{R}^{n \times d}`) of atmospheric
observations, we seek a function #mi(`f_\theta`) that minimises the prediction
error:

#mitex(`\min_\theta \mathbb{E} \left[ \| f_\theta(\mathbf{X}_t) - \mathbf{X}_{t+1} \|_2^2 \right]`)

subject to physical conservation constraints.

// ============================================================
= Methodology
// ============================================================

== Neural Architecture

We propose a *Physics-Informed Neural Operator* (PINO) with the following
components:

+ Fourier feature embedding layer
+ Multi-scale attention blocks (#mi(`L = 6`) layers)
+ Spectral convolution in frequency domain
+ Conservation-law penalty in the loss function

The architecture preserves energy and mass conservation by design.

== Training Protocol

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Hyperparameter*][*Value*][*Notes*],
  [Learning rate], [#mi(`1 \times 10^{-4}`)], [Cosine annealing],
  [Batch size], [64], [Gradient accumulation],
  [Epochs], [200], [Early stopping],
  [Weight decay], [#mi(`10^{-5}`)], [AdamW optimiser],
)

== Mathematical Framework

The spectral convolution operator is defined as:

#mitex(`(\mathcal{K}(\varphi) v)(x) = \mathcal{F}^{-1} (R_\varphi \cdot \mathcal{F}(v))(x)`)

where #mi(`\mathcal{F}`) denotes the Fourier transform, #mi(`R_\varphi`) is a learnable
kernel in frequency space, and #mi(`v`) is the input function.

Conservation is enforced via a Lagrangian penalty:

#mitex(`\mathcal{L}_{\text{total}} = \mathcal{L}_{\text{data}} + \lambda \sum_i C_i(f_\theta(\mathbf{X}))`)

// ============================================================
= Results
// ============================================================

== Prediction Accuracy

Our method achieves state-of-the-art results on the ERA5 reanalysis
benchmark:

- *RMSE* reduction of 23% compared to FourCastNet
- *ACC* (anomaly correlation coefficient) #mi(`> 0.95`) at 5-day lead time
- Inference time: 0.3 seconds per global forecast step

== Comparison with Baselines

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Method*][*RMSE (K)*][*ACC*][*Speed*],
  [IFS (ECMWF)], [1.42], [0.94], [30 min],
  [FourCastNet], [1.38], [0.93], [0.5 s],
  [Pangu-Weather], [1.31], [0.95], [1.2 s],
  [*PINO (Ours)*], [*1.06*], [*0.97*], [*0.3 s*],
)

== Ablation Study

Key findings from the ablation analysis:

+ Removing the conservation penalty increases RMSE by 15%
+ Spectral convolutions outperform spatial convolutions by 8%
+ Multi-scale attention contributes 5% improvement over single-scale
+ Data augmentation with synthetic perturbations adds 3% robustness

// ============================================================
= Conclusion
// ============================================================

== Summary and Future Work

*Contributions:*
- Novel physics-informed neural operator for climate prediction
- State-of-the-art accuracy with sub-second inference
- Provable conservation guarantees

*Future directions:*
- Extension to precipitation and extreme weather events
- Coupling with ocean circulation models
- Deployment for operational forecasting at the Met Office

== Acknowledgements

This work was supported by the EPSRC grant EP/X012345/1 and the
Jean Golding Institute for Data Science at the University of Bristol.

Computational resources provided by the Bristol HPC facility (BlueCrystal).

// === Focus Slide ===
#focus-slide[
  Questions and Discussion
]
