// ===============================================================
// Simple INRIA Touying Theme Demo
// Universe package: @preview/simple-inria-touying-theme:0.1.2
// Touying version: 0.5.2
// Inria — French National Research Institute Theme
// ===============================================================

#import "@preview/touying:0.6.3": *
#import "@preview/simple-inria-touying-theme:0.1.2": *
#import "@preview/mitex:0.2.7": *

// --- Recommended Settings ---
#set text(lang: "en")
#set strong(delta: 100)
#set par(justify: true)

// --- Theme Configuration ---
#show: inria-theme.with(
  aspect-ratio: "16-9",
  align: top,
  config-info(
    title: [Formal Verification of Concurrent Protocols],
    subtitle: [Automated Model Checking with Temporal Logic],
    author: [Dr. Marie Dupont, Prof. Jean-Luc Martin],
    date: datetime.today(),
    institution: [Inria Paris -- Prosecco Team],
  ),
  config-common(breakable: false),
  footer-progress: true,
  // Dedicated `=` section dividers; each `==` heading owns one slide.
  section-slides: false,
  black-title: true,
)

// The package's final built-in fallback is monospaced. Use an installed,
// proportional demo font so demanding content keeps its intended metrics.
#set text(font: "Arial", size: 20pt)

// === Title Slide ===
#title-slide()

// ============================================================
= Motivation and Background
// ============================================================

== The Verification Challenge

Concurrent and distributed systems are *notoriously difficult* to reason
about due to non-deterministic interleavings:

- Race conditions in multi-threaded programs
- Deadlocks in resource allocation protocols
- Byzantine failures in distributed consensus
- Subtle timing bugs that escape conventional testing

Formal verification provides *mathematical guarantees* that a system
satisfies its specification under all possible executions.

== Temporal Logic Specifications

We express correctness properties using *Computational Tree Logic* (CTL\*):

#mitex(`\mathcal{M}, s \models \phi`)

where #mi(`\mathcal{M}`) is a Kripke structure, #mi(`s`) is a state, and #mi(`\phi`) is a
temporal formula. Key operators include:

- #mi(`\square \phi`) — "always #mi(`\phi`)" (safety)
- #mi(`\diamond \phi`) — "eventually #mi(`\phi`)" (liveness)
- #mi(`\phi \mathcal{U} \psi`) — "#mi(`\phi`) until #mi(`\psi`)" (bounded liveness)
- #mi(`\forall \square (\text{req} \to \diamond \text{grant})`) — every request is eventually granted

== System Model

A concurrent protocol is modelled as a *labelled transition system*:

#mitex(`\mathcal{L} = (S, S_0, \text{Act}, \to, \text{AP}, L)`)

where #mi(`S`) is a finite set of states, #mi(`S_0 \subseteq S`) are initial states,
#mi(`\text{Act}`) is a set of actions, #mi(`{\to} \subseteq S \times \text{Act} \times S`) is
the transition relation, #mi(`\text{AP}`) is a set of atomic propositions, and
#mi(`L: S \to 2^{\text{AP}}`) is a labelling function.

// ============================================================
= Algorithmic Contributions
// ============================================================

== Symmetry Reduction

We exploit structural symmetries in the protocol to reduce the state space.
Given a symmetry group #mi(`\mathcal{G}`) acting on states:

#mitex(`|S / \mathcal{G}| \ll |S|`)

The quotient structure #mi(`\mathcal{M} / \mathcal{G}`) preserves CTL\* properties:

#mitex(`\mathcal{M}, s \models \phi \quad \Leftrightarrow \quad \mathcal{M} / \mathcal{G}, [s] \models \phi`)

For a protocol with #mi(`n`) identical processes, this yields a reduction
factor of up to #mi(`n!`).

== Partial Order Reduction

Not all interleavings need to be explored. We identify *ample sets* of
transitions that are sufficient for verification:

+ *Independence*: Commuting transitions can be explored in any order
+ *Invisibility*: Transitions not affecting the property can be deferred
+ *Proviso*: At least one full interleaving must be preserved per cycle

Combined with symmetry reduction, the total state space reduction is:

#mitex(`|S_{\text{reduced}}| \leq \frac{|S|}{n! \cdot k}`)

where #mi(`k`) depends on the degree of independence in the system.

== Implementation Architecture

Our verification tool, *ProVer*, is structured as follows:

+ *Front-end parser*: Protocol specification in a process algebra
+ *State-space generator*: On-the-fly BFS/DFS exploration
+ *Reduction engine*: Symmetry + partial order reduction
+ *Model checker*: CTL\* evaluation on the reduced structure
+ *Counterexample generator*: Diagnostic traces for violated properties

// ============================================================
= Experimental Evaluation
// ============================================================

== Benchmark Protocols

We evaluate ProVer on standard concurrent protocol benchmarks:

#table(
  columns: (2fr, 1fr, 1fr, 1fr),
  align: center,
  inset: 0.5em,
  table.header[*Protocol*][*States*][*Reduced*][*Speedup*],
  [Dining Philosophers (#mi(`n=8`))], [#mi(`6.7 \times 10^4`)], [#mi(`1.2 \times 10^3`)], [56x],
  [Peterson Mutex (#mi(`n=5`))], [#mi(`3.1 \times 10^5`)], [#mi(`4.8 \times 10^3`)], [65x],
  [Paxos Consensus (#mi(`n=3`))], [#mi(`2.4 \times 10^6`)], [#mi(`8.1 \times 10^4`)], [30x],
  [Token Ring (#mi(`n=12`))], [#mi(`4.1 \times 10^7`)], [#mi(`3.4 \times 10^4`)], [1206x],
)

== Comparison with Existing Tools

ProVer outperforms state-of-the-art model checkers on symmetric protocols:

- *SPIN*: ProVer is 3--12x faster due to combined reductions
- *NuSMV*: Symbolic BDD approach is faster for large #mi(`n`) but less diagnostic
- *UPPAAL*: Timed automata support is complementary (not competing)
- *TLA+ / TLC*: ProVer's reductions are more aggressive for symmetric systems

== Scalability Analysis

The reduction ratio improves with system size:

- #mi(`n = 4`) processes: 12x reduction
- #mi(`n = 8`) processes: 56--65x reduction
- #mi(`n = 12`) processes: #mi(`> 1000`)x reduction
- #mi(`n = 16`) processes: #mi(`> 10{,}000`)x reduction (estimated)

Memory usage remains below 2 GB for all benchmarks up to #mi(`n = 12`).

// ============================================================
= Conclusions
// ============================================================

== Summary and Perspectives

*Contributions:*
- Combined symmetry and partial order reduction for CTL\* model checking
- ProVer tool with on-the-fly state-space exploration
- Up to 1200x state-space reduction on symmetric protocols
- Counterexample generation preserving reduction correctness

*Future work:*
- Extension to real-time and probabilistic systems
- Integration with deductive verification (proof assistants)
- Collaborative verification with the Inria Gallium team
- Application to TLS 1.3 handshake protocol verification

== Acknowledgements

This work is partially supported by the ANR project CISC (ANR-XX-CE25-XXXX)
and the Inria Exploratory Action *ProVer*. We thank the Prosecco team at
Inria Paris for valuable discussions on protocol security.

// === Focus Slide ===
#focus-slide[
  Questions and Discussion
]
