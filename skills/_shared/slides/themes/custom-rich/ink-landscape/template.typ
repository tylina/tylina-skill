// Ink Landscape Theme — Chinese Ink Wash Painting (水墨山水画)
// You are unrolling a Song dynasty landscape scroll painting.
// Rice paper texture, flowing ink gradients, distant mountains fading into mist,
// red seal stamps as punctuation, brush stroke calligraphy.
// Features: persistent mountain atmosphere on EVERY content slide, brush-stroke SVG
// headers, scroll-shaped cards, seal stamps, brush dividers.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  primary: rgb("#2C2C2C"),         // heavy ink 浓墨
  dark: rgb("#1A1A1A"),            // deepest ink
  accent: rgb("#C23B22"),          // vermillion seal red 朱砂
  bg: rgb("#F8F4EF"),             // rice paper 宣纸
  card: rgb("#F0EBE3"),           // aged paper
  text-dark: rgb("#1A1A1A"),
  text-body: rgb("#3A3A3A"),
  text-light: rgb("#8A8A7A"),     // dilute ink 淡墨
  border: rgb("#D4CEC4"),
  seal-red: rgb("#C23B22"),
  light-ink: rgb("#B8B0A4"),
  bamboo-green: rgb("#527052"),
  mist: rgb("#E8E2D8"),
)


// ═══ SVG Definitions (Complex — 10+ elements each) ═══

// Mountain range — 3 layered peaks with clear pointed shapes (远山近水)
// Recognizable triangular/pointed mountain silhouettes with smooth slopes
// Used as PERSISTENT BACKGROUND on every content slide (bottom 30%)
#let _mountain-range-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="200" viewBox="0 0 840 200">
  <path d="M0,190 L60,170 L100,150 L130,165 L170,140 L200,155 L240,130 L270,145 L310,125 L340,140 L380,155 L420,145 L460,160 L500,135 L530,150 L570,130 L600,145 L640,155 L680,140 L720,155 L760,165 L800,150 L840,170 L840,200 L0,200 Z" fill="#2C2C2C" opacity="0.05"/>
  <ellipse cx="300" cy="175" rx="120" ry="5" fill="#F8F4EF" opacity="0.5"/>
  <ellipse cx="600" cy="178" rx="90" ry="4" fill="#F8F4EF" opacity="0.4"/>
  <path d="M0,195 L40,185 L80,170 L110,160 L140,145 L160,155 L190,135 L210,125 L240,140 L270,155 L300,165 L340,160 L370,170 L400,155 L430,165 L470,150 L500,140 L520,150 L550,135 L570,125 L590,135 L620,150 L650,160 L680,155 L710,145 L730,155 L760,165 L790,175 L820,180 L840,185 L840,200 L0,200 Z" fill="#2C2C2C" opacity="0.08"/>
  <ellipse cx="180" cy="165" rx="60" ry="3" fill="#F8F4EF" opacity="0.45"/>
  <ellipse cx="550" cy="162" rx="50" ry="3" fill="#F8F4EF" opacity="0.4"/>
  <ellipse cx="720" cy="168" rx="40" ry="2.5" fill="#F8F4EF" opacity="0.35"/>
  <path d="M0,200 L30,192 L60,185 L90,175 L120,160 L145,148 L160,140 L175,148 L200,160 L225,168 L250,158 L270,150 L285,142 L300,135 L315,142 L335,150 L360,162 L390,170 L420,175 L450,168 L470,160 L490,152 L505,145 L520,138 L535,145 L555,155 L580,162 L610,168 L640,160 L660,152 L680,145 L695,138 L710,132 L720,138 L740,148 L760,158 L780,165 L800,175 L820,185 L840,192 L840,200 Z" fill="#2C2C2C" opacity="0.12"/>
  <path d="M143,148 L145,140 L147,148" fill="#2C2C2C" opacity="0.10" stroke="none"/>
  <path d="M144,144 L141,147 M146,144 L149,147" fill="none" stroke="#2C2C2C" stroke-width="0.8" opacity="0.08"/>
  <path d="M298,135 L300,127 L302,135" fill="#2C2C2C" opacity="0.10" stroke="none"/>
  <path d="M299,131 L296,134 M301,131 L304,134" fill="none" stroke="#2C2C2C" stroke-width="0.8" opacity="0.08"/>
  <path d="M518,138 L520,130 L522,138" fill="#2C2C2C" opacity="0.10" stroke="none"/>
  <path d="M519,134 L516,137 M521,134 L524,137" fill="none" stroke="#2C2C2C" stroke-width="0.8" opacity="0.08"/>
  <path d="M708,132 L710,124 L712,132" fill="#2C2C2C" opacity="0.10" stroke="none"/>
  <path d="M709,128 L706,131 M711,128 L714,131" fill="none" stroke="#2C2C2C" stroke-width="0.8" opacity="0.08"/>
</svg>```.text

// Brush stroke underline — variable-width calligraphic horizontal stroke (横)
// Clear thick-to-thin variation simulating brush pressure: starts with pressing
// down (thick), lifts through middle (thin), presses again at end (thick)
#let _brush-stroke-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="12" viewBox="0 0 200 12">
  <path d="M3,6 C5,5 8,4 12,3.5 C18,3 25,3.5 35,4 C50,4.5 70,5 90,5.5 C110,5.8 130,5.8 150,5.5 C165,5 175,4.5 182,4.2 C188,4 192,4.5 195,5.5 C196,6 197,6.5 197,7" fill="none" stroke="currentColor" stroke-width="3.5" stroke-linecap="round" opacity="0.8"/>
  <ellipse cx="4" cy="5.5" rx="2.5" ry="2" fill="currentColor" opacity="0.7"/>
  <path d="M195,5.5 C196,5 197,4.5 198,4" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" opacity="0.5"/>
  <path d="M40,4.5 L55,5" fill="none" stroke="currentColor" stroke-width="0.5" stroke-linecap="round" opacity="0.25"/>
  <path d="M100,5.5 L120,5.8" fill="none" stroke="currentColor" stroke-width="0.4" stroke-linecap="round" opacity="0.2"/>
</svg>```.text

// Seal stamp (印章) — clearly recognizable square seal with thick border
// Traditional Chinese seal: thick outer border, inner character-like strokes
// arranged in a grid pattern simulating seal script (篆书)
#let _seal-stamp-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
  <rect x="2" y="2" width="36" height="36" fill="none" stroke="currentColor" stroke-width="3" rx="1"/>
  <rect x="5" y="5" width="30" height="30" fill="none" stroke="currentColor" stroke-width="1.2" rx="0.5"/>
  <path d="M10,10 L10,30" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
  <path d="M10,14 L17,14" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M10,20 L17,20" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M10,26 L17,26" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M17,10 L17,30" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <path d="M23,10 L23,30" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
  <path d="M23,14 L30,14" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M30,10 L30,30" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <path d="M23,20 L30,20" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M23,26 L30,26" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"/>
  <path d="M26,10 L26,20" stroke="currentColor" stroke-width="1.2" stroke-linecap="round"/>
  <circle cx="3" cy="15" r="0.5" fill="currentColor" opacity="0.2"/>
  <circle cx="37" cy="25" r="0.6" fill="currentColor" opacity="0.15"/>
  <circle cx="20" cy="3" r="0.4" fill="currentColor" opacity="0.2"/>
</svg>```.text


// Bamboo branch — paired stems, nodes, and angled leaves (竹)
#let _bamboo-branch-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="160" height="240" viewBox="0 0 160 240">
  <path d="M118,238 C111,199 108,161 111,124 C114,88 124,50 137,8" fill="none" stroke="currentColor" stroke-width="5" stroke-linecap="round" opacity="0.62"/>
  <path d="M72,240 C77,205 81,174 79,144 C77,111 70,78 56,44" fill="none" stroke="currentColor" stroke-width="4" stroke-linecap="round" opacity="0.44"/>
  <path d="M111,190 C92,171 76,158 57,148" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" opacity="0.48"/>
  <path d="M115,142 C132,126 142,109 149,91" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" opacity="0.46"/>
  <path d="M79,165 C60,151 42,142 22,137" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" opacity="0.4"/>
  <ellipse cx="112" cy="190" rx="6" ry="2.5" fill="currentColor" opacity="0.5"/>
  <ellipse cx="114" cy="142" rx="5.5" ry="2.4" fill="currentColor" opacity="0.48"/>
  <ellipse cx="121" cy="92" rx="5" ry="2.2" fill="currentColor" opacity="0.44"/>
  <ellipse cx="78" cy="165" rx="5" ry="2.2" fill="currentColor" opacity="0.42"/>
  <ellipse cx="76" cy="116" rx="4.8" ry="2" fill="currentColor" opacity="0.38"/>
  <path d="M87,165 C75,151 67,141 61,126 C76,132 87,142 87,165 Z" fill="currentColor" opacity="0.54"/>
  <path d="M67,155 C52,150 39,143 28,132 C46,132 61,138 67,155 Z" fill="currentColor" opacity="0.43"/>
  <path d="M47,146 C34,146 20,142 8,134 C25,130 41,134 47,146 Z" fill="currentColor" opacity="0.34"/>
  <path d="M121,131 C126,113 135,100 149,89 C148,108 138,122 121,131 Z" fill="currentColor" opacity="0.5"/>
  <path d="M127,113 C119,99 116,85 117,70 C129,84 133,98 127,113 Z" fill="currentColor" opacity="0.39"/>
  <path d="M128,78 C134,61 143,49 156,39 C154,57 145,70 128,78 Z" fill="currentColor" opacity="0.46"/>
  <path d="M75,108 C61,98 51,86 45,72 C60,79 70,91 75,108 Z" fill="currentColor" opacity="0.38"/>
  <path d="M65,88 C49,85 36,78 25,68 C43,68 58,75 65,88 Z" fill="currentColor" opacity="0.3"/>
</svg>```.text

// Ink splash — layered central wash with satellite droplets (泼墨)
#let _ink-splash-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="240" height="220" viewBox="0 0 240 220">
  <path d="M57,122 C47,91 64,59 94,45 C120,33 155,41 174,63 C192,84 195,116 180,142 C164,170 132,184 99,177 C73,171 57,151 57,122 Z" fill="currentColor" opacity="0.28"/>
  <path d="M78,130 C66,107 73,78 96,63 C118,49 147,54 163,73 C179,92 178,120 163,139 C147,159 118,166 96,153 C87,148 81,140 78,130 Z" fill="currentColor" opacity="0.22"/>
  <path d="M101,52 C117,36 137,24 160,18 C149,35 135,49 117,61 Z" fill="currentColor" opacity="0.2"/>
  <path d="M68,99 C47,91 29,77 17,59 C40,66 58,77 74,91 Z" fill="currentColor" opacity="0.18"/>
  <path d="M173,83 C191,75 210,72 229,77 C212,88 194,93 176,92 Z" fill="currentColor" opacity="0.19"/>
  <path d="M159,151 C178,161 192,175 201,194 C179,184 164,173 151,158 Z" fill="currentColor" opacity="0.17"/>
  <path d="M91,170 C81,188 67,201 48,210 C56,190 67,176 83,164 Z" fill="currentColor" opacity="0.16"/>
  <circle cx="37" cy="119" r="9" fill="currentColor" opacity="0.24"/>
  <circle cx="27" cy="142" r="4.5" fill="currentColor" opacity="0.18"/>
  <circle cx="201" cy="116" r="7" fill="currentColor" opacity="0.22"/>
  <circle cx="216" cy="137" r="3.5" fill="currentColor" opacity="0.16"/>
  <circle cx="183" cy="42" r="5" fill="currentColor" opacity="0.18"/>
  <circle cx="69" cy="35" r="4" fill="currentColor" opacity="0.15"/>
  <ellipse cx="119" cy="110" rx="92" ry="78" fill="none" stroke="currentColor" stroke-width="1.2" opacity="0.1"/>
  <ellipse cx="119" cy="110" rx="105" ry="91" fill="none" stroke="currentColor" stroke-width="0.8" opacity="0.07"/>
</svg>```.text

// Full-width brush stroke divider — calligraphic horizontal rule
#let _brush-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="8" viewBox="0 0 400 8">
  <path d="M2,4 C6,3.5 12,3 20,2.8 C35,2.5 55,2.5 80,2.8 C110,3 140,3.2 170,3.5 C200,3.7 230,3.7 260,3.5 C290,3.2 320,3 350,3 C370,3.2 385,3.8 392,4.5 C396,5 398,5.5 398,5" fill="none" stroke="currentColor" stroke-width="2.8" stroke-linecap="round" opacity="0.7"/>
  <ellipse cx="3" cy="4" rx="2" ry="1.5" fill="currentColor" opacity="0.6"/>
  <path d="M80,3 L130,3.2" fill="none" stroke="currentColor" stroke-width="0.6" stroke-linecap="round" opacity="0.2"/>
  <path d="M250,3.5 L300,3.3" fill="none" stroke="currentColor" stroke-width="0.5" stroke-linecap="round" opacity="0.15"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render mountain range background (persistent atmosphere on every content slide)
#let _mountain-bg() = {
  place(bottom + left,
    box(width: 100%, height: 35%,
      image(bytes(_mountain-range-svg), width: 100%, height: 100%, fit: "cover")))
}

/// Render brush stroke underline with given color
#let brush-underline(color: palette.primary, width: 120pt) = {
  let svg = _brush-stroke-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 8pt))
}

/// Render seal stamp with given color and size
#let seal-stamp(color: palette.accent, size: 28pt) = {
  let svg = _seal-stamp-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}

/// Render a bamboo branch ornament
#let bamboo-branch(color: palette.bamboo-green, height: 120pt) = {
  let svg = _bamboo-branch-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), height: height))
}

/// Render an organic ink splash
#let ink-splash(color: palette.primary, size: 180pt) = {
  let svg = _ink-splash-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: size, height: size))
}


/// Render brush divider (full-width calligraphic rule)
#let brush-divider(color: palette.primary, width: 60%) = {
  let svg = _brush-divider-svg.replace("currentColor", color.to-hex())
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 6pt)))
}


// ═══ Background Atmosphere (MANDATORY on every content slide) ═══

/// Persistent "landscape scroll" feeling: faint mountains + scattered ink dots
#let _slide-atmosphere() = {
  // Mountain silhouette at bottom of every slide
  _mountain-bg()
  // Scattered ink dots like distant birds (飞鸟) in upper area
  place(top + right, dx: -3em, dy: 0.5em,
    circle(radius: 1.2pt, fill: palette.primary.transparentize(90%)))
  place(top + right, dx: -4.5em, dy: 1em,
    circle(radius: 0.8pt, fill: palette.primary.transparentize(92%)))
  place(top + right, dx: -2em, dy: 1.8em,
    circle(radius: 1pt, fill: palette.primary.transparentize(91%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — rice paper bg, brush-stroke SVG header, mountain atmosphere
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.6em, bottom: 0.1em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Brush stroke underline (SVG calligraphic stroke, NOT a plain line)
      brush-underline(color: palette.primary, width: 140pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.text-body.transparentize(10%), size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Seal stamp as footer center marker
        seal-stamp(color: palette.accent.transparentize(60%), size: 14pt)
      },
      {
        set std.align(right)
        context text(fill: palette.text-body.transparentize(10%), size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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
      background: _slide-atmosphere(),
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — full scroll opening with mountain panorama and seal stamp
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    place(bottom + left,
      box(width: 100%, height: 42%,
        image(bytes(_mountain-range-svg.replace("opacity=\"0.05\"", "opacity=\"0.10\"").replace("opacity=\"0.08\"", "opacity=\"0.15\"").replace("opacity=\"0.12\"", "opacity=\"0.20\"")), width: 100%, height: 100%, fit: "cover")))
    place(center + horizon, dy: -0.4em,
      ink-splash(color: palette.primary.transparentize(65%), size: 230pt))
    place(top + left, dx: 2em, dy: 1.5em,
      seal-stamp(color: palette.accent.transparentize(20%), size: 36pt))
    place(top + right, dx: -2.4em, dy: 0.6em,
      bamboo-branch(color: palette.bamboo-green.transparentize(45%), height: 155pt))
    set std.align(center + horizon)
    pad(x: 5em,
      stack(
        spacing: 0.8em,
        text(size: 2.6em, weight: "bold", fill: palette.text-dark, info.title),
        brush-underline(color: palette.primary, width: 200pt),
        if info.subtitle != none {
          text(size: 1em, fill: palette.text-body, style: "italic", info.subtitle)
        },
        if info.author != none {
          text(size: 0.95em, fill: palette.text-dark, weight: "regular", info.author)
        },
        if info.institution != none {
          text(size: 0.8em, fill: palette.text-body.transparentize(20%), info.institution)
        },
        if info.date != none {
          text(size: 0.75em, fill: palette.text-body.transparentize(20%), utils.display-info-date(self))
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

/// New section slide — large section number, brush stroke divider, mountain atmosphere
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    _mountain-bg()
    place(center + horizon, dx: 5em, dy: -0.2em,
      ink-splash(color: palette.primary.transparentize(58%), size: 300pt))
    place(top + right, dx: -2.5em, dy: 1.5em,
      seal-stamp(color: palette.accent.transparentize(30%), size: 32pt))
    set std.align(center + horizon)
    block(width: 70%, inset: (left: 5em, right: 4em))[
      #stack(
        spacing: 0.8em,
        text(size: 4em, fill: palette.text-light, weight: "bold",
          utils.display-current-heading-number(depth: 1, numbering: "1")),
        {
          set text(fill: palette.text-dark, size: 2.2em, weight: "bold")
          utils.display-current-heading(level: 1, numbered: false)
        },
        brush-underline(color: palette.primary, width: 180pt),
      )
    ]
    place(bottom + center, dy: -3em, brush-divider(color: palette.text-light, width: 35%))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — centered verse with mountain atmosphere and seal
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    _mountain-bg()
    place(center + horizon,
      ink-splash(color: palette.primary.transparentize(38%), size: 330pt))
    place(bottom + right, dx: -2em, dy: -0.6em,
      bamboo-branch(color: palette.bamboo-green.transparentize(48%), height: 140pt))
    place(bottom + left, dx: 2.5em, dy: -2em,
      seal-stamp(color: palette.accent.transparentize(25%), size: 30pt))
    set std.align(center + horizon)
    block(width: 70%, inset: (x: 2em, y: 1.5em))[
      #set std.align(center)
      #set text(fill: palette.text-dark, size: 1.3em, weight: "semibold")
      #stack(spacing: 0.8em,
        body,
        brush-underline(color: palette.accent, width: 120pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — bookends with title: mountain + seal (shared elements)
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    place(bottom + left,
      box(width: 100%, height: 42%,
        image(bytes(_mountain-range-svg.replace("opacity=\"0.05\"", "opacity=\"0.10\"").replace("opacity=\"0.08\"", "opacity=\"0.15\"").replace("opacity=\"0.12\"", "opacity=\"0.20\"")), width: 100%, height: 100%, fit: "cover")))
    place(center + horizon, dy: -0.25em,
      ink-splash(color: palette.primary.transparentize(68%), size: 210pt))
    place(top + left, dx: 2em, dy: 1.5em,
      seal-stamp(color: palette.accent.transparentize(20%), size: 36pt))
    place(top + right, dx: -2.4em, dy: 0.6em,
      bamboo-branch(color: palette.bamboo-green.transparentize(45%), height: 155pt))
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      #stack(
        spacing: 0.8em,
        text(size: 2.4em, weight: "bold", fill: palette.text-dark, body),
        brush-underline(color: palette.primary, width: 160pt),
        brush-divider(color: palette.text-light, width: 100pt),
      )
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Scroll card — top/bottom edges styled like rolled paper ends (NOT a generic rectangle)
#let scroll-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: none,
    inset: 0pt,
    radius: 2pt,
  )[
    // Top scroll edge (darker aged paper roll)
    #block(width: 100%, height: 4pt, fill: palette.border, radius: (top: 2pt))
    // Content area with opaque background
    #block(width: 100%, inset: (x: 1em), fill: palette.card)[
      #stack(
        spacing: 0.8em,
        text(weight: "semibold", fill: accent, size: 0.9em, title),
        box(width: 50pt, height: 2pt, fill: accent.transparentize(50%)),
        {
          set text(fill: palette.text-body, size: 0.82em)
          body
        },
      )
    ]
    #lazy-v(1fr)
    // Bottom scroll edge
    #block(width: 100%, height: 4pt, fill: palette.border, radius: (bottom: 2pt))
  ]
}

/// Seal stat — large number with red seal stamp SVG behind at 20% opacity
#let seal-stat(label, value, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.card,
    inset: (x: 1em, y: 0.7em),
    radius: 3pt,
    stroke: 0.5pt + palette.border,
  )[
    // Seal stamp behind the number
    #place(top + right, dx: -0.3em, dy: 0.2em,
      seal-stamp(color: color.transparentize(80%), size: 36pt))
    #set text(fill: palette.text-body.transparentize(20%), size: 0.75em)
    #stack(
      spacing: .8em,
      label,
      [
        // Large value
        #set text(fill: color, size: 1.8em, weight: "bold")
        #value
      ]
    )
  ]
}

/// Verse quote — centered text with vertical bar accents
#let verse-quote(quote, author: none) = {
  block(width: 100%, fill: palette.bg.transparentize(5%), inset: (x: 1.5em, y: 1em))[
    #place(center + horizon,
      ink-splash(color: palette.primary.transparentize(78%), size: 130pt))
    #set std.align(center)
    #stack(dir: ltr, spacing: 0.8em,
      block(width: 2pt, height: 2.5em, fill: palette.text-light.transparentize(50%)),
      block(width: auto)[
        #set text(fill: palette.text-dark, size: 0.92em, style: "italic")
        #stack(
          spacing: 0.8em,
          quote,
          if author != none {
            text(fill: palette.accent, size: 0.78em, weight: "semibold", style: "normal")[-- #author]
          },
        )
      ],
      block(width: 2pt, height: 2.5em, fill: palette.text-light.transparentize(50%)),
    )
  ]
}

/// Ink box — card with brush-stroke SVG as top border (NOT a straight line)
#let ink-box(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: (bottom: 0.5pt + palette.border, left: 0.5pt + palette.border, right: 0.5pt + palette.border),
    inset: 0pt,
    radius: 2pt,
  )[
    #stack(
      spacing: 0pt,
      brush-underline(color: accent, width: 100%),
      block(width: 100%, inset: (x: 1em, bottom: 0.8em), fill: palette.card)[
        #stack(spacing: 0.8em,
          text(weight: "semibold", fill: accent, size: 0.9em, title),
          {
            set text(fill: palette.text-body, size: 0.82em)
            body
          },
        )
      ],
    )
  ]
}

/// Stamp tag — red seal-shaped inline tag
#let stamp-tag(content, color: palette.accent) = {
  box(
    fill: color.transparentize(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 2pt,
  )[
    #set text(fill: color, size: 0.72em, weight: "semibold")
    #content
  ]
}

/// Brush divider component — SVG-based full-width separator (NOT a line())
#let ink-divider(color: palette.primary, width: 80%) = {
  brush-divider(color: color, width: width)
}

/// Pavilion highlight — featured area with brush underline accent + opaque bg
#let pavilion-highlight(title, body) = {
  block(
    width: 100%,
    fill: palette.card,
    stroke: 0.5pt + palette.border,
    inset: 0pt,
    radius: 3pt,
  )[
    #place(top + right, dx: -0.5em, dy: 0.3em,
      bamboo-branch(color: palette.bamboo-green.transparentize(78%), height: 58pt))
    #block(width: 100%, inset: (x: 1.2em, top: 0.8em, bottom: 1em))[
      #stack(
        spacing: 0.8em,
        text(weight: "semibold", fill: palette.text-dark, size: 0.95em, title),
        brush-underline(color: palette.bamboo-green, width: 80pt),
        {
          set text(fill: palette.text-body, size: 0.82em)
          body
        },
      )
    ]
  ]
}

/// Mist card — gradient card with opaque fill (readable against mountain bg)
#let mist-card(title, body) = {
  block(
    width: 100%,
    fill: gradient.linear(palette.mist, palette.card, angle: 180deg),
    stroke: 0.5pt + palette.border.transparentize(50%),
    inset: (x: 1.2em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: palette.text-dark.transparentize(20%), size: 0.88em, title),
      [
      #set text(fill: palette.text-body.transparentize(10%), size: 0.8em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// Landscape section — NO border, just title + brush SVG divider + content (typography only)
#let landscape-section(title, body) = {
  block(width: 100%)[
    #stack(
      spacing: 0.8em,
      text(fill: palette.text-dark, size: 0.95em, weight: "semibold", title),
      brush-divider(color: palette.text-light, width: 100%),
      {
        set text(fill: palette.text-body, size: 0.82em)
        body
      },
    )
  ]
}


// ═══ 3. Theme Entry Point ═══

#let ink-landscape-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text-dark)
  show raw: set text(font: ("Menlo", "Noto Sans SC"))
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
