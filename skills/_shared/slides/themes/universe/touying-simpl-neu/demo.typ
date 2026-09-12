// ===============================================================
// NEU Simpl Theme Demo
// Universe package: @preview/touying-simpl-neu:0.1.0
// Touying version: 0.6.1 (required by the Universe package)
// Theme for Northeastern University, China (东北大学)
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/touying-simpl-neu:0.1.0": *
#import "@preview/mitex:0.2.7": *

#show: neu-theme.with(
  aspect-ratio: "16-9",
  navigation: "mini-slides",
  font: ("Libertinus Serif", "Songti SC"),
  config-common(breakable: false),
  config-info(
    title: [Reinforcement Learning for Intelligent Steel Rolling Control],
    subtitle: [School of Information Science and Engineering],
    author: [Prof. Liu Mingyang],
    date: datetime.today(),
    institution: [Northeastern University, Shenyang],
  ),
)

// ---------------------------------------------------------------
// Title Slide
// ---------------------------------------------------------------
#title-slide(
  title: [Reinforcement Learning for\
    Intelligent Steel Rolling Control],
)

// To use the alternative photographic title treatment instead, replace the
// preceding call with `#title-slide-blue(...)`.

// ---------------------------------------------------------------
// Outline
// ---------------------------------------------------------------
#outline-slide()

// ---------------------------------------------------------------
// Section 1: Introduction
// ---------------------------------------------------------------
= Introduction

== Background and Motivation <slide:background>

The steel rolling process is a critical stage in metallurgical manufacturing. Key challenges include:

- *Multi-variable coupling* — Temperature, thickness, and speed interact nonlinearly
- *Real-time constraints* — Control decisions must be made within milliseconds
- *Quality requirements* — Thickness tolerance #mi(`< \pm 0.02`) mm for automotive steel
- *Energy consumption* — Rolling accounts for 15--20% of total steelmaking energy

Northeastern University has a long tradition in metallurgical engineering and control science, making this research a natural intersection of our strengths.

== Problem Statement

The hot strip rolling process can be formulated as a Markov Decision Process (MDP):

#mitex(`(S, A, P, R, \gamma)`)

where:
- #mi(`S \subseteq \mathbb{R}^n`) is the state space (temperature, gauge, velocity profiles)
- #mi(`A \subseteq \mathbb{R}^m`) is the action space (roll gap, speed adjustments)
- #mi(`P: S \times A \times S \to [0,1]`) is the transition probability
- #mi(`R: S \times A \to \mathbb{R}`) is the reward function
- #mi(`\gamma \in (0,1)`) is the discount factor

The objective is to find the optimal policy:

#mitex(`\pi^* = \arg\max_\pi \mathbb{E}_{\tau \sim \pi} \left[\sum_{t=0}^T \gamma^t R(s_t, a_t)\right]`)

// ---------------------------------------------------------------
// Section 2: Methodology
// ---------------------------------------------------------------
= Methodology

== Deep Reinforcement Learning Architecture <slide:architecture>

Our proposed control framework consists of three main components:

+ *Digital Twin Environment* — Physics-based simulation of the rolling mill
  - Finite element model for strip deformation
  - Thermal transfer model for temperature evolution
  - Real-time synchronization with plant sensors
+ *Policy Network* — Actor-Critic architecture
  - Actor: Gaussian policy #mi(`\pi_\theta(a|s) = \mathcal{N}(\mu_\theta(s), \sigma_\theta(s))`)
  - Critic: Twin Q-networks for variance reduction
+ *Safety Layer* — Constraint satisfaction module
  - Hard constraints on roll force (#mi(`F \leq F_{\text{max}}`))
  - Soft constraints on temperature deviation

== Reward Function Design

The composite reward function balances multiple objectives:

#mitex(`R(s,a) = -w_1 (h - h^*)^2 - w_2 (T - T^*)^2 - w_3 \|a - a_{t-1}\|^2 + w_4 \cdot v`)

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  table.header([*Term*], [*Description*], [*Weight*]),
  [#mi(`w_1`)], [Thickness deviation penalty], [10.0],
  [#mi(`w_2`)], [Temperature deviation penalty], [5.0],
  [#mi(`w_3`)], [Action smoothness regularization], [0.1],
  [#mi(`w_4`)], [Throughput bonus], [1.0],
)

// ---------------------------------------------------------------
// Section 3: Experiments
// ---------------------------------------------------------------
= Experimental Results <sec:results>

== Simulation Results

Performance comparison on the 7-stand finishing mill simulator:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header([*Controller*], [*Thickness Error*], [*Temp. Error*], [*Throughput*]),
  [PID Baseline], [#mi(`\pm 0.035`) mm], [#mi(`\pm 12`) K], [100%],
  [Model Predictive], [#mi(`\pm 0.022`) mm], [#mi(`\pm 8`) K], [97%],
  [Our RL Agent], [#mi(`\pm 0.015`) mm], [#mi(`\pm 5`) K], [103%],
  [Human Expert], [#mi(`\pm 0.028`) mm], [#mi(`\pm 10`) K], [98%],
)

== Key Findings

Results from 500 simulated rolling campaigns demonstrate:

- *Thickness control*: 57% reduction in deviation vs. PID baseline
- *Temperature uniformity*: Mean absolute error reduced from 12 K to 5 K
- *Throughput*: 3% increase due to optimized speed profiles
- *Adaptation*: Agent self-adjusts to grade changes within #mi(`< 5`) coils

The policy gradient converges reliably:

#mitex(`\nabla_\theta J(\theta) = \mathbb{E}_{\tau \sim \pi_\theta} \left[\sum_{t=0}^T \nabla_\theta \log \pi_\theta(a_t | s_t) \hat{A}_t\right]`)

where #mi(`\hat{A}_t`) is the generalized advantage estimate (GAE).

// ---------------------------------------------------------------
// Section 4: Industrial Deployment
// ---------------------------------------------------------------
= Industrial Deployment <sec:deployment>

== Plant Trial at Ansteel Bayuquan <slide:plant-trial>

The RL controller was deployed at an industrial hot strip mill:

- *Trial duration*: 3 months, covering 12,000+ coils
- *Steel grades*: Low-carbon, HSLA, and dual-phase steels
- *Safety record*: Zero emergency shutdowns triggered by the RL controller
- *Operator acceptance*: Seamless integration with existing HMI systems

Collaboration with Ansteel Group leverages NEU's longstanding partnership with China's steel industry.

== Scalability Considerations <slide:scalability>

Transfer learning enables rapid deployment to new mill configurations:

+ Pre-train policy on source mill digital twin
+ Fine-tune with #mi(`< 100`) episodes on target mill simulator
+ Deploy with safety constraints active during initial production
+ Continuous learning with experience replay from plant data

// ---------------------------------------------------------------
// Focus Slide
// ---------------------------------------------------------------
== Key Takeaway <touying:unoutlined>

#focus-slide[
  Intelligent control transforms traditional manufacturing\
  from experience-driven to data-driven operations.
]

// ---------------------------------------------------------------
// Section 5: Conclusion
// ---------------------------------------------------------------
= Conclusion

== Summary and Outlook <slide:summary>

#grid(columns: (1fr, 1fr), column-gutter: 1.4em)[
  *Key contributions:*

  - RL controller: state-of-the-art thickness control (#mi(`\pm 0.015`) mm)
  - Safe deployment validated in industrial hot strip rolling
  - Transfer learning: 90% faster deployment
][
  *Future directions:*

  + Integrate upstream continuous casting control
  + Coordinate tandem mills with multi-agent RL
  + Federate learning across multiple steel plants
]

== Acknowledgments <slide:acknowledgments>

- China National Key R&D Program (2022YFB3304100)
- NEU--Ansteel Joint Research Center
- China National Natural Science Foundation (62173078)

== References

+ Sutton, R. & Barto, A. (2018). _Reinforcement Learning: An Introduction_. MIT Press.
+ Liu, M. et al. (2024). "Deep RL for hot rolling control." _ISIJ International_, 64(3), 456--468.
+ Wang, T. et al. (2025). "Safe policy optimization in steel manufacturing." _Automatica_, 162, 111543.

// ---------------------------------------------------------------
// Ending Slide
// ---------------------------------------------------------------
== Closing <touying:unoutlined>

#end-slide[
  Thank you\
  for your attention!
]

// To use the photographic ending treatment instead, replace the preceding
// call with `#end-slide-blue[...]`.
