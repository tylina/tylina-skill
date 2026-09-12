// Pulse Grid Theme — Heartbeat monitor / oscilloscope grid aesthetic
// Light backgrounds with phosphor-green trace waveforms, grid patterns, digital readout panels
// Features: ECG pulse lines, oscilloscope grids, signal traces, vital-signs display layouts
// Perfect for tech/science presentations, data analysis, research findings
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg: rgb("#F8F9FA"),
  card-bg: rgb("#FFFFFF"),
  text: rgb("#1E293B"),
  text-muted: rgb("#64748B"),
  primary: rgb("#10B981"),
  primary-dark: rgb("#059669"),
  secondary: rgb("#3B82F6"),
  alert: rgb("#F59E0B"),
  alert-red: rgb("#EF4444"),
  grid-line: rgb("#10B981"),
  grid-faint: rgb("#E2E8F0"),
  border: rgb("#CBD5E1"),
  panel-bg: rgb("#F1F5F9"),
  trace-glow: rgb("#10B981"),
  primary-ink: rgb("#047857"),
  secondary-ink: rgb("#1D4ED8"),
  alert-ink: rgb("#92400E"),
  alert-red-ink: rgb("#B91C1C"),
)

#let _accent-ink(accent) = if accent == palette.primary or accent == palette.primary-dark {
  palette.primary-ink
} else if accent == palette.secondary {
  palette.secondary-ink
} else if accent == palette.alert {
  palette.alert-ink
} else if accent == palette.alert-red {
  palette.alert-red-ink
} else {
  accent.darken(32%)
}


// === SVG Definitions ===

// Full-page oscilloscope grid background (fine lines with major divisions)
#let _oscilloscope-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect width="840" height="474" fill="none"/>
  <path d="M0,47.4 H840 M0,94.8 H840 M0,142.2 H840 M0,189.6 H840 M0,237 H840 M0,284.4 H840 M0,331.8 H840 M0,379.2 H840 M0,426.6 H840" fill="none" stroke="#10B981" stroke-width="0.4" opacity="0.12"/>
  <path d="M84,0 V474 M168,0 V474 M252,0 V474 M336,0 V474 M420,0 V474 M504,0 V474 M588,0 V474 M672,0 V474 M756,0 V474" fill="none" stroke="#10B981" stroke-width="0.4" opacity="0.12"/>
  <path d="M0,118.5 H840 M0,237 H840 M0,355.5 H840" fill="none" stroke="#10B981" stroke-width="0.8" opacity="0.18"/>
  <path d="M210,0 V474 M420,0 V474 M630,0 V474" fill="none" stroke="#10B981" stroke-width="0.8" opacity="0.18"/>
  <circle cx="210" cy="118.5" r="2" fill="#10B981" opacity="0.25"/>
  <circle cx="420" cy="118.5" r="2" fill="#10B981" opacity="0.25"/>
  <circle cx="630" cy="118.5" r="2" fill="#10B981" opacity="0.25"/>
  <circle cx="210" cy="237" r="2.5" fill="#10B981" opacity="0.3"/>
  <circle cx="420" cy="237" r="2.5" fill="#10B981" opacity="0.3"/>
  <circle cx="630" cy="237" r="2.5" fill="#10B981" opacity="0.3"/>
  <circle cx="210" cy="355.5" r="2" fill="#10B981" opacity="0.25"/>
  <circle cx="420" cy="355.5" r="2" fill="#10B981" opacity="0.25"/>
  <circle cx="630" cy="355.5" r="2" fill="#10B981" opacity="0.25"/>
</svg>```.text

// ECG heartbeat pulse waveform trace for decorative borders/dividers
#let _ecg-pulse-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="24" viewBox="0 0 300 24">
  <path d="M0,12 H40 L48,12 L52,4 L56,20 L60,2 L64,22 L68,10 L74,12 H120 L128,12 L132,4 L136,20 L140,2 L144,22 L148,10 L154,12 H200 L208,12 L212,4 L216,20 L220,2 L224,22 L228,10 L234,12 H300" fill="none" stroke="#10B981" stroke-width="1.8" opacity="0.7" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="60" cy="2" r="2.5" fill="#10B981" opacity="0.5"/>
  <circle cx="140" cy="2" r="2.5" fill="#10B981" opacity="0.5"/>
  <circle cx="220" cy="2" r="2.5" fill="#10B981" opacity="0.5"/>
  <circle cx="0" cy="12" r="2" fill="#10B981" opacity="0.6"/>
  <circle cx="300" cy="12" r="2" fill="#3B82F6" opacity="0.6"/>
</svg>```.text

// Monitor frame -- oscilloscope-style border for title/ending slides (bookend)
#let _monitor-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="20" y="14" width="800" height="446" rx="4" ry="4" fill="none" stroke="#10B981" stroke-width="2" opacity="0.6"/>
  <rect x="28" y="22" width="784" height="430" rx="2" ry="2" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.25"/>
  <path d="M20,40 H8 V14 H46" fill="none" stroke="#10B981" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="20" cy="14" r="4" fill="#10B981" opacity="0.8"/>
  <circle cx="8" cy="40" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <circle cx="46" cy="14" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <path d="M820,40 H832 V14 H794" fill="none" stroke="#10B981" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="820" cy="14" r="4" fill="#10B981" opacity="0.8"/>
  <circle cx="832" cy="40" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <circle cx="794" cy="14" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <path d="M20,434 H8 V460 H46" fill="none" stroke="#10B981" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="20" cy="460" r="4" fill="#10B981" opacity="0.8"/>
  <circle cx="8" cy="434" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <circle cx="46" cy="460" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <path d="M820,434 H832 V460 H794" fill="none" stroke="#10B981" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="820" cy="460" r="4" fill="#10B981" opacity="0.8"/>
  <circle cx="832" cy="434" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <circle cx="794" cy="460" r="2.5" fill="#3B82F6" opacity="0.5"/>
  <path d="M370,14 H420 L430,6 H470" fill="none" stroke="#10B981" stroke-width="1.2" opacity="0.4"/>
  <path d="M370,460 H420 L430,468 H470" fill="none" stroke="#10B981" stroke-width="1.2" opacity="0.4"/>
  <circle cx="370" cy="14" r="2" fill="#10B981" opacity="0.5"/>
  <circle cx="470" cy="14" r="2" fill="#10B981" opacity="0.5"/>
  <circle cx="370" cy="460" r="2" fill="#10B981" opacity="0.5"/>
  <circle cx="470" cy="460" r="2" fill="#10B981" opacity="0.5"/>
</svg>```.text

// Signal peak indicator -- small inline waveform pulse
#let _signal-peak-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="20" viewBox="0 0 120 20">
  <path d="M0,10 H25 L35,3 L45,17 L55,3 L65,17 L75,10 H120" fill="none" stroke="#10B981" stroke-width="1.5" opacity="0.8" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="0" cy="10" r="2.5" fill="#10B981" opacity="0.8"/>
  <circle cx="55" cy="3" r="2" fill="#10B981" opacity="0.6"/>
  <circle cx="120" cy="10" r="2.5" fill="#3B82F6" opacity="0.7"/>
</svg>```.text

// Crosshair marker for decorative grid intersections
#let _crosshair-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
  <line x1="12" y1="0" x2="12" y2="24" stroke="#10B981" stroke-width="1" opacity="0.5"/>
  <line x1="0" y1="12" x2="24" y2="12" stroke="#10B981" stroke-width="1" opacity="0.5"/>
  <circle cx="12" cy="12" r="3" fill="none" stroke="#10B981" stroke-width="1.2" opacity="0.6"/>
  <circle cx="12" cy="12" r="1.2" fill="#10B981" opacity="0.7"/>
</svg>```.text

// Waveform baseline divider with single signal spike
#let _baseline-wave-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="16" viewBox="0 0 400 16">
  <path d="M0,8 H120 L135,8 L145,2 L155,14 L165,1 L175,15 L185,8 H280 L290,8 L295,4 L300,12 L305,4 L310,12 L315,8 H400" fill="none" stroke="#10B981" stroke-width="1.5" opacity="0.6" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="0" cy="8" r="2" fill="#10B981" opacity="0.7"/>
  <circle cx="165" cy="1" r="2" fill="#10B981" opacity="0.5"/>
  <circle cx="400" cy="8" r="2" fill="#3B82F6" opacity="0.6"/>
  <circle cx="200" cy="8" r="1.5" fill="#10B981" opacity="0.3"/>
  <circle cx="100" cy="8" r="1.5" fill="#10B981" opacity="0.3"/>
  <circle cx="350" cy="8" r="1.5" fill="#3B82F6" opacity="0.2"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render the oscilloscope grid background
#let oscilloscope-grid-bg() = {
  image(bytes(_oscilloscope-grid-svg), width: 100%, height: 100%)
}

/// Render monitor frame overlay (bookend for title/ending)
#let monitor-frame() = {
  image(bytes(_monitor-frame-svg), width: 100%, height: 100%)
}

/// Render ECG pulse divider
#let ecg-pulse(width: 100%, color: palette.primary) = {
  let svg = _ecg-pulse-svg.replace("#10B981", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 16pt))
}

/// Render signal peak decoration
#let signal-peak(width: 80pt) = {
  box(width: width, image(bytes(_signal-peak-svg), width: width, height: 14pt))
}

/// Render crosshair marker
#let crosshair-marker(size: 16pt) = {
  box(width: size, height: size, image(bytes(_crosshair-svg), width: size, height: size))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides -- oscilloscope grid + corner markers
#let _content-atmosphere() = {
  // Faint oscilloscope grid across entire slide
  place(top + left, box(width: 100%, height: 100%, oscilloscope-grid-bg()))
  // Corner crosshair markers
  place(top + right, dx: -1.4em, dy: 0.7em,
    crosshair-marker(size: 16pt))
  place(bottom + left, dx: 1.4em, dy: -0.7em,
    circle(radius: 2.5pt, fill: palette.secondary.transparentize(80%)))
  place(bottom + right, dx: -2.2em, dy: -1.2em,
    circle(radius: 2pt, fill: palette.primary.transparentize(85%)))
}


// === 1. Slide Functions ===

/// Standard content slide -- light bg, oscilloscope grid atmosphere, green/blue accents
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.6em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // ECG pulse line under title
      ecg-pulse(width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Green pulse dot
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    _content-atmosphere()
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
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- monitor frame, oscilloscope grid, centered data display
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Oscilloscope grid background
    place(top + left, box(width: 100%, height: 100%, oscilloscope-grid-bg()))
    // Monitor frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, monitor-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
        std.align(center, ecg-pulse(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary-ink, weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.text, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.primary-ink, utils.display-info-date(self))
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  touying-slide(self: self, body)
})

/// New section slide -- left green accent bar, signal peak, section title
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Oscilloscope grid
    place(top + left, box(width: 100%, height: 100%, oscilloscope-grid-bg()))
    // Left accent bar -- phosphor green
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Right side decorative nodes
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 4pt, fill: palette.primary.transparentize(40%)))
    place(top + right, dx: -5em, dy: 4em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(50%)))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number with green accent
      #text(size: 3.5em, fill: palette.primary-ink, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Signal peak decoration
      #signal-peak(width: 100pt)
      #v(0.4em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- dark charcoal background with glowing green text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Dark charcoal background (oscilloscope screen)
    place(top + left, block(width: 100%, height: 100%, fill: palette.text))
    // Oscilloscope grid (more visible on dark)
    place(top + left, box(width: 100%, height: 100%, oscilloscope-grid-bg()))
    // Corner nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(30%)))
    // Keep the focal statement in normal flow so Touying can measure it.
    set std.align(center + horizon)
    block(width: 72%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        { set text(fill: palette.primary, size: 1.4em, weight: "bold"); body },
        ecg-pulse(width: 180pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- light bg with monitor frame (bookend), oscilloscope grid, farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Oscilloscope grid
    place(top + left, box(width: 100%, height: 100%, oscilloscope-grid-bg()))
    // Monitor frame (bookend -- shared with title slide)
    place(top + left, box(width: 100%, height: 100%, monitor-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        ecg-pulse(width: 200pt),
        text(size: 2.4em, weight: "bold", fill: palette.text, body),
        block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Readout card -- digital display panel with monospace values, like a monitoring readout
#let readout-card(title, value, unit: none, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      title,
      [
        #set text(fill: _accent-ink(accent), size: 1.8em, weight: "bold", font: "IBM Plex Mono")
        #stack(dir: ltr, spacing: 4pt,
          value,
          if unit != none {
            text(fill: palette.text-muted, size: 0.9em, weight: "medium", unit)
          },
        )
        // Top-right status dot
        #place(top + right, dx: -6pt, dy: 6pt,
          box(width: 6pt, height: 6pt, radius: 3pt, fill: accent.transparentize(40%)))
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Trace box -- content box with waveform bottom border decoration
#let trace-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 4pt, fill: accent),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      { set text(fill: palette.text, size: 0.82em); body },
      ecg-pulse(width: 100%, color: accent),
      lazy-v(1fr),
    )
  ]
}

/// Signal tag -- status indicator capsule with glowing dot
#let signal-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: _accent-ink(color), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Monitor card -- multi-value data display panel with labeled readings
#let monitor-card(title, readings, accent: palette.primary) = {
  let rows = readings.map(((label, val)) => stack(dir: ltr, spacing: 8pt,
    text(fill: palette.text-muted, size: 0.72em, weight: "medium", label + ":"),
    text(fill: _accent-ink(accent), size: 0.82em, weight: "bold", font: "IBM Plex Mono", val),
  ))
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.5em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 4pt, fill: accent),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      ..rows,
      lazy-v(1fr),
    )
  ]
}

/// Baseline divider -- waveform separator line
#let baseline-divider(color: palette.primary, width: 80%) = {
  let svg = _baseline-wave-svg.replace("#10B981", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 12pt)))
}

/// Vital stat -- KPI display with pulse animation feel
#let vital-stat(label, value, trend: none, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-muted, size: 0.72em)
    // Inline signal peak hint
    #place(top + right, dx: -4pt, dy: 4pt, signal-peak(width: 40pt))
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: _accent-ink(color), size: 1.8em, weight: "bold")
        #stack(
          spacing: .8em,
          value,
          if trend != none {
            text(fill: palette.text-muted, size: 0.65em, weight: "medium", trend)
          },
        )
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Channel card -- labeled data channel with header band
#let channel-card(channel-id, title, body, accent: palette.secondary) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #stack(spacing: 0pt,
      // Channel header band
      block(fill: accent.lighten(85%), width: 100%, inset: (x: 0.8em, y: 0.4em))[
        #stack(dir: ltr, spacing: 6pt,
          text(fill: _accent-ink(accent), size: 0.7em, weight: "bold", font: "IBM Plex Mono", "CH:" + channel-id),
          text(fill: palette.text, size: 0.8em, weight: "semibold", title),
        )
      ],
      // Channel body
      block(fill: palette.card-bg, width: 100%, inset: (x: 0.8em, y: 0.6em))[
        #set text(fill: palette.text, size: 0.8em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Spectrum grid -- multi-item frequency display in a grid layout
#let spectrum-grid(items, columns: 3, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.panel-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #grid(columns: (1fr,) * columns, column-gutter: 0.8em, row-gutter: 0.6em,
      ..items.map(item => {
        block(
          width: 100%,
          fill: palette.card-bg,
          stroke: (left: 2pt + accent, rest: 1pt + palette.grid-faint),
          inset: (x: 0.6em, y: 0.4em),
          radius: 2pt,
        )[
          #stack(
            spacing: .8em,
            text(fill: palette.text-muted, size: 0.65em, item.at("label")),
            text(fill: _accent-ink(accent), size: 0.95em, weight: "bold", font: "IBM Plex Mono", item.at("value")),
          )
        ]
      })
    )
    #lazy-v(1fr)
  ]
}

/// Alert box -- warning/critical content with colored border and icon indicator
#let alert-box(title, body, level: "warning") = {
  let accent = if level == "critical" { palette.alert-red } else { palette.alert }
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 4pt + accent, rest: 1pt + accent.transparentize(60%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 1pt, fill: accent),
        text(weight: "bold", fill: _accent-ink(accent), size: 0.92em, title),
      ),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(50%), radius: 1pt),
      { set text(fill: palette.text, size: 0.82em); body },
      lazy-v(1fr),
    )
  ]
}

/// Log entry -- timestamped observation record
#let log-entry(timestamp, event, detail: none, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 2pt + accent, rest: 1pt + palette.grid-faint),
    inset: (x: 0.8em, y: 0.5em),
    radius: 2pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        text(fill: _accent-ink(accent), size: 0.7em, weight: "bold", font: "IBM Plex Mono", timestamp),
        text(fill: palette.text, size: 0.8em, weight: "semibold", event),
      ),
      if detail != none {
        text(fill: palette.text-muted, size: 0.72em, detail)
      },
      lazy-v(1fr),
    )
  ]
}

/// Pulse divider component -- ECG-based separator
#let pulse-divider(color: palette.primary, width: 80%) = {
  std.align(center, box(width: width, ecg-pulse(width: 100%, color: color)))
}


// === 3. Theme Entry Point ===

#let pulse-grid-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
  show raw: set text(font: "IBM Plex Mono")
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary-ink,
      neutral-lightest: palette.card-bg,
      neutral-darkest: palette.text,
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
