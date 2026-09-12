// Quantum Dot Theme Demo — Quantum Computing Research Presentation
// Abstract, precise, futuristic science presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "@preview/lovelace:0.3.1": *
#import "template.typ": *

#set text(font: ("Avenir Next", "Arial Unicode MS"), size: 18pt)
#show raw: set text(font: "Menlo")

#show: quantum-dot-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Quantum Dot -- Research Symposium 2026],
  config-info(
    title: [Scalable Quantum Error Correction with Topological Codes],
    subtitle: [Towards Fault-Tolerant Quantum Computation],
    author: [Dr. Elena Vasquez, Quantum Systems Lab],
    institution: [Institute for Advanced Quantum Research],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ======================================
// Title Slide
// ======================================
#title-slide()

// ======================================
// Section 1: Background
// ======================================
= Background

== Quantum States & Superposition

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    qubit-card([Single-Qubit State], [
      A qubit lives in a two-dimensional Hilbert space. The general pure state is:

      #mitex(`|\psi\rangle = \alpha|0\rangle + \beta|1\rangle`)

      #mi(`\alpha, \beta \in \mathbb{C}`), with #mi(`|\alpha|^2 + |\beta|^2 = 1`). The *Born rule* sets #mi(`P(0)=|\alpha|^2`) and #mi(`P(1)=|\beta|^2`).
    ], accent: palette.primary),
    qubit-card([Bloch Sphere Parametrization], [
      Any pure qubit state can be written as:

      #mitex(`|\psi\rangle = \cos\!\frac{\theta}{2}|0\rangle + e^{i\varphi}\sin\!\frac{\theta}{2}|1\rangle`)

      #mi(`\theta \in [0, \pi]`) is polar and #mi(`\varphi \in [0, 2\pi)`) azimuthal. Mixed states obey #mi(`\rho=\sum_k p_k|\psi_k\rangle\langle\psi_k|`) and #mi(`\mathrm{Tr}(\rho)=1`).
    ], accent: palette.secondary),
  ),
  gate-box([Decoherence & The Error Problem], [
    Decoherence time #mi(`T_2`) bounds depth. Below #mi(`p_{\rm th} \approx 1\%`), distance-#mi(`d`) surface codes suppress logical errors exponentially.
  ]),
)

== Current Landscape

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      superposition-stat([Physical Qubits], [1,121], color: palette.primary),
      superposition-stat([Logical Qubits], [12], color: palette.secondary),
      superposition-stat([Gate Fidelity], [99.7%], color: palette.accent-indigo),
      superposition-stat([T1 Time], [92us], color: palette.secondary),
    ),
    register-grid(
      [Classical Approach], [
        - Concatenated codes
        - High overhead; global operations
      ],
      [Topological Approach], [
        - Surface/color codes
        - Lower overhead; local noise resilience
      ],
    ),
  ),
  stack(spacing: 0.8em,
    qubit-card([Research Landscape], [
      *Hardware*: Superconducting, trapped-ion, and photonic platforms now compete on fidelity and scale.

      *Contribution*: Adaptive neural decoding cuts logical errors 3x at real-time latency.
    ], accent: palette.primary),
    measurement-box([Why Now?], [
      + Fidelity crossed the surface-code threshold
      + Real-time FPGA decoding; 40% fewer qubits
    ], accent: palette.secondary),
  ),
)

// ======================================
// Section 2: Our Approach
// ======================================
= Our Approach

== Quantum Gate Matrices

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    orbital-card([Hadamard Gate], [
      Creates equal superposition from #mi(`|0\rangle`) or #mi(`|1\rangle`):

      #mitex(`H = \frac{1}{\sqrt{2}}\begin{pmatrix}1 & 1\\1 & -1\end{pmatrix}`)

      #mi(`H|0\rangle=|{+}\rangle`) and #mi(`H|1\rangle=|{-}\rangle`).
    ], accent: palette.primary),
    orbital-card([Pauli Gates], [
      The three Pauli operators generate all single-qubit rotations:

      #mitex(`X=\begin{pmatrix}0&1\\1&0\end{pmatrix},\; Z=\begin{pmatrix}1&0\\0&-1\end{pmatrix}`)

      #mi(`Y=iXZ`); #mi(`X^2=Y^2=Z^2=I`).
    ], accent: palette.secondary),
    orbital-card([CNOT Gate], [
      Two-qubit entangling gate — control flips target:

      #mitex(`\mathrm{CNOT} = \begin{pmatrix}1&0&0&0\\0&1&0&0\\0&0&0&1\\0&0&1&0\end{pmatrix}`)

      Universal with single-qubit gates.
    ], accent: palette.accent-indigo),
  ),
  cols(columns: (1fr, 1fr), gutter: 1em, lazy-layout: true,
    superposition-stat([Gate Fidelity], [99.7%], color: palette.primary),
    superposition-stat([Entanglement Depth], [d = 17], color: palette.secondary),
  ),
)

== Novel Decoding Algorithm

#cols(columns: (1fr, 1fr), gutter: 1em,
  stack(spacing: 0.8em,
    gate-box([Step 1: Syndrome Collection], [
      ```
      for round in 0..d:
        measure_stabilizers(X_type)
      measure_stabilizers(Z_type)
      syndrome[round] = extract_defects()
      ```
      Streams syndromes to the decoder over PCIe.
    ], accent: palette.secondary),
    gate-box([Step 2: Neural Matching], [
      ```
      graph = build_defect_graph(syndrome)
      weights = neural_net.predict(graph)
      matching = min_weight_match(graph, weights)
      correction = matching_to_pauli(matching)
      ```
      GNN weights are predicted 47% faster than MWPM.
    ], accent: palette.primary),
  ),
  stack(spacing: 0.8em,
    gate-box([Step 3: Correction Application], [
      ```
      if correction.commutes(logical_ops):
        apply_frame_update(correction)
      else:
      apply_physical_correction(correction)
      verify_stabilizers()
      ```
      Pauli-frame tracking avoids unnecessary physical operations.
    ], accent: palette.secondary),
    entangle-card([Performance Advantage], [
      Our decoder achieves *3.2x lower logical error rate* than MWPM at distance 11 with sub-microsecond FPGA latency. Learned weights adapt to each device's noise profile in real time.
    ], accent: palette.accent-purple),
  ),
)

== Decoding Algorithm (Pseudocode)

#gate-box([Neural Surface-Code Decoder], [
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[Neural Surface-Code Decoder])[
      + Initialize syndrome buffer $S arrow.l emptyset$
      + *for* round $r = 1$ *to* $d$ *do*
        + Measure $X$- and $Z$-stabilizers; append defects to $S$
      + Build defect graph $G = (V, E)$ from $S$
      + Predict edge weights $w arrow.l "GNN"_theta (G)$
      + Compute min-weight perfect matching $M arrow.l "MWPM"(G, w)$
      + Apply Pauli frame correction; verify stabilizers
    ]
  )
], accent: palette.primary)

// ======================================
// Section 3: Results
// ======================================
= Results

== Experimental Validation

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    superposition-stat([Logical Error], [$3.2 times 10^(-4)$], color: palette.primary),
    superposition-stat([Decode Latency], [0.8 us], color: palette.secondary),
    superposition-stat([Code Distance], [d = 7], color: palette.accent-indigo),
    superposition-stat([Improvement], [3.2x], color: palette.primary),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    qubit-card([Hardware Results (IBM Eagle)], [
      - Demonstrated on 127-qubit device with distance-5 surface code
      - *Logical error*: $3.2 times 10^(-4)$ per round (3.2x over MWPM)
      - *Speed*: 0.8 microseconds; 72-hour logical-failure-free run
    ], accent: palette.primary),
    qubit-card([Simulation Results], [
      - Simulated up to distance 21 with depolarizing noise
      - *Sub-threshold scaling*: Exponential suppression confirmed
      - *Correlated noise*: 2.1x improvement; 0.1% leakage resilience
      - Union-find speed with MWPM accuracy
    ], accent: palette.secondary),
  ),
)

== Quantum Algorithm Foundations

#cols(columns: (1fr, 1fr), gutter: 1em,
  stack(spacing: 0.8em,
    qubit-card([Grover's Search Algorithm], [
      For an unstructured database of #mi(`N`) items, Grover's algorithm finds the target in #mi(`O(\sqrt{N})`) queries. The amplitude amplification step applies the operator:

      #mitex(`G = -H^{\otimes n}(2|0\rangle\langle 0| - I)H^{\otimes n} \cdot U_f`)

      After #mi(`k \approx \frac{\pi}{4}\sqrt{N}`) iterations, the amplitude of the marked state becomes:

      #mitex(`\alpha_k = \sin\!\left((2k+1)\arcsin\!\frac{1}{\sqrt{N}}\right) \to 1`)
    ], accent: palette.primary),
    stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 0.4em,
        state-tag([Quadratic Speedup], color: palette.primary),
        state-tag([Amplitude Amplification], color: palette.secondary),
      ),
      state-tag([Oracle Model], color: palette.accent-indigo),
    ),
  ),
  stack(spacing: 0.8em,
    qubit-card([Shor's Period-Finding], [
      Factoring #mi(`N`) reduces to finding the period #mi(`r`) of #mi(`f(x) = a^x \bmod N`). The quantum phase estimation extracts:

      #mitex(`\mathrm{QFT}_N|x\rangle = \frac{1}{\sqrt{N}}\sum_{k=0}^{N-1} e^{2\pi i x k/N}|k\rangle`)

      Measuring after applying QFT yields #mi(`k \approx jN/r`) from which #mi(`r`) is recovered via continued fractions. Runtime: #mi(`O((\log N)^3)`).
    ], accent: palette.secondary),
    cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
      superposition-stat([Qubit Reduction], [4.8x], color: palette.primary),
      superposition-stat([Time Reduction], [2.3x], color: palette.secondary),
    ),
  ),
)

// ======================================
// Section 4: Architecture
// ======================================
= Architecture

== System Design

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    orbital-card([Quantum Layer], [
      Superconducting transmon qubits arranged in a heavy-hex lattice. Frequency-tunable couplers enable high-fidelity two-qubit gates.

      - *T1*: 92 microseconds average
      - *T2*: 68 microseconds; *CX*: 99.7%; *Readout*: 99.4%
    ], accent: palette.primary),
    orbital-card([Classical Control Layer], [
      Custom FPGA-based control system with direct PCIe connection to quantum processor. Real-time syndrome decoding pipeline.

      - *Decode latency*: < 1 microsecond
      - *Throughput*: 1M/s; weights update every 100ms; 45W/unit
    ], accent: palette.secondary),
  ),
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    orbital-card([Software Stack], [
      Compiler optimizes logical circuits into fault-tolerant instruction sequences. Lattice surgery scheduler minimizes space-time volume.

      Open-source framework compatible with Qiskit, Cirq, and Q\#.
    ], accent: palette.accent-indigo),
    orbital-card([Calibration Engine], [
      Continuous device characterization updates noise model every 10 minutes. Neural decoder weights retrained online.

      Drift compensation maintains performance over multi-day experiments.
    ], accent: palette.primary),
  ),
)

== Technical Differentiators

#cols(columns: (1fr, 1fr), gutter: 1em,
  stack(spacing: 0.8em,
    qubit-card([Adaptive Neural Decoder], [
      Unlike fixed decoders, our system *continuously learns* the device noise profile. Key innovations:

      - *Graph Neural Network* architecture processes syndrome graphs natively
      - *Online*: drift adaptation; *hardware-aware*: INT8 FPGA weights
      - *Parallelizable*: linear scaling with code distance
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      state-tag([GNN], color: palette.primary),
      state-tag([FPGA], color: palette.secondary),
      state-tag([Real-time], color: palette.accent-indigo),
    ),
  ),
  stack(spacing: 0.8em,
    qubit-card([Lattice Surgery Compiler], [
      Automated compilation of arbitrary quantum circuits into lattice surgery operations on the surface code.

      - *Optimization*: 40% less space-time volume; parallel ancilla scheduling
      - *Verification*: formal fault-tolerance proofs
    ], accent: palette.secondary),
    entangle-card([Patent Portfolio], [
      8 patents filed (5 granted) covering neural decoding architectures, adaptive calibration methods, and lattice surgery optimization algorithms.
    ], accent: palette.accent-purple),
  ),
)

// ======================================
// Section 5: Roadmap
// ======================================
= Roadmap

== Next Steps

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
    orbital-card([2026 Q3-Q4], [
      - Distance-9 demo on 200+ qubits; real-time decoding
      - Open-source release; two hardware partners
    ], accent: palette.primary),
    orbital-card([2027], [
      - Distance-13 logical qubit; multi-logical operations
      - Lattice surgery and quantum-cloud integration
    ], accent: palette.secondary),
    orbital-card([2028-2029], [
      - Fault-tolerant algorithms (#mi(`d=17+`)); quantum advantage
      - Commercial hardware and standards work
    ], accent: palette.accent-indigo),
  ),
  wire-divider(width: 60%),
  register-grid(
    [Current State (2026)], [
      - 127 physical qubits
      - Distance-5 code demonstrated
      - 0.8 us decode latency
      - Single logical qubit
    ],
    [Target State (2029)], [
      - 10,000+ physical qubits
      - Distance-17 codes
      - Sub-100ns decode latency
      - 100+ logical qubits
    ],
  ),
)

== Collaboration Opportunities

#stack(spacing: 0.8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    qubit-card([For Hardware Teams], [
      *Offer*: Custom decoder optimized for your specific noise model and architecture.

      - Free integration with our open-source decoder framework
      - Joint publications on hardware-decoder co-design
      - Early access to next-gen decoding algorithms
      - Benchmark suite for decoder comparison
    ], accent: palette.primary),
    qubit-card([For Algorithm Researchers], [
      *Offer*: Realistic resource estimates using our decoder performance data.

      - Accurate overhead projections for quantum algorithms
      - Compiler access for lattice surgery scheduling
      - Shared simulation infrastructure (up to d=25)
      - Co-authorship on application-specific analyses
    ], accent: palette.secondary),
  ),
  coherence-note([Funding & Support], [
    This research is supported by the National Quantum Initiative, EU Quantum Flagship, and industry partners. We are seeking collaborators for validation on 1000+ qubit devices.
  ], accent: palette.accent-indigo),
)

// ======================================
// Focus Slide
// ======================================

#focus-slide[
  #stack(spacing: 0.8em,
    [_"The path to useful quantum computation runs through error correction. Our decoder brings that future 3 years closer."_],
    text(size: 0.6em, weight: "regular", fill: palette.accent-purple)[-- Dr. Elena Vasquez, Quantum Systems Lab],
  )
]

// ======================================
// Ending Slide
// ======================================

#ending-slide[Thank You]
