// Fossil Amber Theme — Paleontology / geological strata aesthetic
// Warm honey-gold tones, layered strata patterns, fossilized leaf impressions
// Light warm backgrounds with amber accents and sedimentary cross-sections
// Features: amber resin borders, geological layers, fossilized fern SVGs, strata textures
// Perfect for academic presentations, research talks, scientific showcases
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct - Rich Theme) ===

#let palette = (
  bg: rgb("#FDF8F0"),
  ink: rgb("#3D2B1F"),
  accent: rgb("#D4920B"),
  accent-text: rgb("#8A5A00"),
  secondary: rgb("#8B5E3C"),
  amber-glow: rgb("#F5C842"),
  cream: rgb("#FFF8E7"),
  sediment: rgb("#6B4423"),
  fossil-gray: rgb("#7A6B5E"),
  card-bg: rgb("#FFFDF7"),
  border: rgb("#E8D5B7"),
  amber-light: rgb("#FAEAC8"),
  strata-dark: rgb("#4A3728"),
  resin: rgb("#C87F0A"),
  resin-text: rgb("#8F5200"),
  leaf-green: rgb("#5C7A3D"),
  leaf-text: rgb("#49652E"),
  text-muted: rgb("#6F6252"),
)

#let _text-safe(color) = {
  if color == palette.accent or color == palette.amber-glow {
    palette.accent-text
  } else if color == palette.resin {
    palette.resin-text
  } else if color == palette.leaf-green {
    palette.leaf-text
  } else {
    color
  }
}


// === SVG Definitions ===

// Geological strata background - layered horizontal bands with varying opacity
#let _strata-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="0" y="0" width="840" height="474" fill="#FDF8F0"/>
  <rect x="0" y="420" width="840" height="54" fill="#D4920B" opacity="0.06"/>
  <rect x="0" y="380" width="840" height="40" fill="#8B5E3C" opacity="0.04"/>
  <rect x="0" y="350" width="840" height="30" fill="#6B4423" opacity="0.05"/>
  <rect x="0" y="330" width="840" height="20" fill="#C87F0A" opacity="0.03"/>
  <path d="M0,420 Q210,415 420,422 Q630,429 840,418" fill="none" stroke="#D4920B" stroke-width="0.8" opacity="0.15"/>
  <path d="M0,380 Q210,377 420,383 Q630,379 840,381" fill="none" stroke="#8B5E3C" stroke-width="0.6" opacity="0.12"/>
  <path d="M0,350 Q180,347 360,352 Q540,348 720,353 Q780,350 840,351" fill="none" stroke="#6B4423" stroke-width="0.5" opacity="0.10"/>
  <path d="M0,330 Q200,328 400,332 Q600,329 840,331" fill="none" stroke="#C87F0A" stroke-width="0.4" opacity="0.08"/>
  <circle cx="120" cy="430" r="2" fill="#D4920B" opacity="0.20"/>
  <circle cx="340" cy="395" r="1.5" fill="#8B5E3C" opacity="0.15"/>
  <circle cx="560" cy="440" r="2.5" fill="#C87F0A" opacity="0.12"/>
  <circle cx="720" cy="360" r="1.8" fill="#6B4423" opacity="0.18"/>
  <circle cx="200" cy="365" r="1.2" fill="#D4920B" opacity="0.10"/>
  <circle cx="480" cy="425" r="2" fill="#8B5E3C" opacity="0.14"/>
  <circle cx="650" cy="385" r="1.5" fill="#C87F0A" opacity="0.11"/>
  <circle cx="80" cy="450" r="1.8" fill="#6B4423" opacity="0.13"/>
</svg>```.text

// Fossilized fern leaf impression pattern
#let _fossil-fern-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="160" viewBox="0 0 120 160">
  <path d="M60,10 L60,150" fill="none" stroke="#5C7A3D" stroke-width="1.5" opacity="0.3"/>
  <path d="M60,25 Q45,20 35,30 Q45,28 60,35" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.25"/>
  <path d="M60,25 Q75,20 85,30 Q75,28 60,35" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.25"/>
  <path d="M60,45 Q42,40 30,50 Q42,48 60,55" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.22"/>
  <path d="M60,45 Q78,40 90,50 Q78,48 60,55" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.22"/>
  <path d="M60,65 Q40,60 25,70 Q40,68 60,75" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.20"/>
  <path d="M60,65 Q80,60 95,70 Q80,68 60,75" fill="none" stroke="#5C7A3D" stroke-width="1" opacity="0.20"/>
  <path d="M60,85 Q38,80 22,90 Q38,88 60,95" fill="none" stroke="#5C7A3D" stroke-width="0.8" opacity="0.18"/>
  <path d="M60,85 Q82,80 98,90 Q82,88 60,95" fill="none" stroke="#5C7A3D" stroke-width="0.8" opacity="0.18"/>
  <path d="M60,105 Q42,100 30,110 Q42,108 60,115" fill="none" stroke="#5C7A3D" stroke-width="0.8" opacity="0.15"/>
  <path d="M60,105 Q78,100 90,110 Q78,108 60,115" fill="none" stroke="#5C7A3D" stroke-width="0.8" opacity="0.15"/>
  <path d="M60,125 Q45,120 38,130 Q45,128 60,135" fill="none" stroke="#5C7A3D" stroke-width="0.7" opacity="0.12"/>
  <path d="M60,125 Q75,120 82,130 Q75,128 60,135" fill="none" stroke="#5C7A3D" stroke-width="0.7" opacity="0.12"/>
</svg>```.text

// Amber inclusion frame - resin border with trapped bubbles for title/ending
#let _amber-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="24" y="16" width="792" height="442" rx="8" ry="8" fill="none" stroke="#D4920B" stroke-width="3" opacity="0.6"/>
  <rect x="32" y="24" width="776" height="426" rx="5" ry="5" fill="none" stroke="#C87F0A" stroke-width="1.2" opacity="0.35"/>
  <rect x="18" y="10" width="804" height="454" rx="10" ry="10" fill="none" stroke="#F5C842" stroke-width="1" opacity="0.25"/>
  <circle cx="60" cy="40" r="4" fill="#F5C842" opacity="0.30"/>
  <circle cx="780" cy="40" r="3" fill="#D4920B" opacity="0.25"/>
  <circle cx="55" cy="434" r="3.5" fill="#F5C842" opacity="0.28"/>
  <circle cx="785" cy="430" r="4.5" fill="#D4920B" opacity="0.22"/>
  <circle cx="420" cy="20" r="2.5" fill="#C87F0A" opacity="0.20"/>
  <circle cx="415" cy="456" r="2" fill="#C87F0A" opacity="0.18"/>
  <ellipse cx="100" cy="237" rx="2" ry="3" fill="#F5C842" opacity="0.15"/>
  <ellipse cx="740" cy="237" rx="2.5" ry="3.5" fill="#F5C842" opacity="0.15"/>
  <path d="M24,80 Q20,80 20,84 L20,120 Q20,124 24,124" fill="none" stroke="#D4920B" stroke-width="1.5" opacity="0.4"/>
  <path d="M816,80 Q820,80 820,84 L820,120 Q820,124 816,124" fill="none" stroke="#D4920B" stroke-width="1.5" opacity="0.4"/>
  <path d="M24,350 Q20,350 20,354 L20,390 Q20,394 24,394" fill="none" stroke="#D4920B" stroke-width="1.5" opacity="0.4"/>
  <path d="M816,350 Q820,350 820,354 L820,390 Q820,394 816,394" fill="none" stroke="#D4920B" stroke-width="1.5" opacity="0.4"/>
</svg>```.text

// Cross-section sediment divider - horizontal strata with grain texture
#let _cross-section-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <rect x="0" y="0" width="300" height="3" fill="#D4920B" opacity="0.4" rx="1.5"/>
  <rect x="0" y="4" width="300" height="2" fill="#8B5E3C" opacity="0.3" rx="1"/>
  <rect x="0" y="7" width="300" height="2.5" fill="#6B4423" opacity="0.25" rx="1.25"/>
  <rect x="0" y="10" width="300" height="2" fill="#C87F0A" opacity="0.2" rx="1"/>
  <circle cx="30" cy="1.5" r="1" fill="#F5C842" opacity="0.5"/>
  <circle cx="90" cy="5" r="0.8" fill="#D4920B" opacity="0.4"/>
  <circle cx="150" cy="8" r="1" fill="#8B5E3C" opacity="0.35"/>
  <circle cx="210" cy="2" r="0.7" fill="#F5C842" opacity="0.45"/>
  <circle cx="270" cy="11" r="0.9" fill="#C87F0A" opacity="0.3"/>
</svg>```.text

// Amber resin drip decoration for corners
#let _resin-drip-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="80" viewBox="0 0 40 80">
  <path d="M20,0 Q22,15 20,30 Q18,45 20,55 Q22,62 20,70 Q19,75 20,80" fill="none" stroke="#D4920B" stroke-width="2" opacity="0.35"/>
  <path d="M20,55 Q16,58 14,62 Q12,68 15,72 Q18,76 22,74 Q26,72 27,68 Q28,63 25,59 Q22,56 20,55" fill="#F5C842" opacity="0.20"/>
  <circle cx="20" cy="65" r="3" fill="#D4920B" opacity="0.15"/>
  <ellipse cx="18" cy="62" rx="1" ry="1.5" fill="#FFF8E7" opacity="0.30"/>
  <path d="M15,5 Q17,10 15,15" fill="none" stroke="#C87F0A" stroke-width="0.8" opacity="0.25"/>
  <path d="M25,10 Q27,18 25,25" fill="none" stroke="#C87F0A" stroke-width="0.8" opacity="0.20"/>
  <circle cx="16" cy="20" r="1.2" fill="#F5C842" opacity="0.25"/>
  <circle cx="24" cy="35" r="1" fill="#F5C842" opacity="0.20"/>
</svg>```.text

// Signal-style amber pulse for section headers
#let _amber-pulse-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="16" viewBox="0 0 120 16">
  <path d="M0,8 H25 L30,3 L40,13 L50,3 L55,8 H75 L80,5 L85,11 L90,8 H120" fill="none" stroke="#D4920B" stroke-width="1.5" opacity="0.6" stroke-linecap="round" stroke-linejoin="round"/>
  <circle cx="0" cy="8" r="2.5" fill="#D4920B" opacity="0.7"/>
  <circle cx="120" cy="8" r="2.5" fill="#8B5E3C" opacity="0.6"/>
  <circle cx="40" cy="13" r="1.5" fill="#F5C842" opacity="0.5"/>
  <circle cx="85" cy="11" r="1.5" fill="#C87F0A" opacity="0.4"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render geological strata background
#let strata-bg() = {
  image(bytes(_strata-bg-svg), width: 100%, height: 100%)
}

/// Render fossilized fern decoration
#let fossil-fern(height: 120pt) = {
  box(image(bytes(_fossil-fern-svg), width: auto, height: height))
}

/// Render amber inclusion frame overlay (bookend element for title/ending)
#let amber-frame() = {
  image(bytes(_amber-frame-svg), width: 100%, height: 100%)
}

/// Render cross-section sediment divider
#let cross-section-divider(width: 100%) = {
  box(width: width, image(bytes(_cross-section-svg), width: width, height: 10pt))
}

/// Render resin drip corner decoration
#let resin-drip(height: 60pt) = {
  box(image(bytes(_resin-drip-svg), width: auto, height: height))
}

/// Render amber pulse decoration
#let amber-pulse(width: 80pt) = {
  box(width: width, image(bytes(_amber-pulse-svg), width: width, height: 12pt))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides - strata layers + corner resin
#let _content-atmosphere() = {
  // Full-page strata background
  place(top + left, box(width: 100%, height: 100%, strata-bg()))
  // Faint resin drip in top-right corner
  place(top + right, dx: -0.8em, dy: 0.3em, resin-drip(height: 50pt))
  // Small amber accent dots
  place(bottom + left, dx: 1.5em, dy: -1em,
    circle(radius: 2.5pt, fill: palette.accent.transparentize(75%)))
  place(top + left, dx: 1.2em, dy: 0.8em,
    circle(radius: 2pt, fill: palette.resin.transparentize(80%)))
}


// === 1. Slide Functions ===

/// Standard content slide - warm bg, strata atmosphere, amber accents
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
      // Cross-section divider under title
      cross-section-divider(width: 140pt),
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
        // Amber dot separator
        box(width: 6pt, height: 6pt, radius: 3pt, fill: palette.accent)
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

/// Title slide - amber frame, strata background, centered with fossil fern corners
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Strata background texture
    place(top + left, box(width: 100%, height: 100%, strata-bg()))
    // Amber frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, amber-frame()))
    // Fern decorations in corners
    place(top + left, dx: 2.5em, dy: 2em, fossil-fern(height: 90pt))
    place(bottom + right, dx: -2.5em, dy: -1.5em, fossil-fern(height: 70pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.ink, info.title),
        std.align(center, cross-section-divider(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary, weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.ink, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.resin-text)[#utils.display-info-date(self)]
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

/// New section slide - left amber accent bar, strata decoration, section title
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
    // Strata texture
    place(top + left, box(width: 100%, height: 100%, strata-bg()))
    // Left accent bar - amber gradient
    place(top + left, block(width: 5pt, height: 100%, fill: palette.accent))
    // Resin drip in upper right
    place(top + right, dx: -2em, dy: 1em, resin-drip(height: 60pt))
    // Small fossil accent
    place(bottom + right, dx: -4em, dy: -2em,
      circle(radius: 3pt, fill: palette.accent.transparentize(50%)))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: 0.8em,
        text(size: 3.5em, fill: palette.accent-text, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        amber-pulse(width: 100pt),
        {
          set text(fill: palette.ink, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
      #v(1fr)
    ]
    // Bottom strata accent line
    place(bottom + left, block(width: 100%, height: 3pt, fill: palette.accent.transparentize(60%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide - darker warm background, amber text emphasis
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
    // Darker warm background
    place(top + left, block(width: 100%, height: 100%, fill: palette.strata-dark))
    // Strata at bottom
    place(bottom + left, block(width: 100%, height: 30%, fill: palette.sediment.transparentize(70%)))
    // Corner resin drips
    place(top + left, dx: 2em, dy: 1em, resin-drip(height: 50pt))
    place(top + right, dx: -2em, dy: 1em, resin-drip(height: 50pt))
    // Amber glow dots
    place(bottom + left, dx: 3em, dy: -2em,
      circle(radius: 4pt, fill: palette.amber-glow.transparentize(40%)))
    place(bottom + right, dx: -3em, dy: -2em,
      circle(radius: 3pt, fill: palette.amber-glow.transparentize(50%)))
    // Center content
    place(center + horizon,
      block(width: 72%, height: auto,
        align(center)[
          #set text(fill: palette.amber-glow, size: 1.4em, weight: "bold")
          #stack(spacing: 0.8em,
            body,
            cross-section-divider(width: 180pt),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide - warm bg with amber frame (bookend), fossil fern, farewell
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
    // Strata texture
    place(top + left, box(width: 100%, height: 100%, strata-bg()))
    // Amber frame (bookend - shared with title slide)
    place(top + left, box(width: 100%, height: 100%, amber-frame()))
    // Fossil fern decoration
    place(top + right, dx: -3em, dy: 2em, fossil-fern(height: 80pt))
    place(bottom + left, dx: 3em, dy: -2em, fossil-fern(height: 60pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        amber-pulse(width: 120pt),
        text(size: 2.4em, weight: "bold", fill: palette.ink, body),
        cross-section-divider(width: 200pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Stratum card - layered info card with geological texture accent
#let stratum-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        stack(spacing: 0.8em,
          box(width: 8pt, height: 2pt, fill: accent, radius: 1pt),
          box(width: 8pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
          box(width: 8pt, height: 2pt, fill: accent.transparentize(70%), radius: 1pt),
        ),
        text(weight: "bold", fill: palette.ink, size: 0.92em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Inclusion box - highlighted callout with amber resin border glow
#let inclusion-box(title, body) = {
  block(
    width: 100%,
    fill: palette.amber-light,
    stroke: (left: 4pt + palette.accent),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        amber-pulse(width: 60pt),
        text(weight: "bold", fill: palette.resin-text, size: 0.95em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Fossil tag - small capsule tag with layered dot
#let fossil-tag(content, color: palette.accent) = {
  box(
    fill: color.lighten(85%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      stack(spacing: 0.8em,
        box(width: 5pt, height: 2pt, radius: 1pt, fill: color),
        box(width: 5pt, height: 2pt, radius: 1pt, fill: color.transparentize(50%)),
      ),
      text(fill: _text-safe(color), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Specimen card - data display card with top sediment stripe
#let specimen-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
    clip: true,
  )[
    #stack(spacing: .8em,
      text(fill: _text-safe(accent), size: 0.88em, weight: "bold", title),
      stack(spacing: 0.8em,
        block(width: 30pt, height: 2pt, fill: accent.transparentize(50%), radius: 1pt),
        {
          set text(fill: palette.ink, size: 0.80em)
          body
          lazy-v(1fr)
        },
      ),
    )
  ]
}

/// Amber stat - KPI/metric display with amber accent
#let amber-stat(label, value, color: palette.accent) = {
  block(
    width: 100%,
    height: 88pt,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      box(width: 6pt, height: 6pt, radius: 3pt, fill: color.transparentize(40%)),
      {
        set text(fill: _text-safe(color), size: 1.35em, weight: "bold")
        value
      },
      {
        set text(fill: palette.text-muted, size: 0.75em)
        label
      },
      lazy-v(1fr),
    )
  ]
}

/// Epoch card - timeline/era card with period label
#let epoch-card(era, title, body, accent: palette.sediment) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      stack(spacing: 0.8em,
        text(fill: _text-safe(accent), size: 0.68em, weight: "bold", tracking: 0.05em, upper(era)),
        text(fill: palette.ink, size: 0.92em, weight: "bold", title),
      ),
      {
        set text(fill: palette.ink, size: 0.80em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Sediment grid - multi-item comparison grid with strata styling
#let sediment-grid(items) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(
      columns: (1fr,) * items.len(),
      fill: palette.card-bg,
      inset: (x: 0.8em, y: 0.25em),
      align: center + horizon,
      ..items.map(item => {
        stack(
          spacing: 0.8em,
          text(fill: palette.ink, size: 1.4em, weight: "bold", item.at("value")),
          text(fill: palette.accent-text, size: 0.75em, weight: "bold", item.at("label")),
          text(fill: palette.text-muted, size: 0.62em, item.at("desc", default: "")),
        )
      })
    )
  ]
}

/// Resin box - code/technical content box with amber-tinted monospace feel
#let resin-box(title, body, accent: palette.resin) = {
  block(
    width: 100%,
    fill: rgb("#FFFBF0"),
    stroke: (left: 3pt + accent, rest: 1pt + rgb("#E8D5B7")),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: _text-safe(accent), size: 0.88em, title),
      ),
      {
        set text(fill: palette.ink, size: 0.80em)
        body
        lazy-v(1fr)
      },
    )
  ]
}

/// Discovery note - annotation/insight callout with fossil leaf accent
#let discovery-note(title, body, accent: palette.leaf-green) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      text(weight: "bold", fill: _text-safe(accent), size: 0.92em, title),
      stack(spacing: 0.8em,
        block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
        {
          set text(fill: palette.ink, size: 0.82em)
          body
          lazy-v(1fr)
        },
      ),
    )
  ]
}

/// Cross-section divider component - SVG-based separator with strata layers
#let strata-divider(width: 80%) = {
  std.align(center, box(width: width, cross-section-divider(width: 100%)))
}


// === 3. Theme Entry Point ===

#let fossil-amber-theme(
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
      fill: palette.bg,
      margin: (top: 3.5em, bottom: 2em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.accent-text,
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
