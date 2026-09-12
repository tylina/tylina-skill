// ===============================================================
// Touying BUAA Theme Demo
// Universe package: @preview/touying-buaa:0.2.0
// Touying version: 0.5.2
// Theme for Beihang University (北京航空航天大学)
// Based on the Stargazer theme with BUAA branding
// ===============================================================

#import "@preview/touying:0.5.2": *
#import "@preview/touying-buaa:0.2.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: buaa-theme.with(
  aspect-ratio: "16-9",
  lang: "zh",
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Songti SC",
  ),
  config-info(
    title: [航空航天智能控制系统研究进展],
    subtitle: [基于深度强化学习的自主决策方法],
    author: [张明远],
    date: datetime.today(),
    institution: [北京航空航天大学],
  ),
)

// =========================================================
// Title Slide
// =========================================================
#title-slide()

// =========================================================
// Outline
// =========================================================
#outline-slide()

// =========================================================
// Section 1: Research Background
// =========================================================
= Research Background

== Problem Statement

Autonomous decision-making in aerospace systems faces key challenges:

- *High-dimensional state spaces* in flight dynamics
- Real-time constraint satisfaction under uncertainty
- Safety-critical requirements for control systems

The objective is to develop intelligent controllers that can:
+ Adapt to changing flight conditions
+ Maintain stability guarantees
+ Optimize fuel consumption and trajectory

== Mathematical Formulation

The optimal control problem is formulated as a Markov Decision Process:

#mitex(`V^*(s) = \max_a \left[ R(s, a) + \gamma \sum_{s'} P(s' | s, a) V^*(s') \right]`)

where:
- #mi(`V^*(s)`) is the optimal value function
- #mi(`R(s, a)`) is the reward for action #mi(`a`) in state #mi(`s`)
- #mi(`\gamma \in [0, 1]`) is the discount factor
- #mi(`P(s' | s, a)`) is the state transition probability

// =========================================================
// Section 2: Methodology
// =========================================================
= Proposed Methodology

== Deep Reinforcement Learning Framework

#tblock(title: [Core Architecture])[
  The proposed framework integrates a Proximal Policy Optimization (PPO) agent with a neural network-based dynamics model for online trajectory planning.
]

#tblock(title: [Key Innovation])[
  A safety layer is embedded between the policy network and the actuator commands, ensuring that all control outputs satisfy physical constraints.
]

== Network Architecture

The actor-critic network uses a dual-head design:

- *Actor head*: Outputs action distribution #mi(`\pi_\theta(a | s)`)
- *Critic head*: Estimates state value #mi(`V_\phi(s)`)

The policy gradient objective:

#mitex(`L^{\text{CLIP}}(\theta) = \hat{\mathbb{E}}_t \left[ \min\left( r_t(\theta) \hat{A}_t, \text{clip}(r_t(\theta), 1 - \epsilon, 1 + \epsilon) \hat{A}_t \right) \right]`)

== Two-Column: Simulation vs. Real Flight

#slide(composer: (1fr, 1fr))[
  === Simulation Environment

  - 6-DOF flight dynamics model
  - Wind disturbance modeling
  - Sensor noise injection
  - 10,000 training episodes
  - Convergence in ~2 hours
][
  === Real Flight Testing

  - Fixed-wing UAV platform
  - GPS/INS navigation suite
  - Onboard computing (Jetson)
  - 50 flight test sorties
  - 98.6% mission success rate
]

// =========================================================
// Section 3: Results
// =========================================================
= Experimental Results

== Performance Comparison

Comparison with baseline control methods:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header(
    [*Method*], [*Tracking Error*], [*Fuel Cost*], [*Robustness*],
  ),
  [PID Control], [0.85 m], [100%], [Low],
  [MPC], [0.42 m], [87%], [Medium],
  [DRL (Ours)], [*0.18 m*], [*72%*], [*High*],
)

== Convergence Analysis

The training loss function converges as:

#mitex(`\mathcal{L}_{\text{total}} = \mathcal{L}_{\text{policy}} + c_1 \mathcal{L}_{\text{value}} - c_2 \mathcal{H}[\pi_\theta]`)

Key observations:
- Policy loss stabilizes after 3,000 episodes
- Value function approximation error < 5%
- Entropy bonus #mi(`\mathcal{H}[\pi_\theta]`) ensures exploration

// =========================================================
// Section 4: Conclusion
// =========================================================
= Conclusion

== Summary and Future Work

*Key Contributions:*
+ A safety-constrained DRL framework for aerospace control
+ Integration of learned dynamics models with model-free RL
+ Validated through simulation and real flight experiments

*Future Directions:*
- Multi-agent cooperative control
- Transfer learning across aircraft platforms
- Formal verification of neural network controllers

// =========================================================
// Focus Slide
// =========================================================
#focus-slide[
  Thank You! \
  Questions & Discussion
]
