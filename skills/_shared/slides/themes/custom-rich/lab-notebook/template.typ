// Lab Notebook Theme — Research laboratory notebook pages aesthetic
// Warm off-white "paper" background with graph paper grids, margin rules,
// handwritten-style annotations, specimen sketch frames, and data table styling
// Features: graph paper grid, margin rule lines, ring-binder decorations,
// specimen frames, sticky note callouts, protocol steps
// Perfect for academic research presentations, lab meetings, thesis defenses
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  paper: rgb("#FAF8F3"),
  ink: rgb("#2C2C2C"),
  teal: rgb("#1A7A6C"),
  teal-light: rgb("#E8F5F2"),
  orange: rgb("#D4552A"),
  orange-light: rgb("#FDF0EC"),
  margin-red: rgb("#C75B5B"),
  grid-blue: rgb("#B8D4E3"),
  grid-heavy: rgb("#8FBDD4"),
  card-bg: rgb("#FFFFFF"),
  text-muted: rgb("#6B6B6B"),
  binding-gray: rgb("#9E9E9E"),
  sticky-yellow: rgb("#FFF8DC"),
  sticky-border: rgb("#E6D88A"),
  specimen-green: rgb("#2E7D32"),
  specimen-bg: rgb("#F1F8E9"),
)


// ═══ SVG Definitions ═══

// Full-page graph paper grid — light blue thin lines with heavier lines at intervals
#let _graph-paper-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <pattern id="smallgrid" width="20" height="20" patternUnits="userSpaceOnUse">
      <path d="M 20 0 L 0 0 0 20" fill="none" stroke="#B8D4E3" stroke-width="0.4" opacity="0.5"/>
    </pattern>
    <pattern id="biggrid" width="100" height="100" patternUnits="userSpaceOnUse">
      <rect width="100" height="100" fill="url(#smallgrid)"/>
      <path d="M 100 0 L 0 0 0 100" fill="none" stroke="#8FBDD4" stroke-width="0.8" opacity="0.4"/>
    </pattern>
  </defs>
  <rect width="840" height="474" fill="url(#biggrid)"/>
  <rect x="0" y="0" width="840" height="474" fill="none" stroke="#8FBDD4" stroke-width="1" opacity="0.3"/>
</svg>```.text

// Margin rule line — vertical red/pink line on left like a notebook page
#let _margin-rule-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="56" y1="0" x2="56" y2="474" stroke="#C75B5B" stroke-width="1.5" opacity="0.4"/>
  <line x1="58" y1="0" x2="58" y2="474" stroke="#C75B5B" stroke-width="0.5" opacity="0.25"/>
  <circle cx="28" cy="50" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.2" opacity="0.35"/>
  <circle cx="28" cy="160" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.2" opacity="0.35"/>
  <circle cx="28" cy="270" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.2" opacity="0.35"/>
  <circle cx="28" cy="380" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.2" opacity="0.35"/>
  <path d="M22,50 L34,50" fill="none" stroke="#9E9E9E" stroke-width="0.6" opacity="0.25"/>
  <path d="M28,44 L28,56" fill="none" stroke="#9E9E9E" stroke-width="0.6" opacity="0.25"/>
  <path d="M22,270 L34,270" fill="none" stroke="#9E9E9E" stroke-width="0.6" opacity="0.25"/>
  <path d="M28,264 L28,276" fill="none" stroke="#9E9E9E" stroke-width="0.6" opacity="0.25"/>
</svg>```.text

// Ring-binder holes / spiral binding decorative element (bookend frame)
#let _binder-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="16" y="12" width="808" height="450" rx="4" ry="4" fill="none" stroke="#2C2C2C" stroke-width="1.5" opacity="0.3"/>
  <rect x="20" y="16" width="800" height="442" rx="2" ry="2" fill="none" stroke="#1A7A6C" stroke-width="0.8" opacity="0.25"/>
  <circle cx="36" cy="50" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <circle cx="36" cy="120" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <circle cx="36" cy="190" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <circle cx="36" cy="260" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <circle cx="36" cy="330" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <circle cx="36" cy="400" r="7" fill="none" stroke="#6B6B6B" stroke-width="2" opacity="0.5"/>
  <path d="M29,50 C29,42 43,42 43,50 C43,58 29,58 29,50" fill="none" stroke="#9E9E9E" stroke-width="1" opacity="0.3"/>
  <path d="M29,190 C29,182 43,182 43,190 C43,198 29,198 29,190" fill="none" stroke="#9E9E9E" stroke-width="1" opacity="0.3"/>
  <path d="M29,330 C29,322 43,322 43,330 C43,338 29,338 29,330" fill="none" stroke="#9E9E9E" stroke-width="1" opacity="0.3"/>
  <line x1="56" y1="12" x2="56" y2="462" stroke="#C75B5B" stroke-width="1.2" opacity="0.3"/>
</svg>```.text

// Specimen sketch frame — rounded corners with cross-hairs
#let _specimen-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="140" viewBox="0 0 200 140">
  <rect x="8" y="8" width="184" height="124" rx="8" ry="8" fill="none" stroke="#2E7D32" stroke-width="1.5" opacity="0.6"/>
  <line x1="20" y1="0" x2="20" y2="12" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="14" y1="6" x2="26" y2="6" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="180" y1="0" x2="180" y2="12" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="174" y1="6" x2="186" y2="6" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="20" y1="128" x2="20" y2="140" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="14" y1="134" x2="26" y2="134" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="180" y1="128" x2="180" y2="140" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
  <line x1="174" y1="134" x2="186" y2="134" stroke="#2E7D32" stroke-width="1" opacity="0.5"/>
</svg>```.text

// Tab/sticky-note callout decoration
#let _sticky-tab-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="24" viewBox="0 0 120 24">
  <path d="M4,24 L4,4 C4,1.8 5.8,0 8,0 L112,0 C114.2,0 116,1.8 116,4 L116,24" fill="#FFF8DC" stroke="#E6D88A" stroke-width="1.2" opacity="0.8"/>
  <line x1="12" y1="8" x2="108" y2="8" stroke="#E6D88A" stroke-width="0.6" opacity="0.5"/>
  <line x1="12" y1="13" x2="90" y2="13" stroke="#E6D88A" stroke-width="0.6" opacity="0.4"/>
  <line x1="12" y1="18" x2="70" y2="18" stroke="#E6D88A" stroke-width="0.6" opacity="0.3"/>
  <circle cx="108" cy="4" r="2" fill="#D4552A" opacity="0.4"/>
  <circle cx="12" cy="4" r="1.5" fill="#1A7A6C" opacity="0.4"/>
  <path d="M116,20 L120,24 L116,24 Z" fill="#E6D88A" opacity="0.6"/>
  <path d="M4,20 L0,24 L4,24 Z" fill="#E6D88A" opacity="0.6"/>
</svg>```.text

// Binding divider — spiral coil decorative separator
#let _binding-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <line x1="0" y1="8" x2="300" y2="8" stroke="#9E9E9E" stroke-width="0.8" opacity="0.3"/>
  <circle cx="30" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="70" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="110" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="150" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="190" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="230" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <circle cx="270" cy="8" r="5" fill="none" stroke="#9E9E9E" stroke-width="1.5" opacity="0.5"/>
  <path d="M25,8 C25,3 35,3 35,8 C35,13 25,13 25,8" fill="none" stroke="#6B6B6B" stroke-width="0.8" opacity="0.35"/>
  <path d="M145,8 C145,3 155,3 155,8 C155,13 145,13 145,8" fill="none" stroke="#6B6B6B" stroke-width="0.8" opacity="0.35"/>
  <path d="M265,8 C265,3 275,3 275,8 C275,13 265,13 265,8" fill="none" stroke="#6B6B6B" stroke-width="0.8" opacity="0.35"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render graph paper background (full page)
#let graph-paper-bg() = {
  image(bytes(_graph-paper-svg), width: 100%, height: 100%)
}

/// Render margin rule background
#let margin-rule-bg() = {
  image(bytes(_margin-rule-svg), width: 100%, height: 100%)
}

/// Render binder frame overlay (bookend element for title/ending)
#let binder-frame() = {
  image(bytes(_binder-frame-svg), width: 100%, height: 100%)
}

/// Render specimen frame
#let specimen-frame(width: 100%) = {
  box(width: width, image(bytes(_specimen-frame-svg), width: width))
}

/// Render sticky tab decoration
#let sticky-tab(width: 80pt) = {
  box(width: width, image(bytes(_sticky-tab-svg), width: width, height: 16pt))
}

/// Render binding divider
#let binding-coil(width: 100%) = {
  box(width: width, image(bytes(_binding-divider-svg), width: width, height: 12pt))
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — graph paper + margin rule
#let _content-atmosphere() = {
  // Full graph paper grid
  place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
  // Margin rule line
  place(top + left, box(width: 100%, height: 100%, margin-rule-bg()))
  // Subtle corner page-curl effect
  place(bottom + right, dx: -0.8em, dy: -0.5em,
    box(width: 12pt, height: 12pt,
      place(bottom + right,
        polygon(fill: palette.paper.darken(8%),
          (0pt, 12pt), (12pt, 0pt), (12pt, 12pt)))))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — paper bg, graph paper grid, margin rule, warm text
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
        set text(fill: palette.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Teal underline rule
      block(width: 140pt, height: 2pt, fill: palette.teal, radius: 1pt),
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
        box(width: 5pt, height: 5pt, radius: 2.5pt, fill: palette.teal)
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

/// Title slide — binder frame (bookend), graph paper bg, centered info
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Graph paper grid
    place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
    // Binder frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, binder-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.ink, info.title)
      #v(0.4em)
      // Teal rule
      #std.align(center, block(width: 200pt, height: 2.5pt, fill: palette.teal, radius: 1.2pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.teal, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.ink, weight: "regular", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.orange)[#utils.display-info-date(self)]
      }
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

/// New section slide — left teal accent bar, section number, binding coil decoration
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Graph paper
    place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
    // Notebook margin rule and punch holes
    place(top + left, box(width: 100%, height: 100%, margin-rule-bg()))
    // Left accent bar (teal tab)
    place(top + left, block(width: 5pt, height: 100%, fill: palette.teal))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in orange
      #text(size: 3.5em, fill: palette.orange, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Binding coil decoration
      #binding-coil(width: 160pt)
      #v(0.5em)
      // Section title
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom margin rule
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.margin-red.transparentize(60%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — centered statement on paper with specimen-frame border
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
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Graph paper
    place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
    // Notebook margin rule and punch holes
    place(top + left, box(width: 100%, height: 100%, margin-rule-bg()))
    // Dashed teal border frame
    place(center + horizon,
      rect(width: 82%, height: 72%,
        fill: none,
        stroke: (paint: palette.teal, thickness: 1.5pt, dash: "dashed"),
        radius: 6pt))
    // Center content in normal flow so Touying can measure the slide body.
    set std.align(center + horizon)
    block(width: 70%)[
      #stack(
        spacing: 0.8em,
        {
          set text(fill: palette.ink, size: 1.4em, weight: "bold")
          body
        },
        block(width: 120pt, height: 2pt, fill: palette.teal, radius: 1pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — binder frame (bookend), paper bg, farewell
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
    // Paper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.paper))
    // Graph paper
    place(top + left, box(width: 100%, height: 100%, graph-paper-bg()))
    // Binder frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, binder-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Binding coil above
      #binding-coil(width: 180pt)
      #v(0.8em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.5em)
      // Teal accent bar
      #block(width: 5em, height: 3pt, fill: palette.teal, radius: 1.5pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Entry card — main content card with ruled-line border (like notebook entry)
#let entry-card(title, body, accent: palette.teal) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.grid-blue),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Title with teal dot
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 8pt, height: 8pt, radius: 4pt, fill: accent),
        text(weight: "bold", fill: palette.ink, size: 0.92em, title),
      ),
      block(width: 50pt, height: 1.5pt, fill: accent.transparentize(50%), radius: 0.75pt),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Margin note — annotation box styled like a margin note
#let margin-note(body, accent: palette.margin-red) = {
  block(
    width: 100%,
    fill: palette.paper.darken(2%),
    stroke: (left: 2.5pt + accent, top: 0.5pt + accent.transparentize(60%), bottom: 0.5pt + accent.transparentize(60%)),
    inset: (x: 0.9em, y: 0.7em),
    radius: (right: 4pt),
  )[
    #set text(fill: palette.margin-red.darken(15%), size: 0.80em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}

/// Specimen box — highlighted specimen/sample description with cross-hair corners
#let specimen-box(title, body, accent: palette.specimen-green) = {
  block(
    width: 100%,
    fill: palette.specimen-bg,
    stroke: (paint: accent, thickness: 1.5pt),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    // Cross-hair indicator + title
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        text(fill: accent, size: 1em, weight: "bold")[+],
        text(weight: "bold", fill: accent, size: 0.92em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Protocol card — step-by-step procedure card with numbered steps look
#let protocol-card(title, body, accent: palette.teal) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.grid-blue),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    // Protocol title
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: accent, size: 0.90em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Binding divider — spiral binding decorative separator (SVG-based)
#let binding-divider(width: 80%) = {
  std.align(center, box(width: width, binding-coil(width: 100%)))
}

/// Reading stat — measurement/metric display with large value
#let reading-stat(label, value, color: palette.teal) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.grid-blue,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: color, size: 1.8em, weight: "bold")
        #value
        // Top-right colored indicator dot
        #place(top + right, dx: -6pt, dy: 6pt,
          box(width: 6pt, height: 6pt, radius: 3pt, fill: color.transparentize(40%)))
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Sample tag — capsule label like a specimen label
#let sample-tag(content, color: palette.teal) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: color.darken(10%), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Data table card — structured data display with header stripe
#let data-table-card(title, body, accent: palette.teal) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.grid-blue,
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Header bar
      block(width: 100%, fill: accent.lighten(85%), inset: (x: 1em, y: 0.5em))[
        #text(weight: "bold", fill: accent.darken(10%), size: 0.85em, title)
      ],
      // Content
      block(width: 100%, inset: (x: 1em, y: 0.7em))[
        #set text(fill: palette.ink, size: 0.80em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Sticky note — callout/insight box styled as a yellow sticky note
#let sticky-note(title, body) = {
  block(
    width: 100%,
    fill: palette.sticky-yellow,
    stroke: (paint: palette.sticky-border, thickness: 1.2pt),
    inset: (x: 1em, y: 0.8em),
    radius: 2pt,
  )[
    // Slight shadow/fold indicator
    #place(top + right, dx: -2pt, dy: 2pt,
      polygon(fill: palette.sticky-border.transparentize(50%),
        (0pt, 0pt), (10pt, 0pt), (10pt, 10pt)))
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.orange.darken(10%), size: 0.88em, title),
      [
      #set text(fill: palette.ink.lighten(10%), size: 0.80em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Observation log — timeline/sequence card with timestamp look
#let observation-log(title, body, accent: palette.orange) = {
  block(
    width: 100%,
    fill: palette.orange-light,
    stroke: (left: 4pt + accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        // Timestamp-like circle
        box(width: 10pt, height: 10pt, radius: 5pt, stroke: 1.5pt + accent, fill: palette.card-bg),
        text(weight: "bold", fill: accent.darken(10%), size: 0.92em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let lab-notebook-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.paper,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.teal,
      neutral-lightest: palette.card-bg,
      neutral-darkest: palette.ink,
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
