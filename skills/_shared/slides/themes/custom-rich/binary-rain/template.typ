// Binary Rain Theme — Digital cascading data streams on light backgrounds
// Matrix-like vertical character streams reinterpreted as a light, modern design
// Thin columns of fading digits, binary 0/1 patterns as texture, cascading waterfall patterns
// Terminal cursor blinks, digital rain drops, hexadecimal address decorations
// Perfect for tech presentations, data talks, developer conferences
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Light Digital Rain) ═══

#let palette = (
  bg: rgb("#F8FAF9"),
  card-bg: rgb("#FFFFFF"),
  text: rgb("#1A1D1B"),
  text-muted: rgb("#5C6360"),
  primary: rgb("#00C853"),
  primary-dark: rgb("#009624"),
  primary-ink: rgb("#006E2E"),
  secondary: rgb("#00695C"),
  highlight: rgb("#00E5FF"),
  border: rgb("#C8E6C9"),
  light-green: rgb("#E8F5E9"),
  code-bg: rgb("#F1F8F2"),
  dim-green: rgb("#A5D6A7"),
)


// ═══ SVG Definitions ═══

// Full-page vertical data stream columns — cascading 0/1 characters at varying opacities
#let _data-stream-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.08" x="40" y="20">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.12" x="40" y="40">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.16" x="40" y="60">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.20" x="40" y="80">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.14" x="40" y="100">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.10" x="40" y="120">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.06" x="40" y="140">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.07" x="120" y="50">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.11" x="120" y="70">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.15" x="120" y="90">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.19" x="120" y="110">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.13" x="120" y="130">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.09" x="120" y="150">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.06" x="200" y="30">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.10" x="200" y="50">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.14" x="200" y="70">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.18" x="200" y="90">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.12" x="200" y="110">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.08" x="200" y="130">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.05" x="300" y="60">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.09" x="300" y="80">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.13" x="300" y="100">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.17" x="300" y="120">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.11" x="300" y="140">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.07" x="300" y="160">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.06" x="420" y="40">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.10" x="420" y="60">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.14" x="420" y="80">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.18" x="420" y="100">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.12" x="420" y="120">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.08" x="420" y="140">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.07" x="540" y="20">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.11" x="540" y="40">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.15" x="540" y="60">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.19" x="540" y="80">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.13" x="540" y="100">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.09" x="540" y="120">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.05" x="640" y="50">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.09" x="640" y="70">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.13" x="640" y="90">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.17" x="640" y="110">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.11" x="640" y="130">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.07" x="640" y="150">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.06" x="740" y="30">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.10" x="740" y="50">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.14" x="740" y="70">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.18" x="740" y="90">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.12" x="740" y="110">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.08" x="740" y="130">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.06" x="80" y="300">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.10" x="80" y="320">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.14" x="80" y="340">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.18" x="80" y="360">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.12" x="80" y="380">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.08" x="80" y="400">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.07" x="500" y="320">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.11" x="500" y="340">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.15" x="500" y="360">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.19" x="500" y="380">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.13" x="500" y="400">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.09" x="500" y="420">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.05" x="780" y="340">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.09" x="780" y="360">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.13" x="780" y="380">0</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.17" x="780" y="400">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.11" x="780" y="420">1</text>
  <text font-family="monospace" font-size="11" fill="#00C853" opacity="0.07" x="780" y="440">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.06" x="260" y="350">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.10" x="260" y="370">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.14" x="260" y="390">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.18" x="260" y="410">0</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.12" x="260" y="430">1</text>
  <text font-family="monospace" font-size="11" fill="#00695C" opacity="0.08" x="260" y="450">0</text>
</svg>```.text

// Digital rain frame — border decoration with cascading digits for title/ending bookend
#let _rain-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="24" y="16" width="792" height="442" rx="2" ry="2" fill="none" stroke="#00C853" stroke-width="1.5" opacity="0.4"/>
  <rect x="30" y="22" width="780" height="430" rx="1" ry="1" fill="none" stroke="#00695C" stroke-width="0.6" opacity="0.25"/>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.35" x="28" y="60">01</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.45" x="28" y="80">10</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.55" x="28" y="100">11</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.50" x="28" y="120">00</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.40" x="28" y="140">01</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.30" x="28" y="160">10</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.20" x="28" y="180">11</text>
  <text font-family="monospace" font-size="9" fill="#00C853" opacity="0.15" x="28" y="200">00</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.35" x="808" y="280">10</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.45" x="808" y="300">01</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.55" x="808" y="320">11</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.50" x="808" y="340">00</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.40" x="808" y="360">10</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.30" x="808" y="380">01</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.20" x="808" y="400">11</text>
  <text font-family="monospace" font-size="9" fill="#00695C" opacity="0.15" x="808" y="420">00</text>
  <text font-family="monospace" font-size="8" fill="#00C853" opacity="0.30" x="100" y="14">0x4A2F</text>
  <text font-family="monospace" font-size="8" fill="#00C853" opacity="0.25" x="300" y="14">0xB8C1</text>
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.20" x="500" y="14">0x7E3D</text>
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.25" x="700" y="14">0xF190</text>
  <text font-family="monospace" font-size="8" fill="#00C853" opacity="0.25" x="100" y="468">0xD4A7</text>
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.20" x="300" y="468">0x52BE</text>
  <text font-family="monospace" font-size="8" fill="#00C853" opacity="0.25" x="500" y="468">0x9F03</text>
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.20" x="700" y="468">0x1C8E</text>
  <rect x="24" y="16" width="4" height="4" fill="#00C853" opacity="0.7"/>
  <rect x="812" y="16" width="4" height="4" fill="#00C853" opacity="0.7"/>
  <rect x="24" y="454" width="4" height="4" fill="#00C853" opacity="0.7"/>
  <rect x="812" y="454" width="4" height="4" fill="#00C853" opacity="0.7"/>
</svg>```.text

// Cascade divider — horizontal stream separator with binary pattern
#let _cascade-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <line x1="0" y1="6" x2="300" y2="6" stroke="#00C853" stroke-width="1" opacity="0.3"/>
  <rect x="0" y="4" width="4" height="4" fill="#00C853" opacity="0.7"/>
  <text font-family="monospace" font-size="7" fill="#00C853" opacity="0.5" x="12" y="9">01</text>
  <text font-family="monospace" font-size="7" fill="#00695C" opacity="0.4" x="32" y="9">10</text>
  <text font-family="monospace" font-size="7" fill="#00C853" opacity="0.5" x="52" y="9">11</text>
  <text font-family="monospace" font-size="7" fill="#00695C" opacity="0.4" x="72" y="9">00</text>
  <text font-family="monospace" font-size="7" fill="#00C853" opacity="0.5" x="92" y="9">01</text>
  <rect x="110" y="5" width="80" height="2" fill="#00C853" opacity="0.2"/>
  <text font-family="monospace" font-size="7" fill="#00695C" opacity="0.4" x="200" y="9">10</text>
  <text font-family="monospace" font-size="7" fill="#00C853" opacity="0.5" x="220" y="9">01</text>
  <text font-family="monospace" font-size="7" fill="#00695C" opacity="0.4" x="240" y="9">11</text>
  <text font-family="monospace" font-size="7" fill="#00C853" opacity="0.5" x="260" y="9">00</text>
  <text font-family="monospace" font-size="7" fill="#00695C" opacity="0.4" x="280" y="9">10</text>
  <rect x="296" y="4" width="4" height="4" fill="#00C853" opacity="0.7"/>
</svg>```.text

// Terminal cursor blink marker
#let _cursor-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="10" height="16" viewBox="0 0 10 16">
  <rect x="1" y="1" width="8" height="14" fill="currentColor" opacity="0.7" rx="1"/>
</svg>```.text

// Hex address line decoration
#let _hex-line-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="10" viewBox="0 0 200 10">
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.4" x="0" y="8">0x00</text>
  <line x1="30" y1="5" x2="70" y2="5" stroke="#00C853" stroke-width="0.8" opacity="0.3"/>
  <text font-family="monospace" font-size="8" fill="#00C853" opacity="0.35" x="75" y="8">0xFF</text>
  <line x1="105" y1="5" x2="145" y2="5" stroke="#00695C" stroke-width="0.8" opacity="0.25"/>
  <text font-family="monospace" font-size="8" fill="#00695C" opacity="0.3" x="150" y="8">0xA7</text>
  <rect x="185" y="3" width="4" height="4" fill="#00C853" opacity="0.5"/>
  <rect x="192" y="3" width="4" height="4" fill="#00695C" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render full-page data stream background
#let data-stream-bg() = {
  image(bytes(_data-stream-svg), width: 100%, height: 100%)
}

/// Render rain frame (bookend for title/ending)
#let rain-frame() = {
  image(bytes(_rain-frame-svg), width: 100%, height: 100%)
}

/// Render cascade divider
#let cascade-divider(width: 100%) = {
  box(width: width, image(bytes(_cascade-divider-svg), width: width, height: 10pt))
}

/// Render terminal cursor
#let cursor-blink(color: palette.primary) = {
  let svg = _cursor-svg.replace("currentColor", color.to-hex())
  box(width: 7pt, height: 12pt, image(bytes(svg), width: 7pt, height: 12pt))
}

/// Render hex address decoration
#let hex-line(width: 140pt) = {
  box(width: width, image(bytes(_hex-line-svg), width: width, height: 8pt))
}


// ═══ Background Atmosphere ═══

/// Derive contrast-safe semantic ink while preserving an accent's hue.
#let _accent-ink(color) = color.darken(45%)

/// Persistent background atmosphere for content slides — data streams + corner markers
#let _content-atmosphere() = {
  // Faint data stream columns across the slide
  place(top + left, box(width: 100%, height: 100%, data-stream-bg()))
  // Corner cursor markers
  place(top + right, dx: -1em, dy: 0.5em,
    box(width: 5pt, height: 9pt, fill: palette.primary.transparentize(70%)))
  place(bottom + left, dx: 1em, dy: -0.5em,
    box(width: 5pt, height: 9pt, fill: palette.secondary.transparentize(75%)))
  place(bottom + right, dx: -1.5em, dy: -0.8em,
    box(width: 4pt, height: 7pt, fill: palette.primary.transparentize(80%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — light bg, data stream atmosphere, green accents
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
        set text(fill: palette.text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Cascade divider under title
      cascade-divider(width: 160pt),
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
        // Cursor-style separator
        box(width: 5pt, height: 9pt, fill: palette.primary.transparentize(40%))
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

/// Title slide — rain frame bookend, data streams, centered content
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Light background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Data stream background
    place(top + left, box(width: 100%, height: 100%, data-stream-bg()))
    // Rain frame (bookend)
    place(top + left, box(width: 100%, height: 100%, rain-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      #stack(spacing: 0.8em,
        // Title + cascade divider
        stack(spacing: 0.8em,
          text(size: 2.4em, weight: "bold", fill: palette.text, info.title),
          std.align(center, cascade-divider(width: 220pt)),
        ),
        if info.subtitle != none {
          text(size: 1.05em, fill: palette.secondary, weight: "medium", info.subtitle)
        },
        stack(spacing: 0.8em,
          if info.author != none {
            text(size: 1em, fill: palette.text, weight: "regular", info.author)
          },
          if info.institution != none {
            text(size: 0.8em, fill: palette.text-muted, info.institution)
          },
          if info.date != none {
            text(size: 0.8em, fill: palette.primary-ink)[#utils.display-info-date(self)]
          },
        ),
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

/// New section slide — left data cascade bar, binary pattern, section title
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
    // Data streams
    place(top + left, box(width: 100%, height: 100%, data-stream-bg()))
    // Left accent bar — matrix green
    place(top + left, block(width: 4pt, height: 100%, fill: palette.primary))
    // Decorative cursor markers
    place(top + right, dx: -2.5em, dy: 1.5em,
      box(width: 6pt, height: 10pt, fill: palette.primary.transparentize(40%)))
    place(top + right, dx: -4em, dy: 3em,
      box(width: 4pt, height: 8pt, fill: palette.secondary.transparentize(50%)))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      #stack(spacing: 0.8em,
        // Section number in contrast-safe green
        text(size: 3.5em, fill: palette.primary-ink, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ],
        // Hex line decoration
        hex-line(width: 120pt),
        // Section title
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

/// Focus slide — dark background with bright data streams
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
    // Dark background
    place(top + left, block(width: 100%, height: 100%, fill: rgb("#0D1F14")))
    // Data streams more visible on dark bg
    place(top + left, box(width: 100%, height: 100%, data-stream-bg()))
    // Corner cursors
    place(top + left, dx: 1.5em, dy: 1em,
      box(width: 6pt, height: 10pt, fill: palette.primary.transparentize(30%)))
    place(top + right, dx: -1.5em, dy: 1em,
      box(width: 6pt, height: 10pt, fill: palette.highlight.transparentize(40%)))
    place(bottom + left, dx: 1.5em, dy: -1em,
      box(width: 5pt, height: 8pt, fill: palette.highlight.transparentize(40%)))
    place(bottom + right, dx: -1.5em, dy: -1em,
      box(width: 5pt, height: 8pt, fill: palette.primary.transparentize(30%)))
    // Center content
    place(center + horizon,
      block(width: 72%, height: auto,
        align(center)[
          #stack(spacing: 0.8em,
            {
              set text(fill: palette.primary, size: 1.4em, weight: "bold")
              body
            },
            cascade-divider(width: 180pt),
          )
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — light bg with rain frame bookend, farewell text
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
    // Data streams
    place(top + left, box(width: 100%, height: 100%, data-stream-bg()))
    // Rain frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, rain-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(spacing: 0.8em,
        // Cascade divider above
        cascade-divider(width: 200pt),
        stack(spacing: 0.8em,
          // Main text
          text(size: 2.4em, weight: "bold", fill: palette.text, body),
          // Accent bar below
          block(width: 5em, height: 3pt, fill: palette.primary, radius: 1.5pt),
        ),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Stream card — content card with data cascade side decoration
#let stream-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      // Cursor indicator + title
      stack(dir: ltr, spacing: 6pt,
        box(width: 6pt, height: 10pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: palette.text, size: 0.92em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Cascade box — highlighted content with falling digits border effect
#let cascade-box(title, body) = {
  block(
    width: 100%,
    fill: palette.light-green,
    stroke: (left: 4pt + palette.primary),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(spacing: 0.8em,
      stack(dir: ltr, spacing: 8pt,
        hex-line(width: 60pt),
        text(weight: "bold", fill: palette.primary-ink, size: 0.95em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.82em)
        #body
      ],
    )
  ]
}

/// Bit tag — binary status capsule label
#let bit-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, fill: color, radius: 1pt),
      text(fill: _accent-ink(color), size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// Packet card — data/metric display panel
#let packet-card(label, value, description, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.7em),
    radius: (bottom: 4pt),
  )[
    #set std.align(center)
    // Metric contract: decoration → value → label → description in one stack.
    #stack(spacing: 0.8em,
      hex-line(width: 50pt),
      text(fill: _accent-ink(color), size: 1.6em, weight: "bold", value),
      text(fill: palette.text, size: 0.85em, weight: "semibold", label),
      text(fill: palette.text-muted, size: 0.72em, description),
      lazy-v(1fr),
    )
  ]
}

/// Byte stat — KPI with digital readout style
#let byte-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    // KPI contract: cursor → value → label in one centered stack.
    #stack(spacing: 0.8em,
      box(width: 5pt, height: 8pt, fill: color.transparentize(35%), radius: 1pt),
      text(fill: _accent-ink(color), size: 1.8em, weight: "bold", value),
      text(fill: palette.text-muted, size: 0.75em, label),
      lazy-v(1fr),
    )
  ]
}

/// Buffer card — queue/pipeline card with data flow indicator
#let buffer-card(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: palette.code-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      // Title with flow indicator
      stack(dir: ltr, spacing: 6pt,
        text(fill: _accent-ink(accent), size: 0.8em, weight: "bold")[>>],
        text(weight: "bold", fill: palette.text, size: 0.90em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.80em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Matrix grid — multi-item code-style layout (grid of items)
#let matrix-grid(items, columns: 2) = {
  block(width: 100%, stroke: 1pt + palette.border, radius: 4pt, clip: true)[
    #grid(columns: range(columns).map(_ => 1fr),
      ..items.map(item => {
        block(fill: palette.card-bg, inset: (x: 0.8em, y: 0.6em), width: 100%)[
          #set text(fill: palette.text, size: 0.80em)
          #item
        ]
      })
    )
  ]
}

/// Terminal box — code/command content with terminal header
#let terminal-box(title, body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: (left: 3pt + accent, rest: 1pt + rgb("#E2E8F0")),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: 0.8em,
      // Terminal header with dots
      stack(dir: ltr, spacing: 6pt,
        box(width: 6pt, height: 6pt, fill: rgb("#EF4444"), radius: 3pt),
        box(width: 6pt, height: 6pt, fill: rgb("#F59E0B"), radius: 3pt),
        box(width: 6pt, height: 6pt, fill: palette.primary, radius: 3pt),
        text(weight: "bold", fill: _accent-ink(accent), size: 0.85em, title),
      ),
      [
        #set text(fill: palette.text, size: 0.80em)
        #body
      ],
    )
  ]
}

/// Debug note — annotation/log entry style callout
#let debug-note(title, body, accent: palette.highlight) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1.2em, y: 0.9em),
    radius: 6pt,
  )[
    #stack(spacing: 0.8em,
      text(weight: "bold", fill: palette.secondary, size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      {
        set text(fill: palette.text, size: 0.82em)
        body
      },
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let binary-rain-theme(
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
      primary: palette.primary-ink,
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
