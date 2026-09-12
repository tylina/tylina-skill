// Mosaic Tile Theme — Geometric tilework patterns inspired by Islamic zellige,
// Portuguese azulejo, and Moorish architecture
// Intricate interlocking geometric patterns, star polygons, tessellations
// Features: 8-point stars, octagonal grids, arabesque interlace, glazed tile colors
// Perfect for business presentations, strategy talks, corporate keynotes
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Light — Warm Cream + Deep Blues + Terracotta) ===

#let palette = (
  bg: rgb("#FDF8F0"),
  text: rgb("#1B2A4A"),
  primary: rgb("#1E5AAF"),
  secondary: rgb("#C75B2A"),
  highlight: rgb("#1A8A8A"),
  card-bg: rgb("#FFFFFF"),
  muted: rgb("#6B7B95"),
  border: rgb("#D4C5B0"),
  cream-light: rgb("#FFF9F0"),
  tile-blue: rgb("#2E6FC2"),
  tile-gold: rgb("#C6953A"),
  tile-teal: rgb("#207878"),
)


// === SVG Definitions ===

// Full-page zellige star pattern — interlocking 8-point stars at low opacity
#let _zellige-bg-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M60,30 L68,42 L80,42 L72,54 L80,66 L68,66 L60,78 L52,66 L40,66 L48,54 L40,42 L52,42 Z" fill="none" stroke="#1E5AAF" stroke-width="0.6" opacity="0.12"/>
  <path d="M180,30 L188,42 L200,42 L192,54 L200,66 L188,66 L180,78 L172,66 L160,66 L168,54 L160,42 L172,42 Z" fill="none" stroke="#1E5AAF" stroke-width="0.6" opacity="0.10"/>
  <path d="M300,30 L308,42 L320,42 L312,54 L320,66 L308,66 L300,78 L292,66 L280,66 L288,54 L280,42 L292,42 Z" fill="none" stroke="#1E5AAF" stroke-width="0.6" opacity="0.08"/>
  <path d="M420,30 L428,42 L440,42 L432,54 L440,66 L428,66 L420,78 L412,66 L400,66 L408,54 L400,42 L412,42 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.10"/>
  <path d="M540,30 L548,42 L560,42 L552,54 L560,66 L548,66 L540,78 L532,66 L520,66 L528,54 L520,42 L532,42 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.08"/>
  <path d="M660,30 L668,42 L680,42 L672,54 L680,66 L668,66 L660,78 L652,66 L640,66 L648,54 L640,42 L652,42 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.07"/>
  <path d="M780,30 L788,42 L800,42 L792,54 L800,66 L788,66 L780,78 L772,66 L760,66 L768,54 L760,42 L772,42 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.06"/>
  <path d="M120,100 L128,112 L140,112 L132,124 L140,136 L128,136 L120,148 L112,136 L100,136 L108,124 L100,112 L112,112 Z" fill="none" stroke="#C75B2A" stroke-width="0.6" opacity="0.10"/>
  <path d="M240,100 L248,112 L260,112 L252,124 L260,136 L248,136 L240,148 L232,136 L220,136 L228,124 L220,112 L232,112 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.08"/>
  <path d="M360,100 L368,112 L380,112 L372,124 L380,136 L368,136 L360,148 L352,136 L340,136 L348,124 L340,112 L352,112 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.10"/>
  <path d="M480,100 L488,112 L500,112 L492,124 L500,136 L488,136 L480,148 L472,136 L460,136 L468,124 L460,112 L472,112 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.07"/>
  <path d="M600,100 L608,112 L620,112 L612,124 L620,136 L608,136 L600,148 L592,136 L580,136 L588,124 L580,112 L592,112 Z" fill="none" stroke="#C75B2A" stroke-width="0.5" opacity="0.08"/>
  <path d="M720,100 L728,112 L740,112 L732,124 L740,136 L728,136 L720,148 L712,136 L700,136 L708,124 L700,112 L712,112 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.06"/>
  <path d="M60,200 L68,212 L80,212 L72,224 L80,236 L68,236 L60,248 L52,236 L40,236 L48,224 L40,212 L52,212 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.08"/>
  <path d="M180,200 L188,212 L200,212 L192,224 L200,236 L188,236 L180,248 L172,236 L160,236 L168,224 L160,212 L172,212 Z" fill="none" stroke="#1E5AAF" stroke-width="0.6" opacity="0.10"/>
  <path d="M300,200 L308,212 L320,212 L312,224 L320,236 L308,236 L300,248 L292,236 L280,236 L288,224 L280,212 L292,212 Z" fill="none" stroke="#C75B2A" stroke-width="0.5" opacity="0.07"/>
  <path d="M420,200 L428,212 L440,212 L432,224 L440,236 L428,236 L420,248 L412,236 L400,236 L408,224 L400,212 L412,212 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.09"/>
  <path d="M540,200 L548,212 L560,212 L552,224 L560,236 L548,236 L540,248 L532,236 L520,236 L528,224 L520,212 L532,212 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.08"/>
  <path d="M660,200 L668,212 L680,212 L672,224 L680,236 L668,236 L660,248 L652,236 L640,236 L648,224 L640,212 L652,212 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.06"/>
  <path d="M780,200 L788,212 L800,212 L792,224 L800,236 L788,236 L780,248 L772,236 L760,236 L768,224 L760,212 L772,212 Z" fill="none" stroke="#C75B2A" stroke-width="0.4" opacity="0.06"/>
  <path d="M120,300 L128,312 L140,312 L132,324 L140,336 L128,336 L120,348 L112,336 L100,336 L108,324 L100,312 L112,312 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.08"/>
  <path d="M240,300 L248,312 L260,312 L252,324 L260,336 L248,336 L240,348 L232,336 L220,336 L228,324 L220,312 L232,312 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.07"/>
  <path d="M360,300 L368,312 L380,312 L372,324 L380,336 L368,336 L360,348 L352,336 L340,336 L348,324 L340,312 L352,312 Z" fill="none" stroke="#1E5AAF" stroke-width="0.6" opacity="0.10"/>
  <path d="M480,300 L488,312 L500,312 L492,324 L500,336 L488,336 L480,348 L472,336 L460,336 L468,324 L460,312 L472,312 Z" fill="none" stroke="#C75B2A" stroke-width="0.5" opacity="0.08"/>
  <path d="M600,300 L608,312 L620,312 L612,324 L620,336 L608,336 L600,348 L592,336 L580,336 L588,324 L580,312 L592,312 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.07"/>
  <path d="M720,300 L728,312 L740,312 L732,324 L740,336 L728,336 L720,348 L712,336 L700,336 L708,324 L700,312 L712,312 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.06"/>
  <path d="M60,400 L68,412 L80,412 L72,424 L80,436 L68,436 L60,448 L52,436 L40,436 L48,424 L40,412 L52,412 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.07"/>
  <path d="M180,400 L188,412 L200,412 L192,424 L200,436 L188,436 L180,448 L172,436 L160,436 L168,424 L160,412 L172,412 Z" fill="none" stroke="#C75B2A" stroke-width="0.5" opacity="0.08"/>
  <path d="M300,400 L308,412 L320,412 L312,424 L320,436 L308,436 L300,448 L292,436 L280,436 L288,424 L280,412 L292,412 Z" fill="none" stroke="#1A8A8A" stroke-width="0.5" opacity="0.06"/>
  <path d="M420,400 L428,412 L440,412 L432,424 L440,436 L428,436 L420,448 L412,436 L400,436 L408,424 L400,412 L412,412 Z" fill="none" stroke="#1E5AAF" stroke-width="0.5" opacity="0.09"/>
  <path d="M540,400 L548,412 L560,412 L552,424 L560,436 L548,436 L540,448 L532,436 L520,436 L528,424 L520,412 L532,412 Z" fill="none" stroke="#1E5AAF" stroke-width="0.4" opacity="0.06"/>
  <path d="M660,400 L668,412 L680,412 L672,424 L680,436 L668,436 L660,448 L652,436 L640,436 L648,424 L640,412 L652,412 Z" fill="none" stroke="#C75B2A" stroke-width="0.4" opacity="0.07"/>
  <path d="M780,400 L788,412 L800,412 L792,424 L800,436 L788,436 L780,448 L772,436 L760,436 L768,424 L760,412 L772,412 Z" fill="none" stroke="#1A8A8A" stroke-width="0.4" opacity="0.05"/>
</svg>
```.text

// Geometric tile border frame — arabesque interlace for title/ending bookend
#let _tile-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="24" y="16" width="792" height="442" rx="2" ry="2" fill="none" stroke="#1E5AAF" stroke-width="2.5" opacity="0.7"/>
  <rect x="32" y="24" width="776" height="426" rx="1" ry="1" fill="none" stroke="#C75B2A" stroke-width="1" opacity="0.4"/>
  <path d="M24,60 L12,48 L12,16 L44,16" fill="none" stroke="#1E5AAF" stroke-width="2.5" opacity="0.8" stroke-linecap="round"/>
  <path d="M816,60 L828,48 L828,16 L796,16" fill="none" stroke="#1E5AAF" stroke-width="2.5" opacity="0.8" stroke-linecap="round"/>
  <path d="M24,414 L12,426 L12,458 L44,458" fill="none" stroke="#1E5AAF" stroke-width="2.5" opacity="0.8" stroke-linecap="round"/>
  <path d="M816,414 L828,426 L828,458 L796,458" fill="none" stroke="#1E5AAF" stroke-width="2.5" opacity="0.8" stroke-linecap="round"/>
  <path d="M370,16 L380,8 L390,16 L400,8 L410,16 L420,8 L430,16 L440,8 L450,16 L460,8 L470,16" fill="none" stroke="#C75B2A" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <path d="M370,458 L380,466 L390,458 L400,466 L410,458 L420,466 L430,458 L440,466 L450,458 L460,466 L470,458" fill="none" stroke="#C75B2A" stroke-width="1.5" opacity="0.6" stroke-linecap="round"/>
  <path d="M24,200 L16,210 L24,220 L16,230 L24,240 L16,250 L24,260" fill="none" stroke="#1A8A8A" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <path d="M816,200 L824,210 L816,220 L824,230 L816,240 L824,250 L816,260" fill="none" stroke="#1A8A8A" stroke-width="1.2" opacity="0.4" stroke-linecap="round"/>
  <circle cx="24" cy="16" r="4" fill="#1E5AAF" opacity="0.7"/>
  <circle cx="816" cy="16" r="4" fill="#1E5AAF" opacity="0.7"/>
  <circle cx="24" cy="458" r="4" fill="#1E5AAF" opacity="0.7"/>
  <circle cx="816" cy="458" r="4" fill="#1E5AAF" opacity="0.7"/>
  <circle cx="420" cy="16" r="3" fill="#C75B2A" opacity="0.6"/>
  <circle cx="420" cy="458" r="3" fill="#C75B2A" opacity="0.6"/>
</svg>
```.text

// Tessellation strip — repeating octagon + square border pattern
#let _tessellation-strip-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="12" viewBox="0 0 300 12">
  <path d="M0,6 L4,2 L12,2 L16,6 L12,10 L4,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.2" opacity="0.7"/>
  <rect x="18" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M28,6 L32,2 L40,2 L44,6 L40,10 L32,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.2" opacity="0.7"/>
  <rect x="46" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M56,6 L60,2 L68,2 L72,6 L68,10 L60,10 Z" fill="none" stroke="#1A8A8A" stroke-width="1.2" opacity="0.6"/>
  <rect x="74" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M84,6 L88,2 L96,2 L100,6 L96,10 L88,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.2" opacity="0.7"/>
  <rect x="102" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M112,6 L116,2 L124,2 L128,6 L124,10 L116,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.0" opacity="0.6"/>
  <rect x="130" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M140,6 L144,2 L152,2 L156,6 L152,10 L144,10 Z" fill="none" stroke="#1A8A8A" stroke-width="1.2" opacity="0.6"/>
  <rect x="158" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.4"/>
  <path d="M168,6 L172,2 L180,2 L184,6 L180,10 L172,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.0" opacity="0.6"/>
  <rect x="186" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.4"/>
  <path d="M196,6 L200,2 L208,2 L212,6 L208,10 L200,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.2" opacity="0.7"/>
  <rect x="214" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.5"/>
  <path d="M224,6 L228,2 L236,2 L240,6 L236,10 L228,10 Z" fill="none" stroke="#1A8A8A" stroke-width="1.0" opacity="0.5"/>
  <rect x="242" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.4"/>
  <path d="M252,6 L256,2 L264,2 L268,6 L264,10 L256,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.0" opacity="0.6"/>
  <rect x="270" y="3" width="6" height="6" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.4"/>
  <path d="M280,6 L284,2 L292,2 L296,6 L292,10 L284,10 Z" fill="none" stroke="#1E5AAF" stroke-width="1.2" opacity="0.7"/>
</svg>
```.text

// Star polygon divider — row of small star polygons
#let _star-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="16" viewBox="0 0 200 16">
  <path d="M20,8 L22,5 L25,4 L23,7 L25,10 L22,9 L20,12 L18,9 L15,10 L17,7 L15,4 L18,5 Z" fill="#1E5AAF" opacity="0.5"/>
  <path d="M50,8 L52,5 L55,4 L53,7 L55,10 L52,9 L50,12 L48,9 L45,10 L47,7 L45,4 L48,5 Z" fill="#C75B2A" opacity="0.4"/>
  <path d="M80,8 L82,5 L85,4 L83,7 L85,10 L82,9 L80,12 L78,9 L75,10 L77,7 L75,4 L78,5 Z" fill="#1A8A8A" opacity="0.5"/>
  <path d="M110,8 L112,5 L115,4 L113,7 L115,10 L112,9 L110,12 L108,9 L105,10 L107,7 L105,4 L108,5 Z" fill="#1E5AAF" opacity="0.4"/>
  <path d="M140,8 L142,5 L145,4 L143,7 L145,10 L142,9 L140,12 L138,9 L135,10 L137,7 L135,4 L138,5 Z" fill="#C75B2A" opacity="0.5"/>
  <path d="M170,8 L172,5 L175,4 L173,7 L175,10 L172,9 L170,12 L168,9 L165,10 L167,7 L165,4 L168,5 Z" fill="#1A8A8A" opacity="0.4"/>
  <line x1="0" y1="8" x2="12" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="28" y1="8" x2="42" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="58" y1="8" x2="72" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="88" y1="8" x2="102" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="118" y1="8" x2="132" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="148" y1="8" x2="162" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
  <line x1="178" y1="8" x2="200" y2="8" stroke="#1E5AAF" stroke-width="0.8" opacity="0.3"/>
</svg>
```.text

// Geometric rosette — radial pattern for corner/accent decoration
#let _rosette-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 60 60">
  <circle cx="30" cy="30" r="22" fill="none" stroke="#1E5AAF" stroke-width="1" opacity="0.3"/>
  <circle cx="30" cy="30" r="14" fill="none" stroke="#C75B2A" stroke-width="0.8" opacity="0.25"/>
  <path d="M30,8 L33,26 L30,30 L27,26 Z" fill="#1E5AAF" opacity="0.15"/>
  <path d="M30,52 L33,34 L30,30 L27,34 Z" fill="#1E5AAF" opacity="0.15"/>
  <path d="M8,30 L26,27 L30,30 L26,33 Z" fill="#1A8A8A" opacity="0.15"/>
  <path d="M52,30 L34,27 L30,30 L34,33 Z" fill="#1A8A8A" opacity="0.15"/>
  <path d="M14,14 L27,26 L30,30 L26,27 Z" fill="#C75B2A" opacity="0.10"/>
  <path d="M46,46 L33,34 L30,30 L34,33 Z" fill="#C75B2A" opacity="0.10"/>
  <path d="M46,14 L34,27 L30,30 L33,26 Z" fill="#1E5AAF" opacity="0.10"/>
  <path d="M14,46 L26,33 L30,30 L27,34 Z" fill="#1E5AAF" opacity="0.10"/>
  <circle cx="30" cy="30" r="3" fill="#C75B2A" opacity="0.35"/>
</svg>
```.text


// === SVG Rendering Helpers ===

/// Render zellige star pattern background
#let zellige-bg() = {
  image(bytes(_zellige-bg-svg), width: 100%, height: 100%)
}

/// Render tile frame (bookend for title/ending)
#let tile-frame() = {
  image(bytes(_tile-frame-svg), width: 100%, height: 100%)
}

/// Render tessellation strip divider
#let tessellation-strip(width: 100%) = {
  box(width: width, image(bytes(_tessellation-strip-svg), width: 100%, height: 10pt, fit: "contain"))
}

/// Render star polygon divider
#let star-divider(width: 100%) = {
  box(width: width, image(bytes(_star-divider-svg), width: 100%, height: 12pt, fit: "contain"))
}

/// Render rosette decoration
#let rosette(size: 40pt) = {
  box(width: size, height: size, image(bytes(_rosette-svg), width: size, height: size))
}


// === Background Atmosphere ===

/// Persistent background atmosphere for content slides — zellige pattern + corner rosettes
#let _content-atmosphere() = {
  // Full page zellige star pattern at very low opacity
  place(top + left, box(width: 100%, height: 100%, zellige-bg()))
  // Subtle corner rosette accents
  place(top + right, dx: -0.8em, dy: 0.4em,
    rosette(size: 30pt))
  place(bottom + left, dx: 0.8em, dy: -0.4em,
    rosette(size: 24pt))
}


// === 1. Slide Functions ===

/// Standard content slide — warm cream bg, zellige atmosphere, cobalt/terracotta accents
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
        set text(fill: palette.text, size: 1.3em, weight: "semibold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Tessellation strip under title
      tessellation-strip(width: 160pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.muted, size: 0.65em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small tile-shaped diamond separator
        rotate(45deg, box(width: 5pt, height: 5pt, fill: palette.primary.transparentize(40%)))
      },
      {
        set std.align(right)
        context text(fill: palette.muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
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

/// Title slide — tile frame border (bookend), zellige background, centered info
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm cream background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Zellige star pattern background
    place(top + left, box(width: 100%, height: 100%, zellige-bg()))
    // Tile frame (bookend element)
    place(top + left, box(width: 100%, height: 100%, tile-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Rosette decoration above title
      #rosette(size: 44pt)
      #v(0.5em)
      // Title
      #text(size: 2.4em, weight: "semibold", fill: palette.text, info.title)
      #v(0.4em)
      // Tessellation strip divider
      #std.align(center, tessellation-strip(width: 200pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.primary, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.text, weight: "regular", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.secondary)[#utils.display-info-date(self)]
      }
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

/// New section slide — left cobalt accent bar, star divider, section title
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
    // Zellige pattern
    place(top + left, box(width: 100%, height: 100%, zellige-bg()))
    // Left accent bar — cobalt blue
    place(top + left, block(width: 5pt, height: 100%, fill: palette.primary))
    // Corner rosette
    place(top + right, dx: -2em, dy: 1.5em, rosette(size: 50pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in primary blue
      #text(size: 3.5em, fill: palette.primary, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "1")
      ]
      #v(0.3em)
      // Star divider decoration
      #star-divider(width: 140pt)
      #v(0.4em)
      // Section title
      #set text(fill: palette.text, size: 2em, weight: "semibold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom tessellation strip
    place(bottom + center, dy: -1.5em, std.align(center, tessellation-strip(width: 50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — deeper background, centered bold statement with tile border
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
    // Slightly deeper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.text))
    // Zellige pattern (visible on dark bg)
    place(top + left, box(width: 100%, height: 100%, zellige-bg()))
    // Geometric border frame
    place(center + horizon,
      rect(width: 82%, height: 72%,
        fill: none,
        stroke: (paint: palette.primary.lighten(30%), thickness: 2pt)))
    // Inner border
    place(center + horizon,
      rect(width: 78%, height: 68%,
        fill: none,
        stroke: (paint: palette.secondary.lighten(20%), thickness: 0.8pt)))
    // Center content
    place(center + horizon,
      block(width: 70%, height: auto,
        align(center)[
          #set text(fill: palette.bg, size: 1.4em, weight: "semibold")
          #body
          #v(0.5em)
          #tessellation-strip(width: 180pt)
        ]
      )
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — tile frame (bookend), rosette, farewell text
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
    // Zellige background
    place(top + left, box(width: 100%, height: 100%, zellige-bg()))
    // Tile frame (bookend — shared with title slide)
    place(top + left, box(width: 100%, height: 100%, tile-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Rosette above
      #rosette(size: 50pt)
      #v(0.6em)
      // Main text
      #text(size: 2.4em, weight: "semibold", fill: palette.text, body)
      #v(0.5em)
      // Star divider below
      #star-divider(width: 160pt)
      #v(0.4em)
      // Small tessellation accent
      #tessellation-strip(width: 120pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// tile-card — content card with geometric tile border top
#let tile-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (bottom: 4pt),
  )[
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent, size: 0.92em, title),
      [
      #block(width: 40pt, height: 1.5pt, fill: accent.transparentize(50%), radius: 1pt)
      #v(5pt)
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// zellige-box — highlighted box with star pattern accent and teal border
#let zellige-box(title, body) = {
  block(
    width: 100%,
    fill: palette.highlight.lighten(92%),
    stroke: (left: 4pt + palette.highlight),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 4pt),
  )[
    #stack(dir: ltr, spacing: 8pt,
      rotate(45deg, box(width: 6pt, height: 6pt, fill: palette.highlight)),
      text(weight: "semibold", fill: palette.tile-teal, size: 0.95em, title),
    )
    #v(6pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// tessera-tag — geometric capsule label
#let tessera-tag(content, color: palette.primary) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 99pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      rotate(45deg, box(width: 4pt, height: 4pt, fill: color)),
      text(fill: color, size: 0.75em, weight: "semibold", content),
    )
  ]
}

/// rosette-card — important data card with radial pattern accent
#let rosette-card(title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + accent.transparentize(30%),
    inset: (x: 1em, y: 0.8em),
    radius: 6pt,
  )[
    // Rosette accent in corner
    #place(top + right, dx: -4pt, dy: 4pt, rosette(size: 28pt))
    #stack(spacing: .8em,
      text(weight: "semibold", fill: accent, size: 0.92em, title),
      [
      #set text(fill: palette.text, size: 0.82em)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// interlace-divider — geometric woven separator using star divider SVG
#let interlace-divider(color: palette.primary, width: 80%) = {
  std.align(center, box(
    width: width,
    grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 8pt,
      align: horizon,
      line(length: 100%, stroke: 0.8pt + color.transparentize(55%)),
      star-divider(width: 180pt),
      line(length: 100%, stroke: 0.8pt + color.transparentize(55%)),
    ),
  ))
}

/// facet-stat — KPI with tile-inspired display
#let facet-stat(label, value, color: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 0.8em, y: 0.6em),
    radius: (bottom: 4pt),
  )[
    #set text(fill: palette.muted, size: 0.75em)
    // Small diamond accent
    #place(top + right, dx: -8pt, dy: 8pt,
      rotate(45deg, box(width: 6pt, height: 6pt, fill: color.transparentize(50%))))
    #stack(
      spacing: .8em,
      label,
      [
        #set text(fill: color, size: 1.8em, weight: "bold")
        #value
        #lazy-v(1fr)
      ]
    )
  ]
}

/// pattern-card — sequential/linked card with numbered pattern
#let pattern-card(number, title, body, accent: palette.primary) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 4pt),
  )[
    #stack(dir: ltr, spacing: 8pt,
      // Number in circle
      box(width: 20pt, height: 20pt, radius: 10pt, fill: accent,
        align(center + horizon, text(fill: white, size: 0.7em, weight: "bold", number))),
      text(weight: "semibold", fill: palette.text, size: 0.92em, title),
    )
    #v(5pt)
    #set text(fill: palette.text, size: 0.82em)
    #body
    #lazy-v(1fr)
  ]
}

/// muqarnas-grid — multi-item honeycomb-style layout
#let muqarnas-grid(items, columns: 3) = {
  let cells = items.map(item => {
    block(
      width: 100%,
      fill: palette.card-bg,
      stroke: 1pt + palette.border,
      inset: (x: 0.8em, y: 0.6em),
      radius: 4pt,
    )[
      #if item.keys().contains("title") {
        text(weight: "semibold", fill: palette.primary, size: 0.85em, item.title)
        v(3pt)
      }
      #set text(fill: palette.text, size: 0.78em)
      #if item.keys().contains("body") { item.body }
    ]
  })
  grid(
    columns: range(columns).map(_ => 1fr),
    gutter: 0.8em,
    align: top + left,
    ..cells
  )
}

/// glazed-box — code/technical content with ceramic feel
#let glazed-box(title, body, accent: palette.tile-blue) = {
  block(
    width: 100%,
    fill: rgb("#F5F8FC"),
    stroke: (left: 3pt + accent, rest: 1pt + rgb("#D6E3F0")),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #stack(dir: ltr, spacing: 6pt,
      box(width: 7pt, height: 7pt, fill: accent, radius: 1pt),
      text(weight: "semibold", fill: accent, size: 0.88em, font: ("Menlo", "DejaVu Sans Mono"), title),
    )
    #v(5pt)
    #set text(fill: palette.text, size: 0.80em)
    #body
    #lazy-v(1fr)
  ]
}

/// arabesque-note — annotation with vine-like geometric decoration
#let arabesque-note(body, accent: palette.secondary) = {
  block(
    width: 100%,
    fill: accent.lighten(92%),
    stroke: (left: 3pt + accent.transparentize(20%)),
    inset: (x: 1.2em, y: 0.8em),
    radius: (right: 4pt),
  )[
    // Small decorative diamond chain
    #stack(dir: ltr, spacing: 3pt,
      rotate(45deg, box(width: 4pt, height: 4pt, fill: accent.transparentize(30%))),
      rotate(45deg, box(width: 3pt, height: 3pt, fill: accent.transparentize(50%))),
      rotate(45deg, box(width: 4pt, height: 4pt, fill: accent.transparentize(30%))),
    )
    #v(4pt)
    #set text(fill: palette.text, size: 0.82em, style: "italic")
    #body
    #lazy-v(1fr)
  ]
}


// === 3. Theme Entry Point ===

#let mosaic-tile-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.text)
  show raw: set text(font: ("Menlo", "DejaVu Sans Mono"))
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
