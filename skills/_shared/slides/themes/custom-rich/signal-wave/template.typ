// Signal Wave Theme — Radio/audio waveform aesthetic with flowing sine curves
// and frequency visualizations. Technical data visualization style suitable for
// signal processing, telecommunications, audio engineering, and data science.
// Light theme with deep signal blue primary and warm frequency orange accent.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette ===

#let palette = (
  bg: rgb("#F7F9FC"),            // Cool light gray-blue background
  primary: rgb("#2E5090"),       // Deep signal blue
  secondary: rgb("#E85D3A"),     // Warm frequency orange
  secondary-text: rgb("#B33F25"),// Text-safe frequency orange
  tertiary: rgb("#3A8C6E"),      // Green signal
  text-dark: rgb("#1A2744"),     // Deep navy text
  text-body: rgb("#3D4F6B"),     // Slate blue body text
  card-bg: rgb("#FFFFFF"),       // Card background
  border: rgb("#D8E2F0"),        // Soft blue border
  wave-bg: rgb("#EDF2F9"),       // Light wave fill
  terminal-bg: rgb("#1E2A3F"),   // Terminal code surface
  terminal-title: rgb("#A0B4D0"),// Terminal title text
  terminal-meta: rgb("#7F92AF"), // Terminal metadata text
  terminal-text: rgb("#C8D8EC"), // Terminal body text
  primary-light: rgb("#2E5090").transparentize(85%),
  secondary-light: rgb("#E85D3A").transparentize(85%),
  tertiary-light: rgb("#3A8C6E").transparentize(85%),
)


// === SVG Definitions ===

// 1. Oscilloscope grid — full-page background grid with frequency markers
#let _oscilloscope-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <defs>
    <pattern id="minor-grid" width="48" height="48" patternUnits="userSpaceOnUse">
      <path d="M 48 0 L 0 0 0 48" fill="none" stroke="#2E5090" stroke-width="0.25" opacity="0.06"/>
    </pattern>
    <pattern id="major-grid" width="192" height="192" patternUnits="userSpaceOnUse">
      <rect width="192" height="192" fill="url(#minor-grid)"/>
      <path d="M 192 0 L 0 0 0 192" fill="none" stroke="#2E5090" stroke-width="0.5" opacity="0.1"/>
    </pattern>
  </defs>
  <rect width="960" height="540" fill="url(#major-grid)"/>
  <!-- Frequency axis markers along left -->
  <text x="6" y="90" font-size="6" fill="#2E5090" opacity="0.15" font-family="monospace">1kHz</text>
  <text x="6" y="180" font-size="6" fill="#2E5090" opacity="0.15" font-family="monospace">2kHz</text>
  <text x="6" y="270" font-size="6" fill="#2E5090" opacity="0.15" font-family="monospace">4kHz</text>
  <text x="6" y="360" font-size="6" fill="#2E5090" opacity="0.15" font-family="monospace">8kHz</text>
  <text x="6" y="450" font-size="6" fill="#2E5090" opacity="0.15" font-family="monospace">16kHz</text>
  <!-- Time axis markers along bottom -->
  <text x="190" y="534" font-size="6" fill="#2E5090" opacity="0.12" font-family="monospace">10ms</text>
  <text x="380" y="534" font-size="6" fill="#2E5090" opacity="0.12" font-family="monospace">20ms</text>
  <text x="570" y="534" font-size="6" fill="#2E5090" opacity="0.12" font-family="monospace">30ms</text>
  <text x="760" y="534" font-size="6" fill="#2E5090" opacity="0.12" font-family="monospace">40ms</text>
  <!-- Center crosshair -->
  <line x1="475" y1="270" x2="485" y2="270" stroke="#2E5090" stroke-width="0.4" opacity="0.1"/>
  <line x1="480" y1="265" x2="480" y2="275" stroke="#2E5090" stroke-width="0.4" opacity="0.1"/>
</svg>```.text

// 2. Multi-frequency sine wave overlay — overlapping waveforms at different frequencies/phases
#let _sine-waves-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <!-- Primary sine wave — fundamental frequency -->
  <path d="M0,270 C40,230 80,190 120,200 C160,210 200,260 240,270 C280,280 320,330 360,340 C400,350 440,300 480,270 C520,240 560,190 600,200 C640,210 680,260 720,270 C760,280 800,330 840,340 C880,350 920,300 960,270" fill="none" stroke="#2E5090" stroke-width="1.2" opacity="0.06" stroke-linecap="round"/>
  <!-- Second harmonic — double frequency -->
  <path d="M0,270 C20,250 40,230 60,240 C80,250 100,280 120,290 C140,300 160,280 180,270 C200,260 220,240 240,250 C260,260 280,290 300,290 C320,290 340,270 360,260 C380,250 400,240 420,250 C440,260 460,280 480,270 C500,260 520,240 540,250 C560,260 580,290 600,290 C620,290 640,270 660,260 C680,250 700,240 720,250 C740,260 760,280 780,270 C800,260 820,240 840,250 C860,260 880,290 900,280 C920,270 940,260 960,270" fill="none" stroke="#E85D3A" stroke-width="0.8" opacity="0.05" stroke-linecap="round"/>
  <!-- Third harmonic — triple frequency, subtle -->
  <path d="M0,270 C13,260 27,250 40,255 C53,260 67,275 80,280 C93,285 107,275 120,270 C133,265 147,255 160,260 C173,265 187,280 200,280 C213,280 227,270 240,265 C253,260 267,255 280,260 C293,265 307,275 320,270 C333,265 347,255 360,258 C373,261 387,275 400,278 C413,281 427,272 440,268 C453,264 467,258 480,262 C493,266 507,278 520,278 C533,278 547,268 560,264 C573,260 587,256 600,260 C613,264 627,276 640,278 C653,280 667,272 680,268 C693,264 707,256 720,260 C733,264 747,278 760,278 C773,278 787,268 800,264 C813,260 827,256 840,260 C853,264 867,276 880,275 C893,274 907,266 920,264 C933,262 947,264 960,270" fill="none" stroke="#3A8C6E" stroke-width="0.6" opacity="0.04" stroke-linecap="round"/>
  <!-- Envelope curve — amplitude modulation hint -->
  <path d="M0,220 C120,210 240,200 360,215 C480,230 600,205 720,210 C840,215 900,220 960,215" fill="none" stroke="#2E5090" stroke-width="0.4" opacity="0.03" stroke-dasharray="6,6" stroke-linecap="round"/>
  <path d="M0,320 C120,330 240,340 360,325 C480,310 600,335 720,330 C840,325 900,320 960,325" fill="none" stroke="#2E5090" stroke-width="0.4" opacity="0.03" stroke-dasharray="6,6" stroke-linecap="round"/>
  <!-- Faint grid dots at intersections -->
  <circle cx="120" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="240" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="360" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="480" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="600" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="720" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
  <circle cx="840" cy="270" r="1.5" fill="#2E5090" opacity="0.06"/>
</svg>```.text

// 3. Frequency spectrum bars — vertical bar visualization
#let _spectrum-bars-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 60" preserveAspectRatio="none">
  <rect x="5" y="30" width="6" height="30" fill="#2E5090" opacity="0.4" rx="1"/>
  <rect x="16" y="20" width="6" height="40" fill="#2E5090" opacity="0.5" rx="1"/>
  <rect x="27" y="10" width="6" height="50" fill="#2E5090" opacity="0.7" rx="1"/>
  <rect x="38" y="5" width="6" height="55" fill="#E85D3A" opacity="0.8" rx="1"/>
  <rect x="49" y="12" width="6" height="48" fill="#2E5090" opacity="0.65" rx="1"/>
  <rect x="60" y="18" width="6" height="42" fill="#2E5090" opacity="0.55" rx="1"/>
  <rect x="71" y="25" width="6" height="35" fill="#2E5090" opacity="0.45" rx="1"/>
  <rect x="82" y="15" width="6" height="45" fill="#3A8C6E" opacity="0.6" rx="1"/>
  <rect x="93" y="22" width="6" height="38" fill="#2E5090" opacity="0.5" rx="1"/>
  <rect x="104" y="28" width="6" height="32" fill="#2E5090" opacity="0.4" rx="1"/>
  <rect x="115" y="20" width="6" height="40" fill="#E85D3A" opacity="0.55" rx="1"/>
  <rect x="126" y="32" width="6" height="28" fill="#2E5090" opacity="0.35" rx="1"/>
  <rect x="137" y="35" width="6" height="25" fill="#2E5090" opacity="0.3" rx="1"/>
  <rect x="148" y="38" width="6" height="22" fill="#3A8C6E" opacity="0.4" rx="1"/>
  <rect x="159" y="40" width="6" height="20" fill="#2E5090" opacity="0.25" rx="1"/>
  <rect x="170" y="42" width="6" height="18" fill="#2E5090" opacity="0.2" rx="1"/>
  <rect x="181" y="45" width="6" height="15" fill="#2E5090" opacity="0.15" rx="1"/>
</svg>```.text

// 4. Signal tower / antenna icon
#let _antenna-tower-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 160" preserveAspectRatio="xMidYMid meet">
  <!-- Tower structure -->
  <line x1="60" y1="20" x2="60" y2="155" stroke="#2E5090" stroke-width="2.5" opacity="0.7"/>
  <line x1="60" y1="50" x2="35" y2="155" stroke="#2E5090" stroke-width="1.5" opacity="0.5"/>
  <line x1="60" y1="50" x2="85" y2="155" stroke="#2E5090" stroke-width="1.5" opacity="0.5"/>
  <!-- Cross braces -->
  <line x1="42" y1="90" x2="78" y2="90" stroke="#2E5090" stroke-width="1" opacity="0.4"/>
  <line x1="46" y1="110" x2="74" y2="110" stroke="#2E5090" stroke-width="1" opacity="0.4"/>
  <line x1="39" y1="130" x2="81" y2="130" stroke="#2E5090" stroke-width="1" opacity="0.4"/>
  <!-- Signal emission arcs -->
  <path d="M72,20 C80,15 85,10 88,5" fill="none" stroke="#E85D3A" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <path d="M76,30 C86,24 94,16 100,8" fill="none" stroke="#E85D3A" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <path d="M80,40 C92,32 102,22 112,12" fill="none" stroke="#E85D3A" stroke-width="0.8" opacity="0.25" stroke-linecap="round"/>
  <path d="M48,20 C40,15 35,10 32,5" fill="none" stroke="#E85D3A" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <path d="M44,30 C34,24 26,16 20,8" fill="none" stroke="#E85D3A" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <path d="M40,40 C28,32 18,22 8,12" fill="none" stroke="#E85D3A" stroke-width="0.8" opacity="0.25" stroke-linecap="round"/>
  <!-- Antenna tip -->
  <circle cx="60" cy="16" r="4" fill="#E85D3A" opacity="0.7"/>
  <circle cx="60" cy="16" r="7" fill="none" stroke="#E85D3A" stroke-width="0.8" opacity="0.35"/>
</svg>```.text

// 5. Waveform frame — full border with sine wave integrated (for bookend slides)
#let _waveform-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <!-- Outer border frame -->
  <rect x="16" y="16" width="928" height="508" fill="none" stroke="#2E5090" stroke-width="1.8" opacity="0.5" rx="2"/>
  <!-- Inner border frame -->
  <rect x="24" y="24" width="912" height="492" fill="none" stroke="#2E5090" stroke-width="0.5" opacity="0.2" rx="1"/>
  <!-- Bottom sine wave decoration along frame -->
  <path d="M24,510 C60,500 96,490 132,495 C168,500 204,510 240,510 C276,510 312,500 348,495 C384,490 420,500 456,510 C492,520 528,510 564,505 C600,500 636,495 672,500 C708,505 744,515 780,510 C816,505 852,495 888,498 C924,501 936,505 936,510" fill="none" stroke="#E85D3A" stroke-width="1.2" opacity="0.35" stroke-linecap="round"/>
  <!-- Top sine wave decoration along frame -->
  <path d="M24,30 C60,35 96,40 132,37 C168,34 204,28 240,30 C276,32 312,38 348,40 C384,42 420,36 456,30 C492,24 528,30 564,34 C600,38 636,42 672,38 C708,34 744,26 780,30 C816,34 852,40 888,37 C924,34 936,32 936,30" fill="none" stroke="#2E5090" stroke-width="1" opacity="0.3" stroke-linecap="round"/>
  <!-- Corner frequency dots -->
  <circle cx="24" cy="24" r="3" fill="#2E5090" opacity="0.5"/>
  <circle cx="936" cy="24" r="3" fill="#2E5090" opacity="0.5"/>
  <circle cx="24" cy="516" r="3" fill="#E85D3A" opacity="0.5"/>
  <circle cx="936" cy="516" r="3" fill="#E85D3A" opacity="0.5"/>
  <!-- Signal strength indicators (top-right) -->
  <rect x="890" y="32" width="3" height="8" fill="#2E5090" opacity="0.3" rx="0.5"/>
  <rect x="896" y="28" width="3" height="12" fill="#2E5090" opacity="0.35" rx="0.5"/>
  <rect x="902" y="24" width="3" height="16" fill="#2E5090" opacity="0.4" rx="0.5"/>
  <rect x="908" y="20" width="3" height="20" fill="#E85D3A" opacity="0.5" rx="0.5"/>
</svg>```.text

// 6. Sine wave divider — decorative horizontal separator
#let _wave-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 24" preserveAspectRatio="none">
  <path d="M0,12 C20,6 40,4 60,8 C80,12 100,18 120,16 C140,14 160,8 180,6 C200,4 220,10 240,12 C260,14 280,18 300,16 C320,14 340,6 360,8 C380,10 400,12 400,12" fill="none" stroke="#2E5090" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M0,12 C25,16 50,20 75,16 C100,12 125,6 150,8 C175,10 200,16 225,18 C250,20 275,14 300,12 C325,10 350,8 375,10 C390,11 400,12 400,12" fill="none" stroke="#E85D3A" stroke-width="0.8" opacity="0.3" stroke-linecap="round"/>
  <!-- Phase markers -->
  <circle cx="60" cy="8" r="2" fill="#2E5090" opacity="0.4"/>
  <circle cx="180" cy="6" r="2" fill="#2E5090" opacity="0.4"/>
  <circle cx="300" cy="16" r="2" fill="#E85D3A" opacity="0.4"/>
</svg>```.text

// 7. Pulse/heartbeat line — sharp peaks
#let _pulse-line-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 30" preserveAspectRatio="none">
  <path d="M0,15 L30,15 L40,15 L50,5 L55,25 L60,3 L65,27 L70,15 L80,15 L120,15 L130,15 L140,6 L145,24 L150,4 L155,26 L160,15 L170,15 L210,15 L220,15 L230,7 L235,23 L240,5 L245,25 L250,15 L260,15 L300,15" fill="none" stroke="#E85D3A" stroke-width="1.5" opacity="0.6" stroke-linecap="round" stroke-linejoin="round"/>
  <!-- Baseline glow -->
  <line x1="0" y1="15" x2="300" y2="15" stroke="#2E5090" stroke-width="0.5" opacity="0.15"/>
</svg>```.text

// 8. Static noise pattern — scattered dots for noise effect
#let _noise-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
  <circle cx="5" cy="8" r="0.8" fill="#2E5090" opacity="0.3"/>
  <circle cx="12" cy="3" r="0.6" fill="#3D4F6B" opacity="0.25"/>
  <circle cx="20" cy="10" r="0.9" fill="#2E5090" opacity="0.2"/>
  <circle cx="28" cy="5" r="0.7" fill="#E85D3A" opacity="0.2"/>
  <circle cx="35" cy="12" r="0.6" fill="#3D4F6B" opacity="0.3"/>
  <circle cx="8" cy="20" r="0.7" fill="#2E5090" opacity="0.25"/>
  <circle cx="16" cy="25" r="0.8" fill="#3A8C6E" opacity="0.2"/>
  <circle cx="25" cy="18" r="0.6" fill="#2E5090" opacity="0.3"/>
  <circle cx="33" cy="22" r="0.9" fill="#3D4F6B" opacity="0.2"/>
  <circle cx="3" cy="32" r="0.6" fill="#2E5090" opacity="0.2"/>
  <circle cx="10" cy="35" r="0.8" fill="#E85D3A" opacity="0.15"/>
  <circle cx="18" cy="30" r="0.7" fill="#2E5090" opacity="0.25"/>
  <circle cx="27" cy="37" r="0.6" fill="#3D4F6B" opacity="0.2"/>
  <circle cx="35" cy="33" r="0.7" fill="#3A8C6E" opacity="0.2"/>
  <circle cx="38" cy="38" r="0.5" fill="#2E5090" opacity="0.15"/>
</svg>```.text


// === Background Atmosphere ===

/// Persistent background for content slides — subtle oscilloscope grid + sine waves
#let _bg-atmosphere() = {
  place(top + left, image(bytes(_oscilloscope-grid-svg), width: 100%, height: 100%))
  place(top + left, image(bytes(_sine-waves-svg), width: 100%, height: 100%))
}


// === Reusable Components ===

/// frequency-card — Card with waveform SVG header decoration
#let frequency-card(title, body) = {
  stack(spacing: 0pt,
    block(
      width: 100%,
      fill: palette.primary,
      inset: (x: 0.8em, y: 0.5em),
      radius: (top: 4pt),
    )[
      #stack(
        dir: ltr,
        spacing: 0.4em,
        box(image(bytes(_spectrum-bars-svg), width: 60pt, height: 12pt)),
        text(size: 0.8em, weight: "bold", fill: palette.card-bg, title),
      )
    ],
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: (left: 1pt + palette.primary, right: 1pt + palette.border, bottom: 1pt + palette.border),
      inset: (x: 0.8em, y: 0.6em),
      radius: (bottom: 4pt),
    )[
      #set text(size: 0.75em, fill: palette.text-body)
      #body
      #lazy-v(1fr)
    ],
  )
}

/// spectrum-box — Box with frequency bar decoration on left side
#let spectrum-box(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border,
    inset: (left: 1em, right: 0.7em, y: 0.5em),
    radius: 4pt,
  )[
    #place(left + horizon,
      image(bytes(_spectrum-bars-svg), width: 6pt, height: 40pt))
    #stack(
      spacing: 0.8em,
      text(size: 0.8em, weight: "bold", fill: palette.primary, title),
      {
        set text(size: 0.75em, fill: palette.text-body)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// signal-tag — Small inline tag with wave accent
#let signal-tag(label) = {
  box(
    fill: palette.primary-light,
    inset: (x: 0.5em, y: 0.2em),
    radius: 3pt,
    baseline: 2pt,
  )[
    #text(size: 0.65em, weight: "medium", fill: palette.primary)[
      #box(baseline: 1pt, image(bytes(_wave-divider-svg), width: 10pt, height: 6pt))
      #h(0.2em)
      #label
    ]
  ]
}

/// wave-divider — SVG sine wave divider between content sections
#let wave-divider() = {
  block(
    width: 100%,
    inset: (y: 0.4em),
    image(bytes(_wave-divider-svg), width: 100%, height: 10pt),
  )
}

/// stat-card — Metric display with oscillating wave accent
#let stat-card(value, label) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border,
    inset: (x: 0.7em, y: 0.5em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      image(bytes(_pulse-line-svg), width: 60pt, height: 8pt),
      text(size: 1.6em, weight: "bold", fill: palette.primary, value),
      text(size: 0.65em, fill: palette.text-body, label),
      lazy-v(1fr),
    )
  ]
}

/// code-block — Terminal-style code container with signal header
#let code-block(title, body) = {
  stack(spacing: 0pt,
    block(
      width: 100%,
      fill: palette.text-dark,
      inset: (x: 0.8em, y: 0.35em),
      radius: (top: 4pt),
    )[
      #grid(columns: (auto, 1fr, auto), column-gutter: 6pt,
        {
          // Terminal dots
          box(inset: (y: 2pt))[
            #box(circle(radius: 3pt, fill: palette.secondary))
            #h(3pt)
            #box(circle(radius: 3pt, fill: palette.tertiary))
            #h(3pt)
            #box(circle(radius: 3pt, fill: palette.primary))
          ]
        },
        text(size: 0.65em, fill: palette.terminal-title, weight: "medium", title),
        text(size: 0.55em, fill: palette.terminal-meta, font: "Menlo")[signal],
      )
    ],
    block(
      width: 100%,
      fill: palette.terminal-bg,
      stroke: (left: 1pt + palette.primary.transparentize(50%), right: 1pt + palette.terminal-bg, bottom: 1pt + palette.terminal-bg),
      inset: (x: 0.8em, y: 0.5em),
      radius: (bottom: 4pt),
    )[
      #set text(size: 0.7em, fill: palette.terminal-text, font: "Menlo")
      #body
      #lazy-v(1fr)
    ],
  )
}

/// channel-card — Multi-channel style card with parallel line accent
#let channel-card(title, body) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 0.8pt + palette.border,
    inset: 0pt,
    radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      block(inset: (x: 0.8em, top: 0.5em, bottom: 0.3em), width: 100%)[
        #grid(columns: (auto, 1fr), column-gutter: 8pt,
          // Three parallel channel lines
          box(inset: (y: 3pt))[
            #grid(rows: (auto, auto, auto), row-gutter: 3pt,
              line(length: 16pt, stroke: 1.2pt + palette.primary),
              line(length: 16pt, stroke: 1.2pt + palette.secondary),
              line(length: 16pt, stroke: 1.2pt + palette.tertiary),
            )
          ],
          text(size: 0.8em, weight: "bold", fill: palette.text-dark, title),
        )
      ],
      block(width: 100%, inset: (x: 0.8em, bottom: 0.5em))[
        #set text(size: 0.75em, fill: palette.text-body)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// insight-box — Callout with signal dot accent
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.wave-bg,
    stroke: (left: 3pt + palette.secondary),
    inset: (left: 0.8em, right: 0.7em, y: 0.5em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 6pt,
        // Pulsing dot
        box(circle(radius: 4pt, fill: palette.secondary)),
        text(size: 0.8em, weight: "bold", fill: palette.secondary-text, title),
      ),
      [
        #set text(size: 0.75em, fill: palette.text-body)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// comparison-table — Data table with subtle oscilloscope grid styling
#let comparison-table(align: center + horizon, headers, rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.card-bg }
      else if calc.odd(row) { palette.wave-bg } else { palette.card-bg },
    stroke: (_, row) => (bottom: if row == 0 { 1.5pt + palette.primary } else { 0.5pt + palette.border }, rest: none),
    inset: (x: 0.6em, y: 0.35em),
    align: align,
    table.header(
      ..headers.map(h => {
        set text(size: 0.7em, weight: "bold", fill: palette.primary)
        h
      })
    ),
    ..rows.map(row => {
      row.map(cell => {
        set text(size: 0.68em, fill: palette.text-body)
        cell
      })
    }).flatten(),
  )
}

/// pulse-card — Card with pulse/heartbeat line at top
#let pulse-card(title, body) = {
  stack(spacing: 0pt,
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: (top: 1pt + palette.border, left: 1pt + palette.border, right: 1pt + palette.border),
      inset: (x: 0.5em, top: 0.3em),
      radius: (top: 4pt),
    )[
      #image(bytes(_pulse-line-svg), width: 100%, height: 10pt)
    ],
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: (left: 1pt + palette.border, right: 1pt + palette.border, bottom: 1pt + palette.border),
      inset: (x: 0.8em, y: 0.5em),
      radius: (bottom: 4pt),
    )[
      #stack(
        spacing: .8em,
        text(size: 0.8em, weight: "bold", fill: palette.text-dark, title),
        {
          set text(size: 0.75em, fill: palette.text-body)
          body
        },
        lazy-v(1fr),
      )
    ],
  )
}

/// noise-note — Borderless note with static noise pattern icon
#let noise-note(body) = {
  block(
    width: 100%,
    inset: (x: 0.6em, y: 0.4em),
  )[
    #grid(columns: (auto, 1fr), column-gutter: 8pt,
      box(width: 20pt, height: 20pt, clip: true,
        image(bytes(_noise-pattern-svg), width: 20pt, height: 20pt)
      ),
      {
        set text(size: 0.7em, fill: palette.text-body, style: "italic")
        body
      },
    )
  ]
}


// === Slide Functions ===

/// slide — Main content slide with oscilloscope atmosphere background
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.2em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      line(length: 100%, stroke: 0.8pt + palette.border),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-body, size: 0.55em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        box(baseline: 1pt, image(bytes(_wave-divider-svg), width: 40pt, height: 6pt))
      },
      {
        set std.align(right)
        context { text(fill: palette.primary, size: 0.85em, weight: "medium")[#utils.slide-counter.display() / #utils.last-slide-number] }
      }
    )
  }
  let setting(body) = {
    _bg-atmosphere()
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, repeat: auto, ..args)
})

/// title-slide — Full waveform frame with antenna towers (bookend slide)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Waveform frame (bookend element)
    place(top + left, image(bytes(_waveform-frame-svg), width: 100%, height: 100%))
    // Sine wave atmosphere
    place(top + left, image(bytes(_sine-waves-svg), width: 100%, height: 100%))
    // Antenna tower (left side, bookend element)
    place(left + bottom, dx: 36pt, dy: -30pt, image(bytes(_antenna-tower-svg), width: 40pt, height: 70pt))
    // Antenna tower (right side, smaller, bookend element)
    place(right + top, dx: -50pt, dy: 40pt, image(bytes(_antenna-tower-svg), width: 28pt, height: 50pt))
    // Main content
    set std.align(left + horizon)
    pad(left: 5em, right: 4em, y: 3em)[
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: palette.text-dark, info.title),
        image(bytes(_spectrum-bars-svg), width: 120pt, height: 16pt),
        {
          if info.subtitle != none {
            text(size: 1em, fill: palette.text-body, info.subtitle)
          }
        },
        {
          stack(
            dir: ltr,
            spacing: 1.5em,
            if info.author != none {
              text(size: 0.8em, fill: palette.primary, weight: "medium", info.author)
            },
            if info.date != none {
              text(size: 0.7em, fill: palette.text-body)[#utils.display-info-date(self)]
            },
          )
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide — Section divider with waveform accent
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Background grid (subtle)
    place(top + left, image(bytes(_oscilloscope-grid-svg), width: 100%, height: 100%))
    // Left accent band
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // In-flow section content keeps Touying's content-height diagnostics accurate.
    std.align(left + horizon,
      pad(left: 4em, right: 8em)[
        #stack(
          spacing: .8em,
          text(size: 0.65em, fill: palette.primary, tracking: 2pt, weight: "medium", upper[Section]),
          {
            set text(size: 2em, weight: "semibold", fill: palette.text-dark)
            utils.display-current-heading(level: 1, numbered: false)
          },
          image(bytes(_wave-divider-svg), width: 200pt, height: 12pt),
        )
      ]
    )
    // Spectrum bars on right side
    place(right + bottom, dx: -3em, dy: -2em,
      image(bytes(_spectrum-bars-svg), width: 100pt, height: 50pt)
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide — Centered emphasis text with wave atmosphere
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Sine wave overlay on dark bg
    place(top + left, image(bytes(_sine-waves-svg.replace("opacity=\"0.06\"", "opacity=\"0.12\"").replace("opacity=\"0.05\"", "opacity=\"0.1\"").replace("opacity=\"0.04\"", "opacity=\"0.08\"")), width: 100%, height: 100%))
    set text(fill: white, size: 1.5em, weight: "bold")
    std.align(horizon + center,
      block(width: 100%, inset: (x: 1em))[#body])
  }
  touying-slide(self: self, main-body)
})

/// ending-slide — Bookend with waveform frame and antenna towers, matching title-slide
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Waveform frame (bookend element — matches title slide)
    place(top + left, image(bytes(_waveform-frame-svg), width: 100%, height: 100%))
    // Sine wave atmosphere
    place(top + left, image(bytes(_sine-waves-svg), width: 100%, height: 100%))
    // Antenna tower bottom-left (bookend element)
    place(left + bottom, dx: 36pt, dy: -30pt, image(bytes(_antenna-tower-svg), width: 40pt, height: 70pt))
    // Antenna tower right (bookend element)
    place(right + top, dx: -50pt, dy: 40pt, image(bytes(_antenna-tower-svg), width: 28pt, height: 50pt))
    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      #stack(
        spacing: .8em,
        image(bytes(_spectrum-bars-svg), width: 100pt, height: 18pt),
        text(size: 1.8em, weight: "bold", fill: palette.text-dark, body),
        image(bytes(_wave-divider-svg), width: 160pt, height: 10pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// outline-slide — Table of contents with signal styling
#let outline-slide(title: [Outline]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: (x: 4em, y: 2.5em)),
  )
  let main-body = {
    _bg-atmosphere()
    set std.align(left + top)
    stack(
      spacing: .8em,
      text(size: 1.4em, weight: "bold", fill: palette.text-dark, title),
      image(bytes(_wave-divider-svg), width: 140pt, height: 8pt),
      {
        set text(size: 0.85em, fill: palette.text-body)
        outline(title: none, depth: 1)
      },
    )
  }
  touying-slide(self: self, main-body)
})


// === Theme Entry Point ===

#let signal-wave-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 2.7em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.primary,
      neutral-lightest: palette.bg,
      neutral-darkest: palette.text-dark,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
    ),
    ..args,
  )

  body
}
