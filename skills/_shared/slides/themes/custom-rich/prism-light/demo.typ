// Prism Light Theme Demo — Computational Optics & Data Visualization
// Showcases all slide types and 11 components with tech/science content
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"))

#show: prism-light-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [Prism Light -- Computational Optics Lab],
  config-info(
    title: [Computational Optics],
    subtitle: [Spectral Analysis & Real-Time Ray Tracing Algorithms],
    author: [Dr. Elara Fontaine],
    institution: [Institute for Photonic Sciences],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ==========================================
// Title Slide
// ==========================================
#title-slide()

// ==========================================
// Outline
// ==========================================
#outline-slide()

// ==========================================
// Section 1: Fundamentals of Light
// ==========================================
= Fundamentals of Light

== Snell's Law & Refraction

#cols(columns: (1fr, 1fr), gutter: 1.2em,
  spectrum-card([Snell's Law of Refraction], [
    When light passes between media with different refractive indices, the angle changes according to:

    #v(0.3em)
    #std.align(center, mitex(`n_1 \sin\theta_1 = n_2 \sin\theta_2`))
    #v(0.3em)

    This fundamental principle governs all prismatic dispersion and lens design.

    - Crown glass: $n = 1.52$
    - Flint glass: $n = 1.62$
    - Diamond: $n = 2.42$
  ]),
  lens-box([Chromatic Dispersion], [
    Different wavelengths refract at different angles due to material dispersion:

    #v(0.3em)
    #std.align(center, mitex(`n(\lambda) = A + \frac{B}{\lambda^2} + \frac{C}{\lambda^4}`))
    #v(0.3em)

    The Cauchy equation models this relationship for transparent optical materials. Shorter wavelengths (violet) bend more than longer wavelengths (red).
  ]),
)
#speaker-note[Introduce core optical physics. Snell's law is the foundation for everything that follows. Emphasize the wavelength dependence of refractive index.]

== Electromagnetic Spectrum

#stack(
  spacing: 0.8em,
  grid(columns: 4, gutter: 0.8em,
    stat-card([380nm], [Violet], color: palette.violet),
    stat-card([495nm], [Cyan], color: palette.cyan),
    stat-card([570nm], [Green], color: palette.green),
    stat-card([700nm], [Red], color: palette.red),
  ),
  insight-box([Spectral Resolution], [
    Modern spectrometers achieve sub-nanometer resolution using diffraction gratings with 1200+ lines/mm. The resolving power $R = lambda / Delta lambda$ determines the instrument's ability to distinguish adjacent spectral features. Our lab spectrometer achieves $R > 50,000$ across the visible band.
  ]),
  stack(dir: ltr, spacing: 0.5em,
    wavelength-tag([UV], color: palette.violet),
    wavelength-tag([Visible], color: palette.accent-blue),
    wavelength-tag([NIR], color: palette.secondary),
    wavelength-tag([Thermal IR], color: spectrum-color(5)),
  ),
)
#speaker-note[Walk through the visible spectrum wavelengths. These four stat cards represent key reference points. Mention the spectrometer resolution for context on measurement capability.]

// ==========================================
// Section 2: Ray Tracing Algorithms
// ==========================================
= Ray Tracing Algorithms

== Path Tracing Pipeline

#cols[

  #code-card([ray_trace.py -- Core Path Tracer], [
    ```python
    import numpy as np
    from numba import cuda

    @cuda.jit
    def trace_ray(origin, direction, scene, max_depth=8):
        """GPU-accelerated recursive ray tracer."""
        color = np.zeros(3, dtype=np.float32)
        throughput = np.ones(3, dtype=np.float32)
        for bounce in range(max_depth):
            hit = intersect_scene(origin, direction, scene)
            if hit.distance == np.inf:
                color += throughput * sample_environment(direction)
    ```
  ])
][
  #stack(
    spacing: 0.8em,
    text(weight: "bold", fill: palette.primary)[Performance Characteristics],
    grid(columns: 2, gutter: 0.8em,
      focus-card([2.4M], [Rays/second (RTX 4090)], color: palette.primary),
      focus-card([16ms], [Frame latency @ 1080p], color: palette.tertiary),
    ),
    beam-card([Acceleration Structures], [
      BVH (Bounding Volume Hierarchy) reduces intersection tests from $O(n)$ to $O(log n)$:

      - *SAH-based* construction: Surface Area Heuristic
    ]),
  )
]
#speaker-note[Show the actual ray tracing code. The GPU kernel uses recursive bouncing with Russian roulette termination. Highlight the BVH acceleration structure for real-time performance.]

== Spectral Rendering

#cols(
  stack(spacing: 0.8em,
    spectrum-card([Wavelength-Based Rendering], [
      Traditional RGB rendering cannot accurately simulate dispersion, fluorescence, or thin-film interference. Our spectral renderer samples across 32 wavelength bins:

      #v(0.2em)
      #std.align(center, mitex(`L(\lambda) = \int_\Omega f_r(\lambda, \omega_i, \omega_o) \, L_i(\lambda, \omega_i) \, \cos\theta_i \, d\omega_i`))
      #v(0.2em)

      Each ray carries a full spectral power distribution rather than just RGB triplets.
    ]),
    photon-note([Spectral rendering adds only 15% overhead vs RGB when using hero wavelength sampling.]),
  ),
  stack(spacing: 0.8em,
    comparison-table(
      ([Method], [Speed], [Accuracy], [Memory]),
      (
        ([RGB 3-channel], [1.0x], [Limited], [12 B/ray]),
        ([Spectral 8-bin], [1.08x], [Good], [32 B/ray]),
        ([Spectral 32-bin], [1.15x], [Excellent], [128 B/ray]),
        ([Full SPD], [2.1x], [Reference], [512 B/ray]),
      ),
    ),
    stack(dir: ltr, spacing: 0.3em,
      wavelength-tag([Hero Wavelength], color: palette.primary),
      wavelength-tag([MIS], color: palette.tertiary),
    ),
  ),
)
#speaker-note[Explain why spectral rendering matters for physically correct dispersion. The rendering equation is wavelength-dependent. Show the performance comparison table -- hero wavelength sampling is the key optimization.]

// ==========================================
// Section 3: Data Visualization
// ==========================================
= Data Visualization

== Spectral Data Pipelines

#cols(columns: (1.5fr, 1fr),
  code-card([viz_pipeline.py -- Spectral Colormap], [
    ```python
    import matplotlib.pyplot as plt
    import numpy as np
    from colour import wavelength_to_XYZ

    def spectral_colormap(data, wl_range=(380, 780)):
        """Map scalar data to physically-correct
        spectral colors via CIE XYZ."""
        wavelengths = np.linspace(*wl_range, len(data))
        xyz = np.array([wavelength_to_XYZ(w)
                        for w in wavelengths])
        # Convert XYZ to sRGB with gamut clipping
        rgb = xyz_to_srgb(xyz)
        rgb = np.clip(rgb, 0, 1)
        return ListedColormap(rgb)
    ```
  ]),
  stack(spacing: 0.8em,
    beam-card([Perceptually Uniform Colormaps], [
      Rainbow maps distort perceived distance. We enforce:

      + *CIE L\*a\*b\** -- Equal $Delta E$ steps
      + *Monotonic luminance* -- Grayscale-safe
      + *Spectral fidelity* -- Physical wavelengths
      + *CVD variants* -- Red-green accessible
    ]),
    photon-note([Perceptually uniform maps improve feature detection by 23% in user studies.]),
  ),
)
#speaker-note[Data visualization is where optics meets software engineering. Show the Python code for creating physically-correct spectral colormaps. Emphasize perceptual uniformity over rainbow maps.]

== Performance Benchmarks

#stack(
  spacing: 0.8em,
  grid(columns: 3, gutter: 0.8em,
    focus-card([847 fps], [WebGPU Scatter Plot (10M pts)], color: palette.accent-blue),
    focus-card([3.2ms], [GPU Histogram (100M values)], color: palette.tertiary),
    focus-card([12 GB/s], [Streaming Throughput], color: palette.accent-amber),
  ),
  figure(
    comparison-table(
      ([Renderer], [Points], [Latency], [GPU Memory], [Framework]),
      (
        ([Our Engine], [10M], [1.18ms], [480 MB], [WebGPU + WGSL]),
        ([Deck.gl], [5M], [4.2ms], [1.2 GB], [WebGL2]),
        ([Plotly], [500K], [16ms], [320 MB], [WebGL]),
        ([Matplotlib], [100K], [340ms], [2.1 GB], [CPU / Agg]),
      ),
      columns: (1.1fr, 0.7fr, 0.75fr, 1fr, 1.1fr),
      text-size: 0.72em,
    ),
  ),
  refraction-divider(),
)
#speaker-note[Performance matters for real-time scientific visualization. Our WebGPU renderer handles 10M points at interactive rates. Compare against common frameworks to show the improvement factor.]

// ==========================================
// Section 4: Optical System Design
// ==========================================
= Optical System Design

== Lens Optimization

#cols[
  #stack(
    spacing: 0.8em,
    lens-box([Aberration Correction], [
      #stack(
        spacing: .8em,
        [Modern lens systems minimize Seidel aberrations numerically:],
        [#std.align(center, mitex(`W = \sum_{j,m,n} W_{jmn} \, H^j \rho^m \cos^n\phi`))],
        [
          - *Spherical*: $W_040$ -- field-independent
          - *Coma*: $W_131$ -- linear with field height
          - *Astigmatism*: $W_222$ -- quadratic field dependence
          - *Petzval*: $W_220$ -- field curvature
        ],
      )
    ]),
    stack(dir: ltr, spacing: 0.3em,
      wavelength-tag([Zemax], color: palette.primary),
      wavelength-tag([OpticStudio], color: palette.accent-blue),
      wavelength-tag([CodeV], color: palette.tertiary),
    ),
  )
][
  #spectrum-card([Optimization Algorithm], [
    Our lens optimizer uses a damped least-squares approach with automatic variable selection:

    *Objective function:*

    #std.align(center, mitex(`\chi^2 = \sum_i w_i \left(\frac{y_i - f_i(\mathbf{x})}{\sigma_i}\right)^2`))

    *Constraints:*
    - Total track length $< 12 "mm"$
    - Edge thickness $> 0.5 "mm"$
    - Manufacturing tolerance: $plus.minus 5 mu m$
  ])
]

#speaker-note[Optical design uses computational optimization to balance aberrations. The wavefront polynomial expansion describes all possible aberrations. Mention the connection to machine learning optimization.]

== Diffractive Optics

#set text(size: 19pt)
#cols(columns: (1.05fr, 0.95fr), gutter: 1.1em)[
  #stack(
    spacing: 0.8em,
    insight-box([Phase Profile Engineering], [
      DOEs replace bulk optics with thin phase elements. A diffractive lens uses:

      #std.align(center, mitex(`\phi(r) = -\frac{2\pi}{\lambda} \left(\sqrt{r^2 + f^2} - f\right)`))

      Electron-beam lithography reaches sub-100nm features and $> 95%$ diffraction efficiency.
    ]),
    grid(columns: 3, gutter: 0.45em,
      stat-card([16], [Phase Levels], color: palette.primary),
      stat-card([97.2%], [Diffraction], color: palette.tertiary),
      stat-card([50nm], [Min. Feature], color: palette.accent-amber),
    ),
  )
][
  #stack(
    spacing: 0.8em,
    code-card([doe_design.py -- Phase Optimization], [
      ```python
      import numpy as np
      def optimize_doe_phase(target_psf, grid_size=1024):
          phase = np.random.uniform(
              0, 2*np.pi, (grid_size, grid_size))
          for iteration in range(500):
              field = np.exp(1j * phase)
              far_field = np.fft.fft2(field)
              amplitude = np.sqrt(target_psf)
      ```
    ]),
    stack(dir: ltr, spacing: 0.4em,
      wavelength-tag([E-beam Litho], color: palette.primary),
      wavelength-tag([GS Algorithm], color: palette.tertiary),
    ),
  )
]
#set text(size: 20pt)
#speaker-note[Diffractive optics is where wave optics meets nanofabrication. The Gerchberg-Saxton algorithm iterates between spatial and frequency domains. 16-level quantization gives near-continuous phase control.]

// ==========================================
// Focus Slide
// ==========================================

#focus-slide[
  _"We can scarcely avoid the inference that light consists in the transverse undulations of the same medium which is the cause of electric and magnetic phenomena."_

  #text(size: 0.5em, weight: "regular")[-- James Clerk Maxwell, 1862]
]

// ==========================================
// Section 5: Future Directions
// ==========================================
= Future Directions

== Neural Optical Design

#set text(size: 19pt)
#cols(columns: (1fr, 1fr), gutter: 1.2em,
  stack(spacing: 0.8em,
    spectrum-card([Physics-Informed Neural Networks], [
      Differentiable simulation co-optimizes physical optics and computational processing:

      - *Differentiable rays* learn lens surfaces
      - *Neural ISP* compensates aberrations
      - *Metasurfaces* optimize nanostructures
      - *Inverse design* targets AR/VR optics
    ]),
    beam-card([Key Insight], [
      Joint optimization unifies optics and software.
    ]),
  ),
  stack(spacing: 0.8em,
    figure(
      comparison-table(
        ([Approach], [Design Time], [Performance]),
        (
          ([Classical DLS], [2-4 weeks], [Local optimum]),
          ([Genetic Algorithm], [1-2 weeks], [Good exploration]),
          ([Neural + Physics], [2-3 days], [Global + fast]),
          ([Differentiable Optics], [4-8 hours], [Co-optimized]),
        ),
        columns: (1.15fr, 0.8fr, 1fr),
        text-size: 0.72em,
      ),
    ),
    focus-card([100x], [Faster Design Iteration], color: palette.primary),
  ),
)
#set text(size: 20pt)
#speaker-note[Neural optical design is the frontier. Differentiable rendering enables gradient-based optimization of physical systems. This reduces design time from weeks to hours while finding better solutions.]

== Research Roadmap

#stack(
  spacing: 0.8em,
  grid(columns: 3, gutter: 1em,
    spectrum-card([Near-Term (2026)], [
      - Real-time spectral rendering at 4K
      - Neural radiance field integration
      - Adaptive optics wavefront sensing
      - On-chip spectrometer miniaturization
    ]),
    spectrum-card([Mid-Term (2027--28)], [
      - Quantum photonic computing integration
      - Metamaterial flat optics manufacturing
      - Computational ghost imaging systems
      - Attosecond pulse characterization
    ]),
    spectrum-card([Long-Term (2029+)], [
      - Photonic neural networks at scale
      - Room-temperature quantum sensors
      - Light-based AI accelerators
      - Orbital telescope adaptive arrays
    ]),
  ),
  refraction-divider(),
  photon-note([Research priorities are reviewed quarterly and adjusted based on funding, breakthroughs, and collaboration opportunities.]),
)
#speaker-note[Lay out the three time horizons. Near-term is already in progress. Mid-term requires new fabrication capabilities. Long-term is aspirational but grounded in current physics.]

// ==========================================
// Ending Slide
// ==========================================

#ending-slide[Thank You]
