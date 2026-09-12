#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("neon")

#show: kinetic-theme.with(
  aspect-ratio: "16-9",
  preset: "neon",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Every Element Implies Motion],
    subtitle: [A kinetic approach to presentation design],
    author: [Motion Lab Studio],
    date: datetime.today(),
    institution: [KINETIC STUDIO],
  ),
)

// ===== Cover =====

#title-slide()

#speaker-note[
  Welcome to the Kinetic Studio. This presentation demonstrates how every visual element can imply motion -- diagonal energy, overlapping layers, and velocity-driven composition.
]

// ============================================================
// Slide 1 -- Dark slide: Motion Data with ghost + stats
// ============================================================

#dark-slide(
  title: none,
  ghost: [01],
  ghost-dy: -20pt,
  ghost-dx: -10pt,
  ghost-size: 240pt,
  header-left: [MOTION DATA],
  header-right: [KINETIC 2025],
)[
  #ghost-streak([MOVE], copies: 5, dx: 380pt, dy: -10pt)

  #text(size: 40pt, weight: "black")[Motion is the message.]

  #v(0.2em)

  #velocity-kicker[FRAME ANALYSIS \/\/ REAL-TIME METRICS]

  #v(0.5em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 20pt,
    block(width: 100%)[
      #counter-block([24], [FRAMES PER SECOND])
      #v(0.3em)
      #text(size: 10pt, fill: pal.ink-muted)[
        The threshold of perceived smoothness. Below this, the eye detects discrete frames.
      ]
    ],
    block(width: 100%)[
      #counter-block([360], [DEGREES OF FREEDOM])
      #v(0.3em)
      #text(size: 10pt, fill: pal.ink-muted)[
        Full rotational space. Every axis available for kinetic expression and trajectory.
      ]
    ],
    block(width: 100%)[
      #counter-block([100%], [KINETIC ENERGY])
      #v(0.3em)
      #text(size: 10pt, fill: pal.ink-muted)[
        Maximum energy state. No element at rest. Even stillness implies a paused frame.
      ]
    ],
  )

  #v(0.5em)

  #speed-line(length: 100%, thickness: 2pt)
]

#speaker-note[
  Opening data slide. Three core metrics establish our kinetic vocabulary: frame rate as smoothness threshold, degrees of freedom as expressive range, and kinetic energy as design state. The ghost streak in the background reinforces the motion theme.
]

// ============================================================
// Slide 2 -- Axes of Motion with angle cards + decorative lines
// ============================================================

== Three Axes of Motion

#velocity-kicker[DESIGN PRINCIPLES \/\/ MOTION VOCABULARY]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
  block(width: 100%)[
    #place(top + right, dx: 4pt, dy: -4pt,
      text(size: 56pt, weight: "black", fill: pal.ink-ghost, font: "IBM Plex Mono", [01]),
    )
    #angle-card([Velocity], [
      Speed determines hierarchy.
      Faster elements draw attention.
      Deceleration signals rest.
      The eye follows the fastest object.
    ])
    #v(0.3em)
    #speed-line(length: 80pt, thickness: 2pt)
  ],
  block(width: 100%)[
    #place(top + right, dx: 4pt, dy: -4pt,
      text(size: 56pt, weight: "black", fill: pal.ink-ghost, font: "IBM Plex Mono", [02]),
    )
    #angle-card([Direction], [
      Diagonals create energy.
      Every line implies trajectory.
      No static compositions allowed.
      Horizontal means dead.
    ])
    #v(0.3em)
    #speed-line(length: 60pt, thickness: 2pt, color: pal.secondary)
  ],
  block(width: 100%)[
    #place(top + right, dx: 4pt, dy: -4pt,
      text(size: 56pt, weight: "black", fill: pal.ink-ghost, font: "IBM Plex Mono", [03]),
    )
    #angle-card([Overlap], [
      Layers create depth.
      Elements in motion overlap.
      Collision is composition.
      Depth is time made visible.
    ])
    #v(0.3em)
    #speed-line(length: 40pt, thickness: 2pt, color: pal.accent-light)
  ],
)

#speaker-note[
  Three axes define our motion language. Velocity controls attention hierarchy -- faster elements dominate. Direction creates energy -- diagonals over horizontals, always. Overlap implies depth -- when elements collide, time becomes spatial.
]

// ============================================================
// Slide 3 -- Performance Dashboard with data rows and bars
// ============================================================

== Performance Dashboard

#velocity-kicker[QUARTERLY METRICS \/\/ Q4 2025]

#v(0.2em)

#cols(columns: (1fr, 1fr), gutter: 28pt)[
  #stack(
    spacing: .8em,
    [#text(size: 14pt, weight: "bold", fill: pal.ink)[Rendering Pipeline]],
    [#data-row([Frame Rate], [60 fps])],
    [#data-row([Render Time], [16.7 ms])],
    [#data-row([Motion Blur], [Enabled])],
    [#data-row([Resolution], [3840 x 2160])],
    [#data-row([Color Depth], [10-bit HDR])],
    [#data-row([Refresh Sync], [Adaptive])],
    [
      #block(
        width: 100%,
        stroke: (left: 2pt + pal.accent),
        inset: (left: 0.8em, y: 0.3em),
      )[
        #text(size: 10pt, fill: pal.ink-muted)[
          All metrics captured at peak kinetic load.
          Thermal throttling within 2% of baseline.
        ]
      ]
    ],
  )
][
  #stack(
    spacing: .8em,
    [#text(size: 14pt, weight: "bold", fill: pal.ink)[System Utilization]],
    [
      #stack(
        spacing: .8em,
        text(size: 11pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[GPU UTILIZATION],
        progress-bar(0.87),
        grid(columns: (1fr, auto),
          text(size: 9pt, fill: pal.ink-muted)[Shader cores saturated],
          text(size: 9pt, weight: "bold", fill: pal.ink)[87%],
        ),
      )
    ],
    [
      #stack(
        spacing: .8em,
        text(size: 11pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[CPU UTILIZATION],
        progress-bar(0.54),
        grid(columns: (1fr, auto),
          text(size: 9pt, fill: pal.ink-muted)[Physics simulation thread],
          text(size: 9pt, weight: "bold", fill: pal.ink)[54%],
        ),
      )
    ],
    [
      #stack(
        spacing: .8em,
        text(size: 11pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[MEMORY BANDWIDTH],
        progress-bar(0.72),
        grid(columns: (1fr, auto),
          text(size: 9pt, fill: pal.ink-muted)[Texture streaming active],
          text(size: 9pt, weight: "bold", fill: pal.ink)[72%],
        ),
      )
    ],
    [
      #stack(
        spacing: .8em,
        text(size: 11pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[THERMAL HEADROOM],
        progress-bar(0.35),
        grid(columns: (1fr, auto),
          text(size: 9pt, fill: pal.ink-muted)[Cooling capacity nominal],
          text(size: 9pt, weight: "bold", fill: pal.secondary)[35%],
        ),
      )
    ],
  )
]

#speaker-note[
  Performance dashboard showing the rendering pipeline specifications and system utilization. Left column: discrete metrics as data rows. Right column: continuous metrics as gradient progress bars. The accent-to-secondary gradient on bars reinforces brand energy.
]

// ============================================================
// Slide 4 -- Impact slide: STATIC vs KINETIC split
// ============================================================

#impact-slide(
  left-content: [
    #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.bg.transparentize(10%), font: "IBM Plex Mono")[THE OLD WAY]
    #v(0.4em)
    #text(size: 2.4em, weight: "black")[STATIC]
    #v(0.3em)
    #text(size: 0.85em, weight: "regular")[
      Centered layouts. \
      Symmetric grids. \
      Predictable flow. \
      Dead on arrival.
    ]
    #v(0.5em)
    #block(width: 60pt, height: 2pt, fill: pal.bg.transparentize(20%))
    #v(0.2em)
    #text(size: 9pt, fill: pal.bg.transparentize(15%))[
      Zero kinetic energy. The eye wanders without purpose.
    ]
  ],
  right-content: [
    #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: "IBM Plex Mono")[THE KINETIC WAY]
    #v(0.4em)
    #text(size: 2.4em, weight: "black")[KINETIC]
    #v(0.3em)
    #text(size: 0.85em, weight: "regular")[
      Diagonal composition. \
      Asymmetric splits. \
      Dynamic energy. \
      Always in motion.
    ]
    #v(0.5em)
    #tag[PREFERRED]
    #h(0.3em)
    #tag(color: pal.secondary)[ACTIVE]
    #h(0.3em)
    #tag(color: pal.ink-muted)[60FPS]
    #v(0.3em)
    #text(size: 9pt, fill: pal.ink-muted)[
      Maximum kinetic energy. Every element directed with intent.
    ]
  ],
)

#speaker-note[
  The impact slide uses a dramatic split composition. Left panel in accent color represents the static approach -- dead, predictable, symmetric. Right panel represents the kinetic approach -- diagonal, asymmetric, alive. The split itself embodies the principle.
]

// ============================================================
// Slide 5 -- Section divider
// ============================================================

= Frame by Frame

#speaker-note[
  Section transition. We move from principles to process -- examining the timeline of motion, frame by frame.
]

// ============================================================
// Slide 6 -- Ticker: Motion Timeline with frame numbers
// ============================================================

#ticker-slide(
  title: [Motion Timeline],
  header-left: [TICKER],
  header-right: [KINETIC 2025],
)[
  #velocity-kicker[SEQUENCE ANALYSIS \/\/ 24-FRAME CYCLE]

  #v(0.3em)

  #grid(columns: (auto, 1fr, auto, 1fr, auto, 1fr), column-gutter: 12pt,
    frame-number(1),
    block(width: 100%, inset: (y: 0.3em))[
      #text(weight: "bold", size: 14pt)[Keyframe]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-muted)[Initial position established. All elements at rest. Potential energy at maximum.]
      #v(0.2em)
      #tag[START]
    ],
    frame-number(12),
    block(width: 100%, inset: (y: 0.3em))[
      #text(weight: "bold", size: 14pt)[Acceleration]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-muted)[Motion blur activates. Diagonal trajectories begin. Elements gain velocity vectors.]
      #v(0.2em)
      #tag(color: pal.secondary)[EASING-IN]
    ],
    frame-number(24),
    block(width: 100%, inset: (y: 0.3em))[
      #text(weight: "bold", size: 14pt)[Peak Velocity]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-muted)[Maximum kinetic energy. Elements overlap and collide. Composition is pure motion.]
      #v(0.2em)
      #tag[PEAK] #h(0.2em) #tag(color: pal.secondary)[BLUR]
    ],
  )

  #v(0.4em)

  #speed-line(length: 100%, thickness: 2pt)

  #v(0.3em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[EASING FUNCTION]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-light)[cubic-bezier(0.4, 0, 0.2, 1)]
    ],
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[DURATION]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-light)[1000ms / 24 frames]
    ],
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[MOTION PATH]
      #v(0.1em)
      #text(size: 11pt, fill: pal.ink-light)[Diagonal: 45deg NE]
    ],
  )
]

#speaker-note[
  Timeline view of a single motion cycle. Three keyframes -- rest, acceleration, peak. Frame numbers rendered in oversized mono to evoke video editing timelines. Speed line spans full width as visual separator. Technical specs below anchor the creative concepts in precise values.
]

// ============================================================
// Slide 7 -- Technology Stack with split grid and tags
// ============================================================

== Technology Stack

#velocity-kicker[INFRASTRUCTURE \/\/ ENGINE ARCHITECTURE]

#v(0.2em)

#split-grid(
  [
    #stack(
      spacing: .8em,
      [#text(weight: "bold", size: 18pt)[Rendering Engine]],
      [#tag[GPU] #h(0.3em) #tag(color: pal.secondary)[REAL-TIME] #h(0.3em) #tag(color: pal.ink-muted)[v4.2]],
      [
        #text(size: 13pt, fill: pal.ink-light)[
          Hardware-accelerated motion rendering with
          sub-millisecond frame timing. Adaptive quality
          scaling based on display refresh rate.
        ]
      ],
      [#kinetic-rule(width: 80pt)],
      [
        #cols(columns: (1fr, 1fr), gutter: 12pt)[
          #stack(
            spacing: .8em,
            text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[SHADER CORES],
            text(size: 20pt, weight: "black", fill: pal.ink)[4,096],
          )
        ][
          #stack(
            spacing: .8em,
            text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[CLOCK SPEED],
            text(size: 20pt, weight: "black", fill: pal.ink)[2.1 GHz],
          )
        ]
      ],
    )
  ],
  [
    #stack(
      spacing: .8em,
      [#text(weight: "bold", size: 18pt)[Composition Layer]],
      [#tag[VECTOR] #h(0.3em) #tag(color: pal.secondary)[PROCEDURAL] #h(0.3em) #tag(color: pal.ink-muted)[v2.8]],
      [
        #text(size: 13pt, fill: pal.ink-light)[
          Procedural generation of motion paths with
          easing functions. Bezier curves for natural
          acceleration and deceleration profiles.
        ]
      ],
      [#kinetic-rule(width: 80pt)],
      [
        #cols(columns: (1fr, 1fr), gutter: 12pt)[
          #stack(
            spacing: .8em,
            text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[PATHS / FRAME],
            text(size: 20pt, weight: "black", fill: pal.ink)[512],
          )
        ][
          #stack(
            spacing: .8em,
            text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[BEZIER POINTS],
            text(size: 20pt, weight: "black", fill: pal.ink)[16K],
          )
        ]
      ],
    )
  ],
)

#speaker-note[
  Technology architecture split into two domains: rendering engine on the left and composition layer on the right. Tags categorize capabilities. The accent divider bar physically separates concerns while the gradient kinetic rules echo motion energy within each panel.
]

// ============================================================
// Slide 8 -- Dark slide: Motion Principles Manifesto
// ============================================================

#dark-slide(
  title: none,
  ghost: [FPS],
  ghost-dy: -30pt,
  ghost-dx: -20pt,
  ghost-size: 180pt,
  header-left: [MANIFESTO],
  header-right: [KINETIC PRINCIPLES],
)[
  #ghost-streak([VELOCITY], copies: 4, dx: 300pt, dy: 180pt)

  #text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.ink-muted, font: "IBM Plex Mono")[THE FIVE LAWS OF KINETIC DESIGN]

  #v(0.3em)

  #text(size: 30pt, weight: "black")[Every pixel earns its velocity.]

  #v(0.4em)

  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    block(width: 100%)[
      #block(
        width: 100%,
        fill: pal.ink.transparentize(88%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: pal.ink)[01 -- No element at rest]
        #v(0.2em)
        #text(size: 10pt, fill: pal.ink-muted)[
          Even static elements must imply potential motion through angle, position, or context.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        fill: pal.ink.transparentize(88%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: pal.ink)[02 -- Direction over decoration]
        #v(0.2em)
        #text(size: 10pt, fill: pal.ink-muted)[
          A diagonal line communicates more than any gradient or shadow ever could.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        fill: pal.ink.transparentize(88%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: pal.ink)[03 -- Overlap is depth]
        #v(0.2em)
        #text(size: 10pt, fill: pal.ink-muted)[
          When elements collide, time becomes spatial. Z-axis is the fourth dimension.
        ]
      ]
    ],
    block(width: 100%)[
      #block(
        width: 100%,
        fill: pal.ink.transparentize(88%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: pal.ink)[04 -- Speed is hierarchy]
        #v(0.2em)
        #text(size: 10pt, fill: pal.ink-muted)[
          The fastest element commands attention. Slow elements recede into background.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        fill: pal.ink.transparentize(88%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: pal.ink)[05 -- Stillness is tension]
        #v(0.2em)
        #text(size: 10pt, fill: pal.ink-muted)[
          A paused frame is not rest -- it is maximum potential energy waiting to release.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        stroke: (left: 2pt + pal.accent),
        inset: (left: 0.8em, y: 0.4em),
      )[
        #text(size: 10pt, style: "italic", fill: pal.ink-muted)[
          "Motion is not what you add. It is what you reveal was always there."
        ]
      ]
    ],
  )
]

#speaker-note[
  Five laws of kinetic design presented on dark ground. Two-column layout with semi-transparent surface cards. Each law is a constraint that generates creative energy. The closing quote connects philosophy to practice.
]

// ============================================================
// Slide 9 -- Comparison: Frame Rate Analysis
// ============================================================

== Frame Rate Analysis

#velocity-kicker[BENCHMARK DATA \/\/ COMPARATIVE STUDY]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 14pt,
  block(width: 100%)[
    #block(width: 100%, fill: pal.surface, inset: (x: 0.6em, y: 0.5em))[
      #text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.ink-muted, font: "IBM Plex Mono")[12 FPS]
      #v(0.2em)
      #text(size: 28pt, weight: "black", fill: pal.ink)[Choppy]
      #v(0.2em)
      #progress-bar(0.2)
      #v(0.2em)
      #text(size: 9pt, fill: pal.ink-muted)[
        Perceivable frames. Slideshow effect. No motion blur possible.
      ]
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.surface, inset: (x: 0.6em, y: 0.5em))[
      #text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.ink-muted, font: "IBM Plex Mono")[24 FPS]
      #v(0.2em)
      #text(size: 28pt, weight: "black", fill: pal.ink)[Cinematic]
      #v(0.2em)
      #progress-bar(0.4)
      #v(0.2em)
      #text(size: 9pt, fill: pal.ink-muted)[
        Film standard. Motion blur masks frame gaps. Acceptable baseline.
      ]
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.surface, inset: (x: 0.6em, y: 0.5em))[
      #text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.accent, font: "IBM Plex Mono")[60 FPS]
      #v(0.2em)
      #text(size: 28pt, weight: "black", fill: pal.accent)[Smooth]
      #v(0.2em)
      #progress-bar(0.75)
      #v(0.2em)
      #text(size: 9pt, fill: pal.ink-muted)[
        Interactive standard. Responsive to input. Kinetic design baseline.
      ]
      #v(0.1em)
      #tag[TARGET]
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.surface, inset: (x: 0.6em, y: 0.5em))[
      #text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.secondary, font: "IBM Plex Mono")[120 FPS]
      #v(0.2em)
      #text(size: 28pt, weight: "black", fill: pal.secondary)[Fluid]
      #v(0.2em)
      #progress-bar(1.0)
      #v(0.2em)
      #text(size: 9pt, fill: pal.ink-muted)[
        Perceptual ceiling. Maximum smoothness. Diminishing returns beyond.
      ]
      #v(0.1em)
      #tag(color: pal.secondary)[IDEAL]
    ]
  ],
)

#v(0.2em)

#kinetic-rule(width: 100%, thickness: 2pt)

#v(0.2em)

#grid(columns: (1fr, auto), column-gutter: 16pt,
  text(size: 10pt, fill: pal.ink-muted)[
    Benchmark conditions: 3840x2160 resolution, full-scene motion blur enabled, adaptive VSync active.
  ],
  text(size: 9pt, weight: "bold", fill: pal.ink-muted, font: "IBM Plex Mono")[REF: KIN-BENCH-2025],
)

#speaker-note[
  Comparative frame rate analysis. Four tiers from choppy to fluid, each with a progress bar indicating relative quality. The accent color highlights 60fps as our target baseline. Secondary color marks the ideal. Tags reinforce key states visually.
]

// ============================================================
// Slide 10 -- Focus slide: Closing statement
// ============================================================

#focus-slide[
  #stack(
    spacing: .8em,
    motion-blur-text([Every element implies motion.]),
    [Stillness is just a paused frame.],
  )
]

#speaker-note[
  Final kinetic statement. The paradox of kinetic design: even stillness implies motion. A paused frame contains all the energy of the frames before and after it. This is design that refuses to be static.
]

// ===== Ending =====

#ending-slide[Thank You]

#speaker-note[
  End of presentation. The motion continues beyond this frame. Thank you for being part of the kinetic energy.
]
