// Aurora Prism Theme Demo — Score-Based Diffusion Models
// ICML Oral Presentation Style — information-dense, polished
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/mitex:0.2.7": *
#import "@preview/lilaq:0.6.0" as lq

// ═══ Inline Bibliography ═══
#let bib-ho = [Ho et al., "Denoising Diffusion Probabilistic Models," NeurIPS 2020]
#let bib-song = [Song et al., "Score-Based Generative Modeling through SDEs," ICLR 2021]
#let bib-nichol = [Nichol & Dhariwal, "Improved Denoising Diffusion," ICML 2021]

#show: aurora-prism-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [ICML 2026 -- Oral Presentation],
  config-info(
    title: [Score-Based Diffusion Models:\ Unified Framework and Accelerated Sampling],
    subtitle: [A Continuous-Time Perspective on Generative Modeling],
    author: [Alex Chen, Maria Lopez, David Kim],
    institution: [Stanford University -- Machine Learning Group],
    date: datetime(year: 2026, month: 7, day: 14),
  ),
)

#set text(font: ("Arial", "Noto Sans SC"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Background
// ══════════════════════════════════════
= Background

== Motivation

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  prism-card([The Generation Challenge], [
    Given samples from an unknown distribution $p_"data"(x)$, learn a model that generates new samples from this distribution.

    *Key desiderata:*
    - High sample quality (FID, IS)
    - Mode coverage (no collapse)
    - Tractable likelihood estimation
    - Fast sampling
  ]),
  prism-card([Why Diffusion?], [
    Diffusion models achieve *state-of-the-art* image generation by:
    - Gradually corrupting data with noise (forward)
    - Learning to reverse the corruption (backward)
    - Stable training -- no adversarial dynamics
    - Exact log-likelihood computation via continuous normalizing flows
  ], accent: rgb("#7B1FA2")),
)

#v(0.4em)

#refraction-highlight[
  *Core Insight:* If we know the _score function_ $nabla_x log p_t (x)$ at all noise levels $t$, we can reverse the diffusion process to generate samples from $p_"data"$.
]

== Forward Diffusion Process

#cols[
  The forward process adds Gaussian noise progressively:

  #mitex(`\mathbf{x}_t = \sqrt{\bar{\alpha}_t}\,\mathbf{x}_0 + \sqrt{1-\bar{\alpha}_t}\,\boldsymbol{\epsilon}, \quad \boldsymbol{\epsilon}\sim\mathcal{N}(0,\mathbf{I})`)

  #v(0.5em)

  As $t arrow.r T$, the distribution $q(x_T)$ approaches $cal(N)(0, I)$.

  #v(0.4em)

  #beam-tag[Markov Chain] #h(4pt) #beam-tag[Gaussian Kernel] #h(4pt) #beam-tag(color: rgb("#7B1FA2"))[Variance Schedule]
][
  #prism-card([SDE Formulation], [
    The continuous-time forward SDE:

    $d x = -1/2 beta(t) x d t + sqrt(beta(t)) d w$

    where $beta(t)$ is the noise schedule and $w$ is a Wiener process.

    This unifies DDPM, SMLD, and other variants into a single framework.
  ])
]

= Methods

== Score Matching Objective

#cols[
  #prism-card([Denoising Score Matching], [
    We train a neural network $s_theta (x, t)$ to approximate the score:

    $s_theta (x, t) approx nabla_x log p_t (x)$

    The DSM loss avoids computing the intractable partition function:
  ])

  #v(0.4em)

  #refraction-highlight[
    #mitex(`\mathcal{L}_{\text{DSM}} = \mathbb{E}_{t,\mathbf{x}_0,\boldsymbol{\epsilon}}\left[\lambda(t)\left\|s_\theta(\mathbf{x}_t,t) + \frac{\boldsymbol{\epsilon}}{\sqrt{1-\bar{\alpha}_t}}\right\|^2\right]`)
  ]
][
  #prism-card([Connection to ELBO], [
    The diffusion loss is a *reweighted variational bound*:

    $-log p_theta (x_0) lt.eq cal(L)_"VLB" = sum_(t=1)^T cal(L)_t$

    Each term $cal(L)_t$ is a KL divergence between the forward posterior $q(x_(t-1)|x_t, x_0)$ and the learned reverse $p_theta (x_(t-1)|x_t)$.

    *Simplified loss* (Ho et al. 2020): predict $epsilon$ directly with uniform weighting -- empirically superior.
  ], accent: rgb("#AD1457"))
]

== Reverse Process & Sampling

#cols[
  The reverse SDE generates samples from noise:

  $d x = [-1/2 beta(t) x - beta(t) nabla_x log p_t (x)] d t + sqrt(beta(t)) d macron(w)$

  Replacing $nabla_x log p_t$ with $s_theta$ gives the generative process.

  #v(0.4em)

  #crystal-quote(
    [The score function is all you need -- it determines the entire generative model.],
    author: [Song et al., 2021]
  )
][
  #prism-card([Probability Flow ODE], [
    Deterministic counterpart (same marginals):

    $d x = [-1/2 beta(t) x - 1/2 beta(t) s_theta (x, t)] d t$

    *Advantages:*
    - Exact likelihood via instantaneous change-of-variables
    - Adaptive-step ODE solvers (fewer NFE)
    - Enables latent interpolation
  ])
]

= Results

== FID Score Comparison

#let methods = ("DDPM", "DDIM", "Score-SDE", "Ours")
#let fid = (3.17, 4.04, 2.20, 1.85)
#let x = range(4).map(i => i + 1)

#cols[
  #data-panel(title: [CIFAR-10 Unconditional (FID $arrow.b$)])[
    #figure[
      #lq.diagram(
        width: 320pt, height: 160pt,
        xaxis: (ticks: range(4).map(i => (i + 1, methods.at(i))), subticks: none),
        yaxis: (ticks: ((0, "0"), (1, "1"), (2, "2"), (3, "3"), (4, "4")), subticks: none, label: [FID]),
        lq.bar(x, fid, fill: rgb("#3F51B5"), width: 55%),
      )
    ]
  ]
][
  #prism-card([Analysis], [
    Our method achieves *FID 1.85* on CIFAR-10 unconditional generation, a *16% improvement* over Score-SDE.

    *Key factors:*
    - Adaptive noise schedule optimization
    - Improved U-Net architecture ($2 times$ channels)
    - Exponential moving average of weights
  ])

  #v(0.4em)

  #beam-tag[State-of-the-art] #h(4pt) #beam-tag(color: rgb("#AD1457"))[Unconditional] #h(4pt) #beam-tag(color: rgb("#FF6F00"))[32x32]
]

== Key Metrics

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  aurora-stat([FID (CIFAR-10)], [1.85], color: rgb("#3F51B5")),
  aurora-stat([IS (CIFAR-10)], [9.89], color: rgb("#7B1FA2")),
  aurora-stat([NFE (ours)], [35], color: rgb("#AD1457")),
  aurora-stat([Training (days)], [4.2], color: rgb("#FF6F00")),
)

#v(0.5em)

#spectrum-divider()

#v(0.3em)

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  prism-card([Sampling Speed], [
    Our adaptive ODE solver requires only *35 NFE* (neural function evaluations) vs. 1000 steps for DDPM.

    This is a *28x speedup* with negligible quality loss (FID +0.03).
  ]),
  prism-card([Scalability], [
    Tested on ImageNet 256x256:
    - FID: *3.60* (class-conditional)
    - Classifier-free guidance scale: 1.5
    - Training: 8xA100, 12 days
  ], accent: rgb("#7B1FA2")),
)

== Ablation Study

#cols[
  #prism-card([Architecture Ablations], [
    #set text(size: 0.9em)
    #table(
      columns: (1fr, auto),
      align: (left, right),
      inset: (x: 0.45em, y: 0.25em),
      stroke: 0.4pt + palette.border-light,
      fill: (_, row) => if row == 0 { palette.accent-light } else { none },
      table.header([*Component*], [*FID $Delta$*]),
      [\+ Adaptive schedule], [-0.22],
      [\+ 2x channels], [-0.31],
      [\+ EMA (0.9999)], [-0.18],
      [\+ Variance learning], [-0.08],
      [*Combined (Ours)*], [*-0.79*],
    )
  ])
][
  #prism-card([Noise Schedule Impact], [
    We learn $beta(t)$ end-to-end via:

    $beta(t) = sigma_"min" (sigma_"max" / sigma_"min")^t + Delta beta_theta (t)$

    where $Delta beta_theta$ is a small learned correction. This outperforms:
    - Linear schedule (Ho 2020)
    - Cosine schedule (Nichol 2021)
    - Learned discrete schedule
  ], accent: rgb("#AD1457"))

  #v(0.3em)

  #beam-tag[Ablation] #h(4pt) #beam-tag(color: rgb("#7B1FA2"))[Schedule] #h(4pt) #beam-tag(color: rgb("#FF6F00"))[Architecture]
]

= Theory

== Convergence Guarantees

#cols[
  #prism-card([Main Theorem], [
    Under assumptions (A1)--(A3), the reverse SDE with learned score $s_theta$ satisfies:

    $"KL"(p_"data" || p_theta) lt.eq C dot epsilon_"score"^2 + O(1/T)$

    where $epsilon_"score" = (EE_t [||s_theta - nabla log p_t||^2])^(1/2)$.
  ])

  #v(0.3em)

  #refraction-highlight[
    *Implication:* If the score network achieves $epsilon$-accurate estimation, generation quality degrades at most quadratically.
  ]
][
  #prism-card([Assumptions], [
    *(A1)* $p_"data"$ has bounded second moments

    *(A2)* Score network $s_theta$ is Lipschitz continuous in $x$ uniformly over $t$

    *(A3)* Noise schedule satisfies $integral_0^T beta(t) d t < infinity$

    These are standard and satisfied by all practical implementations.
  ], accent: rgb("#7B1FA2"))
]

= Conclusion

== Summary & Contributions

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  prism-card([Contributions], [
    1. *Unified SDE framework* connecting DDPM, SMLD, and score-based models
    2. *Adaptive noise schedule* learned end-to-end
    3. *Fast ODE sampler* with 35 NFE (28x speedup)
    4. *Convergence theory* with explicit rate
    5. *State-of-the-art FID* on CIFAR-10 and ImageNet
  ]),
  prism-card([Future Directions], [
    - Extension to *video generation* (temporal SDEs)
    - *Distillation* for single-step sampling
    - *Conditional generation* with classifier-free guidance at scale
    - Theoretical analysis of *memorization* vs. generalization
    - Application to *scientific simulation* (molecular dynamics, weather)
  ], accent: rgb("#7B1FA2")),
)

#v(0.5em)

#crystal-quote(
  [Diffusion models represent a paradigm shift: trading adversarial instability for the mathematical elegance of stochastic processes.],
  author: [This work]
)

== References

#prism-card([Key References], [
  1. #bib-ho
  2. #bib-song
  3. #bib-nichol
  4. Karras et al., "Elucidating the Design Space of Diffusion-Based Generative Models," NeurIPS 2022
  5. Kingma et al., "Variational Diffusion Models," NeurIPS 2021
])

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _Score-based diffusion unifies generation, density estimation, and inverse problems under one mathematical framework._
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You -- Questions?]
