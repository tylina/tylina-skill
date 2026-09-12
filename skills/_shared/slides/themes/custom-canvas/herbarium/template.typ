// Herbarium Theme — Scientific botanical herbarium aesthetic
// Pressed plant specimens mounted on archival paper, handwritten Latin labels,
// specimen numbers, museum collection catalog aesthetic.
// The beauty of scientific documentation of nature.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================

#let presets = (
  herbarium: (
    bg: rgb("#FDFAF5"),
    ink: rgb("#2B3A2B"),
    accent: rgb("#6B8F6B"),
    secondary: rgb("#8B6914"),
    surface: rgb("#F5F2EA"),
  ),
  field-notes: (
    bg: rgb("#FAF8F0"),
    ink: rgb("#3A3028"),
    accent: rgb("#5A7A50"),
    secondary: rgb("#9B7830"),
    surface: rgb("#F0ECE0"),
  ),
  autumn-collection: (
    bg: rgb("#FBF7F0"),
    ink: rgb("#3D2B1F"),
    accent: rgb("#8B5E3C"),
    secondary: rgb("#6B7F3A"),
    surface: rgb("#F2EDE4"),
  ),
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
  let surface = p.surface
  (
    bg: bg,
    ink: ink,
    accent: accent,
    secondary: secondary,
    surface: surface,
    // Derived from ink
    ink-light: ink.transparentize(30%),
    ink-muted: ink.transparentize(25%),
    ink-faint: ink.transparentize(75%),
    ink-ghost: ink.transparentize(92%),
    // Derived from accent
    accent-text: accent.darken(25%),
    accent-dim: accent.transparentize(30%),
    accent-muted: accent.transparentize(50%),
    accent-faint: accent.transparentize(80%),
    accent-ghost: accent.transparentize(93%),
    accent-on-dark: accent.lighten(40%),
    // Derived from secondary
    secondary-text: secondary.darken(20%),
    secondary-dim: secondary.transparentize(30%),
    secondary-muted: secondary.transparentize(50%),
    secondary-faint: secondary.transparentize(80%),
    // Surface derived
    surface-dark: surface.darken(8%),
    // Meta
    meta-color: ink.transparentize(25%),
    rule-color: ink.transparentize(70%),
  )
}

// Default palette
#let palette = build-palette("herbarium")

// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  display: 38pt,
  h1: 26pt,
  h2: 20pt,
  body: 16pt,
  small: 12pt,
  tiny: 9pt,
  meta: 7.5pt,
  specimen-num: 11pt,
)

// =====================================================================
// Font Constants
// =====================================================================

#let _serif-font = ("Libertinus Serif", "Noto Serif SC")
#let _mono-font = "DejaVu Sans Mono"

// =====================================================================
// SVG Definitions
// =====================================================================

// Pressed leaf: elliptical silhouette with center vein and side veins
#let _leaf-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 80 140\"><ellipse cx=\"40\" cy=\"70\" rx=\"28\" ry=\"55\" fill=\"currentColor\" opacity=\"0.12\"/><line x1=\"40\" y1=\"12\" x2=\"40\" y2=\"128\" stroke=\"currentColor\" stroke-width=\"1\" opacity=\"0.4\"/><line x1=\"40\" y1=\"35\" x2=\"22\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"35\" x2=\"58\" y2=\"28\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"55\" x2=\"18\" y2=\"45\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"55\" x2=\"62\" y2=\"45\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"75\" x2=\"16\" y2=\"68\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"75\" x2=\"64\" y2=\"68\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"95\" x2=\"20\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"95\" x2=\"60\" y2=\"90\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.3\"/><line x1=\"40\" y1=\"112\" x2=\"26\" y2=\"108\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.25\"/><line x1=\"40\" y1=\"112\" x2=\"54\" y2=\"108\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.25\"/></svg>"

// Specimen mounting tape: diagonal corner strip (like photo corners)
#let _tape-corner-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 40 40\"><polygon points=\"0,0 40,0 0,40\" fill=\"currentColor\" opacity=\"0.15\"/><line x1=\"0\" y1=\"0\" x2=\"40\" y2=\"0\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"0\" y1=\"0\" x2=\"0\" y2=\"40\" stroke=\"currentColor\" stroke-width=\"0.5\" opacity=\"0.3\"/><line x1=\"3\" y1=\"3\" x2=\"34\" y2=\"3\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/></svg>"

// Botanical cross-section: circle with radial lines (stem cross-section)
#let _cross-section-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 60 60\"><circle cx=\"30\" cy=\"30\" r=\"26\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><circle cx=\"30\" cy=\"30\" r=\"18\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.3\"/><circle cx=\"30\" cy=\"30\" r=\"8\" fill=\"currentColor\" opacity=\"0.08\"/><line x1=\"30\" y1=\"4\" x2=\"30\" y2=\"56\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><line x1=\"4\" y1=\"30\" x2=\"56\" y2=\"30\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/><line x1=\"11\" y1=\"11\" x2=\"49\" y2=\"49\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><line x1=\"49\" y1=\"11\" x2=\"11\" y2=\"49\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.2\"/><circle cx=\"30\" cy=\"30\" r=\"3\" fill=\"currentColor\" opacity=\"0.15\"/></svg>"

// Scale bar: ruler-like marks for scientific measurement
#let _scale-bar-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 120 16\"><line x1=\"5\" y1=\"10\" x2=\"115\" y2=\"10\" stroke=\"currentColor\" stroke-width=\"0.8\" opacity=\"0.5\"/><line x1=\"5\" y1=\"6\" x2=\"5\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"27\" y1=\"8\" x2=\"27\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.4\"/><line x1=\"49\" y1=\"6\" x2=\"49\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"71\" y1=\"8\" x2=\"71\" y2=\"12\" stroke=\"currentColor\" stroke-width=\"0.4\" opacity=\"0.4\"/><line x1=\"93\" y1=\"6\" x2=\"93\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/><line x1=\"115\" y1=\"6\" x2=\"115\" y2=\"14\" stroke=\"currentColor\" stroke-width=\"0.6\" opacity=\"0.5\"/></svg>"

// Collection number label: rectangular frame with dashed border
#let _label-frame-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 140 50\"><rect x=\"3\" y=\"3\" width=\"134\" height=\"44\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.8\" stroke-dasharray=\"4 2\" opacity=\"0.5\"/><rect x=\"7\" y=\"7\" width=\"126\" height=\"36\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"0.3\" opacity=\"0.25\"/></svg>"

// =====================================================================
// SVG Render Helpers
// =====================================================================

#let leaf-ornament(color: palette.accent, width: 60pt, height: 105pt) = {
  let svg = _leaf-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

#let tape-corner(color: palette.secondary, size: 28pt) = {
  let svg = _tape-corner-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let cross-section(color: palette.accent, size: 40pt) = {
  let svg = _cross-section-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: size, height: size)
}

#let scale-bar(color: palette.ink, width: 80pt) = {
  let svg = _scale-bar-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: 10pt)
}

#let label-frame(color: palette.secondary, width: 100pt, height: 36pt) = {
  let svg = _label-frame-svg.replace("currentColor", color.to-hex())
  image(bytes(svg), width: width, height: height)
}

// =====================================================================
// Small Decorative Helpers
// =====================================================================

/// specimen-dot -- Small circular marker for specimen notation
#let specimen-dot(color: palette.accent, size: 4pt) = {
  circle(radius: size / 2, fill: color)
}

/// mounting-corner -- Tape corner placed at a specific corner orientation
#let mounting-corner(color: palette.secondary, size: 22pt, rotation: 0deg) = {
  rotate(rotation, origin: center, tape-corner(color: color, size: size))
}

// =====================================================================
// Reusable Components
// =====================================================================

/// specimen-card -- Cream card with thin green border + mounting corner accents
#let specimen-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: 0.6pt + accent.transparentize(40%),
    inset: (x: 1.1em, top: 0.9em, bottom: 0.7em),
  )[
    // Mounting corner decorations
    #place(top + left, dx: -1.1em, dy: -0.9em, mounting-corner(color: palette.secondary, size: 18pt, rotation: 0deg))
    #place(top + right, dx: 1.1em, dy: -0.9em, mounting-corner(color: palette.secondary, size: 18pt, rotation: 90deg))
    #place(bottom + left, dx: -1.1em, dy: 0.7em, mounting-corner(color: palette.secondary, size: 18pt, rotation: -90deg))
    #place(bottom + right, dx: 1.1em, dy: 0.7em, mounting-corner(color: palette.secondary, size: 18pt, rotation: 180deg))
    // Title in small caps style
    #stack(spacing: .8em,
      text(size: typo.body, weight: "semibold", fill: palette.ink, title),
      block(width: 40pt, height: 1pt, fill: accent.transparentize(50%)),
      [
        #set text(size: 13pt, fill: palette.ink-light)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// taxonomy-stat -- Number + italic Latin subtitle (like taxonomy counts)
#let taxonomy-stat(value, label, accent: palette.accent) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(spacing: .8em,
      text(
        size: typo.specimen-num,
        weight: "medium",
        tracking: 1pt,
        fill: palette.secondary-text,
        font: _mono-font,
        upper(label),
      ),
      text(size: 40pt, weight: "bold", fill: palette.ink, value),
      [
        #block(width: 28pt, height: 1.2pt, fill: accent)
        #lazy-v(1fr)
      ],
    )
  ]
}

/// vein-divider -- Thin branching line divider
#let vein-divider(width: 100%, color: palette.accent) = {
  block(width: width, height: 14pt)[
    // Main horizontal vein
    #place(left + horizon, line(length: 100%, stroke: 0.5pt + color.transparentize(40%)))
    // Branching marks
    #place(left + horizon, dx: 20%, dy: -3pt, line(length: 12pt, angle: -30deg, stroke: 0.4pt + color.transparentize(60%)))
    #place(left + horizon, dx: 40%, dy: 3pt, line(length: 10pt, angle: 25deg, stroke: 0.4pt + color.transparentize(60%)))
    #place(left + horizon, dx: 60%, dy: -2pt, line(length: 14pt, angle: -20deg, stroke: 0.4pt + color.transparentize(60%)))
    #place(left + horizon, dx: 80%, dy: 2pt, line(length: 11pt, angle: 30deg, stroke: 0.4pt + color.transparentize(60%)))
  ]
}

/// genus-tag -- Small italic label in dashed frame
#let genus-tag(body, color: palette.accent) = {
  box(
    fill: palette.surface,
    stroke: (paint: color.transparentize(40%), thickness: 0.5pt, dash: "dashed"),
    inset: (x: 7pt, y: 3pt),
    radius: 0pt,
  )[
    #text(size: typo.small, fill: color.darken(25%), style: "italic", weight: "medium", body)
  ]
}

/// field-quote -- Handwriting-style with green accent (field notebook feel)
#let field-quote(body, cite: none) = {
  block(
    width: 100%,
    stroke: (left: 1.5pt + palette.accent),
    inset: (left: 1.2em, right: 1em, y: 0.6em),
    fill: palette.surface.transparentize(50%),
  )[
    #set text(size: typo.body, style: "italic", fill: palette.ink)
    #body
    #if cite != none {
      v(0.4em)
      text(
        size: typo.tiny,
        style: "normal",
        weight: "medium",
        tracking: 1pt,
        fill: palette.meta-color,
        font: _mono-font,
        [-- #upper(cite)],
      )
    }
    #lazy-v(1fr)
  ]
}

/// catalog-panel -- Numbered, systematic layout with specimen-number header
#let catalog-panel(number, title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (top: 1.5pt + accent, rest: 0.4pt + palette.ink-faint),
    inset: (x: 1em, top: 0.7em, bottom: 0.6em),
  )[
    // Specimen number + title header
    #stack(spacing: .8em,
      grid(columns: (auto, 1fr), column-gutter: 8pt, align: horizon,
        text(size: typo.specimen-num, fill: palette.secondary-text, weight: "bold", font: _mono-font, number),
        text(size: typo.body, fill: palette.ink, weight: "medium", title),
      ),
      block(width: 100%, height: 0.4pt, fill: palette.ink-faint),
      [
        #set text(size: 13pt, fill: palette.ink-light)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// herbarium-table -- Data table styled like a museum catalog
#let herbarium-table(align: center + horizon, headers, ..rows) = {
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.surface-dark },
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 0.8em, y: 0.4em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.ink, size: 9pt, tracking: 0.8pt, font: _mono-font, upper(h)))),
    ..rows.pos().flatten().map(c => text(fill: palette.ink-light, size: 11pt, c)),
  )
}

/// collection-label -- Rectangular dashed-border label (like herbarium sheet label)
#let collection-label(collector, number, location, date: none) = {
  block(
    width: 100%,
    stroke: (paint: palette.secondary.transparentize(30%), thickness: 0.6pt, dash: "dashed"),
    inset: (x: 1em, y: 0.6em),
    fill: palette.bg,
  )[
    #grid(columns: (1fr, auto), column-gutter: 12pt,
      {
        set text(size: typo.small, fill: palette.ink)
        text(weight: "medium", collector)
        linebreak()
        text(style: "italic", size: 10pt, fill: palette.ink-muted, location)
      },
      {
        set text(size: typo.specimen-num, fill: palette.secondary-text, weight: "bold", font: _mono-font)
        number
        if date != none {
          linebreak()
          text(size: 8pt, weight: "regular", fill: palette.meta-color, date)
        }
      },
    )
  ]
}

/// pressed-specimen -- Decorative card with leaf SVG watermark behind content
#let pressed-specimen(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 0.5pt + palette.ink-faint,
    inset: (x: 1.2em, y: 0.9em),
  )[
    // Leaf watermark in background
    #place(right + bottom, dx: -8pt, dy: -8pt,
      leaf-ornament(color: accent.transparentize(40%), width: 50pt, height: 88pt))
    // Content
    #stack(spacing: .8em,
      text(size: typo.body, weight: "semibold", fill: palette.ink, style: "italic", title),
      [
        #set text(size: 13pt, fill: palette.ink-light)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// accession-number -- Styled accession/catalog number display
#let accession-number(number, color: palette.secondary) = {
  box(
    fill: color.transparentize(90%),
    stroke: 0.4pt + color.transparentize(50%),
    inset: (x: 6pt, y: 2pt),
  )[
    #text(size: typo.specimen-num, fill: color.darken(20%), weight: "bold", font: _mono-font, number)
  ]
}

/// determination-label -- Botanical determination label (species name format)
#let determination-label(genus, species, authority: none) = {
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.body, style: "italic", fill: palette.ink, weight: "medium")[#genus #species]
    #if authority != none {
      h(6pt)
      text(size: typo.small, fill: palette.ink-muted, weight: "regular", authority)
    }
  ]
}

// =====================================================================
// Internal Slide Helpers
// =====================================================================

/// _slide-header -- Standard header for content slides
#let _slide-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(dir: ttb, spacing: .8em,
    {
      set text(fill: pal.ink, size: 1.3em, weight: "medium")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
    },
    block(width: 44pt, height: 1.2pt, fill: pal.accent),
  )
}

/// _slide-footer -- Standard footer for content slides
#let _slide-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.meta-color, size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[HERBARIUM]
    },
    text(fill: pal.accent-muted, size: 5pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _dark-header -- Header for dark/inverted slides
#let _dark-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: pal.bg.transparentize(40%), font: _mono-font)
    grid(
      columns: (1fr, 1fr),
      {
        if custom-left != none {
          custom-left
        } else if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        if custom-right != none {
          custom-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
}

/// _dark-footer -- Footer for dark slides
#let _dark-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  set text(fill: pal.bg.transparentize(40%), size: 0.6em)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(font: _mono-font, size: 7pt, tracking: 0.5pt)
      upper[HERBARIUM]
    },
    text(fill: pal.accent-muted, size: 5pt)[#sym.diamond.filled],
    {
      set std.align(right)
      set text(font: _mono-font, size: 7pt)
      context [#utils.slide-counter.display()]
    },
  )
}

// =====================================================================
// Slide Functions
// =====================================================================

/// slide -- Standard content slide with archival paper background, leaf watermark
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let header(self) = _slide-header(self)
  let footer(self) = _slide-footer(self)
  let background = block(width: 100%, height: 100%)[
    // Subtle leaf ornament in bottom-right corner
    #place(bottom + right, dx: -2.5em, dy: -1.6em,
      leaf-ornament(color: pal.accent.transparentize(60%), width: 40pt, height: 70pt))
    // Scale bar decoration in top-right
    #place(top + right, dx: -2.5em, dy: 3.2em,
      scale-bar(color: pal.ink-faint, width: 60pt))
  ]
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(header: header, footer: footer, background: background),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// dark-slide -- Inverted: dark botanical green background with cream text
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette

  let header = _dark-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _dark-footer(self)

  let setting(body) = {
    // Cross-section decoration in corner
    place(top + right, dx: -30pt, dy: 20pt,
      cross-section(color: pal.bg.transparentize(60%), size: 50pt))
    // Leaf ghost in bottom-left
    place(bottom + left, dx: 20pt, dy: -20pt,
      leaf-ornament(color: pal.bg.transparentize(75%), width: 45pt, height: 80pt))
    set text(fill: pal.bg)
    show: std.align.with(self.store.align)
    body
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.ink,
      header: header,
      footer: footer,
      margin: (top: 2.5em, bottom: 1.2em, x: 2.5em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- Archival paper with specimen mounting tape corners, botanical decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Archival paper background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Specimen mounting tape corners (diagonal strips)
    place(top + left, dx: 12pt, dy: 12pt,
      mounting-corner(color: pal.secondary, size: 32pt, rotation: 0deg))
    place(top + right, dx: -12pt, dy: 12pt,
      mounting-corner(color: pal.secondary, size: 32pt, rotation: 90deg))
    place(bottom + left, dx: 12pt, dy: -12pt,
      mounting-corner(color: pal.secondary, size: 32pt, rotation: -90deg))
    place(bottom + right, dx: -12pt, dy: -12pt,
      mounting-corner(color: pal.secondary, size: 32pt, rotation: 180deg))

    // Thin border (herbarium sheet edge)
    place(center + horizon,
      rect(width: 95%, height: 92%, stroke: 0.4pt + pal.ink-faint, fill: none))

    // Leaf ornament upper-right
    place(top + right, dx: -60pt, dy: 30pt,
      leaf-ornament(color: pal.accent.transparentize(30%), width: 65pt, height: 115pt))

    // Cross-section lower-left
    place(bottom + left, dx: 50pt, dy: -40pt,
      cross-section(color: pal.accent.transparentize(50%), size: 55pt))

    // Scale bar at bottom
    place(bottom + center, dy: -20pt,
      scale-bar(color: pal.ink-muted, width: 100pt))

    // Centered title content
    set std.align(center + horizon)
    pad(x: 5em, y: 3em)[
      // Institution kicker
      #if info.institution != none {
        text(
          size: typo.tiny,
          weight: "medium",
          tracking: 2pt,
          fill: pal.secondary-text,
          font: _mono-font,
          upper(info.institution),
        )
        v(1em)
      }
      // Title
      #text(size: typo.display, weight: "regular", fill: pal.ink, info.title)
      #v(0.5em)
      // Vein divider
      #block(width: 180pt, height: 8pt)[
        #place(left + horizon, line(length: 75pt, stroke: 0.5pt + pal.accent))
        #place(center + horizon, specimen-dot(color: pal.accent, size: 4pt))
        #place(right + horizon, line(length: 75pt, stroke: 0.5pt + pal.accent))
      ]
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 16pt, weight: "regular", style: "italic", fill: pal.ink-light, info.subtitle)
        v(0.8em)
      }
      // Author + date
      #{
        set text(size: typo.tiny, fill: pal.meta-color, font: _mono-font)
        if info.author != none {
          upper[#info.author]
        }
        if info.author != none and info.date != none {
          h(1.5em)
          text(fill: pal.accent, size: 5pt)[#sym.diamond.filled]
          h(1.5em)
        }
        if info.date != none {
          utils.display-info-date(self)
        }
      }
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Catalog section divider with specimen number, botanical style
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Section number with collection-label style (top-right)
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        block(width: 100pt, inset: 8pt)[
          #set std.align(center)
          #text(fill: pal.secondary-text, size: 48pt, weight: "bold", font: _mono-font, num-str)
        ]
      },
    )

    // Leaf ornament (left side)
    place(left + horizon, dx: 30pt,
      leaf-ornament(color: pal.accent.transparentize(40%), width: 55pt, height: 95pt))

    // Mounting tape accent (top-left)
    place(top + left, dx: 15pt, dy: 15pt,
      mounting-corner(color: pal.secondary.transparentize(30%), size: 24pt, rotation: 0deg))

    // Collection label decoration
    place(top + left, dx: 3em, dy: 1.5em,
      text(size: 7pt, fill: pal.meta-color, font: _mono-font)[SECT. #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      } | HERBARIUM],
    )

    // Top accent line
    place(top + left, dx: 3em, dy: 2.8em,
      line(length: 60pt, stroke: 0.8pt + pal.accent))

    // Content
    pad(left: 5em, right: 8em, top: 5em, bottom: 2em)[
      #v(1fr)
      #text(
        size: typo.tiny,
        weight: "medium",
        tracking: 1.5pt,
        fill: pal.secondary-text,
        font: _mono-font,
      )[SECTION #context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        num-str
      }]
      #v(0.6em)
      #{
        set text(fill: pal.ink, size: 2em, weight: "regular")
        utils.display-current-heading(level: 1, numbered: false)
      }
      #v(0.3em)
      #block(width: 50pt, height: 1.2pt, fill: pal.accent)
      #v(3fr)
    ]

    // Bottom scale bar
    place(bottom + right, dx: -3em, dy: -1.5em,
      scale-bar(color: pal.ink-muted, width: 70pt))

    // Footer label
    place(bottom + left, dx: 2em, dy: -0.8em,
      text(fill: pal.meta-color, size: 7pt, font: _mono-font)[HERBARIUM],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Single statement on archival paper with botanical frame
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.surface,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Thin botanical border
    place(center + horizon,
      rect(width: 92%, height: 88%, stroke: 0.5pt + pal.ink-faint, fill: none))

    // Mounting corners
    place(top + left, dx: 12pt, dy: 12pt,
      mounting-corner(color: pal.secondary.transparentize(30%), size: 20pt, rotation: 0deg))
    place(top + right, dx: -12pt, dy: 12pt,
      mounting-corner(color: pal.secondary.transparentize(30%), size: 20pt, rotation: 90deg))
    place(bottom + left, dx: 12pt, dy: -12pt,
      mounting-corner(color: pal.secondary.transparentize(30%), size: 20pt, rotation: -90deg))
    place(bottom + right, dx: -12pt, dy: -12pt,
      mounting-corner(color: pal.secondary.transparentize(30%), size: 20pt, rotation: 180deg))

    // Leaf ornaments (subtle, in corners)
    place(top + right, dx: -40pt, dy: 30pt,
      leaf-ornament(color: pal.accent.transparentize(60%), width: 35pt, height: 60pt))
    place(bottom + left, dx: 30pt, dy: -30pt,
      cross-section(color: pal.accent.transparentize(60%), size: 35pt))

    set text(fill: pal.ink, size: 1.3em, weight: "regular", style: "italic")
    set std.align(horizon + center)
    pad(x: 2em, body)
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- Final slide with specimen collection aesthetic
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))

    // Ghost text (collection number style)
    place(center + horizon,
      text(size: 100pt, weight: "bold", fill: pal.ink-ghost, font: _mono-font)[FINIS],
    )

    // Thin frame
    place(center + horizon,
      rect(width: 95%, height: 92%, stroke: 0.4pt + pal.ink-faint, fill: none))

    // Mounting corners
    place(top + left, dx: 14pt, dy: 14pt,
      mounting-corner(color: pal.secondary, size: 28pt, rotation: 0deg))
    place(top + right, dx: -14pt, dy: 14pt,
      mounting-corner(color: pal.secondary, size: 28pt, rotation: 90deg))
    place(bottom + left, dx: 14pt, dy: -14pt,
      mounting-corner(color: pal.secondary, size: 28pt, rotation: -90deg))
    place(bottom + right, dx: -14pt, dy: -14pt,
      mounting-corner(color: pal.secondary, size: 28pt, rotation: 180deg))

    // Leaf decorations
    place(top + left, dx: 80pt, dy: 50pt,
      leaf-ornament(color: pal.accent.transparentize(50%), width: 50pt, height: 88pt))
    place(bottom + right, dx: -80pt, dy: -50pt,
      leaf-ornament(color: pal.accent.transparentize(60%), width: 45pt, height: 78pt))

    // Centered content
    set std.align(center + horizon)
    pad(x: 4em)[
      // Cross-section ornament above
      #std.align(center, cross-section(color: pal.accent, size: 32pt))
      #v(0.8em)
      #text(size: 1.8em, weight: "regular", fill: pal.ink, body)
      #v(0.6em)
      // Vein divider
      #std.align(center, block(width: 140pt, height: 8pt)[
        #place(left + horizon, line(length: 55pt, stroke: 0.5pt + pal.accent))
        #place(center + horizon, specimen-dot(color: pal.accent, size: 4pt))
        #place(right + horizon, line(length: 55pt, stroke: 0.5pt + pal.accent))
      ])
      #v(0.8em)
      #text(size: 9pt, fill: pal.meta-color, font: _mono-font, tracking: 1.5pt)[HERBARIUM COLLECTION]
    ]
  }
  touying-slide(self: self, main-body)
})

// =====================================================================
// Theme Entry Point
// =====================================================================

#let herbarium-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "herbarium",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.ink)
  set heading(numbering: (..args) => none)
  show raw: set text(font: _mono-font)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 3.5em, bottom: 1.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.accent,
      neutral-lightest: pal.bg,
      neutral-darkest: pal.ink,
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
