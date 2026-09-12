// Watercolor Theme — Soft, organic painting aesthetic with bleeding-edge shapes
// Features: SVG blob shapes (cubic bezier), paint splatter accents, wavy dividers,
// warm paper texture background, translucent wash fills, brushstroke marks
// Perfect for creative presentations, art direction, design portfolios, storytelling
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct - Rich) ═══

#let palette = (
  bg: rgb("#FDF8F0"),
  ink: rgb("#2C1810"),
  accent: rgb("#1E6091"),
  secondary: rgb("#9B2226"),
  wash-blue: rgb("#1E6091").transparentize(80%),
  wash-rose: rgb("#9B2226").transparentize(85%),
  wash-gold: rgb("#CA8A04").transparentize(80%),
  ink-light: rgb("#2C1810").transparentize(38%),
  ink-muted: rgb("#2C1810").transparentize(30%),
  gold: rgb("#CA8A04"),
  gold-text: rgb("#A16207"),
  white: rgb("#FFFFFF"),
)


// ═══ SVG Definitions ═══

// Watercolor blob shape — organic irregular rounded shape using cubic bezier curves
#let _blob-blue-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300">
  <path d="M50,150 C50,60 120,20 200,30 C280,40 350,80 360,150 C370,220 310,270 220,280 C130,290 50,240 50,150 Z" fill="#1E6091" fill-opacity="0.18" stroke="none"/>
</svg>
```.text

#let _blob-rose-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300">
  <path d="M60,140 C70,50 150,20 230,40 C310,60 370,110 350,180 C330,250 260,290 180,270 C100,250 50,230 60,140 Z" fill="#9B2226" fill-opacity="0.13" stroke="none"/>
</svg>
```.text

#let _blob-gold-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300">
  <path d="M80,130 C90,50 170,10 250,40 C330,70 380,130 350,200 C320,270 230,290 150,260 C70,230 70,210 80,130 Z" fill="#CA8A04" fill-opacity="0.18" stroke="none"/>
</svg>
```.text

// Paint splatter accent — small irregular dots clustered together
#let _splatter-blue-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 40">
  <circle cx="15" cy="20" r="6" fill="#1E6091" fill-opacity="0.25"/>
  <circle cx="30" cy="12" r="4" fill="#1E6091" fill-opacity="0.2"/>
  <circle cx="40" cy="25" r="5" fill="#1E6091" fill-opacity="0.18"/>
  <circle cx="22" cy="30" r="3" fill="#1E6091" fill-opacity="0.22"/>
  <circle cx="48" cy="15" r="2.5" fill="#1E6091" fill-opacity="0.15"/>
</svg>
```.text

#let _splatter-rose-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 40">
  <circle cx="12" cy="18" r="5" fill="#9B2226" fill-opacity="0.2"/>
  <circle cx="28" cy="10" r="3.5" fill="#9B2226" fill-opacity="0.18"/>
  <circle cx="42" cy="22" r="6" fill="#9B2226" fill-opacity="0.15"/>
  <circle cx="20" cy="32" r="2.5" fill="#9B2226" fill-opacity="0.2"/>
  <circle cx="50" cy="12" r="3" fill="#9B2226" fill-opacity="0.12"/>
</svg>
```.text

#let _splatter-gold-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 40">
  <circle cx="14" cy="22" r="5.5" fill="#CA8A04" fill-opacity="0.22"/>
  <circle cx="32" cy="14" r="4" fill="#CA8A04" fill-opacity="0.18"/>
  <circle cx="44" cy="28" r="3.5" fill="#CA8A04" fill-opacity="0.2"/>
  <circle cx="25" cy="32" r="2.5" fill="#CA8A04" fill-opacity="0.15"/>
  <circle cx="50" cy="10" r="3" fill="#CA8A04" fill-opacity="0.17"/>
</svg>
```.text

// Bleeding edge border — wavy irregular line simulating watercolor paper bleeding
#let _bleed-line-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 12">
  <path d="M0,6 C20,2 40,9 60,5 C80,1 100,8 120,6 C140,3 160,10 180,5 C200,1 220,9 240,6 C260,3 280,10 300,5 C320,2 340,8 360,6 C380,3 400,9 420,5 C440,2 460,10 480,6 C500,3 520,8 540,5 C560,2 580,9 600,6" fill="none" stroke="#2C1810" stroke-opacity="0.25" stroke-width="1.5" stroke-linecap="round"/>
</svg>
```.text

// Brushstroke accent mark for quotes — large curved stroke
#let _brushstroke-quote-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 80 80">
  <path d="M20,65 C15,50 18,35 25,25 C32,15 40,12 48,15 C42,18 35,25 30,35 C35,32 42,33 45,38 C48,43 46,50 40,53 C34,56 27,54 24,48 Z" fill="#1E6091" fill-opacity="0.35" stroke="none"/>
</svg>
```.text

// Large decorative blob for title slides
#let _blob-large-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 400">
  <path d="M100,200 C100,80 200,20 320,40 C440,60 550,120 540,220 C530,320 430,380 300,370 C170,360 100,320 100,200 Z" fill="#1E6091" fill-opacity="0.12" stroke="none"/>
  <path d="M150,180 C160,100 250,60 350,80 C450,100 500,160 480,240 C460,320 370,350 270,330 C170,310 140,260 150,180 Z" fill="#9B2226" fill-opacity="0.08" stroke="none"/>
</svg>
```.text

// Organic frame corner blobs
#let _corner-blob-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 120 120">
  <path d="M10,60 C10,25 30,10 60,10 C80,10 100,20 100,40 C100,55 85,65 70,60 C55,55 45,35 60,25" fill="none" stroke="#1E6091" stroke-opacity="0.2" stroke-width="2" stroke-linecap="round"/>
</svg>
```.text


// ═══ Helper Functions ═══

/// Render an SVG blob as a placed background element
#let _place-blob(svg-str, width: 100%, height: 100%) = {
  image(bytes(svg-str), width: width, height: height)
}

/// Paint splatter decoration element
#let paint-splatter(variant: "blue", width: 50pt) = {
  let svg = if variant == "blue" {
    _splatter-blue-svg
  } else if variant == "rose" {
    _splatter-rose-svg
  } else {
    _splatter-gold-svg
  }
  image(bytes(svg), width: width)
}


// ═══ Reusable Components ═══

/// wash-card — Card with organic SVG blob shape visible behind it
#let wash-card(title, body, variant: "blue") = {
  let blob-svg = if variant == "blue" {
    _blob-blue-svg
  } else if variant == "rose" {
    _blob-rose-svg
  } else {
    _blob-gold-svg
  }
  let accent-color = if variant == "blue" {
    palette.accent
  } else if variant == "rose" {
    palette.secondary
  } else {
    palette.gold-text
  }
  block(
    width: 100%,
    fill: palette.bg,
    clip: true,
    inset: 0pt,
    radius: 8pt,
    stroke: 0.5pt + accent-color.transparentize(70%),
  )[
    // Blob background
    #place(top + left, _place-blob(blob-svg, width: 120%, height: 120%))
    // Content overlay
    #block(width: 100%, inset: (x: 0.9em, y: 0.7em))[
      #stack(spacing: .8em,
        text(weight: "bold", fill: accent-color.darken(20%), size: 0.95em, title),
        [
        #set text(fill: palette.ink, size: 0.82em)
        #body
        #lazy-v(1fr)
        ],
      )
    ]
  ]
}

/// palette-stat — Large number with paint-splatter dots as accent
#let palette-stat(label, value, variant: "blue") = {
  let accent-color = if variant == "blue" {
    palette.accent
  } else if variant == "rose" {
    palette.secondary
  } else {
    palette.gold-text
  }
  block(
    width: 100%,
    fill: palette.bg,
    inset: (x: 0.8em, y: 0.6em),
    radius: 8pt,
    stroke: 0.5pt + accent-color.transparentize(70%),
  )[
    // Splatter accent in corner
    #place(top + right, dx: -0.2em, dy: 0.1em, paint-splatter(variant: variant, width: 40pt))
    #set text(fill: palette.ink-muted, size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: accent-color, size: 1.7em, weight: "bold")
        #value
        #lazy-v(1fr)
      ]
    )
  ]
}

/// bleed-divider — Wavy irregular line divider (SVG path)
#let bleed-divider() = {
  std.align(center, image(bytes(_bleed-line-svg), width: 80%, height: 8pt))
}

/// brush-quote — Quote with large brushstroke-style accent mark
#let brush-quote(quote-text, author: none) = {
  block(
    width: 100%,
    fill: palette.wash-blue,
    inset: (x: 1.2em, y: 0.7em),
    radius: 8pt,
  )[
    // Brushstroke quotation mark
    #place(top + left, dx: -0.3em, dy: -0.3em,
      image(bytes(_brushstroke-quote-svg), width: 32pt, height: 32pt))
    #h(1.2em)
    #set text(fill: palette.ink, size: 0.88em, style: "italic")
    #quote-text
    #if author != none {
      v(0.2em)
      set text(fill: palette.accent, size: 0.8em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}

/// swatch-grid — Grid of colored squares like a painter's palette
#let swatch-grid(items) = {
  let colors = (palette.accent, palette.secondary, palette.gold, rgb("#1E6091").transparentize(40%), rgb("#9B2226").transparentize(40%), rgb("#CA8A04").transparentize(40%))
  grid(
    columns: items.len(),
    column-gutter: 6pt,
    row-gutter: 4pt,
    ..items.enumerate().map(((i, item)) => {
      let c = colors.at(calc.rem(i, colors.len()))
      block(
        width: 100%,
        fill: c.transparentize(75%),
        stroke: 0.5pt + c.transparentize(40%),
        inset: (x: 0.6em, y: 0.5em),
        radius: 4pt,
      )[
        #set text(fill: palette.ink, size: 0.78em)
        #item
      ]
    })
  )
}

/// pigment-tag — Small tag with rounded organic shape
#let pigment-tag(label, variant: "blue") = {
  let color = if variant == "blue" {
    palette.accent
  } else if variant == "rose" {
    palette.secondary
  } else {
    palette.gold-text
  }
  box(
    fill: color.transparentize(85%),
    stroke: 0.7pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 12pt,
  )[
    #set text(fill: color.darken(10%), size: 0.72em, weight: "semibold")
    #label
  ]
}

/// wash-box — Content area with soft translucent watercolor background fill
#let wash-box(body, variant: "blue") = {
  let fill-color = if variant == "blue" {
    palette.wash-blue
  } else if variant == "rose" {
    palette.wash-rose
  } else {
    palette.wash-gold
  }
  block(
    width: 100%,
    fill: fill-color,
    inset: (x: 1.2em, y: 0.9em),
    radius: 8pt,
  )[
    #set text(fill: palette.ink, size: 0.85em)
    #body
    #lazy-v(1fr)
  ]
}


// ═══ Slide Functions ═══

/// Content slide — cream paper bg, subtle organic feel, header with wash accent
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
        set text(fill: palette.ink, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Wavy bleed underline instead of straight line
      image(bytes(_bleed-line-svg), width: 120pt, height: 6pt),
    )
    // Corner blob decoration top-right
    place(top + right, dx: -0.5em, dy: 0em,
      image(bytes(_corner-blob-svg), width: 50pt, height: 50pt))
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.ink-light, size: 0.7em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        // Small splatter accent
        paint-splatter(variant: "blue", width: 30pt)
      },
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        context text(fill: palette.ink-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
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

/// Title slide — large watercolor blob shapes as decoration, organic title placement
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Large decorative blobs
    place(top + left, dx: -40pt, dy: -20pt,
      image(bytes(_blob-large-svg), width: 500pt, height: 340pt))
    // Secondary blob bottom-right
    place(bottom + right, dx: 30pt, dy: 20pt,
      image(bytes(_blob-rose-svg), width: 300pt, height: 220pt))
    // Gold blob accent top-right
    place(top + right, dx: -20pt, dy: 40pt,
      image(bytes(_blob-gold-svg), width: 200pt, height: 150pt))
    // Content centered
    set std.align(center + horizon)
    pad(x: 4em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.ink, info.title)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.ink-muted, info.subtitle)
        v(0.5em)
      }
      // Wavy divider
      #std.align(center, image(bytes(_bleed-line-svg), width: 200pt, height: 8pt))
      #v(0.6em)
      // Author
      #if info.author != none {
        text(size: 1.1em, weight: "semibold", fill: palette.accent, info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.85em, fill: palette.ink-light, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.ink-light)[#utils.display-info-date(self)]
      }
    ]
    // Splatter accents
    place(bottom + left, dx: 40pt, dy: -30pt, paint-splatter(variant: "gold", width: 50pt))
    place(top + right, dx: -60pt, dy: 20pt, paint-splatter(variant: "rose", width: 35pt))
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

/// New section slide — full wash of color as background, section title in white
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
    // Deep blue wash background
    place(top + left, block(width: 100%, height: 100%, fill: palette.accent))
    // Overlay blob for organic texture
    place(center + horizon,
      image(bytes(_blob-large-svg), width: 600pt, height: 400pt))
    // Splatter accents
    place(top + right, dx: -50pt, dy: 40pt, paint-splatter(variant: "gold", width: 60pt))
    place(bottom + left, dx: 40pt, dy: -40pt, paint-splatter(variant: "rose", width: 45pt))
    // Section content
    pad(left: 5em, right: 4em, top: 4em, bottom: 2em)[
      #v(1fr)
      #stack(spacing: .8em,
        {
          set text(fill: white, size: 2.2em, weight: "semibold")
          utils.display-current-heading(level: 1)
        },
        // Wavy line in white-ish tone
        block(width: 100pt, height: 2pt, fill: white.transparentize(40%), radius: 1pt),
        // Small decorative dots
        stack(dir: ltr, spacing: 8pt,
          box(circle(radius: 4pt, fill: white.transparentize(30%))),
          box(circle(radius: 3pt, fill: white.transparentize(50%))),
          box(circle(radius: 2pt, fill: white.transparentize(70%))),
        ),
      )
      #v(1fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep blue wash background, white text
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
    // Deep blue watercolor background
    place(top + left, block(width: 100%, height: 100%, fill: palette.accent.darken(20%)))
    // Organic blob overlays for depth
    place(top + left, dx: -30pt, dy: -20pt,
      image(bytes(_blob-blue-svg), width: 350pt, height: 260pt))
    place(bottom + right, dx: 20pt, dy: 10pt,
      image(bytes(_blob-rose-svg), width: 280pt, height: 200pt))
    // Splatter accents
    place(top + right, dx: -40pt, dy: 30pt, paint-splatter(variant: "gold", width: 50pt))
    place(bottom + left, dx: 30pt, dy: -25pt, paint-splatter(variant: "blue", width: 40pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 4em)[
      #set text(fill: white, size: 1.6em, weight: "semibold")
      #body
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — watercolor splatter composition, farewell
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
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Multiple overlapping blobs for composition
    place(top + left, dx: -20pt, dy: -10pt,
      image(bytes(_blob-blue-svg), width: 320pt, height: 240pt))
    place(bottom + right, dx: 10pt, dy: 10pt,
      image(bytes(_blob-rose-svg), width: 300pt, height: 220pt))
    place(top + right, dx: -30pt, dy: 30pt,
      image(bytes(_blob-gold-svg), width: 250pt, height: 180pt))
    place(center, dy: 60pt,
      image(bytes(_blob-large-svg), width: 400pt, height: 260pt))
    // Splatters everywhere
    place(top + left, dx: 60pt, dy: 50pt, paint-splatter(variant: "blue", width: 55pt))
    place(bottom + left, dx: 80pt, dy: -60pt, paint-splatter(variant: "rose", width: 45pt))
    place(top + right, dx: -80pt, dy: 70pt, paint-splatter(variant: "gold", width: 50pt))
    place(bottom + right, dx: -60pt, dy: -50pt, paint-splatter(variant: "blue", width: 40pt))
    // Center text
    set std.align(center + horizon)
    block(
      width: 60%,
      inset: (x: 2em, y: 1.5em),
    )[
      #set std.align(center)
      // Wavy line above
      #image(bytes(_bleed-line-svg), width: 150pt, height: 8pt)
      #v(0.6em)
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.5em)
      // Wavy line below
      #image(bytes(_bleed-line-svg), width: 150pt, height: 8pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ Theme Entry Point ═══

#let watercolor-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.ink)

  show heading: set text(fill: palette.ink)

  show raw: set text(size: 0.85em)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 3em, bottom: 2.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent,
      neutral-lightest: palette.bg,
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
