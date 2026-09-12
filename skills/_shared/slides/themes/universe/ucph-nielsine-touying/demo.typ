// ===============================================================
// UCPH Nielsine Touying Theme Demo
// Universe package: @preview/ucph-nielsine-touying:0.1.3
// Touying version: 0.6.3
// Københavns Universitet — Metropolis-based Institutional Theme
// ===============================================================

#import "@preview/ucph-nielsine-touying:0.1.3" as uc
#import "@preview/touying:0.6.3" as ty
#import "@preview/mitex:0.2.7": *

// --- Typography ---
#set text(font: ("IBM Plex Sans", "Noto Sans SC"), weight: "light")

// --- Theme Configuration ---
#show: uc.ucph-metropolis-theme.with(
  language: "en",
  ty.config-common(breakable: false),
  ty.config-info(
    title: [Bayesian Methods for Population Genomics],
    subtitle: [Scalable Inference Under the Coalescent],
    author: [Dr. Sofie Andersen, Prof. Niels Eriksen],
    date: datetime.today(),
    institution: [University of Copenhagen -- Bioinformatics Centre],
    logo: uc.logos.seal,
  ),
)

// === Title Slide ===
#uc.title-slide()

// ============================================================
= Background
// ============================================================

== Population Genetics and the Coalescent

Understanding *population structure* and *demographic history* from
genomic data is a central challenge in modern genetics:

- Whole-genome sequencing costs have dropped below \$200 per sample
- Large biobank cohorts (UK Biobank, DRAGEN, Danish National Biobank)
- Need for scalable statistical methods handling #mi(`> 10^5`) samples
- Integration of ancient DNA with modern population data

The *coalescent model* provides the theoretical foundation for
relating genetic variation to population history.

== The Coalescent Model

The coalescent traces genealogies backward in time. For #mi(`n`) samples,
the rate of coalescence with #mi(`k`) lineages is:

#mitex(`\lambda_k = \frac{\binom{k}{2}}{N_e}`)

where #mi(`N_e`) is the effective population size. The total tree height
(time to most recent common ancestor) has expectation:

#mitex(`\mathbb{E}[T_{\text{MRCA}}] = 2 N_e \left(1 - \frac{1}{n}\right)`)

For structured populations with #mi(`d`) demes and migration rate #mi(`m`):

#mitex(`\mathbf{Q} = (q_{ij}) \quad \text{where} \quad q_{ij} = \begin{cases} m / (d - 1) & \text{if } i \neq j \\ -m & \text{if } i = j \end{cases}`)

// ============================================================
= Methods
// ============================================================

== Bayesian Inference Framework

We adopt a Bayesian approach to demographic inference:

#mitex(`p(\theta | \mathbf{D}) \propto p(\mathbf{D} | \theta) p(\theta)`)

where #mi(`\theta = (N_e, m, \tau_1, \ldots, \tau_k)`) are the demographic
parameters, #mi(`\mathbf{D}`) is the observed site frequency spectrum (SFS),
and #mi(`p(\theta)`) is the prior.

The likelihood is computed via the *coalescent SFS*:

#mitex(`p(\mathbf{D} | \theta) = \prod_{i=1}^{n-1} \text{Poisson}(\xi_i ; \mu L \eta_i(\theta))`)

where #mi(`\xi_i`) is the count of #mi(`i`)-ton SNPs, #mi(`\mu`) is the mutation rate,
#mi(`L`) is sequence length, and #mi(`\eta_i(\theta)`) is the expected branch
length for frequency class #mi(`i`).

== MCMC Algorithm

Our inference pipeline uses *Hamiltonian Monte Carlo* (HMC) for
efficient exploration of the parameter space:

+ Compute gradient #mi(`\nabla_\theta \log p(\theta | \mathbf{D})`) via automatic differentiation
+ Simulate Hamiltonian dynamics with leapfrog integrator (#mi(`\epsilon = 0.01`), #mi(`L = 20`))
+ Metropolis-Hastings accept/reject step
+ Adaptive step-size tuning during warmup (dual averaging)

Training configuration:

- Warmup iterations: 1,000
- Sampling iterations: 5,000
- Number of chains: 4 (parallel)
- Target acceptance rate: 0.8

== Computational Approach

Benchmark throughput and memory footprint:

#table(
  columns: (2fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Method*][*Samples/sec*][*Memory (GB)*],
  [MCMC (sequential)], [12], [0.5],
  [MCMC (GPU)], [840], [4.2],
  [Variational Bayes], [3,200], [1.8],
  [*Ours (HMC + AD)*], [*2,400*], [*2.1*],
)

// ============================================================
= Results
// ============================================================

== Simulation Study

We validated our method on simulated data under a 3-population
split model (Yoruba, European, East Asian):

- True parameters recovered within 95% credible intervals
- Convergence diagnostics: #mi(`\hat{R} < 1.01`) for all parameters
- Effective sample size: #mi(`> 2{,}000`) per parameter
- Posterior means within 5% of true values for #mi(`N_e`) parameters

== Danish Population Analysis

Application to 10,842 whole-genome sequences from the
*Danish National Biobank*:

- Estimated #mi(`N_e = 11{,}200`) (95% CI: 10,800--11,600)
- Bottleneck at #mi(`\approx 15`) kya (post-glacial recolonisation)
- Gene flow from Scandinavian hunter-gatherers (#mi(`m \approx 0.02`))
- Population expansion onset at #mi(`\approx 5`) kya (Neolithic transition)

== Model Comparison

Bayesian model selection via marginal likelihood estimation:

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Model*][*log BF*][*Parameters*][*Preferred?*],
  [Constant #mi(`N_e`)], [0.0], [1], [No],
  [Exponential growth], [42.3], [2], [No],
  [Piecewise constant], [87.6], [5], [No],
  [*Bottleneck + growth*], [*124.1*], [*4*], [*Yes*],
)

Bayes factor strongly favours the bottleneck model (#mi(`\log \text{BF} > 100`)).

// ============================================================
= Discussion
// ============================================================

== Comparison with Existing Methods

Our HMC-based approach compares favourably with state-of-the-art tools:

- *dadi*: Our method is 8x faster with comparable accuracy
- *moments*: Similar speed but our credible intervals are more informative
- *PSMC/MSMC*: Complementary approaches (individual vs. population-level)
- *fastsimcoal2*: Our Bayesian framework provides natural uncertainty quantification

== Summary and Outlook

*Key contributions:*
- Scalable HMC inference for coalescent demographic models
- Automatic differentiation of the coalescent SFS likelihood
- Application to 10,842 Danish whole-genome sequences
- Recovery of post-glacial bottleneck and Neolithic expansion

*Future directions:*
- Extension to admixture models (ancient DNA integration)
- Variational inference for #mi(`> 10^5`) samples
- Collaboration with the Lundbeck Foundation GeoGenetics Centre
- Application to the iPSYCH psychiatric genetics cohort

== Acknowledgements

This work is supported by the Novo Nordisk Foundation (NNF-XXXXXXX)
and the Danish National Research Foundation. Computational resources
provided by the UCPH HPC cluster (Computerome 2.0). We thank the
Danish National Biobank for data access.

// === Focus Slide with Gradient ===
#let ucph-gradient = gradient.linear(
  uc.colors.ucph-dark.red,
  uc.colors.ucph-dark.blue,
  angle: 45deg,
)
#uc.focus-slide(fill: ucph-gradient)[
  Tak for opmærksomheden! -- Thank you!
]
