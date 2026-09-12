// ===============================================================
// TU Darmstadt Theme Demo (Not TUDaBeamer 2023)
// Universe package: @preview/not-tudabeamer-2023:0.2.1
// Touying version: 0.6.1 (embedded by the Universe package)
// Unofficial TU Darmstadt Beamer 2023 template
// ===============================================================

#import "@preview/not-tudabeamer-2023:0.2.1": *
#import "@preview/mitex:0.2.7": *

#show: not-tudabeamer-2023-theme.with(
  config-common(breakable: false),
  config-info(
    title: [Formal Verification of Distributed Protocols],
    short-title: [Distributed Verification],
    subtitle: [Graduate Seminar on Reliable Systems],
    author: "Dr. Lukas Weber",
    short-author: "Weber",
    date: datetime.today(),
    department: [Department of Computer Science],
    institute: [Reliable Systems Group],
    // Replace `none` with the approved institutional logo when available:
    // logo: image("tuda_logo.svg", height: 100%),
    logo: none,
  ),
)

// The package hard-codes Roboto with `fallback: false`. Arial is the installed
// review-environment substitute; remove this rule when Roboto is available.
#show text: set text(
  font: "Arial",
  fallback: true,
)

// ---- Title and Outline ----

#title-slide()

#outline-slide()

// ---- Section 1: Introduction ----

= Introduction

== Motivation

Distributed systems are ubiquitous in modern computing:

- *Cloud infrastructure*~—~consensus for replicated state machines
- *Blockchain networks*~—~Byzantine fault-tolerant protocols
- *IoT systems*~—~eventually consistent data aggregation
- *Autonomous vehicles*~—~V2X communication protocols

#pause

Subtle bugs in distributed protocols can cause catastrophic failures.~Formal~verification provides mathematical guarantees of correctness.

== Verification Challenges

Key difficulties in verifying distributed protocols:

+ *State space explosion*~—~exponential in the number of processes
+ *Asynchrony*~—~unbounded message delays and reordering
+ *Partial failures*~—~crash and Byzantine fault models
+ *Liveness properties*~—~proving eventual progress

The central question:~can we verify protocols both~_automatically_~and~_efficiently_?

== Formal Framework

We model a distributed system as a transition system:

#mitex(`\mathcal{S} = (S, S_0, \to, \text{AP}, L)`)

where:
- #mi(`S`)~is the set of global states
- #mi(`S_0 \subseteq S`)~is the set of initial states
- #mi(`\to \subseteq S \times S`)~is the transition relation
- #mi(`\text{AP}`)~is a set of atomic propositions
- #mi(`L: S \to 2^{\text{AP}}`)~is the labeling function

The safety property~#mi(`\phi`)~holds iff:

#mitex(`\forall s \in \text{Reach}(\mathcal{S}): s \models \phi`)

// ---- Section 2: Methodology ----

= Approach

== Abstraction-Based Verification

Our technique uses predicate abstraction to reduce the state space:

#mitex(`\alpha: S \to \hat{S}, \quad |\hat{S}| \ll |S|`)

The abstract system~#mi(`\hat{\mathcal{S}}`)~overapproximates the concrete system:

#mitex(`\forall s \in S: s \to s' \Rightarrow \alpha(s) \hat{\to} \alpha(s')`)

#pause

Verification guarantee:

#mitex(`\hat{\mathcal{S}} \models \phi \Rightarrow \mathcal{S} \models \phi`)

== Counterexample-Guided Refinement

When verification fails on the abstract system:

+ Extract abstract counterexample~#mi(`\hat{\pi}`)
+ Test concrete feasibility of~#mi(`\hat{\pi}`)
+ If spurious,~*refine*~the abstraction by adding new predicates
+ Repeat until property is verified or real bug is found

The refinement loop is guaranteed to terminate for finite-state systems.

== Symmetry Reduction

For symmetric protocols with~#mi(`n`)~identical processes:

#mitex(`|S| = O(|S_{\text{local}}|^n) \quad \leadsto \quad |\hat{S}| = O\binom{|S_{\text{local}}| + n - 1}{n}`)

This reduces the state space from exponential to polynomial in~#mi(`n`).

#slide(title: [Reduction Comparison])[
  Comparison of state space sizes:

  #figure[
    #table(
      columns: (1fr, auto, auto, auto),
      align: (left + horizon, center + horizon, center + horizon, center + horizon),
      table.header(
        [*Protocol*], [*Full States*], [*Reduced*], [*Speedup*],
      ),
      [Paxos~(#mi(`n=5`))], [#mi(`2.4 \times 10^8`)], [#mi(`1.2 \times 10^4`)], [#mi(`20000\times`)],
      [2PC~(#mi(`n=10`))], [#mi(`1.0 \times 10^6`)], [#mi(`5.0 \times 10^3`)], [#mi(`200\times`)],
      [Raft~(#mi(`n=7`))], [#mi(`8.1 \times 10^{10}`)], [#mi(`3.7 \times 10^5`)], [#mi(`219000\times`)],
    )
  ]
]

// ---- Section 3: Evaluation ----

= Evaluation

== Benchmark Protocols

We evaluate on well-known consensus and replication protocols:

- *Paxos*~—~classic consensus with leader election
- *Raft*~—~understandable consensus with log replication
- *Two-Phase Commit*~—~atomic commitment protocol
- *PBFT*~—~Byzantine fault-tolerant state machine replication
- *EPaxos*~—~leaderless, optimistically fast consensus

== Verification Results

All protocols verified successfully:

- *Paxos*:~Agreement and validity;~#mi(`14.2\,\text{s}`), for~#mi(`n \leq 7`)
- *Raft*:~Log matching and leader completeness;~#mi(`38.7\,\text{s}`), for~#mi(`n \leq 9`)
- *2PC*:~Atomicity;~#mi(`0.8\,\text{s}`), for~#mi(`n \leq 20`)
- *PBFT*:~Agreement under~#mi(`f < n/3`), verified in~#mi(`127.3\,\text{s}`), for~#mi(`n \leq 7`)

#pause

We also discovered a previously unknown liveness issue in an EPaxos variant.

== Comparison with#h(0.25em)Existing Tools

Our tool outperforms state-of-the-art on 4 out of 5 benchmarks:

- #mi(`3.2\times`)~faster than TLA+ model checker~(TLC)
- #mi(`7.8\times`)~faster than mCRL2 on symmetric protocols
- Comparable to Ivy for parameterized verification

// ---- Section 4: Conclusion ----

= Conclusion

== Summary and#h(0.25em)Future Work

*Contributions:*
+ Abstraction-refinement framework for distributed protocol verification
+ Symmetry reduction yielding polynomial state spaces
+ Automated verification of five major consensus protocols

#pause

*Future directions:*
- Extension to parameterized verification~(#mi(`n`)~unbounded)
- Integration with TU Darmstadt’s MAIS cluster for parallel verification
- Support for Byzantine fault models with partial synchrony

== References

- L. Weber et al.~(2024). Automated Verification of Consensus. POPL.
- K. Fischer~(2023). Symmetry in Distributed Systems. LICS.
- TU Darmstadt RSYS Technical Report TR-2024-03.
