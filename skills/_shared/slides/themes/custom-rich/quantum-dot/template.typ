// Quantum Dot Theme — Quantum computing circuits and orbital pattern aesthetics
// Light backgrounds with deep navy/indigo text, electric violet primary, cyan secondary
// Features: quantum circuit wires, gate boxes, Bloch sphere coordinates, orbital clouds
// Abstract, precise, and futuristic — IBM Quantum meets physics textbook diagrams
// Perfect for tech/science presentations, research talks, innovation showcases
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct — Rich Theme) ===

#let palette = (
  bg: rgb("#F8F7FC"),
  primary: rgb("#7C3AED"),
  secondary: rgb("#06B6D4"),
  secondary-ink: rgb("#087C8C"),
  text: rgb("#1E1B4B"),
  text-muted: rgb("#6366A0"),
  card-bg: rgb("#FFFFFF"),
  accent-purple: rgb("#A78BFA"),
  accent-indigo: rgb("#4338CA"),
  light-violet: rgb("#EDE9FE"),
  light-cyan: rgb("#ECFEFF"),
  border: rgb("#C4B5FD"),
)


// === SVG Definitions ===

// Full-page quantum circuit diagram background — horizontal wires with gate placeholders
#let _quantum-circuit-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M0,80 H840" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.12"/>
  <path d="M0,160 H840" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.10"/>
  <path d="M0,240 H840" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.08"/>
  <path d="M0,320 H840" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.10"/>
  <path d="M0,400 H840" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.12"/>
  <rect x="120" y="70" width="20" height="20" rx="2" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.15"/>
  <rect x="300" y="150" width="20" height="20" rx="2" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.12"/>
  <rect x="500" y="230" width="20" height="20" rx="2" fill="none" stroke="#7C3AED" stroke-width="0.8" opacity="0.10"/>
  <rect x="680" y="310" width="20" height="20" rx="2" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.13"/>
  <rect x="200" y="310" width="20" height="20" rx="2" fill="none" stroke="#7C3AED" stroke-width="0.8" opacity="0.10"/>
  <rect x="420" y="70" width="20" height="20" rx="2" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.12"/>
  <rect x="600" y="150" width="20" height="20" rx="2" fill="none" stroke="#7C3AED" stroke-width="0.8" opacity="0.11"/>
  <rect x="750" y="390" width="20" height="20" rx="2" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.10"/>
  <circle cx="130" cy="80" r="2" fill="#7C3AED" opacity="0.20"/>
  <circle cx="310" cy="160" r="2" fill="#06B6D4" opacity="0.18"/>
  <circle cx="510" cy="240" r="2" fill="#7C3AED" opacity="0.15"/>
  <circle cx="690" cy="320" r="2" fill="#06B6D4" opacity="0.18"/>
  <circle cx="430" cy="80" r="1.5" fill="#06B6D4" opacity="0.20"/>
  <circle cx="610" cy="160" r="1.5" fill="#7C3AED" opacity="0.15"/>
  <circle cx="210" cy="320" r="1.5" fill="#7C3AED" opacity="0.17"/>
  <circle cx="760" cy="400" r="1.5" fill="#06B6D4" opacity="0.15"/>
  <path d="M130,80 V160" fill="none" stroke="#4338CA" stroke-width="0.5" opacity="0.10" stroke-dasharray="3,3"/>
  <path d="M510,240 V320" fill="none" stroke="#4338CA" stroke-width="0.5" opacity="0.08" stroke-dasharray="3,3"/>
  <path d="M690,320 V400" fill="none" stroke="#4338CA" stroke-width="0.5" opacity="0.10" stroke-dasharray="3,3"/>
</svg>```.text

// Orbital probability cloud pattern — concentric ellipses with varying opacity
#let _orbital-cloud-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <ellipse cx="700" cy="100" rx="80" ry="40" fill="none" stroke="#7C3AED" stroke-width="0.6" opacity="0.10"/>
  <ellipse cx="700" cy="100" rx="60" ry="30" fill="none" stroke="#7C3AED" stroke-width="0.5" opacity="0.13"/>
  <ellipse cx="700" cy="100" rx="40" ry="20" fill="none" stroke="#7C3AED" stroke-width="0.4" opacity="0.16"/>
  <ellipse cx="700" cy="100" rx="20" ry="10" fill="none" stroke="#A78BFA" stroke-width="0.4" opacity="0.20"/>
  <ellipse cx="140" cy="380" rx="70" ry="35" fill="none" stroke="#06B6D4" stroke-width="0.5" opacity="0.08"/>
  <ellipse cx="140" cy="380" rx="50" ry="25" fill="none" stroke="#06B6D4" stroke-width="0.4" opacity="0.11"/>
  <ellipse cx="140" cy="380" rx="30" ry="15" fill="none" stroke="#06B6D4" stroke-width="0.4" opacity="0.14"/>
  <ellipse cx="140" cy="380" rx="12" ry="6" fill="none" stroke="#06B6D4" stroke-width="0.3" opacity="0.18"/>
  <circle cx="700" cy="100" r="3" fill="#7C3AED" opacity="0.25"/>
  <circle cx="140" cy="380" r="2.5" fill="#06B6D4" opacity="0.22"/>
  <ellipse cx="420" cy="440" rx="90" ry="25" fill="none" stroke="#4338CA" stroke-width="0.4" opacity="0.06" transform="rotate(-15 420 440)"/>
  <ellipse cx="420" cy="440" rx="60" ry="16" fill="none" stroke="#4338CA" stroke-width="0.3" opacity="0.08" transform="rotate(-15 420 440)"/>
</svg>```.text

// Bloch sphere coordinate frame — decorative sphere for title/ending bookend
#let _bloch-sphere-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="18" width="784" height="438" rx="4" ry="4" fill="none" stroke="#7C3AED" stroke-width="1.8" opacity="0.5"/>
  <rect x="36" y="26" width="768" height="422" rx="2" ry="2" fill="none" stroke="#06B6D4" stroke-width="0.6" opacity="0.25"/>
  <circle cx="420" cy="237" r="120" fill="none" stroke="#7C3AED" stroke-width="1" opacity="0.18"/>
  <ellipse cx="420" cy="237" rx="120" ry="40" fill="none" stroke="#4338CA" stroke-width="0.6" opacity="0.15"/>
  <ellipse cx="420" cy="237" rx="40" ry="120" fill="none" stroke="#06B6D4" stroke-width="0.6" opacity="0.12"/>
  <path d="M420,117 V357" fill="none" stroke="#7C3AED" stroke-width="0.8" opacity="0.20"/>
  <path d="M300,237 H540" fill="none" stroke="#06B6D4" stroke-width="0.8" opacity="0.18"/>
  <circle cx="420" cy="117" r="4" fill="#7C3AED" opacity="0.40"/>
  <circle cx="420" cy="357" r="4" fill="#7C3AED" opacity="0.40"/>
  <circle cx="300" cy="237" r="3" fill="#06B6D4" opacity="0.35"/>
  <circle cx="540" cy="237" r="3" fill="#06B6D4" opacity="0.35"/>
  <circle cx="420" cy="237" r="2" fill="#4338CA" opacity="0.50"/>
  <path d="M28,18 L50,18 L50,40" fill="none" stroke="#7C3AED" stroke-width="2.5" opacity="0.60" stroke-linecap="round"/>
  <path d="M812,18 L790,18 L790,40" fill="none" stroke="#7C3AED" stroke-width="2.5" opacity="0.60" stroke-linecap="round"/>
  <path d="M28,456 L50,456 L50,434" fill="none" stroke="#7C3AED" stroke-width="2.5" opacity="0.60" stroke-linecap="round"/>
  <path d="M812,456 L790,456 L790,434" fill="none" stroke="#7C3AED" stroke-width="2.5" opacity="0.60" stroke-linecap="round"/>
  <circle cx="28" cy="18" r="3.5" fill="#7C3AED" opacity="0.70"/>
  <circle cx="812" cy="18" r="3.5" fill="#7C3AED" opacity="0.70"/>
  <circle cx="28" cy="456" r="3.5" fill="#7C3AED" opacity="0.70"/>
  <circle cx="812" cy="456" r="3.5" fill="#7C3AED" opacity="0.70"/>
  <path d="M380,18 H420 L430,8 H460" fill="none" stroke="#06B6D4" stroke-width="1" opacity="0.40"/>
  <path d="M380,456 H420 L430,466 H460" fill="none" stroke="#06B6D4" stroke-width="1" opacity="0.40"/>
  <circle cx="380" cy="18" r="2" fill="#06B6D4" opacity="0.50"/>
  <circle cx="460" cy="18" r="2" fill="#06B6D4" opacity="0.50"/>
  <circle cx="380" cy="456" r="2" fill="#06B6D4" opacity="0.50"/>
  <circle cx="460" cy="456" r="2" fill="#06B6D4" opacity="0.50"/>
</svg>```.text

// Quantum wire divider — horizontal circuit wire with control/target nodes
#let _wire-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 H300" fill="none" stroke="#7C3AED" stroke-width="1.5" opacity="0.6"/>
  <circle cx="0" cy="6" r="3" fill="#7C3AED" opacity="0.8"/>
  <circle cx="60" cy="6" r="2" fill="#06B6D4" opacity="0.7"/>
  <rect x="95" y="2" width="8" height="8" rx="1" fill="#7C3AED" opacity="0.6"/>
  <circle cx="150" cy="6" r="4" fill="none" stroke="#06B6D4" stroke-width="1.5" opacity="0.7"/>
  <path d="M150,2 V10" fill="none" stroke="#06B6D4" stroke-width="1" opacity="0.7"/>
  <rect x="195" y="2" width="8" height="8" rx="1" fill="#06B6D4" opacity="0.5"/>
  <circle cx="240" cy="6" r="2" fill="#7C3AED" opacity="0.6"/>
  <circle cx="300" cy="6" r="3" fill="#7C3AED" opacity="0.8"/>
</svg>```.text

// Entanglement connection curve — decorative curvy line between two nodes
#let _entangle-curve-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="20" viewBox="0 0 120 20">
  <circle cx="10" cy="10" r="4" fill="#7C3AED" opacity="0.7"/>
  <path d="M14,10 C40,0 80,20 106,10" fill="none" stroke="#A78BFA" stroke-width="1.5" opacity="0.6" stroke-dasharray="4,2"/>
  <circle cx="110" cy="10" r="4" fill="#06B6D4" opacity="0.7"/>
  <circle cx="60" cy="8" r="1.5" fill="#4338CA" opacity="0.4"/>
  <circle cx="45" cy="5" r="1" fill="#7C3AED" opacity="0.3"/>
  <circle cx="75" cy="14" r="1" fill="#06B6D4" opacity="0.3"/>
</svg>```.text

// Ket notation frame — |psi> shaped decorative element
#let _ket-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="40" viewBox="0 0 24 40">
  <path d="M4,2 L4,38" fill="none" stroke="#7C3AED" stroke-width="2" opacity="0.7" stroke-linecap="round"/>
  <path d="M4,2 L18,20 L4,38" fill="none" stroke="#7C3AED" stroke-width="1.8" opacity="0.5" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="4" cy="2" r="2" fill="#06B6D4" opacity="0.6"/>
  <circle cx="4" cy="38" r="2" fill="#06B6D4" opacity="0.6"/>
  <circle cx="18" cy="20" r="1.5" fill="#7C3AED" opacity="0.5"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render quantum circuit background
#let quantum-circuit-bg() = {
  image(bytes(_quantum-circuit-bg-svg), width: 100%, height: 100%)
}

/// Render orbital cloud background
#let orbital-cloud-bg() = {
  image(bytes(_orbital-cloud-svg), width: 100%, height: 100%)
}

/// Render Bloch sphere frame overlay (title/ending bookend)
#let bloch-sphere-frame() = {
  image(bytes(_bloch-sphere-svg), width: 100%, height: 100%)
}

/// Render wire divider
#let wire-divider-render(width: 100%) = {
  box(width: width, image(bytes(_wire-divider-svg), width: width, height: 10pt))
}

/// Render entanglement curve decoration
#let entangle-curve(width: 80pt) = {
  box(width: width, image(bytes(_entangle-curve-svg), width: width, height: 14pt))
}

/// Render ket frame decoration
#let ket-frame-render(height: 30pt) = {
  box(image(bytes(_ket-frame-svg), width: 16pt, height: height))
}

/// Map bright decorative accents to readable companion inks when used as text.
#let _text-ink(color) = {
  if color == palette.secondary {
    palette.secondary-ink
  } else if color == palette.accent-purple {
    palette.accent-indigo
  } else {
    color
  }
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides — circuit wires + orbital hints
#let _content-atmosphere() = {
  // Faint quantum circuit wires across entire slide
  place(top + left, box(width: 100%, height: 100%, quantum-circuit-bg()))
  // Subtle orbital clouds
  place(top + left, box(width: 100%, height: 100%, orbital-cloud-bg()))
  // Small corner accent nodes
  place(top + right, dx: -1.4em, dy: 0.7em,
    circle(radius: 3pt, fill: palette.primary.transparentize(75%)))
  place(bottom + left, dx: 1.4em, dy: -0.7em,
    circle(radius: 2.5pt, fill: palette.secondary.transparentize(80%)))
  place(bottom + right, dx: -2.2em, dy: -1.2em,
    circle(radius: 2pt, fill: palette.accent-purple.transparentize(85%)))
}


// === 1. Slide Functions ===

/// Standard content slide — light bg, quantum circuit atmosphere, violet/cyan accents
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
      spacing: 0.8em,
      {
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Quantum wire divider under title
      wire-divider-render(width: 160pt),
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
        // Violet dot separator
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

/// Title slide — Bloch sphere frame, quantum circuit traces, centered branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light lavender background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Quantum circuit traces background
    place(top + left, box(width: 100%, height: 100%, quantum-circuit-bg()))
    // Bloch sphere frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, bloch-sphere-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: 0.8em,
        // Title
        text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
        // Wire divider
        std.align(center, wire-divider-render(width: 220pt)),
        // Optional metadata
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
          text(size: 0.8em, fill: palette.accent-indigo)[#utils.display-info-date(self)]
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

/// New section slide — left violet accent bar, entangle curve, section title
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
    // Quantum circuit background
    place(top + left, box(width: 100%, height: 100%, quantum-circuit-bg()))
    // Left accent bar — electric violet
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Right side decorative orbital
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 4pt, fill: palette.primary.transparentize(40%)))
    place(top + right, dx: -5em, dy: 4em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(50%)))
    // Content
    set std.align(horizon + left)
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #stack(
        spacing: 0.8em,
        // Section number with violet accent
        text(size: 3.5em, fill: palette.primary, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        // Entanglement curve decoration
        entangle-curve(width: 100pt),
        // Section title
        {
          set text(fill: palette.text, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep indigo background, violet glowing text
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
    // Deep indigo background
    place(top + left, block(width: 100%, height: 100%, fill: palette.text))
    // Circuit traces (visible on dark bg)
    place(top + left, box(width: 100%, height: 100%, quantum-circuit-bg()))
    // Corner nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(30%)))
    // Center content in flow so Touying can measure the slide correctly.
    set std.align(center + horizon)
    block(width: 72%, height: auto)[
      #set std.align(center)
      #set text(fill: palette.accent-purple, size: 1.4em, weight: "bold")
      #stack(
        spacing: 0.8em,
        body,
        wire-divider-render(width: 180pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light bg with Bloch sphere frame (bookend), circuit traces, farewell
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
    // Circuit traces
    place(top + left, box(width: 100%, height: 100%, quantum-circuit-bg()))
    // Bloch sphere frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, bloch-sphere-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        // Wire divider above
        wire-divider-render(width: 200pt),
        // Main text
        text(size: 2.4em, weight: "bold", fill: palette.text, body),
        // Accent pill below
        block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Qubit card — info card with quantum wire accent on the left
#let qubit-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      // Wire node indicator + title
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 4pt, fill: accent),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Gate box — highlighted content with gate-icon styled border (top accent)
#let gate-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.light-cyan,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        box(width: 10pt, height: 10pt, fill: accent, radius: 2pt),
        text(weight: "bold", fill: palette.accent-indigo, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// State tag — quantum state capsule label (|0>, |1>, |+>, etc.)
#let state-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: _text-ink(color), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Orbital card — data display with subtle orbital pattern gradient background
#let orbital-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: gradient.linear(accent.lighten(92%), palette.card-bg, angle: 180deg),
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.text, size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(30%), radius: 1pt),
      [
        #set text(fill: palette.text, size: 0.80em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Wire divider — quantum circuit wire separator component
#let wire-divider(width: 80%) = {
  std.align(center, box(width: width, wire-divider-render(width: 100%)))
}

/// Superposition stat — centered ket icon, value, and label sequence
#let superposition-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      ket-frame-render(height: 12pt),
      {
        set text(fill: _text-ink(color), size: 1.4em, weight: "bold")
        value
      },
      {
        set text(fill: palette.text-muted, size: 0.72em)
        label
      },
      lazy-v(1fr),
    )
  ]
}

/// Entangle card — connected/linked content card with entanglement accent
#let entangle-card(title, body, accent: palette.accent-purple) = {
  block(
    width: 100%,
    fill: palette.light-violet,
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        entangle-curve(width: 60pt),
        text(weight: "bold", fill: palette.accent-indigo, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Register grid — multi-qubit register layout (comparison/two-panel)
#let register-grid(left-title, left-body, right-title, right-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #cols(columns: (1fr, auto, 1fr), gutter: 0em, lazy-layout: true,
      // Left panel (qubit 0)
      block(fill: palette.light-violet, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(spacing: 0.8em,
          text(weight: "bold", fill: palette.accent-indigo, size: 0.88em, left-title),
          {
            set text(fill: palette.text, size: 0.80em)
            left-body
          },
          lazy-v(1fr),
        )
      ],
      // Wire separator
      block(fill: palette.bg, inset: (x: 0.4em, y: 0.8em), width: auto)[
        #set std.align(center + horizon)
        #text(fill: palette.text-muted, size: 0.7em, weight: "bold")[vs]
        #lazy-v(1fr)
      ],
      // Right panel (qubit 1)
      block(fill: palette.light-cyan, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(spacing: 0.8em,
          text(weight: "bold", fill: palette.secondary-ink, size: 0.88em, right-title),
          {
            set text(fill: palette.text, size: 0.80em)
            right-body
          },
          lazy-v(1fr),
        )
      ],
    )
  ]
}

/// Measurement box — observation/result content box with full accent border
#let measurement-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: _text-ink(accent), size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Coherence note — annotation/insight card with dashed border and subtle background
#let coherence-note(title, body, accent: palette.accent-indigo) = {
  block(
    width: 100%,
    fill: palette.bg.darken(2%),
    stroke: (paint: accent.transparentize(40%), thickness: 1.5pt, dash: "dashed"),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.88em, title),
      [
      #set text(fill: palette.text, size: 0.80em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}


// === 3. Theme Entry Point ===

#let quantum-dot-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
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
      primary: palette.primary,
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
