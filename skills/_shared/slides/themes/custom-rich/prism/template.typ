// Prism Theme — Light refraction through a prism: spectral color bands, geometric angles, rainbow-edge highlights
// Features: Clean white background, spectral color progression (violet → indigo → blue → cyan),
// prismatic triangle SVGs, spectral band separators, light ray decorations
// Best for: Tech/data presentations, scientific talks, innovation pitches, data visualization
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FAFBFD"),
  primary: rgb("#4C3D8F"),        // Deep violet
  secondary: rgb("#2E6BC6"),      // Electric blue
  accent: rgb("#E8793B"),         // Spectrum orange
  highlight: rgb("#0EA5C8"),      // Cyan
  text-dark: rgb("#1A1A2E"),      // Near-black
  text-body: rgb("#3D3D56"),      // Dark body text
  text-muted: rgb("#6D6D82"),     // Muted text (WCAG AA on light surfaces)
  card-bg: rgb("#FFFFFF"),        // Card white
  border: rgb("#E2E4ED"),         // Subtle border
  // Spectral progression
  violet: rgb("#4C3D8F"),
  indigo: rgb("#3B4FC4"),
  blue: rgb("#2E6BC6"),
  cyan: rgb("#0EA5C8"),
  green: rgb("#10B981"),
  orange: rgb("#E8793B"),
  red: rgb("#DC4A5F"),
  // Darker spectral variants for text on light surfaces
  cyan-text: rgb("#08758D"),
  green-text: rgb("#087A5A"),
  orange-text: rgb("#A84213"),
  red-text: rgb("#B92C45"),
)

#let spectrum-colors = (palette.violet, palette.indigo, palette.blue, palette.cyan, palette.green, palette.orange, palette.red)


// ═══ SVG Definitions ═══

// Prismatic triangle — geometric prism shape with spectral dispersion
#let _prism-triangle-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="110" viewBox="0 0 120 110">
  <defs>
    <linearGradient id="prismGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#4C3D8F;stop-opacity:0.15"/>
      <stop offset="50%" style="stop-color:#2E6BC6;stop-opacity:0.10"/>
      <stop offset="100%" style="stop-color:#0EA5C8;stop-opacity:0.05"/>
    </linearGradient>
  </defs>
  <polygon points="60,8 112,100 8,100" fill="url(#prismGrad)" stroke="#4C3D8F" stroke-width="1.5" stroke-opacity="0.4"/>
  <polygon points="60,22 98,90 22,90" fill="none" stroke="#2E6BC6" stroke-width="0.8" stroke-opacity="0.25"/>
</svg>```.text

// Spectral band — horizontal rainbow gradient bar
#let _spectral-band-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="4" viewBox="0 0 400 4">
  <defs>
    <linearGradient id="spectrumGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#4C3D8F;stop-opacity:1"/>
      <stop offset="16%" style="stop-color:#3B4FC4;stop-opacity:1"/>
      <stop offset="33%" style="stop-color:#2E6BC6;stop-opacity:1"/>
      <stop offset="50%" style="stop-color:#0EA5C8;stop-opacity:1"/>
      <stop offset="66%" style="stop-color:#10B981;stop-opacity:1"/>
      <stop offset="83%" style="stop-color:#E8793B;stop-opacity:1"/>
      <stop offset="100%" style="stop-color:#DC4A5F;stop-opacity:1"/>
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="400" height="4" rx="2" fill="url(#spectrumGrad)"/>
</svg>```.text

// Light ray lines — diverging lines from a point (like light through a prism)
#let _light-rays-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="120" viewBox="0 0 200 120">
  <line x1="20" y1="60" x2="180" y2="10" stroke="#4C3D8F" stroke-width="1.2" opacity="0.3"/>
  <line x1="20" y1="60" x2="180" y2="30" stroke="#3B4FC4" stroke-width="1.2" opacity="0.3"/>
  <line x1="20" y1="60" x2="180" y2="50" stroke="#2E6BC6" stroke-width="1.2" opacity="0.3"/>
  <line x1="20" y1="60" x2="180" y2="70" stroke="#0EA5C8" stroke-width="1.2" opacity="0.3"/>
  <line x1="20" y1="60" x2="180" y2="90" stroke="#10B981" stroke-width="1.2" opacity="0.3"/>
  <line x1="20" y1="60" x2="180" y2="110" stroke="#E8793B" stroke-width="1.2" opacity="0.3"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render prismatic triangle decoration
#let prism-triangle(width: 80pt) = {
  box(image(bytes(_prism-triangle-svg), width: width))
}

/// Render spectral band separator
#let spectral-band(width: 100%) = {
  box(width: width, image(bytes(_spectral-band-svg), width: width, height: 3.5pt))
}

/// Render light rays decoration
#let light-rays(width: 140pt) = {
  box(image(bytes(_light-rays-svg), width: width))
}


// ═══ Helper Functions ═══

/// Returns spectrum color by index (cycles through 7 spectral colors)
#let spectrum-color(index) = {
  spectrum-colors.at(calc.rem(index, spectrum-colors.len()))
}

/// Map bright spectral accent colors to WCAG-AA text variants on light surfaces.
#let spectrum-text-color(color) = {
  if color == palette.cyan {
    palette.cyan-text
  } else if color == palette.green {
    palette.green-text
  } else if color == palette.orange {
    palette.orange-text
  } else if color == palette.red {
    palette.red-text
  } else {
    color
  }
}

/// Faint geometric grid background pattern (triangular lattice)
#let prism-bg-pattern() = {
  // Subtle triangular grid lines
  for i in range(8) {
    let x-pos = (i + 1) * (100% / 9)
    place(top + left, dx: x-pos, dy: 0pt,
      line(length: 100%, angle: 90deg, stroke: 0.3pt + palette.border.transparentize(60%)))
  }
  for i in range(5) {
    let y-pos = (i + 1) * (100% / 6)
    place(top + left, dx: 0pt, dy: y-pos,
      line(length: 100%, stroke: 0.3pt + palette.border.transparentize(60%)))
  }
  // Subtle diagonal lines for prism effect
  place(top + left, dx: 0pt, dy: 0pt,
    line(length: 160pt, angle: 30deg, stroke: 0.3pt + palette.primary.transparentize(92%)))
  place(top + right, dx: -50pt, dy: 20pt,
    line(length: 120pt, angle: 150deg, stroke: 0.3pt + palette.secondary.transparentize(92%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — white background, spectral band top, prismatic accents
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Spectral band top bar
    block(width: 100%, height: 3.5pt, {
      box(width: 100%, image(bytes(_spectral-band-svg), width: 100%, height: 3.5pt))
    })
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Violet-to-blue underline gradient effect (two blocks)
      stack(dir: ltr, spacing: 3pt,
        block(width: 50pt, height: 3pt, fill: palette.primary, radius: 1.5pt),
        block(width: 30pt, height: 3pt, fill: palette.secondary, radius: 1.5pt),
        block(width: 15pt, height: 3pt, fill: palette.highlight, radius: 1.5pt),
      ),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.text-muted, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      if self.store.footer != none {
        utils.call-or-display(self, self.store.footer)
      },
      {
        // Spectral dots
        stack(dir: ltr, spacing: 5pt,
          box(circle(radius: 2.5pt, fill: palette.violet)),
          box(circle(radius: 2.5pt, fill: palette.blue)),
          box(circle(radius: 2.5pt, fill: palette.cyan)),
          box(circle(radius: 2.5pt, fill: palette.orange)),
        )
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    // Faint background pattern
    prism-bg-pattern()
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

/// Title slide — deep violet background with prismatic geometry and spectral rays
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Deep violet-to-dark gradient background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Large prismatic triangle overlay — bottom right
    place(bottom + right, dx: -20pt, dy: -10pt,
      polygon(fill: palette.secondary.transparentize(70%), stroke: none,
        (0pt, 0pt),
        (-300pt, 0pt),
        (-150pt, -250pt),
      )
    )
    // Second layer triangle
    place(bottom + right, dx: -60pt, dy: -30pt,
      polygon(fill: palette.highlight.transparentize(80%), stroke: none,
        (0pt, 0pt),
        (-200pt, 0pt),
        (-100pt, -180pt),
      )
    )
    // Top-left prism accent
    place(top + left, dx: 30pt, dy: 20pt,
      polygon(fill: white.transparentize(92%), stroke: 0.8pt + white.transparentize(80%),
        (0pt, 80pt),
        (40pt, 0pt),
        (80pt, 80pt),
      )
    )

    // Light ray lines from left
    place(left + horizon, dx: 0pt, dy: -20pt, {
      box(width: 160pt, image(bytes(_light-rays-svg), width: 160pt))
    })

    // Spectral band at bottom
    place(bottom + left, dy: -40pt,
      box(width: 100%, image(bytes(_spectral-band-svg), width: 100%, height: 4pt))
    )

    // Center content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: white, info.title)
      #v(0.3em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.1em, fill: white.transparentize(25%), info.subtitle)
        v(0.6em)
      }
      // Spectral line decoration
      #align(center, stack(dir: ltr, spacing: 4pt,
        block(width: 40pt, height: 3pt, fill: palette.highlight, radius: 1.5pt),
        block(width: 60pt, height: 3pt, fill: palette.secondary.lighten(20%), radius: 1.5pt),
        block(width: 40pt, height: 3pt, fill: palette.accent, radius: 1.5pt),
      ))
      #v(0.8em)
      // Author
      #if info.author != none {
        text(size: 1.15em, weight: "bold", fill: white, info.author)
        v(0.2em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.9em, fill: white.transparentize(35%), info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.3em)
        text(size: 0.85em, fill: palette.highlight.lighten(40%))[#utils.display-info-date(self)]
      }
    ]

    // Bottom-left spectral dots
    place(bottom + left, dx: 2em, dy: -1.5em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.cyan)),
        box(circle(radius: 3pt, fill: palette.blue)),
        box(circle(radius: 3pt, fill: palette.violet)),
      )
    )
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

/// New section slide — deep background with prismatic triangle and spectral title accent
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
    // Dark violet background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))

    // Prismatic triangle — right side
    place(right + bottom, dx: -40pt, dy: -40pt,
      polygon(fill: palette.secondary.transparentize(65%), stroke: none,
        (0pt, 0pt),
        (-250pt, 0pt),
        (-125pt, -200pt),
      )
    )
    // Inner triangle
    place(right + bottom, dx: -80pt, dy: -70pt,
      polygon(fill: palette.highlight.transparentize(75%), stroke: none,
        (0pt, 0pt),
        (-160pt, 0pt),
        (-80pt, -130pt),
      )
    )
    // Top-left small prism
    place(top + left, dx: 20pt, dy: 20pt,
      polygon(fill: white.transparentize(90%), stroke: 0.5pt + white.transparentize(85%),
        (0pt, 60pt),
        (30pt, 0pt),
        (60pt, 60pt),
      )
    )

    // Section content — left aligned, vertically centered
    set std.align(left + horizon)
    pad(left: 4em, right: 4em)[
      // Spectral accent blocks
      #stack(dir: ltr, spacing: 3pt,
        block(width: 35pt, height: 4pt, fill: palette.highlight, radius: 2pt),
        block(width: 20pt, height: 4pt, fill: palette.secondary.lighten(20%), radius: 2pt),
      )
      #v(0.8em)
      // Section title
      #set text(fill: white, size: 2.4em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.5em)
      // Spectral band below title
      #box(width: 200pt, image(bytes(_spectral-band-svg), width: 200pt, height: 3pt))
    ]

    // Bottom spectral dots
    place(bottom + left, dx: 4em, dy: -1.5em,
      stack(dir: ltr, spacing: 6pt,
        box(circle(radius: 3pt, fill: palette.cyan)),
        box(circle(radius: 3pt, fill: palette.green)),
        box(circle(radius: 3pt, fill: palette.orange)),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — full highlight-cyan background with prismatic overlays, bold centered text
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.primary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Subtle triangle overlays
    place(bottom + right,
      polygon(fill: palette.secondary.transparentize(70%), stroke: none,
        (0pt, 0pt),
        (-280pt, 0pt),
        (-140pt, -200pt),
      )
    )
    place(top + left,
      polygon(fill: white.transparentize(92%), stroke: none,
        (0pt, 0pt),
        (140pt, 0pt),
        (70pt, 100pt),
      )
    )
    // Spectral band at top
    place(top + left, dy: 0pt,
      box(width: 100%, image(bytes(_spectral-band-svg), width: 100%, height: 3pt))
    )
    set text(fill: white, size: 2em, weight: "bold")
    std.align(horizon + center, body)
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light background with centered card, prismatic decoration
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

    // Decorative prism triangles in corners
    place(top + right, dx: -30pt, dy: 30pt,
      polygon(fill: palette.primary.transparentize(88%), stroke: 0.5pt + palette.primary.transparentize(80%),
        (0pt, 70pt),
        (35pt, 0pt),
        (70pt, 70pt),
      )
    )
    place(bottom + left, dx: 40pt, dy: -40pt,
      polygon(fill: palette.secondary.transparentize(88%), stroke: 0.5pt + palette.secondary.transparentize(80%),
        (0pt, 55pt),
        (27pt, 0pt),
        (55pt, 55pt),
      )
    )

    // Center card
    set std.align(center + horizon)
    block(
      width: 60%,
      fill: palette.card-bg,
      stroke: 1pt + palette.border,
      radius: 12pt,
      inset: (x: 2em, y: 2em),
    )[
      #set std.align(center)
      // Spectral band top decoration
      #box(width: 120pt, image(bytes(_spectral-band-svg), width: 120pt, height: 3pt))
      #v(0.8em)
      // Content
      #text(size: 2.4em, weight: "bold", fill: palette.text-dark, body)
      #v(0.5em)
      // Prismatic underline
      #stack(dir: ltr, spacing: 3pt,
        block(width: 30pt, height: 3pt, fill: palette.violet, radius: 1.5pt),
        block(width: 30pt, height: 3pt, fill: palette.blue, radius: 1.5pt),
        block(width: 30pt, height: 3pt, fill: palette.cyan, radius: 1.5pt),
      )
      #v(0.6em)
      // Spectral dots
      #stack(dir: ltr, spacing: 7pt,
        box(circle(radius: 3pt, fill: palette.violet)),
        box(circle(radius: 3pt, fill: palette.blue)),
        box(circle(radius: 3pt, fill: palette.cyan)),
        box(circle(radius: 3pt, fill: palette.green)),
        box(circle(radius: 3pt, fill: palette.orange)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Spectrum card — card with spectral left border progression
#let spectrum-card(title, body, index: 0) = {
  let color = spectrum-color(index)
  let text-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: text-color, size: 0.95em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Wavelength stat — large metric display with spectral color accent
#let wavelength-stat(label, value, unit: none, color: palette.primary) = {
  let text-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (bottom: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: (top: 8pt),
  )[
    #set text(fill: palette.text-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: text-color, size: 1.8em, weight: "bold")
        #value
        #if unit != none {
          h(0.2em)
          text(fill: palette.text-muted, size: 0.4em, weight: "regular", unit)
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Refraction box — highlighted callout with violet accent for key information
#let refraction-box(title, body) = {
  block(
    width: 100%,
    fill: palette.primary.lighten(95%),
    stroke: (left: 4pt + palette.primary),
    inset: 12pt,
    radius: (right: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.primary, size: 0.9em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Band divider — spectral gradient horizontal separator
#let band-divider(width: 100%) = {
  block(inset: (y: 0.35em))[
    #box(width: width, image(bytes(_spectral-band-svg), width: width, height: 3pt))
  ]
}

/// Photon tag — small colored tag/chip
#let photon-tag(content, color: palette.primary) = {
  let text-color = spectrum-text-color(color)
  box(
    fill: color.transparentize(94%),
    stroke: 1pt + color.transparentize(50%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #set text(fill: text-color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Lens highlight — emphasis box with cyan highlight border for featured content
#let lens-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.highlight.lighten(96%),
    stroke: (top: 3pt + palette.highlight, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 8pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.cyan-text, size: 0.92em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Diffraction grid — data table with spectral header
#let diffraction-grid(align: center + horizon, columns: auto, text-size: 0.82em, headers, rows) = {
  let resolved-columns = if columns == auto { headers.len() * (1fr,) } else { columns }
  set text(size: text-size, fill: palette.text-body)
  table(
    columns: resolved-columns,
    fill: (_, row) => if row == 0 { palette.primary }
      else if calc.odd(row) { palette.card-bg } else { palette.bg },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.7em, y: 0.25em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: white, h))),
    ..rows.flatten(),
  )
}

/// Prism card — numbered feature card with spectral color cycling
#let prism-card(number, title, description) = {
  let color = spectrum-color(number - 1)
  let badge-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.1em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      box(
        fill: badge-color,
        width: 1.8em,
        height: 1.8em,
        radius: 4pt,
        inset: 0pt,
      )[
        #set std.align(center + horizon)
        #set text(fill: white, weight: "bold", size: 0.85em)
        #str(number)
      ],
      text(weight: "bold", fill: palette.text-dark, size: 0.95em, title),
      {
        set text(fill: palette.text-body, size: 0.78em)
        description
      },
      lazy-v(1fr),
    )
  ]
}

/// Roadmap card — phase card with a spectral top edge and standard list content
#let roadmap-card(period, title, body, color: palette.primary) = {
  let text-color = spectrum-text-color(color)
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 8pt),
  )[
    #stack(
      spacing: .8em,
      text(size: 0.7em, weight: "bold", fill: text-color, period),
      text(size: 0.9em, weight: "bold", fill: palette.text-dark, title),
      {
        set text(size: 0.72em, fill: palette.text-body)
        body
      },
      lazy-v(1fr),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let prism-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(
    size: 20pt,
    fill: palette.text-body,
  )

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.primary,
      neutral-lightest: white,
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
