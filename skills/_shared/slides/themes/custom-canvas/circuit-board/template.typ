// Circuit Board Theme -- PCB (Printed Circuit Board) aesthetic Touying presentation theme
// Dark green solder-mask background with copper-gold traces. SVG circuit trace patterns.
// Connection pads as bullet points. Components as IC packages.
// 3 presets: pcb, breadboard, flex
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset: bg, ink, accent, secondary

#let presets = (
  pcb: (bg: rgb("#064E3B"), ink: rgb("#ECFDF5"), accent: rgb("#F59E0B"), secondary: rgb("#22D3EE")),
  breadboard: (bg: rgb("#FAFAF9"), ink: rgb("#1C1917"), accent: rgb("#DC2626"), secondary: rgb("#2563EB")),
  flex: (bg: rgb("#292524"), ink: rgb("#FDE68A"), accent: rgb("#FB923C"), secondary: rgb("#A78BFA")),
)


// =====================================================================
// Palette Builder
// =====================================================================

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let ink = p.ink
  let accent = p.accent
  let secondary = p.secondary
  let surface = if preset-name == "breadboard" { bg.darken(4%) } else { bg.lighten(6%) }
  let dark-bg = if preset-name == "breadboard" { bg.darken(8%) } else { bg.darken(40%) }
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    // Derived tones
    ink-light: ink.transparentize(15%),
    ink-muted: ink.transparentize(45%),
    ink-faint: ink.transparentize(70%),
    ink-ghost: ink.transparentize(88%),
    // Accent variants
    accent-light: accent.transparentize(20%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    // Secondary variants
    secondary-light: secondary.transparentize(20%),
    secondary-muted: secondary.transparentize(50%),
    // Surface
    surface: surface,
    surface-border: accent.transparentize(60%),
    divider: accent.transparentize(40%),
    // Dark variant (for dark-slide)
    dark-bg: dark-bg,
  )
}

// Default palette (pcb)
#let palette = build-palette("pcb")

// Public helpers and components read this state so their colors follow the active preset.
#let _active-palette = state("circuit-board-active-palette", palette)


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 42pt,
  h1: 30pt,
  h2: 22pt,
  body: 16pt,
  kicker-size: 9pt,
  meta-size: 8pt,
)


// =====================================================================
// Font Constants
// =====================================================================

#let _mono-font = ("Menlo", "Courier New")
#let _sans-font = ("Arial", "Heiti SC")


// =====================================================================
// SVG Decorations
// =====================================================================

// Circuit trace pattern: horizontal/vertical lines with 90-degree turns, connection pads
#let _circuit-trace-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" opacity="TRACE_OPACITY">
  <!-- Horizontal traces -->
  <line x1="0" y1="40" x2="120" y2="40" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="120" y1="40" x2="120" y2="80" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="120" y1="80" x2="250" y2="80" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="250" y1="80" x2="250" y2="40" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="250" y1="40" x2="400" y2="40" stroke="#F59E0B" stroke-width="1.5"/>
  <!-- Second trace -->
  <line x1="0" y1="150" x2="80" y2="150" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="80" y1="150" x2="80" y2="200" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="80" y1="200" x2="200" y2="200" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="200" y1="200" x2="200" y2="260" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="200" y1="260" x2="350" y2="260" stroke="#F59E0B" stroke-width="1.5"/>
  <!-- Third trace -->
  <line x1="300" y1="0" x2="300" y2="120" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="300" y1="120" x2="380" y2="120" stroke="#F59E0B" stroke-width="1.5"/>
  <line x1="380" y1="120" x2="380" y2="180" stroke="#F59E0B" stroke-width="1.5"/>
  <!-- Connection pads (circles at endpoints) -->
  <circle cx="0" cy="40" r="4" fill="#F59E0B"/>
  <circle cx="400" cy="40" r="4" fill="#F59E0B"/>
  <circle cx="0" cy="150" r="4" fill="#F59E0B"/>
  <circle cx="350" cy="260" r="4" fill="#F59E0B"/>
  <circle cx="300" cy="0" r="4" fill="#F59E0B"/>
  <circle cx="380" cy="180" r="4" fill="#F59E0B"/>
  <!-- Vias -->
  <circle cx="120" cy="80" r="5" fill="none" stroke="#F59E0B" stroke-width="1"/>
  <circle cx="120" cy="80" r="2.5" fill="#F59E0B"/>
  <circle cx="250" cy="40" r="5" fill="none" stroke="#F59E0B" stroke-width="1"/>
  <circle cx="250" cy="40" r="2.5" fill="#F59E0B"/>
  <circle cx="200" cy="200" r="5" fill="none" stroke="#F59E0B" stroke-width="1"/>
  <circle cx="200" cy="200" r="2.5" fill="#F59E0B"/>
</svg>
```.text.replace("#F59E0B", "currentColor")

// IC chip decoration: 8-pin DIP package
#let _ic-chip-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 80" opacity="0.15">
  <!-- IC body -->
  <rect x="20" y="15" width="80" height="50" fill="none" stroke="#F59E0B" stroke-width="1.5" rx="2"/>
  <!-- Pin 1 marker -->
  <circle cx="30" cy="25" r="3" fill="none" stroke="#F59E0B" stroke-width="0.8"/>
  <!-- Left pins -->
  <line x1="0" y1="25" x2="20" y2="25" stroke="#F59E0B" stroke-width="1.2"/>
  <line x1="0" y1="40" x2="20" y2="40" stroke="#F59E0B" stroke-width="1.2"/>
  <line x1="0" y1="55" x2="20" y2="55" stroke="#F59E0B" stroke-width="1.2"/>
  <!-- Right pins -->
  <line x1="100" y1="25" x2="120" y2="25" stroke="#F59E0B" stroke-width="1.2"/>
  <line x1="100" y1="40" x2="120" y2="40" stroke="#F59E0B" stroke-width="1.2"/>
  <line x1="100" y1="55" x2="120" y2="55" stroke="#F59E0B" stroke-width="1.2"/>
  <!-- Pin pads -->
  <rect x="0" y="22" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
  <rect x="0" y="37" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
  <rect x="0" y="52" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
  <rect x="115" y="22" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
  <rect x="115" y="37" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
  <rect x="115" y="52" width="5" height="6" fill="#F59E0B" opacity="0.6"/>
</svg>
```.text.replace("#F59E0B", "currentColor")

// Via/pad element: concentric circles
#let _via-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" opacity="0.2">
  <circle cx="20" cy="20" r="18" fill="none" stroke="#F59E0B" stroke-width="1"/>
  <circle cx="20" cy="20" r="12" fill="none" stroke="#F59E0B" stroke-width="0.8"/>
  <circle cx="20" cy="20" r="6" fill="#F59E0B"/>
</svg>
```.text.replace("#F59E0B", "currentColor")


// =====================================================================
// SVG Rendering Helpers
// =====================================================================

#let circuit-trace-pattern(color: auto, opacity: 12%, width: 100%, height: 100%) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _circuit-trace-svg
    .replace("currentColor", color.to-hex())
    .replace("TRACE_OPACITY", str(opacity / 100%))
  image(bytes(svg), width: width, height: height)
}

#let ic-chip-decoration(color: auto, size: 80pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _ic-chip-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size)
}

#let via-element(color: auto, size: 30pt) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  let svg = _via-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size)
}


// =====================================================================
// Circuit Background Pattern
// =====================================================================

#let circuit-background(color: auto, opacity: 12%) = context {
  let pal = _active-palette.get()
  let color = if color == auto { pal.accent } else { color }
  place(top + left, dx: -20pt, dy: -10pt,
    circuit-trace-pattern(color: color, opacity: opacity, width: 110%, height: 110%))
  // Additional via decorations in corners
  place(top + right, dx: -40pt, dy: 30pt, via-element(color: color, size: 24pt))
  place(bottom + left, dx: 40pt, dy: -40pt, via-element(color: color, size: 20pt))
}


// =====================================================================
// Reusable Components
// =====================================================================

/// solder-point -- Decorative bullet point (filled circle with ring)
#let solder-point(color: palette.accent, size: 7pt) = {
  box(baseline: 20%, width: size + 4pt, height: size + 2pt)[
    #place(center + horizon,
      circle(radius: size / 2 + 1.5pt, stroke: 0.6pt + color.transparentize(40%)))
    #place(center + horizon,
      circle(radius: size / 2 - 0.5pt, fill: color))
  ]
}

/// trace-divider -- Horizontal copper trace with connection pads at endpoints
#let trace-divider(color: palette.accent, width: 100%) = {
  block(width: width, height: 12pt)[
    #place(left + horizon, circle(radius: 4pt, fill: color))
    #place(left + horizon, dx: 6pt,
      line(length: 100% - 12pt, stroke: 1.5pt + color))
    #place(right + horizon, circle(radius: 4pt, fill: color))
  ]
}

/// ic-card -- Card styled as IC package: pin marks along edges, chip label in header
#let ic-card(title, body, color: palette.accent) = {
  block(
    width: 100%,
    stroke: 1.2pt + color.transparentize(30%),
    inset: (x: 1em, y: 0.7em),
  )[
    // Pin marks on left edge
    #place(left + top, dx: -1em - 0.6pt, dy: 8pt,
      stack(spacing: 6pt,
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
      ))
    // Pin marks on right edge
    #place(right + top, dx: 1em + 0.6pt - 4pt, dy: 8pt,
      stack(spacing: 6pt,
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
        rect(width: 4pt, height: 3pt, fill: color.transparentize(40%)),
      ))
    // Pin 1 indicator
    #place(left + top, dx: 0pt, dy: 0pt,
      circle(radius: 2.5pt, stroke: 0.5pt + color.transparentize(50%)))
    // Title header
    #stack(
      spacing: .8em,
      text(size: typo.kicker-size, weight: "bold", tracking: 1pt, fill: color, font: _mono-font, upper(title)),
      [
        #set text(size: 14pt)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// led-stat -- Stat number with LED indicator (colored dot)
#let led-stat(value, label, color: palette.secondary) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #stack(
      spacing: .8em,
      box[
        #text(size: 36pt, weight: "bold", fill: palette.ink, font: _mono-font, value)
        #h(0.3em)
        #box(baseline: 30%, circle(radius: 5pt, fill: color))
      ],
      [
        #text(size: typo.kicker-size, weight: "medium", tracking: 1.2pt, fill: palette.ink.transparentize(40%), font: _mono-font, upper(label))
        #lazy-v(1fr)
      ],
    )
  ]
}

/// register-box -- Monospace data display like a chip register
#let register-box(pairs, title: none, bg-color: none, text-color: none) = {
  let bg = if bg-color != none { bg-color } else { palette.ink.transparentize(92%) }
  let tc = if text-color != none { text-color } else { palette.ink }
  block(
    width: 100%,
    fill: bg,
    stroke: 0.5pt + palette.accent.transparentize(60%),
    inset: (x: 0.8em, y: 0.5em),
  )[
    #set text(font: _mono-font, size: 11pt, fill: tc)
    #if title != none {
      text(size: typo.kicker-size, weight: "bold", tracking: 1pt, fill: palette.accent, upper(title))
      v(0.3em)
    }
    #stack(
      spacing: .8em,
      [
        #for (addr, val) in pairs {
          grid(columns: (auto, 1fr),
            column-gutter: 1em,
            text(fill: tc.transparentize(40%), addr),
            text(weight: "medium", val),
          )
          v(0.15em)
        }
      ],
      [#lazy-v(1fr)],
    )
  ]
}

/// signal-tag -- Small pill-shaped signal label
#let signal-tag(body, color: palette.secondary) = {
  box(
    inset: (x: 0.5em, y: 0.15em),
    fill: color.transparentize(80%),
    stroke: 0.6pt + color.transparentize(40%),
    radius: 8pt,
  )[
    #text(size: 8pt, weight: "bold", fill: color, font: _mono-font, upper(body))
  ]
}

/// bus-layout -- Multi-column layout with "bus" trace lines at top
#let bus-layout(columns-content, color: palette.accent) = {
  let n = columns-content.len()
  stack(spacing: .8em,
    // Bus trace at top
    block(width: 100%, height: 10pt)[
      #place(left + horizon,
        line(length: 100%, stroke: 1.5pt + color))
      // Connection pads at evenly spaced positions
      #place(left + horizon, dx: 0pt, circle(radius: 3pt, fill: color))
      #place(right + horizon, dx: 0pt, circle(radius: 3pt, fill: color))
      #place(center + horizon, circle(radius: 3pt, fill: color))
    ],
    // Ordinary one-row column composition; cells do not request lazy equalization.
    cols(
      columns: range(n).map(_ => 1fr),
      gutter: 14pt,
      ..columns-content,
    ),
  )
}

/// circuit-kicker -- Small tracked uppercase label (PCB style)
#let circuit-kicker(body, color: palette.ink) = {
  text(
    size: typo.kicker-size,
    weight: "medium",
    tracking: 1.8pt,
    fill: color.transparentize(40%),
    font: _mono-font,
    upper(body),
  )
}


// =====================================================================
// Internal Helpers (header/footer)
// =====================================================================

/// _slide-header -- Header for standard slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.8em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(size: 8pt, fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
      grid(
        columns: (1fr, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    },
    {
      set text(fill: pal.ink, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 50pt, height: 2pt, fill: pal.accent),
  )
}

/// _slide-footer -- Footer for standard slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.ink-muted, size: 0.6em, font: _mono-font)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[PCB]
    },
    solder-point(color: pal.accent, size: 4pt),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark slides
#let _dark-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
  set std.align(horizon + left)
  set text(size: 8pt, fill: pal.secondary-muted, font: _mono-font, tracking: 0.5pt)
  grid(
    columns: (1fr, 1fr),
    {
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      }
    },
    {
      set std.align(right)
      context [#utils.slide-counter.display() / #utils.last-slide-number]
    },
  )
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.secondary-muted, size: 0.6em, font: _mono-font)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, tracking: 0.5pt)
      upper[SIGNAL]
    },
    solder-point(color: pal.secondary, size: 4pt),
    {
      set std.align(right)
      set text(size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Standard dark green PCB slide with faint circuit trace pattern
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let pal = self.store.palette
  let setting(body) = {
    // Faint circuit trace background
    circuit-background()
    show: std.align.with(self.store.align)
    set text(fill: pal.ink)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
      margin: (top: 4em, bottom: 1.3em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Even darker PCB with LED-cyan highlights
#let dark-slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _dark-header(self)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Circuit trace background
    circuit-background()
    // Title display
    if self.store.title != none and self.store.title != auto {
      stack(dir: ttb, spacing: .8em,
        text(size: 1.4em, weight: "bold", fill: pal.secondary, font: _mono-font,
          utils.call-or-display(self, self.store.title)),
        block(width: 50pt, height: 1.5pt, fill: pal.secondary.transparentize(40%)),
      )
    }
    set text(fill: pal.ink)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.dark-bg,
      header: header,
      footer: footer,
      margin: (top: 2.1em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Large IC chip frame containing title, trace decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Circuit trace pattern
    circuit-background()
    // IC chip decoration top-right
    place(top + right, dx: -30pt, dy: 20pt, ic-chip-decoration(size: 100pt))
    // Via decorations
    place(bottom + right, dx: -60pt, dy: -50pt, via-element(size: 28pt))
    place(top + left, dx: 50pt, dy: 50pt, via-element(size: 22pt))
    // IC frame border around content area
    place(left + horizon, dx: 2.5em, dy: 0pt,
      rect(
        width: 70%,
        height: 60%,
        stroke: 1.2pt + pal.accent.transparentize(40%),
        radius: 2pt,
      ))
    // Pin marks on frame left
    place(left + horizon, dx: 2.5em - 0.6pt - 4pt, dy: -40pt,
      stack(spacing: 12pt,
        rect(width: 4pt, height: 6pt, fill: pal.accent.transparentize(50%)),
        rect(width: 4pt, height: 6pt, fill: pal.accent.transparentize(50%)),
        rect(width: 4pt, height: 6pt, fill: pal.accent.transparentize(50%)),
        rect(width: 4pt, height: 6pt, fill: pal.accent.transparentize(50%)),
        rect(width: 4pt, height: 6pt, fill: pal.accent.transparentize(50%)),
      ))
    // Content
    set std.align(left + horizon)
    pad(x: 4em, y: 3em)[
      // Module label
      #text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 2pt,
        fill: pal.accent,
        font: _mono-font,
      )[MODULE:]
      #v(0.6em)
      // Title
      #text(size: typo.display, weight: "bold", fill: pal.ink, info.title)
      #v(0.5em)
      // Copper trace accent
      #trace-divider(color: pal.accent, width: 120pt)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: typo.h2, weight: "regular", fill: pal.ink-light, info.subtitle)
        v(0.8em)
      }
      // Author + date
      #{
        set text(size: 9pt, fill: pal.ink-muted, font: _mono-font, tracking: 0.5pt)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent.transparentize(40%))[|]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
    // Bottom trace line
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0pt)[
        #place(left + horizon, dx: 20pt,
          line(length: 100% - 40pt, stroke: 0.8pt + pal.accent.transparentize(60%)))
        #place(left + horizon, dx: 20pt,
          circle(radius: 3pt, fill: pal.accent.transparentize(50%)))
        #place(right + horizon, dx: -20pt,
          circle(radius: 3pt, fill: pal.accent.transparentize(50%)))
      ])
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section as "module" number, PCB component look
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Circuit background
    circuit-background()
    // Large module number (ghosted)
    place(top + right, dx: -50pt, dy: 20pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.accent.transparentize(80%), size: 130pt, weight: "bold", font: _mono-font, num-str)
      },
    )
    // IC chip decoration
    place(bottom + right, dx: -40pt, dy: -40pt, ic-chip-decoration(size: 90pt))
    // Content
    pad(left: 3.5em, right: 5em, top: 3.5em, bottom: 2em)[
      #v(1fr)
      // MODULE label
      #text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 2pt,
        fill: pal.accent,
        font: _mono-font,
      )[MODULE #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.6em)
      // Section title
      #{
        set text(fill: pal.ink, size: 2em, weight: "bold")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      // Trace underline
      #trace-divider(color: pal.accent, width: 80pt)
      #v(3fr)
    ]
    // Bottom trace
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0.5pt, fill: pal.accent.transparentize(60%)))
    // Footer label
    place(bottom + right, dx: -2em, dy: -0.8em,
      text(fill: pal.ink-muted, size: 7pt, font: _mono-font, tracking: 0.5pt)[PCB REV.A],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single message in IC package frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 0pt,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Circuit trace bg
    circuit-background()
    // IC package frame border -- properly centered
    place(center + horizon,
      rect(
        width: 96%,
        height: 94%,
        stroke: 1.5pt + pal.accent.transparentize(30%),
        radius: 2pt,
      ))
    // Pin marks top
    place(center + horizon, dy: -47% + 4pt,
      stack(dir: ltr, spacing: 14pt,
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
      ))
    // Pin marks bottom
    place(center + horizon, dy: 47% - 4pt,
      stack(dir: ltr, spacing: 14pt,
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
        rect(width: 6pt, height: 4pt, fill: pal.accent.transparentize(50%)),
      ))
    // Centered text content
    set text(fill: pal.ink, size: 1.5em, weight: "bold")
    set std.align(horizon + center)
    pad(x: 4em, y: 3em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Circuit board fading out, farewell text
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Faded circuit pattern (using lower opacity SVG)
    place(top + left, dx: 0pt, dy: 0pt,
      image(bytes(_circuit-trace-svg), width: 100%, height: 100%))
    // Ghost text
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.accent.transparentize(90%), font: _mono-font, [END]),
    )
    // Via decorations scattered
    place(top + left, dx: 80pt, dy: 60pt, via-element(size: 30pt))
    place(bottom + right, dx: -80pt, dy: -70pt, via-element(size: 26pt))
    place(top + right, dx: -100pt, dy: 80pt, via-element(size: 20pt))
    // Content
    set std.align(center + horizon)
    pad(x: 4em)[
      #text(
        size: typo.kicker-size,
        weight: "medium",
        tracking: 2pt,
        fill: pal.accent,
        font: _mono-font,
      )[END OF TRANSMISSION]
      #v(0.8em)
      #trace-divider(color: pal.accent, width: 80pt)
      #v(0.8em)
      #text(size: 2em, weight: "bold", fill: pal.ink, body)
      #v(0.6em)
      #trace-divider(color: pal.accent.transparentize(40%), width: 50pt)
      #v(1.2em)
      #text(size: 8pt, fill: pal.ink-muted, font: _mono-font, tracking: 1pt)[CIRCUIT BOARD]
    ]
    // Bottom trace
    place(bottom + left, dy: -18pt,
      block(width: 100%, height: 0.5pt, fill: pal.accent.transparentize(60%)))
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// Theme Entry Point
// =====================================================================

#let circuit-board-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "pcb",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink, font: _sans-font)
  set heading(numbering: (..args) => none)

  show raw: set text(font: _mono-font)
  show raw.where(block: false): body => box(
    fill: rgb("#065F46"),
    inset: (x: 3pt, y: 0pt),
    outset: (x: 0pt, y: 3pt),
    radius: 2pt,
    { set par(justify: false); body },
  )
  show raw.where(block: true): body => block(
    width: 100%,
    fill: rgb("#065F46"),
    outset: (x: 0pt, y: 4pt),
    inset: (x: 8pt, y: 4pt),
    radius: 4pt,
    { set par(justify: false); body },
  )

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 4em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.ink,
      neutral-darkest: pal.bg,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
