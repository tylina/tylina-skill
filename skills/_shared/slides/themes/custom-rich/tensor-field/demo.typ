// Tensor Field Theme Demo — Differential Geometry & Machine Learning
// Mathematical/scientific presentation showcasing tensor field components
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": mitex
#import "@preview/lovelace:0.3.1": *
#import "template.typ": *

#show raw: set text(font: ("IBM Plex Mono", "Menlo", "Courier"))

#show: tensor-field-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Tensor Methods Workshop 2026 -- Computational Mathematics],
  config-info(
    title: [Tensor Fields in Differential Geometry],
    subtitle: [From Smooth Manifolds to Neural Network Optimization],
    author: [Prof. Elena Vasquez],
    institution: [Department of Mathematics, Institute for Advanced Study],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

#set text(font: ("IBM Plex Sans", "Arial", "Helvetica"))

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations
// ══════════════════════════════════════
= Mathematical Foundations

== Tensor Fields on Manifolds

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  field-card([Tangent Bundle], [
    A tensor field of type $(r, s)$ on a smooth manifold $M$ assigns to each point $p in M$ a multilinear map:

    #v(0.3em)
    #mitex(`T^{i_1 \cdots i_r}_{j_1 \cdots j_s}(p) : T_p^*M \times \cdots \times T_pM \to \mathbb{R}`)
    #v(0.3em)

    The tangent bundle $T M$ provides the natural arena for vector fields.
  ], accent: palette.primary),
  field-card([Covariant Derivative], [
    The connection $nabla$ extends differentiation to tensor fields:

    #v(0.3em)
    #mitex(`\nabla_X T = \lim_{t \to 0} \frac{\tau_t^{-1} T_{\gamma(t)} - T_p}{t}`)
    #v(0.3em)

    Parallel transport $tau_t$ moves tensors along curves while preserving their geometric meaning.
  ], accent: palette.secondary),
)

#v(0.5em)

#manifold-box([Key Insight: Curvature from Connection], [
  The Riemann curvature tensor measures the failure of parallel transport to commute. For vector fields $X, Y, Z$:

  #v(.8em)
  #align(center, mitex(`R(X,Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X,Y]} Z`))
])

== Differential Forms & Exterior Calculus

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  basis-card([0-forms], [
    Smooth functions $f: M -> RR$

    #v(0.2em)
    #mitex(`df = \frac{\partial f}{\partial x^i} dx^i`)
    #v(0.2em)

    The gradient is the simplest differential form.
  ], accent: palette.primary),
  basis-card([1-forms], [
    Covector fields $omega in Gamma(T^* M)$

    #v(0.2em)
    #mitex(`\omega = \omega_i \, dx^i`)
    #v(0.2em)

    Dual to vector fields via the metric tensor.
  ], accent: palette.accent),
  basis-card([2-forms], [
    Antisymmetric $(0,2)$ tensors

    #v(0.2em)
    #mitex(`F = F_{ij} \, dx^i \wedge dx^j`)
    #v(0.2em)

    Electromagnetic field strength is a 2-form.
  ], accent: palette.secondary),
)

#v(0.4em)

#theorem-box([Theorem], [Stokes' Theorem (General Form)], [
  For a compact oriented manifold $M$ with boundary $partial M$ and any $(n-1)$-form $omega$:

  #v(0.2em)
  #align(center, mitex(`\int_M d\omega = \oint_{\partial M} \omega`))
  #v(0.2em)

  This unifies the fundamental theorem of calculus, Green's theorem, and the divergence theorem.
], accent: palette.primary)

// ══════════════════════════════════════
// Section 2: Riemannian Geometry
// ══════════════════════════════════════
= Riemannian Geometry

== Metric Tensor & Geodesics

#cols[
  #field-card([The Metric Tensor], [
    The Riemannian metric $g$ is a smooth assignment of an inner product to each tangent space:

    #v(0.3em)
    #mitex(`ds^2 = g_{ij} \, dx^i \otimes dx^j`)
    #v(0.3em)

    This determines lengths, angles, volumes, and curvature -- the complete geometry of the manifold.

    - *Positive definite*: $g(v,v) > 0$ for $v eq.not 0$
    - *Symmetric*: $g_(i j) = g_(j i)$
    - *Non-degenerate*: $det(g_(i j)) eq.not 0$
  ], accent: palette.primary)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.5em,
    vector-tag([Christoffel], color: palette.primary),
    vector-tag([Levi-Civita], color: palette.accent),
    vector-tag([Geodesic], color: palette.secondary),
  )
][
  #eigenvalue-box([Geodesic Equation], [
    Curves of zero acceleration (straightest possible paths):

    #v(0.3em)
    #mitex(`\frac{d^2 x^\mu}{d\tau^2} + \Gamma^\mu_{\alpha\beta} \frac{dx^\alpha}{d\tau} \frac{dx^\beta}{d\tau} = 0`)
    #v(0.3em)

    where the Christoffel symbols encode the connection:

    #v(0.2em)
    #mitex(`\Gamma^\mu_{\alpha\beta} = \frac{1}{2} g^{\mu\nu} \left( \partial_\alpha g_{\beta\nu} + \partial_\beta g_{\alpha\nu} - \partial_\nu g_{\alpha\beta} \right)`)
  ], accent: palette.secondary)

  #v(0.4em)

  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    magnitude-stat([Dimension], [$n = 4$], color: palette.primary),
    magnitude-stat([Signature], [$(3,1)$], color: palette.accent),
  )
]

== Curvature Invariants

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  theorem-box([Definition], [Ricci Tensor], [
    The trace of the Riemann tensor:

    #v(0.2em)
    #mitex(`R_{\mu\nu} = R^\lambda_{\ \mu\lambda\nu} = g^{\lambda\sigma} R_{\lambda\mu\sigma\nu}`)
    #v(0.2em)

    Measures how volume elements deviate from flat space. Einstein's field equations relate $R_(mu nu)$ to the stress-energy tensor.
  ], accent: palette.primary),
  theorem-box([Definition], [Scalar Curvature], [
    The full trace of the Riemann tensor:

    #v(0.2em)
    #mitex(`R = g^{\mu\nu} R_{\mu\nu}`)
    #v(0.2em)

    A single number at each point measuring total curvature. Appears in the Einstein-Hilbert action:

    #v(0.2em)
    #mitex(`S = \frac{1}{16\pi G} \int R \sqrt{-g} \, d^4x`)
  ], accent: palette.accent),
)

#v(0.4em)

#flow-divider(width: 70%)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  magnitude-stat([Riemann], [$R^mu_(space nu rho sigma)$], color: palette.primary),
  magnitude-stat([Ricci], [$R_(mu nu)$], color: palette.accent),
  magnitude-stat([Scalar], [$R$], color: palette.secondary),
  magnitude-stat([Weyl], [$C^mu_(space nu rho sigma)$], color: palette.primary),
)

// ══════════════════════════════════════
// Section 3: Applications to ML
// ══════════════════════════════════════
= Neural Network Geometry

== Information Geometry

#cols[
  #field-card([Fisher Information Metric], [
    The space of probability distributions forms a Riemannian manifold with the Fisher metric:

    #v(0.3em)
    #mitex(`g_{ij}(\theta) = \mathbb{E}\left[ \frac{\partial \log p(x|\theta)}{\partial \theta^i} \frac{\partial \log p(x|\theta)}{\partial \theta^j} \right]`)
    #v(0.3em)

    This induces a natural geometry on parameter space where:
    - Geodesic distance = statistical divergence
    - Curvature = model complexity
    - Volume = distinguishability of parameters
  ], accent: palette.primary)

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    vector-tag([KL-divergence], color: palette.primary),
    vector-tag([Natural gradient], color: palette.accent),
    vector-tag([Amari], color: palette.secondary),
  )
][
  #eigenvalue-box([Natural Gradient Descent], [
    Standard gradient descent ignores parameter space geometry. The natural gradient corrects this:

    #v(0.3em)
    #mitex(`\theta_{t+1} = \theta_t - \eta \, F^{-1}(\theta_t) \nabla_\theta \mathcal{L}`)
    #v(0.3em)

    where $F^(-1)$ is the inverse Fisher information matrix. This yields:
    - Invariance to reparameterization
    - Faster convergence in curved spaces
    - Connection to mirror descent
  ], accent: palette.secondary)

  #v(0.3em)

  #cols(columns: (1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    magnitude-stat([Convergence], [2-5x~faster], color: palette.primary),
    magnitude-stat([Parameters], [$10^9$], color: palette.accent),
  )
]

== Loss Landscape Topology

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  field-card([Critical Points], [
    The Hessian matrix $H = nabla^2 cal(L)$ classifies critical points:

    - *Minimum*: all eigenvalues $lambda_i > 0$
    - *Saddle point*: mixed signs (most common in high dim)
    - *Maximum*: all eigenvalues $lambda_i < 0$

    In high dimensions, saddle points vastly outnumber local minima.
  ], accent: palette.primary),
  field-card([Mode Connectivity], [
    Recent results show that SGD solutions are connected by paths of nearly constant loss:

    #v(0.3em)
    #mitex(`\max_{t \in [0,1]} \mathcal{L}(\gamma(t)) \approx \mathcal{L}(\theta_1) \approx \mathcal{L}(\theta_2)`)
    #v(0.3em)

    This suggests the loss landscape has a *connected sublevel set* structure -- the manifold of good solutions is path-connected.
  ], accent: palette.accent),
)

// ══════════════════════════════════════
// Section 4: Computational Methods
// ══════════════════════════════════════
= Computational Methods

== Discrete Exterior Calculus

#cols[
  #basis-card([Simplicial Complex], [
    Discretize manifold $M$ into simplices:

    - *0-simplex*: vertices (points)
    - *1-simplex*: edges (line segments)
    - *2-simplex*: triangles (faces)
    - *3-simplex*: tetrahedra (volumes)

    Discrete differential forms live on these simplices as cochains -- linear functionals on chains.
  ], accent: palette.primary)

  #v(0.4em)

  #basis-card([Discrete Hodge Star], [
    Maps $k$-forms to $(n-k)$-forms:

    #v(0.2em)
    #mitex(`\star_k : \Omega^k(K) \to \Omega^{n-k}(K)`)
    #v(0.2em)

    Implemented via circumcentric dual mesh. Diagonal matrix with entries $|star sigma| / |sigma|$.
  ], accent: palette.accent)
][
  #theorem-box([Algorithm], [Discrete Laplacian], [
    The Laplace-de Rham operator in discrete setting:

    #v(0.2em)
    #mitex(`\Delta_k = d_{k-1} \star_{k-1}^{-1} d_{k-1}^T \star_k + \star_{k+1}^{-1} d_k^T \star_{k+1} d_k`)
    #v(0.2em)

    For 0-forms on a mesh, this reduces to the familiar cotangent Laplacian used in geometry processing:

    #v(0.2em)
    #mitex(`L_{ij} = \begin{cases} -\frac{1}{2}(\cot \alpha_{ij} + \cot \beta_{ij}) & i \neq j \\ -\sum_{k \neq i} L_{ik} & i = j \end{cases}`)
  ], accent: palette.primary)

  #v(.8em)

  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
    magnitude-stat([Vertices], [50K], color: palette.primary),
    magnitude-stat([Faces], [100K], color: palette.accent),
    magnitude-stat([Genus], [$g = 3$], color: palette.secondary),
  )
]

== Numerical Tensor Decomposition

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  field-card([CP Decomposition], [
    Approximate a tensor as sum of rank-1 terms:

    #v(0.3em)
    #mitex(`\mathcal{T} \approx \sum_{r=1}^{R} \lambda_r \, \mathbf{a}_r \otimes \mathbf{b}_r \otimes \mathbf{c}_r`)
    #v(0.3em)

    Alternating least squares (ALS) iteratively optimizes each factor matrix while holding others fixed.
  ], accent: palette.primary),
  field-card([Tucker Decomposition], [
    Core tensor with factor matrices:

    #v(0.3em)
    #mitex(`\mathcal{T} \approx \mathcal{G} \times_1 U_1 \times_2 U_2 \times_3 U_3`)
    #v(0.3em)

    Higher-order SVD (HOSVD) provides initialization. Multilinear rank $(r_1, r_2, r_3)$ controls compression ratio.
  ], accent: palette.accent),
)

#v(0.4em)

#topology-quote([
  The tensor is the fundamental object in modern computational science -- it encodes the multilinear structure of data, physics, and geometry alike.
], attribution: [Tamara Kolda, Sandia National Laboratories])

== Alternating Least Squares (Pseudocode)

#theorem-box([Algorithm], [CP-ALS Tensor Decomposition], [
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[CP-ALS Tensor Decomposition])[
      + Initialize factor matrices $A, B, C$ randomly; set rank $R$
      + *repeat*
        + Update $A arrow.l cal(T)_(1) (C times.o B)^+$
        + Update $B arrow.l cal(T)_(2) (C times.o A)^+$
        + Update $C arrow.l cal(T)_(3) (B times.o A)^+$
        + Normalize columns; absorb weights into $lambda$
      + *until* $| cal(T) - sum_r lambda_r a_r times.o b_r times.o c_r | < epsilon$
    ]
  )
], accent: palette.primary)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"In the beginning, God said: let the four-dimensional divergence of an antisymmetric second-rank tensor equal zero -- and there was light."_

  #text(size: 0.6em, weight: "regular", fill: white.transparentize(30%))[-- Charles W. Misner]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Thank You]
