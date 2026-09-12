// ===============================================================
// BUAA Unofficial Gradient Theme Demo
// Universe package: @preview/buaa-unofficial-gradient:0.1.0
// Touying version: 0.6.1
// Beihang University — Gradient Institutional Theme
// ===============================================================

#import "@preview/touying:0.6.1": *
#import "@preview/buaa-unofficial-gradient:0.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: buaa-theme.with(
  config-common(breakable: false),
  config-info(
    title: [Intelligent Control of Unmanned Aerial Systems],
    subtitle: [Deep Reinforcement Learning for Autonomous Flight],
    author: [Dr. Wei Zhang, Prof. Yiming Chen],
    date: datetime.today(),
    institution: [School of Aeronautic Science and Engineering, Beihang University],
  ),
)

// === Title Slide ===
#title-slide()

// === Outline ===
#outline-slide()

// ============================================================
= Introduction
// ============================================================

== Research Background

Unmanned aerial systems (UAS) have emerged as a *transformative technology*
across civil and military applications:

- Autonomous navigation in GPS-denied environments
- Real-time obstacle avoidance using onboard perception
- Multi-agent coordination for surveillance and delivery
- Energy-efficient trajectory planning over long distances

The demand for intelligent, adaptive flight controllers has grown
significantly in recent years.

== Problem Formulation

We model autonomous flight control as a *Markov Decision Process* (MDP):

#mitex(`\mathcal{M} = \langle \mathcal{S}, \mathcal{A}, \mathcal{P}, \mathcal{R}, \gamma \rangle`)

where #mi(`\mathcal{S}`) is the state space (attitude, velocity, position),
#mi(`\mathcal{A}`) is the continuous action space (thrust and torque commands),
#mi(`\mathcal{P}`) is the transition probability, #mi(`\mathcal{R}`) is the reward function,
and #mi(`\gamma \in (0, 1)`) is the discount factor.

The objective is to find the optimal policy:

#mitex(`\pi^* = \arg\max_\pi \mathbb{E} \left[ \sum_{t=0}^{\infty} \gamma^t r_t \right]`)

// ============================================================
= Methodology
// ============================================================

== Network Architecture

Our proposed *Dual-Attention Flight Controller* (DAFC) consists of:

+ Spatial attention module for environmental feature extraction
+ Temporal attention module for flight dynamics modelling
+ Actor-critic heads with shared backbone (#mi(`L = 4`) layers)
+ Physics-informed reward shaping for stability guarantees

== Themed Information Blocks

#stack(
  spacing: 0.8em,
  tblock(title: [Training Configuration])[
    The policy network is trained using Proximal Policy Optimisation (PPO) with
    a learning rate of #mi(`3 \times 10^{-4}`) and a clipping parameter #mi(`\epsilon = 0.2`).
  ],
  rblock(title: [Safety Constraint])[
    All generated trajectories are verified against geofencing boundaries
    and no-fly zone databases before execution.
  ],
  gblock(title: [Computational Resources])[
    Training is performed on 8 NVIDIA A100 GPUs with a total wall-clock time
    of approximately 48 hours for convergence.
  ],
)

== Side-by-Side Comparison

#horz-block()[
  *Simulation Results*

  - Success rate: 97.3%
  - Average flight time: 142s
  - Collision rate: 0.8%
][
  *Real-World Transfer*

  - Success rate: 91.6%
  - Average flight time: 158s
  - Collision rate: 2.1%
]

// ============================================================
= Experimental Results
// ============================================================

== Performance Comparison

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Method*][*Success (%)*][*Collision (%)*][*Avg. Time (s)*],
  [PID Controller], [78.5], [8.2], [185],
  [MPC Baseline], [88.1], [4.7], [162],
  [DRL (SAC)], [93.2], [2.3], [149],
  [*DAFC (Ours)*], [*97.3*], [*0.8*], [*142*],
)

== Convergence Analysis

The training reward curve shows stable convergence after approximately
#mi(`2 \times 10^6`) environment steps:

#mitex(`J(\pi_\theta) = \mathbb{E}_{\tau \sim \pi_\theta} \left[ \sum_{t=0}^{T} \gamma^t r(s_t, a_t) \right]`)

Key observations from the ablation study:

+ Removing spatial attention degrades success rate by 6.2%
+ Reward shaping accelerates convergence by 40%
+ Domain randomisation improves sim-to-real transfer by 12%

// ============================================================
= Conclusion
// ============================================================

== Summary and Future Directions

*Contributions:*
- Novel dual-attention architecture for autonomous flight control
- Physics-informed reward shaping with stability guarantees
- Successful sim-to-real transfer on quadrotor platforms

*Future work:*
- Extension to fixed-wing and hybrid VTOL vehicles
- Multi-agent collaborative mission planning
- Integration with BUAA's flight testing facilities

== Acknowledgements

This research is supported by the National Natural Science Foundation of
China (Grant No. 62XXXXXXX) and the Beihang University Graduate Innovation
Fund. Flight experiments are conducted at BUAA's Shahe Campus UAV Test Range.

// === End Slide ===
#end-slide()
