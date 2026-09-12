// Lecture Hall Theme Demo — Eigenvalues and Eigenvectors
// Course lecture with definition/theorem/proof structure
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "@preview/lovelace:0.3.1": *
#import "template.typ": *

#show: lecture-hall-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [MATH 425 -- Linear Algebra II],
  config-info(
    title: [Eigenvalues and Eigenvectors],
    subtitle: [Spectral Theory and Diagonalization],
    author: [Prof. James Harrington],
    institution: [Department of Mathematics, Westfield University],
    date: datetime(year: 2026, month: 5, day: 26),
  ),
)

// Inline bibliography
#let bib-data = bytes("
@book{strang2016,
  author = {Gilbert Strang},
  title = {Introduction to Linear Algebra},
  edition = {5th},
  publisher = {Wellesley-Cambridge Press},
  year = {2016},
}
@book{hoffman1971,
  author = {Kenneth Hoffman and Ray Kunze},
  title = {Linear Algebra},
  edition = {2nd},
  publisher = {Prentice-Hall},
  year = {1971},
}
")

// ==============================
// Title Slide
// ==============================
#title-slide()

// ==============================
// Section 1: Definitions
// ==============================
= Definitions

== Eigenvalue Equation

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  definition-block([Eigenvalue and Eigenvector], [
    Let $A$ be an $n times n$ matrix. A scalar $lambda$ is an *eigenvalue* of $A$ if there exists a nonzero vector $bold(v)$ such that:

    #mitex(`A\mathbf{v} = \lambda\mathbf{v}`)

    The vector $bold(v)$ is called an *eigenvector* corresponding to $lambda$.
  ]),
  example-panel([Geometric Interpretation], [
    Under the linear transformation $T(bold(v)) = A bold(v)$, an eigenvector $bold(v)$ is merely _scaled_ by the factor $lambda$:

    - $lambda > 1$: stretching
    - $0 < lambda < 1$: compression
    - $lambda < 0$: reversal + scaling
    - $lambda = 0$: collapse to zero
  ]),
)

#v(0.4em)

#formula-display[
  *Eigenvalue Equation:* #h(1em) #mi(`A\mathbf{v} = \lambda\mathbf{v} \iff (A - \lambda I)\mathbf{v} = \mathbf{0}`)
]

== Key Terminology

#cols[
  #definition-block([Eigenspace], [
    The *eigenspace* $E_lambda$ corresponding to an eigenvalue $lambda$ is the set of all eigenvectors plus the zero vector:

    $ E_lambda = "ker"(A - lambda I) = {bold(v) in RR^n : A bold(v) = lambda bold(v)} $

    This is always a subspace of $RR^n$.
  ])

  #v(.8em)

  #definition-block([Spectrum], [
    The *spectrum* of $A$, denoted $sigma(A)$, is the set of all eigenvalues of $A$. The *spectral radius* is $rho(A) = max{|lambda| : lambda in sigma(A)}$.
  ])
][
  #definition-block([Characteristic Polynomial], [
    The *characteristic polynomial* of $A$ is:

    $ p(lambda) = det(A - lambda I) $

    This is a polynomial of degree $n$. Its roots are exactly the eigenvalues of $A$.
  ])

  #v(.8em)

  #stack(dir: ltr, spacing: 0.5em,
    lecture-tag([Linear Algebra], color: palette.accent),
    lecture-tag([Spectral Theory], color: palette.gold),
    lecture-tag([Week 8], color: palette.muted-ink),
  )
]

== Characteristic Polynomial Example

#cols(columns: (2fr, 3fr), gutter: 1.2em)[
  #example-panel([Compute Eigenvalues], [
    Let $A = mat(2, 1; 1, 2)$.

    The characteristic polynomial is:

    #mitex(`\det(A - \lambda I) = \det\begin{pmatrix} 2-\lambda & 1 \\ 1 & 2-\lambda \end{pmatrix}`)

    $ = (2 - lambda)^2 - 1 = lambda^2 - 4 lambda + 3 $

    $ = (lambda - 1)(lambda - 3) $
  ])
][
  #theorem-box([Eigenvalues Found], [
    The eigenvalues are $lambda_1 = 1$ and $lambda_2 = 3$.

    *Eigenvectors:*

    For $lambda_1 = 1$: #h(0.5em) $bold(v)_1 = vec(-1, 1)$

    For $lambda_2 = 3$: #h(0.5em) $bold(v)_2 = vec(1, 1)$

    The eigenvectors are orthogonal since $A$ is symmetric.
  ])

  #v(0.3em)

  #proof-block[
    Setting $lambda = 1$: $(A - I)bold(v) = mat(1, 1; 1, 1) bold(v) = bold(0)$ gives $x_1 = -x_2$, so $bold(v)_1 = t vec(-1, 1)$. Similarly for $lambda = 3$.
  ]
]

// ==============================
// Section 2: Properties
// ==============================
= Properties

== Fundamental Theorems

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  theorem-box([Theorem: Trace and Determinant], [
    For an $n times n$ matrix $A$ with eigenvalues $lambda_1, ..., lambda_n$ (counted with multiplicity):

    $ "tr"(A) = sum_(i=1)^n lambda_i $
    $ det(A) = product_(i=1)^n lambda_i $
  ]),
  theorem-box([Theorem: Linear Independence], [
    Eigenvectors corresponding to *distinct* eigenvalues are linearly independent.

    Consequently, if an $n times n$ matrix has $n$ distinct eigenvalues, then it is diagonalizable.
  ]),
)

#v(0.4em)

#proof-block[
  Let $bold(v)_1, ..., bold(v)_k$ be eigenvectors for distinct $lambda_1, ..., lambda_k$. Suppose $c_1 bold(v)_1 + dots + c_k bold(v)_k = bold(0)$. Applying $A$ and subtracting $lambda_k$ times the original equation eliminates $bold(v)_k$. By induction on $k$, all $c_i = 0$.
]

== Spectral Properties

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  example-panel([Symmetric Matrices], [
    If $A = A^T$, then:
    - All eigenvalues are *real*
    - Eigenvectors for distinct $lambda$ are *orthogonal*
    - $A$ is always diagonalizable
  ]),
  example-panel([Positive Definite], [
    $A$ is positive definite iff:
    - All eigenvalues $lambda_i > 0$
    - $bold(x)^T A bold(x) > 0$ for all $bold(x) != bold(0)$
    - All leading minors positive
  ]),
  example-panel([Nilpotent Matrices], [
    $A$ is nilpotent ($A^k = 0$) iff:
    - All eigenvalues are $0$
    - $sigma(A) = {0}$
    - $"tr"(A^j) = 0$ for all $j >= 1$
  ]),
)

#v(0.3em)

#corollary-note([Corollary: Cayley-Hamilton Theorem], [
  Every square matrix satisfies its own characteristic equation: if $p(lambda) = det(A - lambda I)$, then $p(A) = 0$. This means $A^n$ can be expressed as a linear combination of $I, A, A^2, ..., A^(n-1)$.
])

== Similarity and Diagonalization

#cols[
  #definition-block([Similarity], [
    Matrices $A$ and $B$ are *similar* if there exists an invertible matrix $P$ such that $B = P^(-1) A P$. Similar matrices share:
    - Same eigenvalues (same characteristic polynomial)
    - Same determinant
    - Same trace
    - Same rank
  ])

  #v(0.4em)

  #glass-divider(width: 80%)

  #theorem-box([Diagonalization Theorem], [
    An $n times n$ matrix $A$ is diagonalizable if and only if it has $n$ linearly independent eigenvectors. In this case:

    #mitex(`A = PDP^{-1}`)

    where $D = "diag"(lambda_1, ..., lambda_n)$ and $P = [bold(v)_1 | dots | bold(v)_n]$.
  ])
][
  #example-panel([Powers of Matrices], [
    If $A = P D P^(-1)$, then computing powers is trivial:

    $ A^k = P D^k P^(-1) = P mat(lambda_1^k, , ; , dots.down, ; , , lambda_n^k) P^(-1) $

    This reduces $O(n^3 k)$ to $O(n^3 + n k)$.
  ])

  #v(0.4em)

  #corollary-note([Corollary], [
    Matrix exponential: $e^(A t) = P "diag"(e^(lambda_1 t), ..., e^(lambda_n t)) P^(-1)$. This solves $bold(x)'(t) = A bold(x)(t)$ directly.
  ])

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    lecture-tag([Diagonalization], color: palette.accent),
    lecture-tag([Similarity], color: palette.gold),
  )
]

// ==============================
// Section 3: Computation
// ==============================
= Computation

== The QR Algorithm

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #definition-block([QR Decomposition], [
    Every matrix $A$ can be factored as $A = Q R$ where:
    - $Q$ is orthogonal ($Q^T Q = I$)
    - $R$ is upper triangular

    This is computed via Gram-Schmidt, Householder reflections, or Givens rotations.
  ])

  #v(.8em)

  The QR algorithm iterates this decomposition to find eigenvalues:

  #set text(size: 0.62em)
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[QR Algorithm])[
      + Set $A_0 = A$
      + *for* $k = 0, 1, 2, ...$ *do*
        + Compute QR factorization: $A_k = Q_k R_k$
        + Form next iterate: $A_(k+1) = R_k Q_k$
      + *end*
      + Diagonal of $A_k$ converges to eigenvalues
    ]
  )
][
  #theorem-box([Convergence of QR], [
    Under mild conditions (distinct eigenvalue magnitudes), the QR algorithm converges:

    $ A_k -> T "as" k -> infinity $

    where $T$ is upper triangular with eigenvalues on the diagonal.

    *Convergence rate:* $O(|lambda_(i+1) / lambda_i|^k)$ for the $(i, i+1)$ subdiagonal entry.
  ])

  #v(.8em)

  #corollary-note([Practical Enhancement], [
    With *shifts* (Wilkinson shift), convergence becomes cubic. The shifted QR iteration uses $A_k - mu_k I = Q_k R_k$, then $A_(k+1) = R_k Q_k + mu_k I$.
  ])
]

== Numerical Considerations

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  example-panel([Condition Number], [
    The eigenvalue condition number for a simple eigenvalue $lambda$ of $A$ is:

    $ kappa(lambda) = 1 / (|bold(y)^H bold(x)|) $

    where $bold(x), bold(y)$ are right and left eigenvectors.
  ]),
  example-panel([Computational Cost], [
    - Direct methods: $O(n^3)$
    - QR algorithm: $O(n^3)$ total
    - Power iteration: $O(n^2)$ per step
    - Lanczos (sparse): $O(n k^2)$
    - Arnoldi: $O(n k^2)$
  ]),
  example-panel([Software Libraries], [
    - *LAPACK*: `dgeev`, `dsyev`
    - *NumPy*: `numpy.linalg.eig`
    - *Julia*: `eigen(A)`
    - *MATLAB*: `eig(A)`
    - Specialized: ARPACK, SLEPc
  ]),
)

#v(0.3em)

#formula-display[
  *Backward stability:* The computed eigenvalues are exact eigenvalues of $A + E$ where $||E|| <= c dot epsilon_"mach" dot ||A||$
]

// ==============================
// Section 4: Applications
// ==============================
= Applications

== Principal Component Analysis

#block(width: 100%)[
  #set text(size: .9em)
  #cols(columns: (3fr, 2fr), gutter: 1.2em)[
  #definition-block([PCA via Eigendecomposition], [
    Given data matrix $X in RR^(n times p)$ (centered), PCA computes the eigendecomposition of the covariance matrix:

    $ Sigma = 1/(n-1) X^T X = V Lambda V^T $

    The eigenvectors $bold(v)_i$ (columns of $V$) are the *principal directions*. The eigenvalues $lambda_i$ measure variance along each direction.
  ])

  #v(.8em)

  #theorem-box([Optimal Low-Rank Approximation], [
    The best rank-$k$ approximation to $X$ (in Frobenius norm) is given by projecting onto the top $k$ eigenvectors:

    $ X_k = X V_k V_k^T $

    Fraction of variance explained: $sum_(i=1)^k lambda_i \/ sum_(i=1)^p lambda_i$
  ])
][
  #example-panel([Applications of PCA], [
    - *Image compression*: faces as eigenfaces
    - *Genomics*: population structure
    - *Finance*: risk factor extraction
    - *NLP*: word embeddings (SVD)
    - *Signal processing*: noise reduction
  ])

  #v(.8em)

  #corollary-note([Connection to SVD], [
    If $X = U Sigma V^T$ (SVD), then the right singular vectors $V$ are eigenvectors of $X^T X$ and the singular values satisfy $sigma_i = sqrt(lambda_i (n-1))$.
  ])

  #v(.8em)

    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: .5em,
        lecture-tag([Statistics], color: palette.accent),
        lecture-tag([Dimensionality Reduction], color: palette.gold),
      ),
      stack(dir: ltr, spacing: .5em,
        lecture-tag([Machine Learning], color: palette.muted-ink),
      ),
    )
  ]
]

== Differential Equations

#pad(top: 68pt)[
  #cols(columns: (1fr, 1fr), gutter: 1.2em,
    theorem-box([Solution of Linear ODE Systems], [
      The system $bold(x)'(t) = A bold(x)(t)$ with initial condition $bold(x)(0) = bold(x)_0$ has solution:

      #mitex(`\mathbf{x}(t) = e^{At}\mathbf{x}_0 = \sum_{i=1}^n c_i e^{\lambda_i t}\mathbf{v}_i`)

      where $c_i = (bold(v)_i^(-1) bold(x)_0)_i$ and $lambda_i, bold(v)_i$ are eigenvalues/eigenvectors of $A$.
    ]),
    example-panel([Stability Analysis], [
      The equilibrium $bold(x) = bold(0)$ is:
      - *Stable* if all $"Re"(lambda_i) < 0$
      - *Unstable* if any $"Re"(lambda_i) > 0$
      - *Marginally stable* if max $"Re"(lambda_i) = 0$

      In discrete systems $bold(x)_(k+1) = A bold(x)_k$:
      - Stable iff all $|lambda_i| < 1$
      - The spectral radius $rho(A)$ determines convergence rate
    ]),
  )

  #v(.8em)

  #proof-block[
    Substituting $bold(x)(t) = e^(lambda t) bold(v)$ into $bold(x)' = A bold(x)$ gives $lambda e^(lambda t) bold(v) = A e^(lambda t) bold(v)$, hence $A bold(v) = lambda bold(v)$. General solution: superposition of $n$ independent such solutions.
  ]
]

== Quantum Mechanics and Graph Theory

#cols[
  #definition-block([Observable Operators], [
    In quantum mechanics, physical observables are represented by *Hermitian operators* $hat(H)$ on a Hilbert space. The eigenvalue equation:

    $ hat(H) |psi_n chevron.r = E_n |psi_n chevron.r $

    gives the possible measurement outcomes $E_n$ (energy levels) and corresponding states $|psi_n chevron.r$.
  ])

  #v(0.3em)

  #glass-divider(width: 80%)

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    lecture-tag([Quantum], color: palette.accent),
    lecture-tag([Graph Laplacian], color: palette.gold),
    lecture-tag([Spectral Clustering], color: palette.muted-ink),
  )
][
  #example-panel([Spectral Graph Theory], [
    The *graph Laplacian* $L = D - A$ (where $D$ = degree matrix, $A$ = adjacency matrix) encodes connectivity:
    - $lambda_2 > 0$ iff graph is connected
    - $lambda_2$ = algebraic connectivity (Fiedler value)
    - Eigenvectors of $L$ yield *spectral clustering*
    - Number of zero eigenvalues = number of connected components
  ])

  #v(0.3em)

  #corollary-note([Cheeger Inequality], [
    The isoperimetric number $h(G)$ satisfies: $lambda_2 / 2 <= h(G) <= sqrt(2 lambda_2)$, connecting eigenvalues to graph partitioning quality.
  ])
]

// ==============================
// Focus Slide
// ==============================

#focus-slide[
  _"No one shall expel us from the paradise_
  _that eigenvalues have created for us."_

  #v(0.3em)
  #set text(size: 0.6em, weight: "regular", fill: palette.muted-ink)
  -- Adapted from David Hilbert
]

// ==============================
// References Slide
// ==============================

== References

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  example-panel([Primary Texts], [
    #set text(size: 0.75em)
    1. *Strang, G.* (2016). _Introduction to Linear Algebra_, 5th ed. Wellesley-Cambridge Press.

    2. *Hoffman, K. & Kunze, R.* (1971). _Linear Algebra_, 2nd ed. Prentice-Hall.

    3. *Trefethen, L. N. & Bau, D.* (1997). _Numerical Linear Algebra_. SIAM.
  ]),
  example-panel([Further Reading], [
    #set text(size: 0.75em)
    4. *Horn, R. A. & Johnson, C. R.* (2012). _Matrix Analysis_, 2nd ed. Cambridge University Press.

    5. *Golub, G. H. & Van Loan, C. F.* (2013). _Matrix Computations_, 4th ed. Johns Hopkins.

    6. *Parlett, B. N.* (1998). _The Symmetric Eigenvalue Problem_. SIAM.
  ]),
)

// ==============================
// Ending Slide
// ==============================

#ending-slide[End of Lecture]
