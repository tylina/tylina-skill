// Neon Mint Theme — Fresh, modern, tech-forward startup aesthetic
// Bright mint green primary accent with electric blue secondary
// Clean white backgrounds with geometric circuit-board-inspired line patterns
// Features: circuit traces, connection nodes, dot-grid patterns, modern geometric decorations
// Perfect for startup pitches, tech product launches, innovation showcases
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FAFFFE"),
  primary: rgb("#059669"),
  secondary: rgb("#3B82F6"),
  secondary-dark: rgb("#1D4ED8"),
  light-mint: rgb("#D1FAE5"),
  charcoal: rgb("#1F2937"),
  warm-gray: rgb("#6B7280"),
  card-bg: rgb("#FFFFFF"),
  primary-dark: rgb("#047857"),
  secondary-light: rgb("#DBEAFE"),
  border: rgb("#A7F3D0"),
  text: rgb("#1F2937"),
  text-muted: rgb("#6B7280"),
  focus-muted: rgb("#B6C2D1"),
  code-bg: rgb("#F8FAFC"),
  code-border: rgb("#E2E8F0"),
)


// ═══ SVG Definitions ═══

// Circuit board trace pattern — horizontal and vertical traces with right-angle turns
#let _circuit-trace-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M0,60 H120 L140,80 H280" fill="none" stroke="#059669" stroke-width="1" opacity="0.15"/>
  <path d="M560,60 H680 L700,80 H840" fill="none" stroke="#059669" stroke-width="0.8" opacity="0.12"/>
  <path d="M0,180 H80 L100,200 H200 L220,180 H340" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.10"/>
  <path d="M500,180 H600 L620,200 H720 L740,180 H840" fill="none" stroke="#3B82F6" stroke-width="0.6" opacity="0.08"/>
  <path d="M0,300 H60 L80,320 H160 L180,300 H260" fill="none" stroke="#059669" stroke-width="0.7" opacity="0.12"/>
  <path d="M580,300 H660 L680,320 H760 L780,300 H840" fill="none" stroke="#059669" stroke-width="0.6" opacity="0.10"/>
  <path d="M0,400 H100 L120,420 H240" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.08"/>
  <path d="M600,400 H700 L720,420 H840" fill="none" stroke="#3B82F6" stroke-width="0.6" opacity="0.07"/>
  <path d="M200,0 V80 L220,100 V180" fill="none" stroke="#059669" stroke-width="0.6" opacity="0.10"/>
  <path d="M640,0 V60 L660,80 V160" fill="none" stroke="#3B82F6" stroke-width="0.6" opacity="0.08"/>
  <path d="M400,294 V374 L420,394 V474" fill="none" stroke="#059669" stroke-width="0.7" opacity="0.10"/>
  <path d="M760,294 V354 L780,374 V474" fill="none" stroke="#3B82F6" stroke-width="0.5" opacity="0.07"/>
  <circle cx="120" cy="60" r="3" fill="#059669" opacity="0.25"/>
  <circle cx="280" cy="80" r="2.5" fill="#059669" opacity="0.20"/>
  <circle cx="200" cy="80" r="2" fill="#3B82F6" opacity="0.18"/>
  <circle cx="680" cy="60" r="2.5" fill="#059669" opacity="0.20"/>
  <circle cx="600" cy="200" r="3" fill="#3B82F6" opacity="0.15"/>
  <circle cx="160" cy="320" r="2.5" fill="#059669" opacity="0.20"/>
  <circle cx="660" cy="320" r="2" fill="#059669" opacity="0.18"/>
  <circle cx="400" cy="374" r="2.5" fill="#059669" opacity="0.20"/>
  <circle cx="640" cy="60" r="2" fill="#3B82F6" opacity="0.15"/>
  <circle cx="760" cy="354" r="2" fill="#3B82F6" opacity="0.12"/>
</svg>```.text

// Dot grid pattern — evenly spaced dots creating a subtle PCB layout grid
#let _dot-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <pattern id="dotgrid" width="40" height="40" patternUnits="userSpaceOnUse">
      <circle cx="20" cy="20" r="1.2" fill="#059669" opacity="0.18"/>
    </pattern>
  </defs>
  <rect width="840" height="474" fill="url(#dotgrid)"/>
  <circle cx="100" cy="100" r="2.5" fill="#3B82F6" opacity="0.15"/>
  <circle cx="300" cy="60" r="2" fill="#059669" opacity="0.20"/>
  <circle cx="540" cy="140" r="2.5" fill="#3B82F6" opacity="0.12"/>
  <circle cx="740" cy="80" r="2" fill="#059669" opacity="0.18"/>
  <circle cx="180" cy="380" r="2.5" fill="#3B82F6" opacity="0.12"/>
  <circle cx="420" cy="420" r="2" fill="#059669" opacity="0.15"/>
  <circle cx="660" cy="360" r="2.5" fill="#3B82F6" opacity="0.10"/>
  <circle cx="780" cy="440" r="2" fill="#059669" opacity="0.15"/>
</svg>```.text

// Neon frame — geometric border with circuit-trace corners for title/ending slides
#let _neon-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="30" y="20" width="780" height="434" rx="4" ry="4" fill="none" stroke="#059669" stroke-width="2" opacity="0.6"/>
  <rect x="38" y="28" width="764" height="418" rx="2" ry="2" fill="none" stroke="#3B82F6" stroke-width="0.8" opacity="0.3"/>
  <path d="M30,50 H10 V20 H50" fill="none" stroke="#059669" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="30" cy="20" r="4" fill="#059669" opacity="0.8"/>
  <circle cx="10" cy="50" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <circle cx="50" cy="20" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <path d="M810,50 H830 V20 H790" fill="none" stroke="#059669" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="810" cy="20" r="4" fill="#059669" opacity="0.8"/>
  <circle cx="830" cy="50" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <circle cx="790" cy="20" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <path d="M30,424 H10 V454 H50" fill="none" stroke="#059669" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="30" cy="454" r="4" fill="#059669" opacity="0.8"/>
  <circle cx="10" cy="424" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <circle cx="50" cy="454" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <path d="M810,424 H830 V454 H790" fill="none" stroke="#059669" stroke-width="2.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="810" cy="454" r="4" fill="#059669" opacity="0.8"/>
  <circle cx="830" cy="424" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <circle cx="790" cy="454" r="2.5" fill="#3B82F6" opacity="0.6"/>
  <path d="M380,20 H420 L430,10 H460" fill="none" stroke="#059669" stroke-width="1.2" opacity="0.5"/>
  <path d="M380,454 H420 L430,464 H460" fill="none" stroke="#059669" stroke-width="1.2" opacity="0.5"/>
  <circle cx="380" cy="20" r="2" fill="#059669" opacity="0.6"/>
  <circle cx="460" cy="20" r="2" fill="#059669" opacity="0.6"/>
  <circle cx="380" cy="454" r="2" fill="#059669" opacity="0.6"/>
  <circle cx="460" cy="454" r="2" fill="#059669" opacity="0.6"/>
</svg>```.text

// Circuit connector divider — horizontal trace with nodes
#let _circuit-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 H60 L70,2 H90 L100,6 H140 L150,10 H170 L180,6 H240 L250,2 H270 L280,6 H300" fill="none" stroke="#059669" stroke-width="1.8" opacity="0.7" stroke-linecap="round"/>
  <circle cx="0" cy="6" r="3" fill="#059669" opacity="0.9"/>
  <circle cx="70" cy="2" r="2" fill="#3B82F6" opacity="0.7"/>
  <circle cx="100" cy="6" r="2.5" fill="#059669" opacity="0.8"/>
  <circle cx="150" cy="10" r="2" fill="#3B82F6" opacity="0.7"/>
  <circle cx="200" cy="6" r="2" fill="#059669" opacity="0.6"/>
  <circle cx="250" cy="2" r="2" fill="#3B82F6" opacity="0.7"/>
  <circle cx="300" cy="6" r="3" fill="#059669" opacity="0.9"/>
</svg>```.text

// Signal pulse — small inline decoration for section headers
#let _signal-pulse-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="20" viewBox="0 0 120 20">
  <path d="M0,10 H20 L30,3 L40,17 L50,3 L60,17 L70,10 H120" fill="none" stroke="#059669" stroke-width="1.5" opacity="0.8" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="0" cy="10" r="2.5" fill="#059669" opacity="0.9"/>
  <circle cx="120" cy="10" r="2.5" fill="#3B82F6" opacity="0.8"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render circuit trace background
#let circuit-trace-bg() = {
  image(bytes(_circuit-trace-svg), width: 100%, height: 100%, fit: "stretch")
}

/// Render dot grid background
#let dot-grid-bg() = {
  image(bytes(_dot-grid-svg), width: 100%, height: 100%, fit: "stretch")
}

/// Render neon frame overlay (title/ending bookend)
#let neon-frame() = {
  image(bytes(_neon-frame-svg), width: 100%, height: 100%, fit: "stretch")
}

/// Render circuit divider
#let circuit-divider(width: 100%, color: palette.primary) = {
  let rendered = _circuit-divider-svg.replace("#059669", color.to-hex())
  box(width: width, image(bytes(rendered), width: width, height: 10pt, fit: "contain"))
}

/// Render signal pulse decoration
#let signal-pulse(width: 80pt, color: palette.primary) = {
  let rendered = _signal-pulse-svg.replace("#059669", color.to-hex())
  box(width: width, image(bytes(rendered), width: width, height: 14pt, fit: "contain"))
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — dot grid + corner nodes
#let _content-atmosphere() = {
  // Faint dot grid across entire slide
  place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
  // Small corner accent nodes
  place(top + right, dx: -1.2em, dy: 0.6em,
    circle(radius: 3pt, fill: palette.primary.transparentize(75%)))
  place(bottom + left, dx: 1.2em, dy: -0.6em,
    circle(radius: 2.5pt, fill: palette.secondary.transparentize(80%)))
  place(bottom + right, dx: -2em, dy: -1em,
    circle(radius: 2pt, fill: palette.primary.transparentize(85%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — white bg, dot-grid atmosphere, mint/blue accents
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
        set text(fill: palette.charcoal, size: 1.3em, weight: "medium")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Circuit divider under title
      circuit-divider(width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.warm-gray, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Mint dot separator
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.primary)
      },
      {
        set std.align(right)
        context text(fill: palette.warm-gray, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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

/// Title slide — neon frame, circuit traces, centered branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Clean white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Circuit traces background
    place(top + left, box(width: 100%, height: 100%, circuit-trace-bg()))
    // Neon frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, neon-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.charcoal, info.title),
        std.align(center, circuit-divider(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary-dark, weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.charcoal, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.warm-gray, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.primary-dark, utils.display-info-date(self))
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

/// New section slide — left mint accent bar, signal pulse, section title
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
    // Dot grid
    place(top + left, box(width: 100%, height: 100%, dot-grid-bg()))
    // Left accent bar — neon mint gradient
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Right side decorative circuit trace
    place(top + right, dx: -3em, dy: 2em,
      circle(radius: 4pt, fill: palette.primary.transparentize(40%)))
    place(top + right, dx: -5em, dy: 4em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(50%)))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #stack(
        spacing: .8em,
        v(1fr),
        stack(
          spacing: .8em,
          text(size: 3.5em, fill: palette.primary, weight: "bold")[
            #context utils.display-current-heading-number(depth: 1, numbering: "1")
          ],
          signal-pulse(width: 100pt),
          {
            set text(fill: palette.charcoal, size: 2em, weight: "semibold")
            utils.display-current-heading(level: 1, numbered: false)
          },
        ),
        v(1fr),
      )
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — charcoal background, neon mint text glow effect
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
    // Dark charcoal background
    place(top + left, block(width: 100%, height: 100%, fill: palette.charcoal))
    // Circuit traces (visible on dark bg)
    place(top + left, box(width: 100%, height: 100%, circuit-trace-bg()))
    // Corner nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 4pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.secondary.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 3pt, fill: palette.primary.transparentize(30%)))
    // Center content
    place(center + horizon,
      block(width: 72%, height: auto,
        align(center)[
          #stack(
            spacing: .8em,
            {
              set text(fill: palette.primary, size: 1.4em, weight: "semibold")
              body
            },
            circuit-divider(width: 180pt),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — white bg with neon frame (bookend), circuit traces, farewell
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
    // White background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Circuit traces
    place(top + left, box(width: 100%, height: 100%, circuit-trace-bg()))
    // Neon frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, neon-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        circuit-divider(width: 200pt),
        text(size: 2.4em, weight: "bold", fill: palette.charcoal, body),
        block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Concept card — card with left neon border and connection node indicator
#let concept-card(title, body, accent: palette.primary) = {
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
        text(weight: "semibold", fill: palette.charcoal, size: 0.92em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Insight box — highlighted box with signal-pulse SVG decoration and light mint bg
#let insight-box(title, body) = {
  block(
    width: 100%,
    fill: palette.light-mint,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        signal-pulse(width: 60pt),
        text(weight: "semibold", fill: palette.primary-dark, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Stat card — metric display with large value and neon accent
#let stat-card(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    // Top-right neon node
    #place(top + right, dx: -6pt, dy: 6pt,
      box(width: 6pt, height: 6pt, radius: 3pt, fill: color.transparentize(40%)))
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: color, size: 1.8em, weight: "bold", value),
      text(fill: palette.warm-gray, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Metric card — stat card variant with subtitle description, uses SVG pulse
#let metric-card(label, value, description, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
  )[
    #set std.align(center)
    // One centered icon -> value -> label metric stack
    #stack(
      spacing: .8em,
      signal-pulse(width: 50pt, color: color),
      text(fill: color, size: 1.6em, weight: "bold", value),
      text(fill: palette.charcoal, size: 0.85em, weight: "semibold", label),
      text(fill: palette.warm-gray, size: 0.72em, description),
      lazy-v(1fr),
    )
  ]
}

/// Code card — code/tech content box with monospace feel and circuit accent
#let code-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.code-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.code-border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, fill: accent, radius: 1pt),
        text(weight: "semibold", fill: accent.darken(18%), size: 0.88em,
          font: ("Menlo", "DejaVu Sans Mono"), title),
      ),
      {
        set text(fill: palette.text, size: 0.80em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Feature card — borderless card using only typography, spacing, and background gradient
#let feature-card(icon-text, title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: gradient.linear(accent.lighten(92%), palette.card-bg, angle: 180deg),
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      text(size: 1.6em, icon-text),
      text(weight: "semibold", fill: palette.charcoal, size: 0.92em, title),
      [
        #set text(fill: palette.text, size: 0.80em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Comparison box — two-panel comparison with vs separator
#let comparison-box(left-title, left-body, right-title, right-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(
      columns: (1fr, auto, 1fr),
      gutter: 0pt,
      fill: (x, _) => if x == 0 { palette.light-mint }
        else if x == 2 { palette.secondary-light } else { palette.bg },
      inset: (x: 0.9em, y: 0.75em),
      align: (left + top, center + horizon, left + top),
      [
        #stack(
          spacing: .8em,
          text(weight: "semibold", fill: palette.primary-dark, size: 0.88em, left-title),
          {
            set text(fill: palette.text, size: 0.80em)
            left-body
          },
        )
      ],
      text(fill: palette.warm-gray, size: 0.7em, weight: "bold")[VS],
      [
        #stack(
          spacing: .8em,
          text(weight: "semibold", fill: palette.secondary-dark, size: 0.88em, right-title),
          {
            set text(fill: palette.text, size: 0.80em)
            right-body
          },
        )
      ],
    )
  ]
}

/// Callout box — attention-grabbing box with full accent border and icon
#let callout-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent.darken(18%), size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Circuit divider component — SVG-based separator with neon trace
#let trace-divider(color: palette.primary, width: 80%) = {
  std.align(center, box(width: width, circuit-divider(width: 100%, color: color)))
}

/// Neon tag — small capsule tag with glowing dot
#let neon-tag(content, color: palette.primary) = {
  let ink = color.darken(16%)
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: ink, size: 0.75em, weight: "semibold", content),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let neon-mint-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
  show raw: set text(font: ("Menlo", "DejaVu Sans Mono"))
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
