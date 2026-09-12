// Ivory Column Theme — Classical Greek/Roman architecture aesthetic
// Warm ivory/cream backgrounds with deep charcoal text, slate blue primary, antique gold accents
// Features: fluted column patterns, Ionic volute scrolls, entablature borders, Greek key meanders
// Temple pediment frames, classical proportional systems, marble-white card surfaces
// Perfect for authoritative presentations requiring timeless elegance and visual weight
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FAF8F3"),
  ivory: rgb("#F5F1E8"),
  card-bg: rgb("#FFFFFF"),
  charcoal: rgb("#2C2C34"),
  primary: rgb("#4A5B7A"),
  primary-dark: rgb("#3A4A66"),
  accent: rgb("#B8943F"),
  accent-text: rgb("#80601B"),
  accent-light: rgb("#D4B55A"),
  secondary: rgb("#536A80"),
  marble: rgb("#F0ECE3"),
  border: rgb("#D6CFC2"),
  text: rgb("#2C2C34"),
  text-muted: rgb("#6B6B73"),
  warm-shadow: rgb("#E8E2D6"),
)


// ═══ SVG Definitions ═══

// Full-page fluted column pattern — vertical fluting lines across background
#let _fluted-columns-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="60" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.06" rx="1"/>
  <rect x="63" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.04" rx="0.75"/>
  <rect x="120" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.05" rx="1"/>
  <rect x="123" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.03" rx="0.75"/>
  <rect x="180" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.06" rx="1"/>
  <rect x="183" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.04" rx="0.75"/>
  <rect x="240" y="40" width="2" height="394" fill="#B8943F" opacity="0.05" rx="1"/>
  <rect x="243" y="40" width="1.5" height="394" fill="#B8943F" opacity="0.03" rx="0.75"/>
  <rect x="360" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.05" rx="1"/>
  <rect x="363" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.03" rx="0.75"/>
  <rect x="480" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.06" rx="1"/>
  <rect x="483" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.04" rx="0.75"/>
  <rect x="600" y="40" width="2" height="394" fill="#B8943F" opacity="0.05" rx="1"/>
  <rect x="603" y="40" width="1.5" height="394" fill="#B8943F" opacity="0.03" rx="0.75"/>
  <rect x="660" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.05" rx="1"/>
  <rect x="663" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.03" rx="0.75"/>
  <rect x="720" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.06" rx="1"/>
  <rect x="723" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.04" rx="0.75"/>
  <rect x="780" y="40" width="2" height="394" fill="#4A5B7A" opacity="0.05" rx="1"/>
  <rect x="783" y="40" width="1.5" height="394" fill="#4A5B7A" opacity="0.03" rx="0.75"/>
  <line x1="0" y1="38" x2="840" y2="38" stroke="#B8943F" stroke-width="1" opacity="0.12"/>
  <line x1="0" y1="436" x2="840" y2="436" stroke="#B8943F" stroke-width="1" opacity="0.12"/>
</svg>```.text

// Temple pediment frame — triangular pediment with entablature (bookend element)
#let _pediment-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="28" y="60" width="784" height="6" fill="#4A5B7A" opacity="0.5" rx="1"/>
  <rect x="28" y="68" width="784" height="2" fill="#B8943F" opacity="0.4"/>
  <rect x="28" y="72" width="784" height="3" fill="#4A5B7A" opacity="0.3" rx="1"/>
  <polygon points="420,20 780,60 60,60" fill="none" stroke="#4A5B7A" stroke-width="2.5" opacity="0.5"/>
  <polygon points="420,28 740,60 100,60" fill="none" stroke="#B8943F" stroke-width="1" opacity="0.3"/>
  <line x1="28" y1="78" x2="28" y2="440" stroke="#4A5B7A" stroke-width="3" opacity="0.3"/>
  <line x1="812" y1="78" x2="812" y2="440" stroke="#4A5B7A" stroke-width="3" opacity="0.3"/>
  <rect x="28" y="440" width="784" height="6" fill="#4A5B7A" opacity="0.4" rx="1"/>
  <rect x="28" y="448" width="784" height="2" fill="#B8943F" opacity="0.3"/>
  <circle cx="60" cy="60" r="4" fill="#B8943F" opacity="0.5"/>
  <circle cx="780" cy="60" r="4" fill="#B8943F" opacity="0.5"/>
  <circle cx="60" cy="446" r="4" fill="#B8943F" opacity="0.5"/>
  <circle cx="780" cy="446" r="4" fill="#B8943F" opacity="0.5"/>
  <circle cx="420" cy="20" r="5" fill="#B8943F" opacity="0.6"/>
</svg>```.text

// Entablature/cornice decorative header border
#let _entablature-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <rect x="0" y="0" width="300" height="4" fill="#4A5B7A" opacity="0.6" rx="1"/>
  <rect x="0" y="5" width="300" height="2" fill="#B8943F" opacity="0.5"/>
  <rect x="0" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="30" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="60" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="90" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="120" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="150" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="180" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="210" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="240" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
  <rect x="270" y="8" width="20" height="8" fill="#4A5B7A" opacity="0.3"/>
</svg>```.text

// Ionic volute scroll ornament
#let _volute-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
  <path d="M20,5 C30,5 35,12 35,20 C35,28 28,33 20,33 C14,33 9,29 9,23 C9,18 13,15 18,15 C22,15 25,17 25,20 C25,23 23,25 20,25 C18,25 17,23 17,21 C17,19 18,18 20,18" fill="none" stroke="#B8943F" stroke-width="1.5" opacity="0.7" stroke-linecap="round"/>
  <circle cx="20" cy="20" r="2" fill="#B8943F" opacity="0.6"/>
</svg>```.text

// Greek key/meander pattern divider
#let _meander-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 H10 V2 H20 V10 H30 V2 H40 V10 H50 V2 H60 V10 H70 V2 H80 V10 H90 V2 H100 V10 H110 V2 H120 V10 H130 V2 H140 V10 H150 V6 H160 V2 H170 V10 H180 V2 H190 V10 H200 V2 H210 V10 H220 V2 H230 V10 H240 V2 H250 V10 H260 V2 H270 V10 H280 V2 H290 V10 H300 V6" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.6" stroke-linecap="square"/>
</svg>```.text

// Fluted pillar accent — single column for card borders
#let _pillar-accent-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="8" height="120" viewBox="0 0 8 120">
  <rect x="0" y="0" width="8" height="4" fill="currentColor" opacity="0.6" rx="1"/>
  <rect x="1" y="6" width="1.5" height="108" fill="currentColor" opacity="0.3" rx="0.75"/>
  <rect x="3.25" y="6" width="1.5" height="108" fill="currentColor" opacity="0.4" rx="0.75"/>
  <rect x="5.5" y="6" width="1.5" height="108" fill="currentColor" opacity="0.3" rx="0.75"/>
  <rect x="0" y="116" width="8" height="4" fill="currentColor" opacity="0.6" rx="1"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render fluted columns background
#let fluted-columns-bg() = {
  image(bytes(_fluted-columns-svg), width: 100%, height: 100%)
}

/// Render pediment frame overlay (bookend)
#let pediment-frame() = {
  image(bytes(_pediment-frame-svg), width: 100%, height: 100%)
}

/// Render entablature border
#let entablature-border(width: 100%) = {
  box(width: width, image(bytes(_entablature-svg), width: width, height: 12pt))
}

/// Render volute ornament with configurable opacity
#let volute-ornament(size: 28pt, opacity: 1.0) = {
  let svg = _volute-svg.replace("opacity=\"0.7\"", "opacity=\"" + str(0.7 * opacity) + "\"").replace("opacity=\"0.6\"", "opacity=\"" + str(0.6 * opacity) + "\"")
  box(image(bytes(svg), width: size, height: size))
}

/// Render meander divider
#let meander-line(width: 100%, color: palette.accent) = {
  let svg = _meander-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 10pt))
}

/// Render pillar accent
#let pillar-accent(height: 80pt, color: palette.primary) = {
  let svg = _pillar-accent-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: 6pt, height: height))
}

// Keep decorative gold bright while routing text roles to an accessible tone.
#let _text-color(color) = if color == palette.accent or color == palette.accent-light {
  palette.accent-text
} else {
  color
}

#let _on-color(color) = if color == palette.accent or color == palette.accent-light {
  palette.charcoal
} else {
  white
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — fluted columns + corner volutes
#let _content-atmosphere() = {
  // Faint fluted column pattern across entire slide
  place(top + left, box(width: 100%, height: 100%, fluted-columns-bg()))
  // Corner volute ornaments (subtle)
  place(top + right, dx: -0.8em, dy: 0.4em,
    volute-ornament(size: 22pt, opacity: 0.4))
  place(bottom + left, dx: 0.8em, dy: -1.5em,
    volute-ornament(size: 20pt, opacity: 0.35))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — ivory bg, fluted column atmosphere, classical accents
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
        set text(fill: palette.charcoal, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Entablature border under title
      entablature-border(width: 160pt),
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
        // Classical diamond separator
        box(width: 6pt, height: 6pt,
          rotate(45deg, box(width: 4pt, height: 4pt, fill: palette.accent)))
      },
      {
        set std.align(right)
        context text(fill: palette.text-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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
      background: _content-atmosphere(),
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — pediment frame, fluted columns, centered classical branding
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Fluted columns background
    place(top + left, box(width: 100%, height: 100%, fluted-columns-bg()))
    // Pediment frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, pediment-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em,
      stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.charcoal, info.title),
        std.align(center, meander-line(width: 220pt)),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.primary, weight: "medium", info.subtitle)
        },
        if info.author != none {
          text(size: 1em, fill: palette.charcoal, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-muted, info.institution)
        },
        if info.date != none {
          text(size: 0.8em, fill: palette.accent-text, utils.display-info-date(self))
        },
      ),
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

/// New section slide — left pillar accent bar, entablature, classical section number
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
    // Fluted columns
    place(top + left, box(width: 100%, height: 100%, fluted-columns-bg()))
    // Left pillar accent bar
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Top-right volute decoration
    place(top + right, dx: -2.5em, dy: 1.5em,
      volute-ornament(size: 32pt, opacity: 0.7))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(
        spacing: 0.8em,
        text(size: 3.5em, fill: palette.accent-text, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        entablature-border(width: 120pt),
        {
          set text(fill: palette.charcoal, size: 2em, weight: "semibold")
          utils.display-current-heading(level: 1, numbered: false)
        },
      )
      #v(1fr)
    ]
    // Bottom meander line
    place(bottom + center, dy: -1.5em, std.align(center, meander-line(width: 40%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — marble background, centered classical statement with pediment accent
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
    // Marble background
    place(top + left, block(width: 100%, height: 100%, fill: palette.marble))
    // Fluted columns
    place(top + left, box(width: 100%, height: 100%, fluted-columns-bg()))
    // Top entablature band
    place(top + left,
      block(width: 100%, height: 4pt, fill: palette.primary.transparentize(40%)))
    // Bottom entablature band
    place(bottom + left,
      block(width: 100%, height: 4pt, fill: palette.primary.transparentize(40%)))
    // Corner volutes
    place(top + left, dx: 2em, dy: 1.5em, volute-ornament(size: 28pt, opacity: 0.55))
    place(top + right, dx: -2em, dy: 1.5em, volute-ornament(size: 28pt, opacity: 0.55))
    place(bottom + left, dx: 2em, dy: -1.5em, volute-ornament(size: 24pt, opacity: 0.5))
    place(bottom + right, dx: -2em, dy: -1.5em, volute-ornament(size: 24pt, opacity: 0.5))
    // Keep semantic content in flow so Touying can measure the slide.
    set std.align(center + horizon)
    block(width: 72%, height: auto,
      align(center,
        stack(
          spacing: 0.8em,
          {
            set text(fill: palette.charcoal, size: 1.4em, weight: "bold")
            body
          },
          meander-line(width: 180pt),
        ),
      ),
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — ivory bg with pediment frame (bookend), classical farewell
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
    // Ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Fluted columns
    place(top + left, box(width: 100%, height: 100%, fluted-columns-bg()))
    // Pediment frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, pediment-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
      spacing: 0.8em,
        volute-ornament(size: 36pt),
        text(size: 2.4em, weight: "bold", fill: palette.charcoal, body),
        meander-line(width: 200pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Pillar card — content card with fluted column border accent on the left
#let pillar-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #place(left + horizon, dx: -0.75em,
      pillar-accent(height: 56pt, color: accent))
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: _text-color(accent), size: 0.92em, title),
      block(width: 40pt, height: 2pt, fill: palette.accent.transparentize(40%)),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Capital box — highlighted box with volute scroll decoration feel (gold accent top)
#let capital-box(title, body) = {
  block(
    width: 100%,
    fill: palette.ivory,
    stroke: (top: 3pt + palette.accent, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (bottom: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        box(width: 8pt, height: 8pt, radius: 4pt, fill: palette.accent),
        text(weight: "semibold", fill: palette.primary-dark, size: 0.95em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Frieze tag — classical capsule label (like a triglyph marker)
#let frieze-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(30%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, radius: 0pt, fill: color),
      text(fill: _text-color(color), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Pediment card — important data display with triangular top accent
#let pediment-card(title, body, accent: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        {
          box(width: 10pt, height: 8pt,
            place(bottom + center,
              polygon(fill: accent,
                (0pt, 8pt), (5pt, 0pt), (10pt, 8pt))))
        },
        text(weight: "semibold", fill: palette.charcoal, size: 0.92em, title),
      ),
      block(width: 100%, height: 1.5pt, fill: accent.transparentize(60%)),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Meander divider — Greek key pattern separator component
#let meander-divider(width: 80%, color: palette.accent) = {
  std.align(center, meander-line(width: width, color: color))
}

/// Order stat — KPI display with classical proportions
#let order-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (bottom: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (top: 4pt),
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      box(width: 6pt, height: 6pt, radius: 0pt, fill: palette.accent.transparentize(35%)),
      text(fill: _text-color(color), size: 1.8em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Colonnade card — linked/sequential card with step number
#let colonnade-card(number, title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        box(width: 22pt, height: 22pt, radius: 11pt, fill: accent,
          align(center + horizon, text(fill: _on-color(accent), size: 0.7em, weight: "bold", number))),
        text(weight: "semibold", fill: palette.charcoal, size: 0.92em, title),
      ),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Forum grid — multi-item comparison layout (two-panel)
#let forum-grid(left-title, left-body, right-title, right-body) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(columns: (1fr, auto, 1fr),
      // Left panel
      block(fill: palette.ivory, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(
          spacing: 0.8em,
          text(weight: "semibold", fill: palette.primary-dark, size: 0.88em, left-title),
          {
            set text(fill: palette.text, size: 0.80em)
            left-body
          },
        )
      ],
      // Classical divider column
      block(fill: palette.warm-shadow, inset: (x: 0.3em, y: 0.8em), width: auto)[
        #set std.align(center + horizon)
        #box(width: 2pt, height: 3em, fill: palette.accent.transparentize(50%))
      ],
      // Right panel
      block(fill: palette.card-bg, inset: (x: 1em, y: 0.8em), width: 100%)[
        #stack(
          spacing: 0.8em,
          text(weight: "semibold", fill: palette.primary, size: 0.88em, right-title),
          {
            set text(fill: palette.text, size: 0.80em)
            right-body
          },
        )
      ],
    )
  ]
}

/// Portico box — code/technical content with classical column feel
#let portico-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: rgb("#F8F7F4"),
    stroke: (left: 4pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      stack(dir: ltr, spacing: 6pt,
        box(width: 3pt, height: 12pt, fill: accent, radius: 1pt),
        text(weight: "semibold", fill: _text-color(accent), size: 0.88em, title),
      ),
      {
        set text(fill: palette.text, size: 0.80em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Inscription note — annotation/insight with engraved feel
#let inscription-note(title, body) = {
  block(
    width: 100%,
    fill: palette.marble,
    stroke: (left: 3pt + palette.accent.transparentize(30%)),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: 0.8em,
      text(weight: "semibold", fill: palette.accent-text, size: 0.88em, title),
      {
        set text(fill: palette.text, size: 0.82em, style: "italic")
        body
      },
      lazy-v(1fr),
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let ivory-column-theme(
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
      primary: palette.accent-text,
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
