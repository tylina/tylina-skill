#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Arial", "PingFang SC"), size: 18pt)

#show: signal-wave-theme.with(
  aspect-ratio: "16-9",
  footer: [Signal Processing Workshop 2026],
  config-info(
    title: [Digital Signal Processing: From Theory to Implementation],
    subtitle: [Foundations of Modern DSP Systems],
    author: [Dr. Elena Vasquez -- Signal Systems Lab],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
  config-common(breakable: false),
)

#title-slide()

#speaker-note[Welcome everyone to today's workshop on Digital Signal Processing. We'll cover core concepts from Fourier analysis through practical implementation.]

#outline-slide()

#speaker-note[Preview the workshop's three-part progression: fundamentals, implementation, and advanced topics.]

= Fundamentals

== Signal Representation

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  frequency-card[Time Domain][
    A continuous signal $x(t)$ can be sampled at rate $f_s$ to produce discrete samples $x[n]$:

    #v(0.3em)
    #signal-tag[Nyquist] #signal-tag[Sampling] #signal-tag[ADC]
    #v(0.3em)

    Sampling theorem requires $f_s >= 2 f_"max"$ to avoid aliasing artifacts.
  ],
  frequency-card[Frequency Domain][
    The Discrete Fourier Transform maps time to frequency:

    #v(0.3em)
    #mitex(`X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j2\pi kn/N}`)
    #v(0.3em)

    Each bin $k$ represents frequency $f_k = k f_s / N$ Hz.
  ],
)

#v(0.5em)

#noise-note[Note: All examples use real-valued signals. Complex baseband representations are covered in Section 3.]

#speaker-note[Start with the fundamentals. Time and frequency are dual representations of the same information.]

== Core Transforms

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true,
  stat-card[1024][FFT Points],
  stat-card[44.1 kHz][Sample Rate],
  stat-card[< 2ms][Latency],
)

#wave-divider()

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  insight-box[Key Insight][
    The FFT reduces DFT complexity from $O(N^2)$ to $O(N log N)$. For $N = 1024$: over 100x speedup. This makes real-time spectral analysis feasible.
  ],
  pulse-card[Algorithm Variants][
    - *Radix-2 FFT* -- Power-of-2 lengths, butterfly ops
    - *Split-Radix* -- Optimal multiply count
    - *Bluestein's* -- Arbitrary-length DFT via convolution
    - *Goertzel* -- Single-bin detection (DTMF)
  ],
)

#speaker-note[The FFT is the workhorse algorithm. Real-time audio typically uses radix-2 with 512 to 4096 point transforms.]

== Fourier Analysis

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  channel-card[Continuous Fourier Transform][
    #mitex(`\mathcal{F}\{x(t)\} = \int_{-\infty}^{\infty} x(t) e^{-j2\pi ft} \, dt`)

    #v(0.3em)
    Properties:
    - Linearity: $cal(F){a x + b y} = a X + b Y$
    - Time shift: $x(t - t_0) arrow.r X(f) e^(-j 2 pi f t_0)$
    - Convolution: $x * h arrow.r X dot H$
  ],
  channel-card[Discrete Fourier Transform][
    #mitex(`X[k] = \sum_{n=0}^{N-1} x[n] W_N^{kn}, \quad W_N = e^{-j2\pi/N}`)

    #v(0.3em)
    Inverse transform:
    #mitex(`x[n] = \frac{1}{N} \sum_{k=0}^{N-1} X[k] W_N^{-kn}`)

    Resolution: $Delta f = f_s / N$
  ],
)

#speaker-note[The continuous and discrete transforms share the same mathematical structure. The DFT is what we compute in practice.]

= Implementation

== Python Signal Processing Pipeline

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  code-block[fft_analysis.py][
    ```python
    import numpy as np
    from scipy.fft import fft, fftfreq

    # Generate test signal
    fs = 44100  # Sample rate
    t = np.linspace(0, 1, fs)
    # Two-tone signal
    signal = (0.7 * np.sin(2*np.pi*440*t)
            + 0.3 * np.sin(2*np.pi*880*t))

    # Compute FFT
    N = len(signal)
    yf = fft(signal)
    xf = fftfreq(N, 1/fs)[:N//2]
    magnitude = 2/N * np.abs(yf[:N//2])
    ```
  ],
  code-block[filter_design.py][
    ```python
    from scipy.signal import (
        butter, filtfilt, freqz
    )

    # Design 4th-order Butterworth
    # bandpass: 300-3400 Hz (voice)
    nyq = fs / 2
    low = 300 / nyq
    high = 3400 / nyq
    b, a = butter(4, [low, high],
                  btype='band')

    # Zero-phase filtering
    filtered = filtfilt(b, a, signal)

    # Frequency response
    w, h = freqz(b, a, worN=2048)
    ```
  ],
)

#speaker-note[These code examples demonstrate the typical workflow: generate or acquire a signal, transform to frequency domain, apply filtering, analyze results.]

== System Architecture

#cols(columns: (1fr, 1fr), gutter: 16pt,
  spectrum-box[Processing Chain][
    *Input Stage*
    - ADC: 24-bit, 96 kHz capable
    - Anti-aliasing filter: 8th order elliptic
    - Buffer: Ring buffer, 2048 samples

    *DSP Core*
    - Windowing (Hann/Blackman-Harris)
    - Overlap-add FFT convolution
    - Spectral modification engine

    *Output Stage*
    - IFFT reconstruction
    - DAC: 24-bit output
    - Crossfade: 64-sample overlap
  ],
  [
    #insight-box[Design Constraint][
      Total pipeline latency must stay below 10ms for live monitoring. At 48 kHz with 512-point FFT: latency = 512/48000 = 10.7ms. Solution: use 256-point with 50% overlap.
    ]

    #figure[
      #comparison-table(
        ([Parameter], [Value], [Unit]),
        (
          ([Sample Rate], [48000], [Hz]),
          ([FFT Size], [256], [points]),
          ([Overlap], [50], [%]),
          ([Hop Size], [128], [samples]),
          ([Latency], [5.3], [ms]),
          ([Throughput], [7.5], [MFLOPS]),
        ),
      )
    ]
  ]
)

#speaker-note[Architecture decisions are driven by the latency budget. The overlap-add method lets us process in blocks while maintaining continuity.]

== Filter Performance Benchmarks
#comparison-table(
  ([Filter Type], [Order], [Passband Ripple], [Stopband Atten.], [Group Delay], [CPU Cycles]),
  (
    ([Butterworth], [8], [0.0 dB (maximally flat)], [-48 dB], [Constant], [142]),
    ([Chebyshev I], [6], [0.5 dB], [-60 dB], [Variable], [108]),
    ([Chebyshev II], [6], [0.0 dB], [-60 dB], [Variable], [108]),
    ([Elliptic], [4], [0.1 dB], [-80 dB], [Highly variable], [96]),
    ([Bessel], [10], [0.0 dB], [-30 dB], [Linear phase], [180]),
    ([FIR (Parks-McClellan)], [64], [Equiripple], [-70 dB], [Exactly linear], [640]),
  ),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt,
  signal-tag[IIR], signal-tag[FIR], signal-tag[Adaptive],
)

#speaker-note[Filter selection is always a tradeoff. IIR filters are computationally cheap but have nonlinear phase. FIR guarantees linear phase at the cost of higher order.]

= Advanced Topics

== Spectral Estimation Methods

#cols(columns: (1fr, 1fr), gutter: 16pt, lazy-layout: true,
  frequency-card[Parametric Methods][
    *Autoregressive (AR) Model:*
    #mitex(`x[n] = -\sum_{k=1}^{p} a_k x[n-k] + e[n]`)

    #v(0.2em)
    - Yule-Walker equations for coefficient estimation
    - Model order selection via AIC/BIC criteria
    - Excellent frequency resolution for short data

    #v(0.2em)
    #signal-tag[Burg] #signal-tag[Levinson] #signal-tag[MUSIC]
  ],
  frequency-card[Non-Parametric Methods][
    *Welch's Method:*
    - Segment signal into overlapping blocks
    - Apply window to each segment
    - Average periodograms

    #v(0.2em)
    #mitex(`\hat{S}(f) = \frac{1}{KLU} \sum_{i=0}^{K-1} \left| \sum_{n=0}^{L-1} w[n] x_i[n] e^{-j2\pi fn} \right|^2`)

    #v(0.2em)
    Variance reduction: $"Var" prop 1/K$
  ],
)

#speaker-note[Parametric vs non-parametric is a fundamental choice. Parametric methods assume a model structure, giving better resolution with fewer samples.]

== Adaptive Filtering

#cols(columns: (1fr, 1fr), gutter: 16pt,
  {
    pulse-card[LMS Algorithm][
      The Least Mean Squares algorithm adapts filter weights iteratively:

      #v(0.2em)
      #mitex(`\mathbf{w}[n+1] = \mathbf{w}[n] + \mu \cdot e[n] \cdot \mathbf{x}[n]`)
      #v(0.2em)

      Where $mu$ is the step size controlling convergence vs. stability tradeoff.
    ]
    v(0.5em)
    noise-note[Step size bounds: $0 < mu < 2 / (N dot P_x)$ where $P_x$ is input signal power.]
  },
  {
    stat-card[-45 dB][Noise Cancellation]
    v(0.5em)
    channel-card[Applications][
      - *Echo cancellation* -- Telephony, conferencing
      - *Active noise control* -- Headphones, vehicles
      - *Channel equalization* -- Wireless comms
      - *System identification* -- Unknown plant modeling
      - *Beamforming* -- Antenna arrays, microphone arrays
    ]
  },
)

#speaker-note[Adaptive filters are essential for environments where the signal statistics change over time. LMS is the simplest but NLMS and RLS offer faster convergence.]

== Modulation Techniques

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true,
  stat-card[64-QAM][Modulation],
  stat-card[6 bit/sym][Spectral Eff.],
  stat-card[24 dB][Required SNR],
)

#wave-divider()

#cols(columns: (1fr, 1fr), gutter: 16pt,
  spectrum-box[Digital Modulation Overview][
    Signal representation:
    #mitex(`s(t) = A(t) \cos(2\pi f_c t + \phi(t))`)

    Constellation mapping determines bits-per-symbol and noise resilience. Higher-order schemes (16/64/256-QAM) increase throughput but require better SNR.
  ],
  comparison-table(
    ([Scheme], [Bits/Sym], [BER @ 10dB]),
    (
      ([BPSK], [1], [$3.8 times 10^(-6)$]),
      ([QPSK], [2], [$3.8 times 10^(-6)$]),
      ([16-QAM], [4], [$1.2 times 10^(-3)$]),
      ([64-QAM], [6], [$8.5 times 10^(-2)$]),
    ),
  ),
)

#speaker-note[Modulation is where signal processing meets communications. The fundamental tradeoff is always spectral efficiency versus noise tolerance.]

== Real-Time DSP Platform

#cols(columns: (1fr, 1fr), gutter: 16pt,
  code-block[dsp_core.py][
    ```python
    import sounddevice as sd
    import queue

    class DSPEngine:
        def __init__(self, fs=48000,
                     block=256):
            self.fs = fs
            self.block = block
            self.q = queue.Queue()

        def callback(self, indata,
                     outdata, frames,
                     time, status):
            # Apply processing chain
            x = indata[:, 0]
            X = np.fft.rfft(x)
            # Spectral gate
            mag = np.abs(X)
            mask = mag > self.threshold
            Y = X * mask
            outdata[:, 0] = np.fft.irfft(Y)
    ```
  ],
  {
    insight-box[Performance Critical][
      Real-time audio callback must complete within one buffer period. At 48 kHz / 256 samples = 5.3ms deadline. Any overrun causes audible glitches (buffer underflow).
    ]
    v(0.5em)
    pulse-card[Optimization Strategies][
      - Pre-allocate all buffers (zero malloc in callback)
      - Use SIMD intrinsics for vectorized FFT
      - Lock memory pages (prevent swap)
      - Thread priority: SCHED_FIFO / realtime
    ]
  },
)

#speaker-note[Real-time DSP has hard timing constraints. Unlike batch processing, you cannot exceed the buffer deadline even once without audible artifacts.]

// Focus slide for key takeaway
#focus-slide[
  Signal processing is the art of\
  extracting information from noise.
]

#speaker-note[This is the central philosophy. Every technique we've discussed is ultimately about improving signal-to-noise ratio in some domain.]

#ending-slide[
  Thank You -- Questions?
]

#speaker-note[Open the floor for questions. Be prepared to discuss implementation details, algorithm selection criteria, and real-world deployment challenges.]
