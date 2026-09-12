// Golden Ratio Theme — Mathematical proportion and Fibonacci-inspired design
// Warm white/cream backgrounds with deep warm gray text, gold/amber primary
// Features: golden spirals, Fibonacci rectangles, phi proportions, harmonic curves
// The divine proportion (phi = 1.618) applied to layout, spacing, and decoration
// Perfect for elegant business presentations, strategy talks, executive briefs
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FFFDF7"),
  text: rgb("#3D3530"),
  primary: rgb("#C8922A"),
  primary-text: rgb("#966917"),
  secondary: rgb("#8B6914"),
  highlight: rgb("#7A9B6D"),
  highlight-text: rgb("#557348"),
  card-bg: rgb("#FFFFFF"),
  cream: rgb("#FBF7EF"),
  gold-light: rgb("#F5E6C8"),
  bronze: rgb("#6B4E2A"),
  text-muted: rgb("#7A6F66"),
  border: rgb("#E8DFD2"),
  primary-soft: rgb("#C8922A").transparentize(80%),
)

// Accent hues stay bright for rules and nodes; text uses contrast-safe inks.
#let _accent-ink(color) = if color == palette.primary {
  palette.primary-text
} else if color == palette.highlight {
  palette.highlight-text
} else if color == palette.secondary {
  palette.secondary
} else {
  palette.text
}


// ═══ SVG Definitions ═══

// Full-page golden spiral — logarithmic spiral arcs forming phi proportion
#let _golden-spiral-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="520" y="30" width="290" height="179" fill="none" stroke="#C8922A" stroke-width="0.6" opacity="0.12"/>
  <rect x="520" y="209" width="179" height="111" fill="none" stroke="#C8922A" stroke-width="0.5" opacity="0.10"/>
  <rect x="699" y="209" width="111" height="111" fill="none" stroke="#C8922A" stroke-width="0.5" opacity="0.08"/>
  <rect x="699" y="209" width="69" height="69" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.07"/>
  <rect x="699" y="278" width="69" height="42" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.06"/>
  <path d="M810,30 C810,129 730,209 631,209" fill="none" stroke="#C8922A" stroke-width="1.2" opacity="0.18"/>
  <path d="M631,209 C631,270 686,320 742,320" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.15"/>
  <path d="M742,320 C742,282 712,252 674,252" fill="none" stroke="#C8922A" stroke-width="0.8" opacity="0.13"/>
  <path d="M674,252 C674,275 692,292 714,292" fill="none" stroke="#C8922A" stroke-width="0.7" opacity="0.11"/>
  <path d="M714,292 C714,278 704,268 690,268" fill="none" stroke="#C8922A" stroke-width="0.6" opacity="0.10"/>
  <circle cx="30" cy="440" r="2" fill="#C8922A" opacity="0.15"/>
  <circle cx="60" cy="420" r="1.5" fill="#8B6914" opacity="0.12"/>
  <circle cx="100" cy="450" r="1.8" fill="#C8922A" opacity="0.10"/>
  <circle cx="780" cy="440" r="1.5" fill="#7A9B6D" opacity="0.12"/>
  <circle cx="750" cy="460" r="1.2" fill="#C8922A" opacity="0.10"/>
  <path d="M30,60 L50,60" fill="none" stroke="#C8922A" stroke-width="0.5" opacity="0.15"/>
  <path d="M30,97 L80,97" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.12"/>
  <path d="M30,157 L130,157" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.10"/>
  <path d="M30,254 L210,254" fill="none" stroke="#8B6914" stroke-width="0.3" opacity="0.08"/>
</svg>
```.text

// Fibonacci rectangle grid — nested golden rectangles for section backgrounds
#let _fibonacci-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="40" y="40" width="760" height="394" fill="none" stroke="#C8922A" stroke-width="0.8" opacity="0.12"/>
  <rect x="40" y="40" width="470" height="394" fill="none" stroke="#C8922A" stroke-width="0.6" opacity="0.10"/>
  <rect x="510" y="40" width="290" height="244" fill="none" stroke="#8B6914" stroke-width="0.5" opacity="0.08"/>
  <rect x="510" y="284" width="290" height="150" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.07"/>
  <rect x="510" y="284" width="180" height="150" fill="none" stroke="#8B6914" stroke-width="0.4" opacity="0.06"/>
  <path d="M510,40 C510,174 618,284 752,284" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.14"/>
  <path d="M510,284 C510,367 575,434 656,434" fill="none" stroke="#C8922A" stroke-width="0.8" opacity="0.11"/>
  <circle cx="510" cy="40" r="3" fill="#C8922A" opacity="0.20"/>
  <circle cx="800" cy="40" r="2.5" fill="#8B6914" opacity="0.15"/>
  <circle cx="800" cy="434" r="2.5" fill="#C8922A" opacity="0.15"/>
  <circle cx="40" cy="434" r="3" fill="#7A9B6D" opacity="0.12"/>
  <circle cx="40" cy="40" r="2" fill="#C8922A" opacity="0.18"/>
  <circle cx="510" cy="284" r="2" fill="#C8922A" opacity="0.16"/>
</svg>
```.text

// Golden spiral frame — bookend element for title/ending slides
#let _golden-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="18" width="784" height="438" rx="2" ry="2" fill="none" stroke="#C8922A" stroke-width="1.8" opacity="0.5"/>
  <rect x="36" y="26" width="768" height="422" rx="1" ry="1" fill="none" stroke="#8B6914" stroke-width="0.6" opacity="0.25"/>
  <path d="M28,80 C28,45 55,18 90,18" fill="none" stroke="#C8922A" stroke-width="2.2" opacity="0.6" stroke-linecap="round"/>
  <path d="M28,80 C60,80 90,50 90,18" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.3" stroke-linecap="round"/>
  <path d="M812,80 C812,45 785,18 750,18" fill="none" stroke="#C8922A" stroke-width="2.2" opacity="0.6" stroke-linecap="round"/>
  <path d="M812,80 C780,80 750,50 750,18" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.3" stroke-linecap="round"/>
  <path d="M28,394 C28,429 55,456 90,456" fill="none" stroke="#C8922A" stroke-width="2.2" opacity="0.6" stroke-linecap="round"/>
  <path d="M28,394 C60,394 90,424 90,456" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.3" stroke-linecap="round"/>
  <path d="M812,394 C812,429 785,456 750,456" fill="none" stroke="#C8922A" stroke-width="2.2" opacity="0.6" stroke-linecap="round"/>
  <path d="M812,394 C780,394 750,424 750,456" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.3" stroke-linecap="round"/>
  <circle cx="90" cy="18" r="3" fill="#C8922A" opacity="0.6"/>
  <circle cx="750" cy="18" r="3" fill="#C8922A" opacity="0.6"/>
  <circle cx="90" cy="456" r="3" fill="#C8922A" opacity="0.6"/>
  <circle cx="750" cy="456" r="3" fill="#C8922A" opacity="0.6"/>
  <path d="M370,18 L420,18 L425,12 L430,18 L470,18" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.4"/>
  <path d="M370,456 L420,456 L425,462 L430,456 L470,456" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.4"/>
  <circle cx="370" cy="18" r="2" fill="#C8922A" opacity="0.5"/>
  <circle cx="470" cy="18" r="2" fill="#C8922A" opacity="0.5"/>
  <circle cx="370" cy="456" r="2" fill="#C8922A" opacity="0.5"/>
  <circle cx="470" cy="456" r="2" fill="#C8922A" opacity="0.5"/>
</svg>
```.text

// Phi proportion divider — line with golden ratio markers
#let _phi-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 H300" fill="none" stroke="#C8922A" stroke-width="1.2" opacity="0.6"/>
  <circle cx="0" cy="6" r="3" fill="#C8922A" opacity="0.8"/>
  <circle cx="185" cy="6" r="4" fill="#C8922A" opacity="0.7"/>
  <circle cx="115" cy="6" r="2.5" fill="#8B6914" opacity="0.5"/>
  <circle cx="71" cy="6" r="2" fill="#C8922A" opacity="0.4"/>
  <circle cx="44" cy="6" r="1.5" fill="#8B6914" opacity="0.35"/>
  <circle cx="300" cy="6" r="3" fill="#C8922A" opacity="0.8"/>
  <path d="M185,2 V10" fill="none" stroke="#C8922A" stroke-width="1.5" opacity="0.5"/>
  <path d="M115,3 V9" fill="none" stroke="#8B6914" stroke-width="1.0" opacity="0.4"/>
</svg>
```.text

// Golden angle radial pattern — 137.5 degree pattern for section transitions
#let _golden-angle-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200">
  <circle cx="100" cy="100" r="6" fill="#C8922A" opacity="0.3"/>
  <circle cx="100" cy="80" r="4" fill="#C8922A" opacity="0.25"/>
  <circle cx="118" cy="108" r="4.5" fill="#8B6914" opacity="0.22"/>
  <circle cx="84" cy="114" r="4" fill="#C8922A" opacity="0.20"/>
  <circle cx="110" cy="82" r="3.5" fill="#7A9B6D" opacity="0.18"/>
  <circle cx="88" cy="92" r="3.5" fill="#C8922A" opacity="0.16"/>
  <circle cx="114" cy="118" r="3" fill="#8B6914" opacity="0.14"/>
  <circle cx="80" cy="98" r="3" fill="#C8922A" opacity="0.12"/>
  <circle cx="120" cy="94" r="2.8" fill="#7A9B6D" opacity="0.13"/>
  <circle cx="92" cy="120" r="2.5" fill="#C8922A" opacity="0.11"/>
  <circle cx="104" cy="74" r="2.5" fill="#8B6914" opacity="0.10"/>
  <circle cx="126" cy="104" r="2.2" fill="#C8922A" opacity="0.10"/>
</svg>
```.text

// Vitruvian geometric frame — circle inscribed in square
#let _vitruvian-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" viewBox="0 0 120 120">
  <rect x="10" y="10" width="100" height="100" fill="none" stroke="#C8922A" stroke-width="1.0" opacity="0.25"/>
  <circle cx="60" cy="60" r="50" fill="none" stroke="#C8922A" stroke-width="1.2" opacity="0.20"/>
  <path d="M60,10 V110" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.15"/>
  <path d="M10,60 H110" fill="none" stroke="#C8922A" stroke-width="0.4" opacity="0.15"/>
  <circle cx="60" cy="60" r="2" fill="#C8922A" opacity="0.4"/>
  <circle cx="60" cy="10" r="1.5" fill="#8B6914" opacity="0.3"/>
  <circle cx="110" cy="60" r="1.5" fill="#8B6914" opacity="0.3"/>
  <circle cx="60" cy="110" r="1.5" fill="#8B6914" opacity="0.3"/>
  <circle cx="10" cy="60" r="1.5" fill="#8B6914" opacity="0.3"/>
</svg>
```.text


// ═══ SVG Rendering Helpers ═══

/// Render golden spiral background (full-page)
#let golden-spiral-bg() = {
  image(bytes(_golden-spiral-bg-svg), width: 100%, height: 100%)
}

/// Render fibonacci rectangle grid
#let fibonacci-grid-bg() = {
  image(bytes(_fibonacci-grid-svg), width: 100%, height: 100%)
}

/// Render golden frame overlay (bookend for title/ending)
#let golden-frame() = {
  image(bytes(_golden-frame-svg), width: 100%, height: 100%)
}

/// Render phi proportion divider
#let phi-divider(width: 100%) = {
  box(width: width, image(bytes(_phi-divider-svg), width: width, height: 10pt))
}

/// Render golden angle pattern decoration
#let golden-angle-decoration(size: 80pt) = {
  box(width: size, height: size, image(bytes(_golden-angle-svg), width: size, height: size))
}

/// Render vitruvian geometric icon
#let vitruvian-icon(size: 50pt) = {
  box(width: size, height: size, image(bytes(_vitruvian-svg), width: size, height: size))
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — golden spiral + proportion dots
#let _content-atmosphere() = {
  // Faint golden spiral across the slide
  place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
  // Small phi-ratio accent markers
  place(top + right, dx: -1.5em, dy: 0.8em,
    circle(radius: 2.5pt, fill: palette.primary.transparentize(75%)))
  place(bottom + left, dx: 1.5em, dy: -0.8em,
    circle(radius: 2pt, fill: palette.highlight.transparentize(80%)))
  place(bottom + right, dx: -2.5em, dy: -1.2em,
    circle(radius: 1.8pt, fill: palette.primary.transparentize(85%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — cream bg, golden spiral atmosphere, warm typography
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
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Phi proportion divider under title
      phi-divider(width: 160pt),
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
        // Golden ratio dot separator
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

/// Title slide — golden frame (bookend), fibonacci grid, centered branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Fibonacci grid background
    place(top + left, box(width: 100%, height: 100%, fibonacci-grid-bg()))
    // Golden frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, golden-frame()))
    // Golden angle decoration top-right
    place(top + right, dx: -3em, dy: 2em, golden-angle-decoration(size: 60pt))
    // Centered semantic regions with explicit, stable spacing
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
        std.align(center, phi-divider(width: 220pt)),
        {
          if info.subtitle != none {
            text(size: 1.05em, fill: palette.secondary, weight: "medium", info.subtitle)
          }
        },
        {
          if info.author != none {
            text(size: 1em, fill: palette.text, weight: "regular", info.author)
          }
        },
        {
          if info.institution != none {
            text(size: 0.8em, fill: palette.text-muted, info.institution)
          }
        },
        {
          if info.date != none {
            text(size: 0.8em, fill: palette.bronze)[#utils.display-info-date(self)]
          }
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

/// New section slide — fibonacci grid, golden angle pattern, section title with phi marker
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
    // Fibonacci grid
    place(top + left, box(width: 100%, height: 100%, fibonacci-grid-bg()))
    // Left accent bar — golden proportion
    place(top + left, block(width: 4pt, height: 100%, fill: palette.primary))
    // Golden angle decoration at right
    place(top + right, dx: -2em, dy: 2em, golden-angle-decoration(size: 100pt))
    // Content
    set std.align(left + horizon)
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #stack(spacing: .8em,
        text(size: 3.5em, fill: palette.primary-text, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        phi-divider(width: 120pt),
        {
          set text(fill: palette.text, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
    ]
    // Bottom proportion line
    place(bottom + left, block(width: 61.8%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — dark bronze background, golden text, mathematical elegance
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
    // Dark warm background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bronze))
    // Golden spiral visible on dark
    place(top + left, box(width: 100%, height: 100%, golden-spiral-bg()))
    // Corner golden nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.primary.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(30%)))
    // Keep semantic content in flow so quality checks can measure the slide.
    set std.align(center + horizon)
    block(width: 72%)[
      #set std.align(center)
      #stack(spacing: .8em,
        {
          set text(fill: palette.gold-light, size: 1.4em, weight: "bold")
          body
        },
        phi-divider(width: 180pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — golden frame (bookend shared with title), fibonacci bg, farewell
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
    // Cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Fibonacci grid
    place(top + left, box(width: 100%, height: 100%, fibonacci-grid-bg()))
    // Golden frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, golden-frame()))
    // Golden angle decoration bottom-left
    place(bottom + left, dx: 3em, dy: -2em, golden-angle-decoration(size: 60pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(spacing: .8em,
        vitruvian-icon(size: 48pt),
        text(size: 2.4em, weight: "bold", fill: palette.text, body),
        phi-divider(width: 200pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Proportion card — content card with phi-ratio proportions (golden rectangle)
#let proportion-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      // Title with golden dot indicator
      stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, radius: 3.5pt, fill: accent),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Spiral box — highlighted content with spiral corner accent and warm bg
#let spiral-box(title, body) = {
  block(
    width: 100%,
    fill: palette.gold-light,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        vitruvian-icon(size: 28pt),
        text(weight: "bold", fill: palette.secondary, size: 0.95em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Phi tag — golden capsule label with ratio dot
#let phi-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: palette.text, size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Sequence card — data display following Fibonacci sizing (value prominent)
#let sequence-card(label, value, description, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
  )[
    // One centered KPI stack: ratio node -> value -> label -> description.
    #set std.align(center)
    #stack(spacing: .8em,
      circle(radius: 2.5pt, fill: color),
      text(fill: _accent-ink(color), size: 1.6em, weight: "bold", value),
      text(fill: palette.text, size: 0.85em, weight: "semibold", label),
      text(fill: palette.text-muted, size: 0.72em, description),
      lazy-v(1fr),
    )
  ]
}

/// Ratio divider — proportional line separator using phi divisions
#let ratio-divider(width: 80%) = {
  std.align(center, box(width: width, phi-divider(width: 100%)))
}

/// Fibonacci stat — KPI display with golden rectangle background accent
#let fibonacci-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    // One centered KPI stack: ratio node -> value -> label.
    #set std.align(center)
    #stack(spacing: .8em,
      circle(radius: 2.5pt, fill: color),
      text(fill: _accent-ink(color), size: 1.5em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Harmonic card — balanced two-section card (left and right in harmony)
#let harmonic-card(left-title, left-body, right-title, right-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(columns: (1fr, auto, 1fr), align: top,
      // Left panel (larger, phi-ratio)
      block(fill: palette.gold-light, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(spacing: .8em,
          text(weight: "bold", fill: palette.secondary, size: 0.88em, left-title),
          {
            set text(fill: palette.text, size: 0.80em)
            left-body
          },
        )
      ],
      // Phi divider (vertical)
      block(fill: palette.bg, inset: (x: 0.3em, y: 0.8em), width: auto)[
        #set std.align(center + horizon)
        #text(fill: palette.primary, size: 0.7em, weight: "bold")[#sym.phi]
      ],
      // Right panel
      block(fill: palette.cream, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(spacing: .8em,
          text(weight: "bold", fill: palette.primary-text, size: 0.88em, right-title),
          {
            set text(fill: palette.text, size: 0.80em)
            right-body
          },
        )
      ],
    )
  ]
}

/// Nautilus grid — spiral-inspired multi-item layout (items in descending prominence)
#let nautilus-grid(items) = {
  // Display items in a grid with golden-ratio emphasis on the first
  if items.len() >= 2 {
    grid(columns: (1.618fr, 1fr), gutter: 0.8em, align: top,
      // First item is largest (phi proportion)
      block(
        width: 100%,
        fill: palette.gold-light,
        stroke: (left: 3pt + palette.primary, rest: 1pt + palette.border),
        inset: (x: 1em, y: 0.8em),
        radius: 4pt,
      )[
        #set text(fill: palette.text, size: 0.85em)
        #items.at(0)
      ],
      // Remaining items stacked
      stack(spacing: .8em,
        ..items.slice(1).map(item =>
          block(
            width: 100%,
            fill: palette.card-bg,
            stroke: 1pt + palette.border,
            inset: (x: 0.8em, y: 0.5em),
            radius: 4pt,
          )[
            #set text(fill: palette.text, size: 0.80em)
            #item
          ]
        )
      ),
    )
  } else if items.len() == 1 {
    block(
      width: 100%,
      fill: palette.gold-light,
      stroke: (left: 3pt + palette.primary, rest: 1pt + palette.border),
      inset: (x: 1em, y: 0.8em),
      radius: 4pt,
    )[
      #set text(fill: palette.text, size: 0.85em)
      #items.at(0)
    ]
  }
}

/// Theorem box — precise content with mathematical elegance and border
#let theorem-box(title, body, accent: palette.highlight) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-ink(accent), size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Annotation note — insight with proportion markers and subtle background
#let annotation-note(title, body) = {
  block(
    width: 100%,
    fill: palette.cream,
    stroke: (left: 3pt + palette.highlight, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      // Title with phi proportion marker
      stack(dir: ltr, spacing: 6pt,
        box(width: 5pt, height: 10pt, fill: palette.highlight, radius: 1pt),
        text(weight: "bold", fill: palette.highlight-text, size: 0.88em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.80em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let golden-ratio-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  // The reusable theme is font-agnostic; choose installed fonts in the deck.
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
      primary: palette.primary-text,
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
