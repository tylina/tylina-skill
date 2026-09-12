// Plasma Arc Theme — Electrical discharge, plasma physics, Tesla coils aesthetic
// Raw energy channeled into precision: jagged arc paths, ionization dots, electrode markers
// Clean white background with electric violet, plasma blue, energy orange accents
// Perfect for technology presentations, engineering talks, physics, innovation showcases
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Plasma Arc — Light Theme) ===

#let palette = (
  bg: rgb("#FAFCFF"),
  card-bg: rgb("#FFFFFF"),
  text: rgb("#1E293B"),
  text-muted: rgb("#64748B"),
  primary: rgb("#6D28D9"),
  secondary: rgb("#2563EB"),
  accent: rgb("#F59E0B"),
  border: rgb("#E2E8F0"),
  light-violet: rgb("#EDE9FE"),
  light-blue: rgb("#EFF6FF"),
  field-bg: rgb("#F5F3FF"),
)


// === SVG Definitions ===

// Full-page plasma field background — radiating arc paths from edges, ionization dots, circular field lines
#let _plasma-field-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="700" cy="237" r="180" fill="none" stroke="#6D28D9" stroke-width="0.5" opacity="0.06"/>
  <circle cx="700" cy="237" r="140" fill="none" stroke="#6D28D9" stroke-width="0.4" opacity="0.05"/>
  <circle cx="700" cy="237" r="100" fill="none" stroke="#2563EB" stroke-width="0.4" opacity="0.04"/>
  <circle cx="700" cy="237" r="60" fill="none" stroke="#2563EB" stroke-width="0.3" opacity="0.05"/>
  <circle cx="80" cy="60" r="120" fill="none" stroke="#6D28D9" stroke-width="0.4" opacity="0.05"/>
  <circle cx="80" cy="60" r="80" fill="none" stroke="#2563EB" stroke-width="0.3" opacity="0.04"/>
  <polyline points="0,40 12,38 18,52 24,35 36,48 42,30 55,44 62,28 78,42 85,25 98,39 110,22 125,36 138,20 152,33" fill="none" stroke="#6D28D9" stroke-width="0.8" opacity="0.08"/>
  <polyline points="840,420 828,424 820,410 812,428 800,415 790,432 778,418 768,435 755,420 742,438 730,422 718,440 705,425 692,442 680,428" fill="none" stroke="#2563EB" stroke-width="0.7" opacity="0.07"/>
  <polyline points="0,240 8,235 14,248 22,230 30,245 38,225 48,242 56,220 66,238 74,215 84,232 94,210 105,228 115,206" fill="none" stroke="#6D28D9" stroke-width="0.6" opacity="0.06"/>
  <polyline points="840,200 832,205 825,192 818,210 808,195 800,212 790,198 780,215 770,200 758,218 748,202 738,220 728,205" fill="none" stroke="#2563EB" stroke-width="0.6" opacity="0.06"/>
  <polyline points="750,0 748,10 755,18 742,24 752,32 740,38 750,46 738,52 748,60 736,66 746,74 734,80" fill="none" stroke="#6D28D9" stroke-width="0.5" opacity="0.05"/>
  <polyline points="120,474 118,462 125,456 115,448 126,440 114,432 124,424 112,416 122,408 110,400 120,392" fill="none" stroke="#2563EB" stroke-width="0.5" opacity="0.05"/>
  <circle cx="150" cy="80" r="1.5" fill="#6D28D9" opacity="0.10"/>
  <circle cx="280" cy="120" r="1" fill="#2563EB" opacity="0.08"/>
  <circle cx="420" cy="60" r="1.2" fill="#6D28D9" opacity="0.07"/>
  <circle cx="560" cy="100" r="1" fill="#2563EB" opacity="0.09"/>
  <circle cx="680" cy="80" r="1.5" fill="#6D28D9" opacity="0.06"/>
  <circle cx="100" cy="350" r="1.2" fill="#2563EB" opacity="0.08"/>
  <circle cx="250" cy="400" r="1" fill="#6D28D9" opacity="0.07"/>
  <circle cx="380" cy="430" r="1.5" fill="#2563EB" opacity="0.09"/>
  <circle cx="520" cy="380" r="1" fill="#6D28D9" opacity="0.06"/>
  <circle cx="650" cy="420" r="1.2" fill="#2563EB" opacity="0.08"/>
  <circle cx="760" cy="360" r="1" fill="#6D28D9" opacity="0.07"/>
  <circle cx="200" cy="230" r="0.8" fill="#F59E0B" opacity="0.10"/>
  <circle cx="600" cy="280" r="0.8" fill="#F59E0B" opacity="0.08"/>
  <circle cx="400" cy="320" r="0.8" fill="#F59E0B" opacity="0.07"/>
  <rect x="0" y="440" width="840" height="34" fill="url(#pfg1)" opacity="0.03"/>
  <defs><linearGradient id="pfg1" x1="0" y1="0" x2="1" y2="0"><stop offset="0%" stop-color="#6D28D9"/><stop offset="100%" stop-color="#2563EB"/></linearGradient></defs>
</svg>
```.text

// Arc frame SVG — border with jagged electrical discharge paths, electrode nodes at corners (bookend for title/ending)
#let _arc-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="20" width="784" height="434" rx="2" ry="2" fill="none" stroke="#6D28D9" stroke-width="1.5" opacity="0.35"/>
  <rect x="34" y="26" width="772" height="422" rx="1" ry="1" fill="none" stroke="#2563EB" stroke-width="0.6" opacity="0.20"/>
  <polyline points="60,20 68,14 74,22 82,10 90,20 98,8 106,18 114,6 122,16 130,4 138,14 146,8 154,18 162,6 170,16 178,10 186,20 194,8 202,16 210,12 218,20" fill="none" stroke="#6D28D9" stroke-width="1.2" opacity="0.30"/>
  <polyline points="620,454 628,460 636,450 644,464 652,452 660,466 668,454 676,468 684,456 692,470 700,458 708,466 716,454 724,468 732,456 740,462 748,454 756,466 764,456 772,460 780,454" fill="none" stroke="#2563EB" stroke-width="1.2" opacity="0.28"/>
  <polyline points="28,80 22,88 30,96 18,104 28,112 16,120 26,128 14,136 24,144 18,152 28,160 20,168 28,176 16,184 26,192" fill="none" stroke="#6D28D9" stroke-width="1.0" opacity="0.25"/>
  <polyline points="812,280 818,288 810,296 822,304 812,312 824,320 814,328 826,336 816,344 820,352 812,360 822,368 814,376 824,384 816,392" fill="none" stroke="#2563EB" stroke-width="1.0" opacity="0.25"/>
  <circle cx="28" cy="20" r="4" fill="#6D28D9" opacity="0.6"/>
  <circle cx="28" cy="20" r="8" fill="none" stroke="#6D28D9" stroke-width="0.8" opacity="0.3"/>
  <circle cx="812" cy="20" r="4" fill="#2563EB" opacity="0.6"/>
  <circle cx="812" cy="20" r="8" fill="none" stroke="#2563EB" stroke-width="0.8" opacity="0.3"/>
  <circle cx="28" cy="454" r="4" fill="#2563EB" opacity="0.6"/>
  <circle cx="28" cy="454" r="8" fill="none" stroke="#2563EB" stroke-width="0.8" opacity="0.3"/>
  <circle cx="812" cy="454" r="4" fill="#6D28D9" opacity="0.6"/>
  <circle cx="812" cy="454" r="8" fill="none" stroke="#6D28D9" stroke-width="0.8" opacity="0.3"/>
  <circle cx="28" cy="20" r="14" fill="none" stroke="#F59E0B" stroke-width="0.4" opacity="0.25"/>
  <circle cx="812" cy="20" r="14" fill="none" stroke="#F59E0B" stroke-width="0.4" opacity="0.25"/>
  <circle cx="28" cy="454" r="14" fill="none" stroke="#F59E0B" stroke-width="0.4" opacity="0.25"/>
  <circle cx="812" cy="454" r="14" fill="none" stroke="#F59E0B" stroke-width="0.4" opacity="0.25"/>
  <rect x="250" y="14" width="16" height="3" fill="#6D28D9" opacity="0.3"/>
  <rect x="280" y="14" width="10" height="3" fill="#2563EB" opacity="0.25"/>
  <rect x="300" y="14" width="20" height="3" fill="#6D28D9" opacity="0.2"/>
  <rect x="540" y="14" width="14" height="3" fill="#2563EB" opacity="0.25"/>
  <rect x="565" y="14" width="18" height="3" fill="#6D28D9" opacity="0.3"/>
  <rect x="595" y="14" width="8" height="3" fill="#F59E0B" opacity="0.3"/>
</svg>
```.text

// Discharge divider — horizontal jagged arc line with energy nodes at endpoints
#let _discharge-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="14" viewBox="0 0 300 14">
  <circle cx="4" cy="7" r="3" fill="#6D28D9" opacity="0.7"/>
  <circle cx="4" cy="7" r="5" fill="none" stroke="#6D28D9" stroke-width="0.6" opacity="0.4"/>
  <polyline points="9,7 18,4 24,9 32,3 40,8 48,2 56,7 64,3 72,8 80,4 88,7 96,3 104,8 112,4 120,7 128,3 136,8 144,4 152,7 160,3 168,8 176,4 184,7 192,3 200,8 208,4 216,7 224,3 232,8 240,4 248,7 256,3 264,8 272,4 280,7 288,4 291,7" fill="none" stroke="#6D28D9" stroke-width="1.2" opacity="0.45"/>
  <circle cx="296" cy="7" r="3" fill="#2563EB" opacity="0.7"/>
  <circle cx="296" cy="7" r="5" fill="none" stroke="#2563EB" stroke-width="0.6" opacity="0.4"/>
  <circle cx="80" cy="5" r="1" fill="#F59E0B" opacity="0.6"/>
  <circle cx="150" cy="4" r="1.2" fill="#F59E0B" opacity="0.5"/>
  <circle cx="220" cy="6" r="1" fill="#F59E0B" opacity="0.6"/>
</svg>
```.text

// Spark accent SVG — small starburst/spark for decorations
#let _spark-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
  <circle cx="8" cy="8" r="2" fill="#F59E0B" opacity="0.8"/>
  <line x1="8" y1="0" x2="8" y2="4" stroke="#F59E0B" stroke-width="1.2" opacity="0.7"/>
  <line x1="8" y1="12" x2="8" y2="16" stroke="#F59E0B" stroke-width="1.2" opacity="0.7"/>
  <line x1="0" y1="8" x2="4" y2="8" stroke="#F59E0B" stroke-width="1.2" opacity="0.7"/>
  <line x1="12" y1="8" x2="16" y2="8" stroke="#F59E0B" stroke-width="1.2" opacity="0.7"/>
  <line x1="2" y1="2" x2="5" y2="5" stroke="#6D28D9" stroke-width="0.8" opacity="0.6"/>
  <line x1="11" y1="11" x2="14" y2="14" stroke="#6D28D9" stroke-width="0.8" opacity="0.6"/>
  <line x1="14" y1="2" x2="11" y2="5" stroke="#2563EB" stroke-width="0.8" opacity="0.6"/>
  <line x1="2" y1="14" x2="5" y2="11" stroke="#2563EB" stroke-width="0.8" opacity="0.6"/>
</svg>
```.text


// === SVG Rendering Helpers ===

/// Render full-page plasma field background
#let plasma-field-bg() = {
  image(bytes(_plasma-field-svg), width: 100%, height: 100%)
}

/// Render arc frame (bookend for title/ending)
#let arc-frame() = {
  image(bytes(_arc-frame-svg), width: 100%, height: 100%)
}

/// Render discharge divider
#let discharge-divider(width: 100%) = {
  box(width: width, image(bytes(_discharge-divider-svg), width: width, height: 11pt))
}

/// Render spark accent
#let spark-accent() = {
  box(width: 12pt, height: 12pt, image(bytes(_spark-svg), width: 12pt, height: 12pt))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides — plasma field + subtle corner markers
#let _content-atmosphere() = {
  // Plasma field lines across the slide
  place(top + left, box(width: 100%, height: 100%, plasma-field-bg()))
  // Corner electrode markers
  place(top + right, dx: -0.8em, dy: 0.4em,
    box(width: 5pt, height: 5pt, fill: palette.primary.transparentize(70%), radius: 2.5pt))
  place(bottom + left, dx: 0.8em, dy: -0.4em,
    box(width: 5pt, height: 5pt, fill: palette.secondary.transparentize(70%), radius: 2.5pt))
  place(bottom + right, dx: -1.2em, dy: -0.6em,
    box(width: 4pt, height: 4pt, fill: palette.accent.transparentize(75%), radius: 2pt))
}


// === 1. Slide Functions ===

/// Standard content slide — light bg, plasma field atmosphere, violet/blue accents
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
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Discharge divider under title
      discharge-divider(width: 160pt),
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
        // Spark separator
        box(width: 8pt, height: 8pt, image(bytes(_spark-svg), width: 8pt, height: 8pt))
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

/// Title slide — arc frame bookend, plasma field, centered content
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Plasma field background
    place(top + left, box(width: 100%, height: 100%, plasma-field-bg()))
    // Arc frame (bookend)
    place(top + left, box(width: 100%, height: 100%, arc-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(
        spacing: .8em,
        text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
        std.align(center, discharge-divider(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary, weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.text, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.primary)[#utils.display-info-date(self)]
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

/// New section slide — left plasma bar, electrode decoration, section title
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
    // Plasma field
    place(top + left, box(width: 100%, height: 100%, plasma-field-bg()))
    // Left accent bar — electric violet
    place(top + left, block(width: 4pt, height: 100%, fill: palette.primary))
    // Decorative electrode markers
    place(top + right, dx: -2.5em, dy: 1.5em,
      box(width: 6pt, height: 6pt, fill: palette.primary.transparentize(40%), radius: 3pt))
    place(top + right, dx: -4em, dy: 3em,
      box(width: 4pt, height: 4pt, fill: palette.secondary.transparentize(50%), radius: 2pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: .8em,
        {
          set text(size: 3.5em, fill: palette.primary, weight: "bold")
          utils.display-current-heading-number(depth: 1, numbering: "1")
        },
        discharge-divider(width: 120pt),
        {
          set text(fill: palette.text, size: 2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.primary.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deep violet background with bright plasma arcs
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
    // Dark violet background
    place(top + left, block(width: 100%, height: 100%, fill: rgb("#1E1040")))
    // Plasma field (more visible on dark)
    place(top + left, box(width: 100%, height: 100%, plasma-field-bg()))
    // Corner electrodes
    place(top + left, dx: 1.5em, dy: 1em,
      box(width: 6pt, height: 6pt, fill: palette.primary.transparentize(30%), radius: 3pt))
    place(top + right, dx: -1.5em, dy: 1em,
      box(width: 6pt, height: 6pt, fill: palette.accent.transparentize(30%), radius: 3pt))
    place(bottom + left, dx: 1.5em, dy: -1em,
      box(width: 5pt, height: 5pt, fill: palette.accent.transparentize(40%), radius: 2.5pt))
    place(bottom + right, dx: -1.5em, dy: -1em,
      box(width: 5pt, height: 5pt, fill: palette.primary.transparentize(30%), radius: 2.5pt))
    // Keep the principal content in flow so Touying can measure the slide.
    set std.align(center + horizon)
    block(width: 72%)[
      #set text(fill: white, size: 1.4em, weight: "bold")
      #stack(
        spacing: .8em,
        body,
        std.align(center, discharge-divider(width: 180pt)),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light bg with arc frame bookend, farewell text
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
    // Plasma field
    place(top + left, box(width: 100%, height: 100%, plasma-field-bg()))
    // Arc frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, arc-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: .8em,
        discharge-divider(width: 200pt),
        text(size: 2.4em, weight: "bold", fill: palette.text, body),
        block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Arc card — card with jagged electric border on top
#let arc-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.15em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        spark-accent(),
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

/// Plasma box — insight box with glowing violet left border and spark decoration
#let plasma-box(title, body) = {
  block(
    width: 100%,
    fill: palette.light-violet,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        spark-accent(),
        text(weight: "bold", fill: palette.primary, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Voltage stat — metric display with electrode-style framing
#let voltage-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, bottom: 1.5pt + color.transparentize(50%), left: 1pt + palette.border, right: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.4em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      box(width: 5pt, height: 5pt, fill: color.transparentize(35%), radius: 2.5pt),
      {
        set text(fill: color, size: 1.55em, weight: "bold")
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

/// Discharge quote — quote with arc decoration
#let discharge-quote(body, attribution: none) = {
  block(
    width: 100%,
    fill: palette.field-bg,
    stroke: (left: 3pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      discharge-divider(width: 80pt),
      {
        set text(fill: palette.text, size: 0.88em, style: "italic")
        body
      },
      if attribution != none {
        set text(fill: palette.text-muted, size: 0.75em, style: "normal")
        [-- #attribution]
      },
      lazy-v(1fr),
    )
  ]
}

/// Ion tag — small glowing capsule tag
#let ion-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, fill: color, radius: 2.5pt),
      text(fill: color, size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Arc divider — jagged electrical separator (SVG-based)
#let arc-divider(width: 80%) = {
  std.align(center, box(width: width, discharge-divider(width: 100%)))
}

/// Field card — card with circular plasma field lines behind
#let field-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.light-blue,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 6pt, height: 6pt, fill: accent, radius: 3pt),
        text(weight: "bold", fill: palette.text, size: 0.90em, title),
      ),
      {
        set text(fill: palette.text, size: 0.80em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Reactor box — large feature box with all-around electric border
#let reactor-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 2pt + accent.transparentize(30%),
    inset: (x: 1.4em, y: 1em),
    radius: 6pt,
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 8pt,
        spark-accent(),
        text(weight: "bold", fill: accent, size: 1em, title),
      ),
      discharge-divider(width: 100%),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Pulse meter — horizontal bar-style metric/progress indicator
#let pulse-meter(label, value, percent, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      grid(columns: (1fr, 1fr), column-gutter: 0.35em,
        text(fill: palette.text, size: 0.8em, weight: "medium", label),
        std.align(right, text(fill: color, size: 0.82em, weight: "bold", value)),
      ),
      block(width: 100%, height: 6pt, fill: palette.border, radius: 3pt)[
        #block(width: percent, height: 6pt, fill: color, radius: 3pt)
      ],
      lazy-v(1fr),
    )
  ]
}


// === 3. Theme Entry Point ===

#let plasma-arc-theme(
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
