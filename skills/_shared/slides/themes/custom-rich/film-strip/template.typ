// Film Strip Theme — Analog photography aesthetic, warm nostalgic tones
// Inspired by Kodak film boxes, Fujifilm packaging, light leaks, sprocket holes
// Features: sprocket hole decorations, film frame borders, contact sheet cards, light leaks
// Perfect for photography talks, creative presentations, analog/vintage topics
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  kodak-gold: rgb("#FFBF00"),
  kodak-ink: rgb("#A35D00"),
  fuji-green: rgb("#00A651"),
  dark: rgb("#1C1C1E"),
  warm-white: rgb("#FFF8E7"),
  film-base: rgb("#F97316"),
  film-ink: rgb("#C05000"),
  safelight: rgb("#DC2626"),
  text-dark: rgb("#1C1C1E"),
  text-body: rgb("#3D3D3F"),
  text-light: rgb("#8A8A8E"),
  text-muted: rgb("#707075"),
  border: rgb("#2C2C2E"),
  card-bg: rgb("#FFFDF5"),
)

#let mono-font = ("Courier New", "Noto Sans SC")

// ═══ Helper Functions ═══

/// Sprocket holes — small rounded rectangles along top/bottom strips
#let sprocket-holes-top(count: 8, color: rgb("#FFF8E7")) = {
  for i in range(count) {
    let x-offset = (i + 1) * (100% / (count + 1))
    place(top + left, dx: x-offset - 4pt, dy: 4pt,
      block(width: 8pt, height: 5pt, fill: color, radius: 1.5pt)
    )
  }
}

#let sprocket-holes-bottom(count: 8, color: rgb("#FFF8E7")) = {
  for i in range(count) {
    let x-offset = (i + 1) * (100% / (count + 1))
    place(bottom + left, dx: x-offset - 4pt, dy: -4pt,
      block(width: 8pt, height: 5pt, fill: color, radius: 1.5pt)
    )
  }
}

/// Film frame border — top and bottom dark strips with sprocket cutouts
#let film-frame-border(frame-num: "01", strip-color: rgb("#1C1C1E"), hole-color: rgb("#FFF8E7")) = {
  // Top film strip
  place(top + left, block(width: 100%, height: 16pt, fill: strip-color))
  sprocket-holes-top(count: 10, color: hole-color)
  // Bottom film strip
  place(bottom + left, block(width: 100%, height: 16pt, fill: strip-color))
  sprocket-holes-bottom(count: 10, color: hole-color)
  // Frame number annotation (monospace, bottom-right)
  place(bottom + right, dx: -28pt, dy: -2pt,
    text(size: 7pt, fill: strip-color.lighten(50%), font: mono-font, frame-num)
  )
}

/// Orange accent underline (Kodak style)
#let kodak-underline(width: 80pt, weight: 3pt) = {
  block(width: width, height: weight, fill: palette.kodak-gold, radius: 1pt)
}

/// Light leak decoration — warm orange/yellow gradient at low opacity
#let light-leak(anchor: top + right, size: 120pt, dx: 0pt, dy: 0pt) = {
  place(anchor, dx: dx, dy: dy,
    circle(radius: size, fill: gradient.radial(
      palette.film-base.transparentize(70%),
      palette.kodak-gold.transparentize(85%),
      palette.warm-white.transparentize(100%),
    ))
  )
}


// ═══ 1. Slide Functions ═══

/// Content slide — warm white bg, film frame border, dark title with Kodak-orange underline
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    // Top film strip (dark bar with sprocket holes)
    block(width: 100%, height: 16pt, fill: palette.dark)
    place(top + left, {
      for i in range(10) {
        let x-pos = (i + 1) * (100% / 11)
        place(top + left, dx: x-pos - 4pt, dy: 4pt,
          block(width: 8pt, height: 5pt, fill: palette.warm-white.transparentize(20%), radius: 1.5pt)
        )
      }
    })
    // Title area
    show: components.cell.with(inset: (x: 1.5em, top: 0.5em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(spacing: 0.8em,
      {
        set text(fill: palette.dark, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      kodak-underline(width: 60pt, weight: 2.5pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    // Bottom film strip
    show: components.cell.with(inset: (x: 1.5em, y: 0.1em))
    set std.align(horizon)
    grid(
      columns: (1fr, auto, 1fr),
      // Left: film stock annotation
      {
        set text(fill: palette.text-muted, size: 0.6em, font: mono-font)
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      // Center: Kodak-gold dot
      { box(block(width: 6pt, height: 6pt, fill: palette.kodak-gold, radius: 3pt)) },
      // Right: frame counter (monospace)
      {
        set std.align(right)
        set text(fill: palette.text-muted, size: 0.65em, font: mono-font)
        context [FR #utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
    // Bottom dark strip with sprocket holes
    block(width: 100%, height: 16pt, fill: palette.dark)
    place(bottom + left, {
      for i in range(10) {
        let x-pos = (i + 1) * (100% / 11)
        place(bottom + left, dx: x-pos - 4pt, dy: -4pt,
          block(width: 8pt, height: 5pt, fill: palette.warm-white.transparentize(20%), radius: 1.5pt)
        )
      }
    })
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

/// Title slide — dark film-leader bg, Kodak-gold title, film strip borders
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Dark film leader background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Top film strip with sprocket holes
    place(top + left, block(width: 100%, height: 20pt, fill: palette.dark.darken(20%)))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(top + left, dx: x-pos - 4pt, dy: 5pt,
        block(width: 8pt, height: 6pt, fill: palette.warm-white.transparentize(30%), radius: 2pt)
      )
    }
    // Bottom film strip with sprocket holes
    place(bottom + left, block(width: 100%, height: 20pt, fill: palette.dark.darken(20%)))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(bottom + left, dx: x-pos - 4pt, dy: -5pt - 6pt,
        block(width: 8pt, height: 6pt, fill: palette.warm-white.transparentize(30%), radius: 2pt)
      )
    }
    // Light leak decoration (subtle orange glow)
    place(top + right, dx: -60pt, dy: 40pt,
      circle(radius: 100pt, fill: palette.film-base.transparentize(88%)))
    place(bottom + left, dx: 40pt, dy: -60pt,
      circle(radius: 80pt, fill: palette.kodak-gold.transparentize(90%)))
    // "FRAME 01" annotation top-left
    place(top + left, dx: 24pt, dy: 28pt,
      text(size: 7pt, fill: palette.kodak-gold.transparentize(40%), font: mono-font, tracking: 2pt)[FRAME 01]
    )
    // Orange accent line (like film edge marking)
    place(left, dx: 24pt, dy: -10pt,
      block(width: 4pt, height: 80pt, fill: palette.film-base, radius: 2pt)
    )
    // Center content
    set std.align(center + horizon)
    block(width: 70%, inset: (x: 1.5em, y: 2em))[
      #set std.align(center)
      #stack(
        spacing: 1.5em,
        text(size: 2.2em, weight: "bold", fill: palette.kodak-gold, info.title),
        std.align(center, block(width: 120pt, height: 3pt, fill: palette.film-base, radius: 1.5pt)),
        if info.subtitle != none {
          text(size: 0.9em, fill: palette.warm-white.transparentize(30%), info.subtitle)
        },
        if info.author != none or info.institution != none or info.date != none {
          stack(
            spacing: 0.8em,
            if info.author != none {
              text(size: 1.05em, weight: "semibold", fill: palette.warm-white, info.author)
            },
            if info.institution != none {
              text(size: 0.8em, fill: palette.text-light, info.institution)
            },
            if info.date != none {
              text(size: 0.75em, fill: palette.text-light, font: mono-font)[#utils.display-info-date(self)]
            },
          )
        },
      )
    ]
    // Film canister dots (bottom center)
    place(bottom, dy: -28pt, std.align(center,
      stack(dir: ltr, spacing: 10pt,
        block(width: 5pt, height: 5pt, fill: palette.kodak-gold.transparentize(50%), radius: 2.5pt),
        block(width: 5pt, height: 5pt, fill: palette.film-base.transparentize(50%), radius: 2.5pt),
        block(width: 5pt, height: 5pt, fill: palette.kodak-gold.transparentize(50%), radius: 2.5pt),
      )
    ))
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

/// Section slide — Kodak yellow/gold bg, dark bold title, frame number
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
    // Kodak gold background (like inside of film box)
    place(top + left, block(width: 100%, height: 100%, fill: palette.kodak-gold))
    // Subtle warm gradient overlay
    place(top + left, block(width: 100%, height: 100%,
      fill: gradient.linear(palette.kodak-gold, palette.kodak-gold.lighten(15%), angle: 135deg)))
    // Top dark border strip with sprocket holes
    place(top + left, block(width: 100%, height: 18pt, fill: palette.dark))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(top + left, dx: x-pos - 4pt, dy: 4pt,
        block(width: 8pt, height: 5pt, fill: palette.kodak-gold.transparentize(40%), radius: 1.5pt)
      )
    }
    // Bottom dark border strip
    place(bottom + left, block(width: 100%, height: 18pt, fill: palette.dark))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(bottom + left, dx: x-pos - 4pt, dy: -4pt - 5pt,
        block(width: 8pt, height: 5pt, fill: palette.kodak-gold.transparentize(40%), radius: 1.5pt)
      )
    }
    // Frame number annotation (top-right)
    place(top + right, dx: -30pt, dy: 24pt,
      text(size: 8pt, fill: palette.dark.transparentize(50%), font: mono-font, tracking: 1pt)[FRAME]
    )
    // Dark vertical accent bar (left)
    place(left, dx: 36pt, dy: 30%, block(width: 5pt, height: 25%, fill: palette.dark, radius: 2.5pt))
    // Section content
    pad(left: 5em, top: 4em, right: 3em)[
      #v(1fr)
      #set text(fill: palette.dark, size: 2.4em, weight: "bold")
      #utils.display-current-heading(level: 1)
      #v(0.5em)
      #block(width: 80pt, height: 3pt, fill: palette.dark, radius: 1.5pt)
      #v(1fr)
    ]
    // Film-base orange dot (bottom-left)
    place(bottom + left, dx: 36pt, dy: -28pt,
      block(width: 8pt, height: 8pt, fill: palette.film-base, radius: 4pt))
  }
  touying-slide(self: self, main-body)
})

/// Outline/TOC slide — warm bg, section list with frame-number-style numbering
#let outline-slide(title: [Contents]) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.warm-white))
    // Top film strip
    place(top + left, block(width: 100%, height: 16pt, fill: palette.dark))
    for i in range(10) {
      let x-pos = (i + 1) * (100% / 11)
      place(top + left, dx: x-pos - 4pt, dy: 4pt,
        block(width: 8pt, height: 5pt, fill: palette.warm-white.transparentize(20%), radius: 1.5pt)
      )
    }
    // Bottom film strip
    place(bottom + left, block(width: 100%, height: 16pt, fill: palette.dark))
    for i in range(10) {
      let x-pos = (i + 1) * (100% / 11)
      place(bottom + left, dx: x-pos - 4pt, dy: -4pt - 5pt,
        block(width: 8pt, height: 5pt, fill: palette.warm-white.transparentize(20%), radius: 1.5pt)
      )
    }
    // Light leak (subtle)
    place(top + right, dx: -30pt, dy: 30pt,
      circle(radius: 60pt, fill: palette.film-base.transparentize(92%)))
    // Content
    pad(left: 4em, right: 4em, top: 3em, bottom: 2em)[
      // Title
      #text(size: 1.5em, weight: "bold", fill: palette.dark, title)
      #v(0.3em)
      #kodak-underline(width: 60pt, weight: 2.5pt)
      #v(1fr)
      // Section list
      #set text(size: 1.5em, fill: palette.text-dark, weight: "semibold")
      #outline(title: none, depth: 1)
      #v(2fr)
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — safelight red bg, white text, darkroom atmosphere
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      margin: 0pt,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Safelight red background
    place(top + left, block(width: 100%, height: 100%, fill: palette.safelight))
    // Darker vignette edges
    place(top + left, block(width: 100%, height: 100%,
      fill: gradient.radial(
        palette.safelight.transparentize(100%),
        palette.safelight.darken(30%).transparentize(0%),
      )))
    // Top film strip
    place(top + left, block(width: 100%, height: 14pt, fill: palette.dark))
    // Bottom film strip
    place(bottom + left, block(width: 100%, height: 14pt, fill: palette.dark))
    // Content
    set text(fill: white, size: 2em, weight: "bold")
    std.align(horizon + center, pad(x: 3em, body))
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — dark bg, "END OF ROLL" monospace gold text, sprocket holes
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
    // Dark film leader background
    place(top + left, block(width: 100%, height: 100%, fill: palette.dark))
    // Top film strip with sprocket holes
    place(top + left, block(width: 100%, height: 20pt, fill: palette.dark.darken(20%)))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(top + left, dx: x-pos - 4pt, dy: 5pt,
        block(width: 8pt, height: 6pt, fill: palette.kodak-gold.transparentize(60%), radius: 2pt)
      )
    }
    // Bottom film strip
    place(bottom + left, block(width: 100%, height: 20pt, fill: palette.dark.darken(20%)))
    for i in range(12) {
      let x-pos = (i + 1) * (100% / 13)
      place(bottom + left, dx: x-pos - 4pt, dy: -5pt - 6pt,
        block(width: 8pt, height: 6pt, fill: palette.kodak-gold.transparentize(60%), radius: 2pt)
      )
    }
    // "END OF ROLL" label
    place(top + left, dx: 24pt, dy: 28pt,
      text(size: 7pt, fill: palette.kodak-gold.transparentize(40%), font: mono-font, tracking: 2pt)[END OF ROLL]
    )
    // Light leak (warm glow)
    place(bottom + right, dx: -40pt, dy: -60pt,
      circle(radius: 80pt, fill: palette.film-base.transparentize(90%)))
    // Center content
    set std.align(center + horizon)
    block(width: 70%, inset: 2em)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.kodak-gold, font: mono-font, body),
        std.align(center, block(width: 50%, height: 2pt, fill: palette.kodak-gold.transparentize(40%), radius: 1pt)),
        stack(dir: ltr, spacing: 10pt,
          block(width: 5pt, height: 5pt, fill: palette.film-base, radius: 2.5pt),
          block(width: 5pt, height: 5pt, fill: palette.kodak-gold, radius: 2.5pt),
          block(width: 5pt, height: 5pt, fill: palette.film-base, radius: 2.5pt),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Contact card — styled like a contact sheet frame (thin black border, monospace caption)
#let contact-card(title, body, caption: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + palette.dark,
    inset: (x: 1em, y: 0.8em),
    radius: 1pt,
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "bold", fill: palette.dark, size: 0.95em, title),
      { set text(fill: palette.text-body, size: 0.82em); body },
      if caption != none {
        text(fill: palette.text-muted, size: 0.7em, font: mono-font, caption)
      },
      lazy-v(1fr),
    )
  ]
}

/// Exposure stat — big number in Kodak orange with small aperture annotation
#let exposure-stat(value, label, annotation: none) = {
  block(
    width: 100%,
    fill: palette.warm-white,
    stroke: 1pt + palette.kodak-gold.transparentize(50%),
    inset: (x: 1em, y: 0.7em),
    radius: 3pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      text(size: 1.8em, weight: "bold", fill: palette.film-ink, value),
      text(size: 0.8em, fill: palette.text-body, label),
      if annotation != none {
        text(size: 0.65em, fill: palette.text-muted, font: mono-font, annotation)
      },
      lazy-v(1fr),
    )
  ]
}

/// Darkroom box — callout with safelight-red left border
#let darkroom-box(title, body) = {
  block(
    width: 100%,
    fill: palette.safelight.lighten(92%),
    stroke: (left: 4pt + palette.safelight, rest: 1pt + palette.safelight.lighten(70%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.safelight.darken(10%), size: 0.9em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Film tag — styled like a film canister label (Kodak gold bg)
#let film-tag(content) = {
  box(
    fill: palette.kodak-gold,
    inset: (x: 0.7em, y: 0.25em),
    radius: 2pt,
  )[
    #set text(fill: palette.dark, size: 0.75em, weight: "bold")
    #content
  ]
}

/// Developer quote — warm-toned quote with italic styling
#let developer-quote(quote, author: none) = {
  block(
    width: 100%,
    fill: palette.warm-white,
    stroke: (left: 3pt + palette.kodak-gold),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 6pt),
  )[
    #stack(
      spacing: 0.8em,
      text(
        fill: palette.text-dark,
        size: 0.9em,
        style: "italic",
        [#sym.quote.double.low#quote#sym.quote.double.high],
      ),
      if author != none {
        text(
          fill: palette.film-ink,
          size: 0.8em,
          weight: "bold",
          style: "normal",
          [-- #author],
        )
      },
      lazy-v(1fr),
    )
  ]
}

/// Fuji box — callout with Fujifilm green accent (alternative to darkroom-box)
#let fuji-box(title, body) = {
  block(
    width: 100%,
    fill: palette.fuji-green.lighten(92%),
    stroke: (left: 4pt + palette.fuji-green, rest: 1pt + palette.fuji-green.lighten(60%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: palette.fuji-green.darken(10%), size: 0.9em, title),
      [
      #set text(fill: palette.text-body, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let film-strip-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.text-body)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.warm-white,
      margin: (top: 4em, bottom: 3.5em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.kodak-ink,
      neutral-lightest: palette.warm-white,
      neutral-darkest: palette.dark,
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
