// Vermillion Theme — Warm Terracotta Professional
// Mediterranean architecture meets modern business: sun-baked clay, warm white
// spaces, rounded geometric shapes, organic SVG decorations. Think creative
// agency pitches, lifestyle brands, warm confident presentations.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Warm Terracotta / Vermillion Professional) ===

#let palette = (
  bg: rgb("#FDF9F5"),              // warm white
  primary: rgb("#C84B31"),         // vermillion
  primary-text: rgb("#B53B27"),    // text-safe vermillion for light surfaces
  accent: rgb("#A0522D"),          // burnt sienna
  secondary: rgb("#4A5D3A"),       // deep olive
  text-dark: rgb("#2C1810"),       // espresso
  text-body: rgb("#4A3228"),       // warm brown body
  text-light: rgb("#8B6B55"),      // muted terracotta caption
  card: rgb("#FFF8F0"),            // cream card
  border: rgb("#E8D8C8"),          // warm border
  sand: rgb("#F5EDE4"),            // sand accent bg
  highlight: rgb("#FFF0E0"),       // warm highlight
)

#let _accent-text(color) = if color == palette.primary {
  palette.primary-text
} else {
  color
}


// === SVG Definitions (Organic Warm Shapes) ===

// Organic arch pattern — repeating rounded arches evoking Mediterranean windows
// Used as persistent subtle background on content slides
#let _arch-pattern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M60,90 C60,50 90,30 120,30 C150,30 180,50 180,90" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M220,90 C220,50 250,30 280,30 C310,30 340,50 340,90" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M380,90 C380,50 410,30 440,30 C470,30 500,50 500,90" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M540,90 C540,50 570,30 600,30 C630,30 660,50 660,90" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M700,90 C700,50 730,30 760,30 C790,30 820,50 820,90" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M140,200 C140,160 170,140 200,140 C230,140 260,160 260,200" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M300,200 C300,160 330,140 360,140 C390,140 420,160 420,200" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M460,200 C460,160 490,140 520,140 C550,140 580,160 580,200" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M620,200 C620,160 650,140 680,140 C710,140 740,160 740,200" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M60,310 C60,270 90,250 120,250 C150,250 180,270 180,310" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M220,310 C220,270 250,250 280,250 C310,250 340,270 340,310" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M380,310 C380,270 410,250 440,250 C470,250 500,270 500,310" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M540,310 C540,270 570,250 600,250 C630,250 660,270 660,310" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M700,310 C700,270 730,250 760,250 C790,250 820,270 820,310" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M140,420 C140,380 170,360 200,360 C230,360 260,380 260,420" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M300,420 C300,380 330,360 360,360 C390,360 420,380 420,420" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <path d="M460,420 C460,380 490,360 520,360 C550,360 580,380 580,420" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.03"/>
  <path d="M620,420 C620,380 650,360 680,360 C710,360 740,380 740,420" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.035"/>
  <circle cx="120" cy="28" r="2.5" fill="currentColor" opacity="0.025"/>
  <circle cx="280" cy="28" r="2.5" fill="currentColor" opacity="0.02"/>
  <circle cx="440" cy="28" r="2.5" fill="currentColor" opacity="0.025"/>
  <circle cx="600" cy="28" r="2.5" fill="currentColor" opacity="0.02"/>
  <circle cx="760" cy="28" r="2.5" fill="currentColor" opacity="0.025"/>
  <circle cx="200" cy="138" r="2.5" fill="currentColor" opacity="0.02"/>
  <circle cx="360" cy="138" r="2.5" fill="currentColor" opacity="0.025"/>
  <circle cx="520" cy="138" r="2.5" fill="currentColor" opacity="0.02"/>
  <circle cx="680" cy="138" r="2.5" fill="currentColor" opacity="0.025"/>
</svg>
```.text

// Sunburst corner ornament — radiating lines from corner, evoking warm sunrise
// Used on title and ending slides as corner decoration
#let _sunburst-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" viewBox="0 0 200 200">
  <line x1="200" y1="0" x2="140" y2="60" stroke="currentColor" stroke-width="1.5" opacity="0.3"/>
  <line x1="200" y1="0" x2="120" y2="40" stroke="currentColor" stroke-width="1" opacity="0.2"/>
  <line x1="200" y1="0" x2="160" y2="80" stroke="currentColor" stroke-width="1" opacity="0.25"/>
  <line x1="200" y1="0" x2="100" y2="20" stroke="currentColor" stroke-width="0.8" opacity="0.15"/>
  <line x1="200" y1="0" x2="180" y2="100" stroke="currentColor" stroke-width="0.8" opacity="0.2"/>
  <line x1="200" y1="0" x2="150" y2="50" stroke="currentColor" stroke-width="1.2" opacity="0.25"/>
  <line x1="200" y1="0" x2="130" y2="70" stroke="currentColor" stroke-width="0.8" opacity="0.18"/>
  <line x1="200" y1="0" x2="170" y2="40" stroke="currentColor" stroke-width="0.6" opacity="0.12"/>
  <path d="M200,0 A60,60 0 0,0 140,60" fill="none" stroke="currentColor" stroke-width="1" opacity="0.15"/>
  <path d="M200,0 A100,100 0 0,0 100,100" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.1"/>
  <path d="M200,0 A140,140 0 0,0 60,140" fill="none" stroke="currentColor" stroke-width="0.6" opacity="0.07"/>
  <circle cx="170" cy="25" r="2" fill="currentColor" opacity="0.2"/>
  <circle cx="155" cy="42" r="1.5" fill="currentColor" opacity="0.15"/>
  <circle cx="145" cy="55" r="2" fill="currentColor" opacity="0.2"/>
</svg>
```.text

// Wavy terracotta divider — organic flowing line with warm undulation
// Used as section separator and header accent
#let _wavy-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 C10,2 20,2 30,6 C40,10 50,10 60,6 C70,2 80,2 90,6 C100,10 110,10 120,6 C130,2 140,2 150,6 C160,10 170,10 180,6 C190,2 200,2 210,6 C220,10 230,10 240,6 C250,2 260,2 270,6 C280,10 290,10 300,6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" opacity="0.7"/>
  <path d="M0,6 C10,3 20,3 30,6 C40,9 50,9 60,6 C70,3 80,3 90,6 C100,9 110,9 120,6 C130,3 140,3 150,6 C160,9 170,9 180,6 C190,3 200,3 210,6 C220,9 230,9 240,6 C250,3 260,3 270,6 C280,9 290,9 300,6" fill="none" stroke="currentColor" stroke-width="0.8" stroke-linecap="round" opacity="0.35"/>
</svg>
```.text


// === SVG Rendering Helpers ===

/// Render arch pattern as full-page background atmosphere
#let _arch-bg() = {
  place(top + left,
    box(width: 100%, height: 100%,
      image(bytes(_arch-pattern-svg.replace("currentColor", palette.primary.to-hex())), width: 100%, height: 100%, fit: "cover")))
}

/// Render the private wavy divider asset with a given color
#let _wavy-divider(color: palette.primary, width: 200pt) = {
  let svg = _wavy-divider-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 8pt))
}

/// Terrace divider — the wavy line used as a section separator (centered)
#let terrace-divider(color: palette.primary, width: 60%) = {
  std.align(center, _wavy-divider(color: color, width: width))
}


// === Background Atmosphere (Subtle warmth on every content slide) ===

/// Persistent warm Mediterranean feeling: faint arch pattern + warm corner glow
#let _slide-atmosphere() = {
  // Full-page arch pattern (very subtle)
  _arch-bg()
  // Warm corner glow — simulating terracotta warmth
  place(top + right, dx: -0.5em, dy: 0.3em,
    circle(radius: 2.5pt, fill: palette.primary.transparentize(90%)))
  place(bottom + left, dx: 1em, dy: -0.8em,
    circle(radius: 2pt, fill: palette.accent.transparentize(90%)))
}


// === 1. Slide Functions ===

/// Standard content slide — warm white bg, wavy header accent, arch atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: .8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Wavy terracotta divider as header accent
      _wavy-divider(color: palette.primary, width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-light, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small warm circle as footer center
        box(circle(radius: 3pt, fill: palette.primary.transparentize(60%)))
      },
      {
        set std.align(right)
        context text(fill: palette.text-light, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  let setting(body) = {
    // PERSISTENT ATMOSPHERE — warm arch background
    _slide-atmosphere()
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

/// Title slide — warm white with sunburst ornament, organic wavy accents
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Arch pattern (slightly stronger for title)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_arch-pattern-svg.replace("currentColor", palette.primary.to-hex()).replace("opacity=\"0.035\"", "opacity=\"0.055\"").replace("opacity=\"0.03\"", "opacity=\"0.05\"").replace("opacity=\"0.025\"", "opacity=\"0.04\"").replace("opacity=\"0.02\"", "opacity=\"0.035\"")), width: 100%, height: 100%, fit: "cover")))
    // Sunburst ornament in top-right corner
    place(top + right, dx: 0pt, dy: 0pt,
      box(width: 160pt, height: 160pt,
        image(bytes(_sunburst-svg.replace("currentColor", palette.primary.to-hex())), width: 160pt)))
    // Sunburst mirrored in bottom-left (flipped)
    place(bottom + left, dx: 0pt, dy: 0pt,
      box(width: 120pt, height: 120pt,
        rotate(180deg, image(bytes(_sunburst-svg.replace("currentColor", palette.accent.to-hex())), width: 120pt))))
    // Vertical accent bar on left
    place(top + left, dx: 2em, dy: 15%, block(width: 4pt, height: 70%, fill: palette.primary.transparentize(40%), radius: 2pt))
    // Center content
    set std.align(center + horizon)
    let sequence = (
      text(size: 2.4em, weight: "bold", fill: palette.text-dark, info.title),
      std.align(center, _wavy-divider(color: palette.primary, width: 200pt)),
    )
    if info.subtitle != none {
      sequence.push(text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle))
    }
    if info.author != none {
      sequence.push(text(size: 0.9em, fill: palette.text-dark, weight: "regular", info.author))
    }
    if info.institution != none {
      sequence.push(text(size: 0.8em, fill: palette.text-light, info.institution))
    }
    if info.date != none {
      sequence.push(text(size: 0.75em, fill: palette.text-light, utils.display-info-date(self)))
    }
    pad(x: 5em, y: 2em, stack(spacing: .8em, ..sequence))
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

/// New section slide — vermillion accent bar, section number, wavy separator
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
    // Warm background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Arch pattern
    _arch-bg()
    // Left accent bar — thick vermillion strip
    place(top + left, block(width: 6pt, height: 100%, fill: palette.primary))
    // Warm accent circle, bottom-right
    place(bottom + right, dx: -3em, dy: -2em,
      circle(radius: 20pt, fill: palette.primary.transparentize(92%)))
    // Section content
    place(center + horizon,
      block(width: 70%, inset: (left: 4em, right: 3em),
        stack(
          spacing: .8em,
          text(size: 4em, fill: palette.primary.transparentize(60%), weight: "bold",
            utils.display-current-heading-number(depth: 1, numbering: "1")),
          {
            set text(fill: palette.text-dark, size: 2em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
          },
          _wavy-divider(color: palette.primary, width: 200pt),
        ),
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep vermillion background with centered white text
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
    // Deep vermillion background
    place(top + left, block(width: 100%, height: 100%, fill: palette.primary))
    // Subtle arch pattern on dark bg (white, very faint)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_arch-pattern-svg.replace("currentColor", rgb("#FFFFFF").to-hex()).replace("opacity=\"0.035\"", "opacity=\"0.06\"").replace("opacity=\"0.03\"", "opacity=\"0.05\"").replace("opacity=\"0.025\"", "opacity=\"0.04\"").replace("opacity=\"0.02\"", "opacity=\"0.035\"")), width: 100%, height: 100%, fit: "cover")))
    // Sunburst in corner
    place(top + right, dx: 0pt, dy: 0pt,
      box(width: 140pt, height: 140pt,
        image(bytes(_sunburst-svg.replace("currentColor", rgb("#FFFFFF").to-hex())), width: 140pt)))
    // Center content
    place(center + horizon,
      block(width: 75%, inset: (x: 2em, y: 1.5em))[
        #set std.align(center)
        #set text(fill: rgb("#FFFFFF"), size: 1.4em, weight: "bold")
        #stack(
          spacing: .8em,
          body,
          _wavy-divider(color: rgb("#FFFFFF").transparentize(30%), width: 160pt),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookends with title: sunburst ornaments + wavy divider
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
    // Warm white background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Arch pattern (stronger — bookends with title)
    place(top + left,
      box(width: 100%, height: 100%,
        image(bytes(_arch-pattern-svg.replace("currentColor", palette.primary.to-hex()).replace("opacity=\"0.035\"", "opacity=\"0.06\"").replace("opacity=\"0.03\"", "opacity=\"0.05\"").replace("opacity=\"0.025\"", "opacity=\"0.04\"").replace("opacity=\"0.02\"", "opacity=\"0.035\"")), width: 100%, height: 100%, fit: "cover")))
    // Sunburst corners (bookend with title)
    place(top + right, dx: 0pt, dy: 0pt,
      box(width: 160pt, height: 160pt,
        image(bytes(_sunburst-svg.replace("currentColor", palette.primary.to-hex())), width: 160pt)))
    place(bottom + left, dx: 0pt, dy: 0pt,
      box(width: 120pt, height: 120pt,
        rotate(180deg, image(bytes(_sunburst-svg.replace("currentColor", palette.accent.to-hex())), width: 120pt))))
    // Vertical accent bar
    place(top + left, dx: 2em, dy: 15%, block(width: 4pt, height: 70%, fill: palette.primary.transparentize(40%), radius: 2pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        text(size: 2.2em, weight: "bold", fill: palette.text-dark, body),
        _wavy-divider(color: palette.primary, width: 180pt),
        terrace-divider(color: palette.text-light, width: 80pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Kiln card — warm card with rounded top border accent and cream fill
#let kiln-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (top: 3pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1.1em, y: 0.9em),
    radius: (top: 6pt, bottom: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-text(accent), size: 0.9em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Hearth stat — large number display with warm accent, rounded container
#let hearth-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    inset: (x: 1em, y: 0.8em),
    radius: 8pt,
    stroke: 0.5pt + palette.border,
  )[
    // Faint warm circle behind the number
    #place(top + right, dx: -0.3em, dy: 0.2em,
      circle(radius: 18pt, fill: color.transparentize(92%)))
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(fill: _accent-text(color), size: 1.8em, weight: "bold", value),
      text(fill: palette.text-light, size: 0.75em, label),
    )
  ]
}

/// Clay box — content box with left vermillion accent bar and sand background
#let clay-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.sand,
    stroke: (left: 3pt + accent, rest: 0.5pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _accent-text(accent), size: 0.9em, title),
      [
        #set text(fill: palette.text-body, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Ember tag — small warm pill/badge for inline labeling
#let ember-tag(content, color: palette.primary) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.8pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.2em),
    radius: 99pt,
  )[
    #set text(fill: _accent-text(color), size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Foundry highlight — featured content block with warm gradient background
#let foundry-highlight(title, body) = {
  block(
    width: 100%,
    fill: gradient.linear(palette.highlight, palette.card, angle: 180deg),
    stroke: 0.5pt + palette.border,
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(
      spacing: .8em,
      stack(dir: ltr, spacing: 0.5em,
        // Small warm circle icon
        box(circle(radius: 5pt, fill: palette.primary.transparentize(30%))),
        text(fill: palette.text-dark, size: 0.92em, weight: "bold", title),
      ),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

// === 3. Theme Entry Point ===

#let vermillion-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-dark)
  set heading(numbering: (..args) => none)

  // Global list styling with vermillion bullet markers
  set list(marker: box(baseline: .6em, circle(radius: .25em, fill: palette.primary.transparentize(20%))))

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
      neutral-lightest: palette.bg,
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
