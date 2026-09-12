// ===============================================================
// Definitely Not ISEC Slides Theme Demo
// Universe package: @preview/definitely-not-isec-slides:1.1.0
// Touying version: 0.7.4 (owned by the Universe package)
// ISEC / TU Graz — Institutional Presentation Theme
// ===============================================================

#import "@preview/definitely-not-isec-slides:1.1.0": *
#import "@preview/mitex:0.2.7": *

// --- Theme Configuration ---
#show: definitely-not-isec-theme.with(
  aspect-ratio: "16-9",
  slide-alignment: top,
  font: "Arial",
  progress-bar: true,
  config-common(breakable: false),
  config-info(
    title: [Post-Quantum Lattice-Based Cryptography],
    subtitle: [Efficient Key Exchange from Module-LWE],
    authors: ([Dr. Anna Müller], [Prof. Thomas Kern]),
    extra: [ISEC Research Seminar -- TU Graz 2025],
    footer: [Müller & Kern],
  ),
)

// === Title Slide ===
#title-slide()

// ============================================================
// Introduction
// ============================================================

#slide(title: [Motivation])[
  The advent of large-scale quantum computers poses a *fundamental threat*
  to classical public-key cryptography:

  - Shor's algorithm breaks RSA and elliptic-curve schemes in polynomial time
  - NIST post-quantum standardisation is entering its final phase
  - Lattice-based schemes offer strong security with practical efficiency
  - Key exchange is a critical primitive for TLS and secure messaging
]

#slide(title: [Security Foundation])[
  The *Module Learning With Errors* (M-LWE) problem provides our
  hardness assumption:

  #mitex(`\mathbf{A} \mathbf{s} + \mathbf{e} = \mathbf{b} \quad (\text{mod } q)`)

  where #mi(`\mathbf{A} \in \mathbb{Z}_q^{m \times n}`), #mi(`\mathbf{s}`) is the secret, and
  #mi(`\mathbf{e}`) is drawn from a discrete Gaussian distribution
  #mi(`\chi_\sigma`) with parameter #mi(`\sigma`).

  The decisional M-LWE problem is believed to be hard even for quantum
  adversaries:

  #mitex(`\Pr[\mathcal{A}(\mathbf{A}, \mathbf{b}) = 1] - \Pr[\mathcal{A}(\mathbf{A}, \mathbf{u}) = 1] \leq \text{negl}(\lambda)`)
]

// ============================================================
// Protocol Design
// ============================================================

#slide(title: [Key Exchange Overview])[
  Our proposed *Compact Module Key Exchange* (CMKE) protocol proceeds in
  three phases:

  + *Key generation*: Sample #mi(`\mathbf{s}, \mathbf{e} \leftarrow \chi_\sigma^n`) and compute #mi(`\text{pk} = \mathbf{A} \mathbf{s} + \mathbf{e}`)
  + *Encapsulation*: Initiator computes shared ciphertext using ring operations
  + *Decapsulation*: Responder recovers shared secret via error reconciliation
  + *Key confirmation*: Optional MAC-based confirmation for mutual authentication
]

#slide(title: [Concrete Parameters])[
  #figure[
    #table(
      columns: (2fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      inset: 0.5em,
      table.header[*Parameter Set*][*#mi(`n`)*][*#mi(`q`)*][*#mi(`\sigma`)*][*Security*],
      [CMKE-512], [512], [3329], [3.2], [128-bit],
      [CMKE-768], [768], [3329], [2.8], [192-bit],
      [CMKE-1024], [1024], [3329], [2.4], [256-bit],
    )
  ]
]

#slide(title: [Styled Content Blocks])[
  #set text(size: 20pt)
  #stack(
    spacing: 0.8em,
    quote-block(spacing: 0pt)[
      "The only truly secure system is one that is powered off." -- Gene Spafford
    ],
    color-block(title: [Theorem: IND-CCA2 Security], spacing: 0pt)[
      If M-LWE is hard, CMKE achieves IND-CCA2 security.
    ],
    color-block(title: [Implementation Note], spacing: 0pt)[
      NTT multiplication gives #mi(`O(n \log n)`) ring operations.
    ],
  )
]

// ============================================================
// Experimental Evaluation
// ============================================================

#slide(title: [Performance Benchmarks])[
  #stack(
    spacing: 0.8em,
    [Measured on an Intel Core i7-13700K at 3.4 GHz (single-threaded):],
    figure(
      table(
        columns: (2fr, 1fr, 1fr, 1fr),
        align: center,
        inset: 0.5em,
        table.header[*Scheme*][*KeyGen ($mu$s)*][*Encaps ($mu$s)*][*PK Size (B)*],
        [Kyber-512], [12.4], [16.8], [800],
        [NTRU-HPS], [28.1], [9.2], [699],
        [FrodoKEM], [1830], [2150], [9616],
        [*CMKE-512*], [*10.8*], [*14.2*], [*736*],
      ),
    ),
  )
]

#slide(title: [Security Analysis])[
  Our reduction from M-LWE to CMKE security achieves a tight bound:

  #mitex(`\text{Adv}_{\text{CMKE}}^{\text{IND-CCA2}} (\mathcal{A}) \leq 2 \cdot \text{Adv}_{\text{M-LWE}}^{\text{dec}} (\mathcal{B}) + 2^{-128}`)

  Key findings from formal verification:

  + Side-channel resistance verified using constant-time analysis tools
  + No timing leaks detected in NTT or polynomial sampling routines
  + Memory-safe implementation in Rust with #mi(`< 5000`) lines of code
]

// ============================================================
// Conclusion
// ============================================================

#slide(title: [Summary and Future Work])[
  *Contributions:*
  - Novel compact key exchange from Module-LWE with tight security proof
  - State-of-the-art performance in key generation and encapsulation
  - Formally verified, constant-time reference implementation

  *Future directions:*
  - Integration with TLS 1.3 handshake protocol
  - Hybrid classical/post-quantum key exchange mode
  - Hardware acceleration on FPGA targets at ISEC
]

#slide(title: [Acknowledgements], alignment: horizon)[
  This research is supported by the Austrian Science Fund (FWF) under
  project P-XXXXX and the European Research Council (ERC) under the
  EU Horizon programme.

  Computational resources provided by the TU Graz HPC cluster.
]

// === Standout Slide ===
#standout-slide(title: [Thank you! Questions?])
