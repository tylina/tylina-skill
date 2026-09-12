// Lattice Theme — Crystalline lattice / molecular structure aesthetic
// Cool white background with structured grid patterns, hexagonal motifs, and node-connection SVG decorations
// Features: hexagonal grids, molecular nodes, crystal facets, interconnected structures
// Perfect for tech presentations, engineering talks, system architecture discussions
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#F5F7FA"),
  primary: rgb("#2558A6"),
  accent: rgb("#0D9488"),
  secondary: rgb("#6D55A3"),
  border: rgb("#D1D8E3"),
  text: rgb("#1E293B"),
  text-muted: rgb("#64748B"),
  card-bg: rgb("#FFFFFF"),
  primary-light: rgb("#2558A6").lighten(88%),
  accent-light: rgb("#0D9488").lighten(88%),
  secondary-light: rgb("#6D55A3").lighten(88%),
  grid-faint: rgb("#D1D8E3").transparentize(70%),
)


// ═══ SVG Definitions ═══

// Hexagonal lattice pattern — repeating hexagonal grid for background decoration
#let _hex-lattice-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <defs>
    <pattern id="hexgrid" width="60" height="52" patternUnits="userSpaceOnUse" patternTransform="translate(0,0)">
      <path d="M30,0 L60,15 L60,37 L30,52 L0,37 L0,15 Z" fill="none" stroke="#D1D8E3" stroke-width="0.6" opacity="0.35"/>
    </pattern>
  </defs>
  <rect width="840" height="474" fill="url(#hexgrid)"/>
</svg>```.text

// Molecular node connector — dots connected by lines, representing bonds
#let _node-connector-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="8" viewBox="0 0 200 8">
  <line x1="0" y1="4" x2="200" y2="4" stroke="#2558A6" stroke-width="1.5" opacity="0.6"/>
  <circle cx="0" cy="4" r="3" fill="#2558A6" opacity="0.8"/>
  <circle cx="50" cy="4" r="2.5" fill="#0D9488" opacity="0.7"/>
  <circle cx="100" cy="4" r="3" fill="#2558A6" opacity="0.8"/>
  <circle cx="150" cy="4" r="2.5" fill="#6D55A3" opacity="0.7"/>
  <circle cx="200" cy="4" r="3" fill="#2558A6" opacity="0.8"/>
</svg>```.text

// Crystal facet border — angular geometric frame for title slides
#let _crystal-facet-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M40,10 L800,10 L830,40 L830,434 L800,464 L40,464 L10,434 L10,40 Z" fill="none" stroke="#2558A6" stroke-width="2" opacity="0.5"/>
  <path d="M50,18 L790,18 L816,44 L816,430 L790,456 L50,456 L24,430 L24,44 Z" fill="none" stroke="#0D9488" stroke-width="1" opacity="0.3"/>
  <circle cx="40" cy="10" r="3" fill="#2558A6" opacity="0.6"/>
  <circle cx="800" cy="10" r="3" fill="#2558A6" opacity="0.6"/>
  <circle cx="830" cy="40" r="3" fill="#0D9488" opacity="0.6"/>
  <circle cx="830" cy="434" r="3" fill="#0D9488" opacity="0.6"/>
  <circle cx="800" cy="464" r="3" fill="#2558A6" opacity="0.6"/>
  <circle cx="40" cy="464" r="3" fill="#2558A6" opacity="0.6"/>
  <circle cx="10" cy="434" r="3" fill="#0D9488" opacity="0.6"/>
  <circle cx="10" cy="40" r="3" fill="#0D9488" opacity="0.6"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render hexagonal lattice background overlay
#let hex-lattice-bg() = {
  image(bytes(_hex-lattice-svg), width: 100%, height: 100%)
}

/// Render molecular node connector divider
#let node-connector(width: 100%) = {
  box(width: width, image(bytes(_node-connector-svg), width: width, height: 6pt))
}

/// Render crystal facet border overlay
#let crystal-facet-frame() = {
  image(bytes(_crystal-facet-svg), width: 100%, height: 100%)
}


// ═══ Helper Functions ═══

/// Faint hexagonal grid background for content slides
#let hex-grid-bg() = {
  place(top + left, box(width: 100%, height: 100%, hex-lattice-bg()))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — cool white bg, faint hex grid, structured header
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.primary, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Node connector underline
      node-connector(width: 140pt),
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
        box(width: 4pt, height: 4pt, radius: 2pt, fill: palette.accent)
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Keep the lattice identity visible in negative space on every content slide.
    hex-grid-bg()
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

/// Title slide — crystal facet border, centered title with node connectors
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Cool white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Hexagonal grid background
    hex-grid-bg()
    // Crystal facet frame
    place(top + left, box(width: 100%, height: 100%, crystal-facet-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.primary, info.title)
      #v(0.3em)
      // Node connector decoration
      #std.align(center, node-connector(width: 200pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.accent, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.text, weight: "regular", info.author)
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
        text(size: 0.8em, fill: palette.secondary)[#utils.display-info-date(self)]
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

/// New section slide — primary cobalt left accent, section title, lattice decoration
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
    // Hex grid
    hex-grid-bg()
    // Left accent bar
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number
      #text(size: 3em, fill: palette.accent, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.4em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Node connector
      #node-connector(width: 220pt)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 3pt, fill: palette.border))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep primary background, centered white text, crystal facets
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
    // Deep primary background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Crystal facet frame
    place(top + left, box(width: 100%, height: 100%, crystal-facet-frame()))
    // Keep the statement in normal flow so Touying can measure the slide.
    set std.align(center + horizon)
    block(width: 76%)[
      #set text(fill: white, size: 1.4em, weight: "bold")
      #stack(
        spacing: 0.8em,
        body,
        node-connector(width: 160pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — gradient feel with accent colors, molecular node decoration
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
    // Primary background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Hex grid (subtle on dark)
    hex-grid-bg()
    // Crystal facet frame
    place(top + left, box(width: 100%, height: 100%, crystal-facet-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        // Node connector above
        node-connector(width: 180pt),
        // Main text
        text(size: 2.4em, weight: "bold", fill: white, body),
        // Accent line below
        block(width: 5em, height: 3pt, fill: palette.accent, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Node card — card with left colored border and node-dot indicator, structured content
#let node-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: 4pt,
  )[
    #stack(
      spacing: 0.8em,
      // Node indicator dot + title
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

/// Bond stat — centered bond node, large value, and label for KPIs
#let bond-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.25em),
    radius: 4pt,
  )[
    #set std.align(center)
    // The complete icon -> value -> label sequence is one centered stack.
    #stack(
      spacing: 0.8em,
      box(width: 6pt, height: 6pt, radius: 3pt, fill: color.transparentize(30%)),
      text(fill: color, size: 1.65em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.72em, label),
      lazy-v(1fr),
    )
  ]
}

/// Crystal box — highlighted content box with angled accent corners
#let crystal-box(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (paint: accent, thickness: 1.5pt),
    inset: (x: 1.2em, y: 0.9em),
    radius: 4pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: accent, size: 0.95em, title),
      block(width: 40pt, height: 2pt, fill: accent.transparentize(50%)),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Lattice divider — horizontal separator with node dots
#let lattice-divider(color: palette.border, width: 80%) = {
  std.align(center,
    box(width: width)[
      #set std.align(horizon + center)
      #stack(dir: ltr, spacing: 0pt,
        box(width: 6pt, height: 6pt, radius: 3pt, fill: color),
        box(width: 1fr, height: 1.5pt, fill: color),
        box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.primary),
        box(width: 1fr, height: 1.5pt, fill: color),
        box(width: 6pt, height: 6pt, radius: 3pt, fill: color),
      )
    ]
  )
}

/// Atom tag — small capsule tag with dot indicator
#let atom-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 2.5pt, fill: color),
      text(fill: color, size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Structure highlight — key insight box with left border and accent background
#let structure-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.primary-light,
    stroke: (left: 4pt + palette.primary),
    inset: 14pt,
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.primary, size: 0.95em, title),
      {
        set text(fill: palette.text, size: 0.85em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Facet grid — structured data display with alternating row backgrounds
#let facet-grid(align: center + horizon, headers, rows) = {
  set text(size: 0.85em, fill: palette.text)
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.8em, y: 0.5em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, h))),
    ..rows.flatten(),
  )
}


// ═══ 3. Theme Entry Point ═══

#let lattice-theme(
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
