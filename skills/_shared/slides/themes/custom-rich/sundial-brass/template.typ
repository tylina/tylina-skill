// Sundial Brass Theme — Astronomical instruments, horology, sundial engravings
// Warm ivory background with aged brass/bronze primary, deep navy secondary, patina green accent
// Sundial hour lines radiating from gnomon, clock gear teeth borders, Roman numeral markers,
// celestial arc curves, brass engraving-style cross-hatching, armillary sphere rings
// Perfect for academic research, time-series analysis, historical studies, philosophy, physics
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (Direct — Rich Theme) ═══

#let palette = (
  bg: rgb("#FDFAF3"),
  ivory: rgb("#F8F5EC"),
  ink: rgb("#2D2A26"),
  brass: rgb("#8B6914"),
  navy: rgb("#1B2B4A"),
  patina: rgb("#4A7C59"),
  charcoal: rgb("#2D2A26"),
  brass-light: rgb("#B8941F"),
  navy-muted: rgb("#3B4D6B"),
  card-bg: rgb("#FFFDF7"),
  border: rgb("#E8DFC8"),
  text-muted: rgb("#6B6560"),
  shadow-warm: rgb("#D4C9A8"),
)


// ═══ SVG Definitions ═══

// Full-page sundial radiating hour lines with gnomon center point
#let _sundial-bg-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="120" cy="400" r="4" fill="#8B6914" opacity="0.15"/>
  <circle cx="120" cy="400" r="2" fill="#8B6914" opacity="0.25"/>
  <line x1="120" y1="400" x2="840" y2="380" stroke="#8B6914" stroke-width="0.4" opacity="0.06"/>
  <line x1="120" y1="400" x2="840" y2="320" stroke="#8B6914" stroke-width="0.4" opacity="0.07"/>
  <line x1="120" y1="400" x2="840" y2="260" stroke="#8B6914" stroke-width="0.5" opacity="0.08"/>
  <line x1="120" y1="400" x2="840" y2="200" stroke="#8B6914" stroke-width="0.4" opacity="0.07"/>
  <line x1="120" y1="400" x2="840" y2="140" stroke="#8B6914" stroke-width="0.4" opacity="0.06"/>
  <line x1="120" y1="400" x2="840" y2="80" stroke="#8B6914" stroke-width="0.4" opacity="0.05"/>
  <line x1="120" y1="400" x2="840" y2="20" stroke="#8B6914" stroke-width="0.3" opacity="0.04"/>
  <line x1="120" y1="400" x2="780" y2="0" stroke="#8B6914" stroke-width="0.3" opacity="0.04"/>
  <line x1="120" y1="400" x2="650" y2="0" stroke="#8B6914" stroke-width="0.3" opacity="0.05"/>
  <line x1="120" y1="400" x2="500" y2="0" stroke="#8B6914" stroke-width="0.4" opacity="0.06"/>
  <line x1="120" y1="400" x2="350" y2="0" stroke="#8B6914" stroke-width="0.3" opacity="0.05"/>
  <line x1="120" y1="400" x2="200" y2="0" stroke="#8B6914" stroke-width="0.3" opacity="0.04"/>
  <path d="M0,350 Q420,280 840,320" fill="none" stroke="#1B2B4A" stroke-width="0.3" opacity="0.05"/>
  <path d="M0,280 Q420,200 840,240" fill="none" stroke="#1B2B4A" stroke-width="0.3" opacity="0.04"/>
  <path d="M0,200 Q420,120 840,160" fill="none" stroke="#1B2B4A" stroke-width="0.25" opacity="0.04"/>
  <ellipse cx="700" cy="80" rx="120" ry="50" fill="none" stroke="#4A7C59" stroke-width="0.4" opacity="0.05"/>
  <ellipse cx="700" cy="80" rx="90" ry="35" fill="none" stroke="#4A7C59" stroke-width="0.3" opacity="0.04"/>
  <rect x="300" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
  <rect x="320" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
  <rect x="340" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
  <rect x="360" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
  <rect x="380" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
  <rect x="400" y="468" width="4" height="6" fill="#8B6914" opacity="0.06"/>
</svg>```.text

// Bookend frame — brass border with gear-teeth corners, armillary rings, gnomon point
#let _bookend-frame-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="24" y="16" width="792" height="442" rx="2" ry="2" fill="none" stroke="#8B6914" stroke-width="2" opacity="0.6"/>
  <rect x="32" y="24" width="776" height="426" rx="1" ry="1" fill="none" stroke="#8B6914" stroke-width="0.7" opacity="0.35"/>
  <rect x="100" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="140" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="180" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="220" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="260" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="300" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="340" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="380" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="420" y="14" width="8" height="6" fill="#8B6914" opacity="0.6"/>
  <rect x="460" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="500" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="540" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="580" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="620" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="660" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="700" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="740" y="14" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="100" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="140" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="180" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="220" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="260" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="300" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="340" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="380" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="420" y="456" width="8" height="6" fill="#8B6914" opacity="0.6"/>
  <rect x="460" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="500" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="540" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="580" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="620" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="660" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="700" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <rect x="740" y="456" width="6" height="5" fill="#8B6914" opacity="0.5"/>
  <circle cx="50" cy="40" r="12" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5"/>
  <circle cx="50" cy="40" r="8" fill="none" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3"/>
  <circle cx="790" cy="40" r="12" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5"/>
  <circle cx="790" cy="40" r="8" fill="none" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3"/>
  <circle cx="50" cy="434" r="12" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5"/>
  <circle cx="50" cy="434" r="8" fill="none" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3"/>
  <circle cx="790" cy="434" r="12" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5"/>
  <circle cx="790" cy="434" r="8" fill="none" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3"/>
  <ellipse cx="420" cy="237" rx="140" ry="140" fill="none" stroke="#8B6914" stroke-width="0.8" opacity="0.12"/>
  <ellipse cx="420" cy="237" rx="140" ry="60" fill="none" stroke="#1B2B4A" stroke-width="0.6" opacity="0.10" transform="rotate(-23 420 237)"/>
  <ellipse cx="420" cy="237" rx="120" ry="120" fill="none" stroke="#4A7C59" stroke-width="0.5" opacity="0.08"/>
  <circle cx="420" cy="237" r="4" fill="#8B6914" opacity="0.20"/>
  <line x1="420" y1="237" x2="420" y2="97" stroke="#8B6914" stroke-width="0.4" opacity="0.10"/>
  <line x1="420" y1="237" x2="560" y2="237" stroke="#8B6914" stroke-width="0.4" opacity="0.10"/>
  <line x1="420" y1="237" x2="520" y2="137" stroke="#8B6914" stroke-width="0.3" opacity="0.08"/>
  <line x1="420" y1="237" x2="320" y2="137" stroke="#8B6914" stroke-width="0.3" opacity="0.08"/>
</svg>```.text

// Dial divider — radiating lines from a left gnomon point with tick marks
#let _dial-divider-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="16" viewBox="0 0 300 16">
  <circle cx="6" cy="8" r="3" fill="#8B6914" opacity="0.7"/>
  <line x1="10" y1="8" x2="290" y2="4" stroke="#8B6914" stroke-width="1.2" opacity="0.5"/>
  <line x1="10" y1="8" x2="290" y2="8" stroke="#8B6914" stroke-width="0.8" opacity="0.4"/>
  <line x1="10" y1="8" x2="290" y2="12" stroke="#8B6914" stroke-width="0.6" opacity="0.3"/>
  <line x1="50" y1="6" x2="50" y2="10" stroke="#8B6914" stroke-width="0.8" opacity="0.5"/>
  <line x1="100" y1="5" x2="100" y2="11" stroke="#8B6914" stroke-width="1" opacity="0.6"/>
  <line x1="150" y1="5" x2="150" y2="11" stroke="#1B2B4A" stroke-width="1.2" opacity="0.5"/>
  <line x1="200" y1="5" x2="200" y2="11" stroke="#8B6914" stroke-width="1" opacity="0.6"/>
  <line x1="250" y1="6" x2="250" y2="10" stroke="#8B6914" stroke-width="0.8" opacity="0.5"/>
  <circle cx="290" cy="8" r="2" fill="#8B6914" opacity="0.5"/>
</svg>```.text

// Gnomon pointer — sundial shadow angle indicator for stats
#let _gnomon-pointer-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48">
  <path d="M8,40 A30,30 0 0,1 40,40" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.6"/>
  <line x1="10" y1="36" x2="12" y2="38" stroke="#8B6914" stroke-width="1" opacity="0.5"/>
  <line x1="14" y1="28" x2="16" y2="30" stroke="#8B6914" stroke-width="1" opacity="0.5"/>
  <line x1="20" y1="22" x2="22" y2="24" stroke="#8B6914" stroke-width="1" opacity="0.5"/>
  <line x1="28" y1="20" x2="28" y2="23" stroke="#8B6914" stroke-width="1.2" opacity="0.6"/>
  <line x1="34" y1="22" x2="32" y2="24" stroke="#8B6914" stroke-width="1" opacity="0.5"/>
  <line x1="38" y1="28" x2="36" y2="30" stroke="#8B6914" stroke-width="1" opacity="0.5"/>
  <line x1="24" y1="42" x2="18" y2="18" stroke="#1B2B4A" stroke-width="2" opacity="0.7" stroke-linecap="round"/>
  <circle cx="24" cy="42" r="3" fill="#8B6914" opacity="0.8"/>
  <circle cx="24" cy="42" r="1.5" fill="#FDFAF3" opacity="0.9"/>
</svg>```.text

// Gear border segment for gear-box component
#let _gear-border-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="8" viewBox="0 0 200 8">
  <rect x="0" y="2" width="200" height="4" fill="#8B6914" opacity="0.15"/>
  <rect x="0" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="14" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="28" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="42" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="56" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="70" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="84" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="98" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="112" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="126" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="140" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="154" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="168" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
  <rect x="182" y="0" width="8" height="8" rx="1" fill="#8B6914" opacity="0.4"/>
</svg>```.text

// Armillary sphere rings — concentric circles with axis cross for armillary-box
#let _armillary-rings-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <circle cx="32" cy="32" r="28" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5"/>
  <ellipse cx="32" cy="32" rx="28" ry="14" fill="none" stroke="#1B2B4A" stroke-width="1.2" opacity="0.4" transform="rotate(-23.5 32 32)"/>
  <ellipse cx="32" cy="32" rx="22" ry="22" fill="none" stroke="#4A7C59" stroke-width="0.8" opacity="0.35"/>
  <ellipse cx="32" cy="32" rx="10" ry="28" fill="none" stroke="#8B6914" stroke-width="0.7" opacity="0.3"/>
  <line x1="32" y1="4" x2="32" y2="60" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3"/>
  <circle cx="32" cy="32" r="2.5" fill="#8B6914" opacity="0.6"/>
  <circle cx="32" cy="32" r="1.2" fill="#FDFAF3" opacity="0.8"/>
  <circle cx="32" cy="4" r="2" fill="#1B2B4A" opacity="0.4"/>
  <circle cx="32" cy="60" r="2" fill="#1B2B4A" opacity="0.4"/>
</svg>```.text

// Cross-hatch engraving texture for engraving-card background
#let _crosshatch-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
  <line x1="0" y1="0" x2="40" y2="40" stroke="#8B6914" stroke-width="0.4" opacity="0.08"/>
  <line x1="10" y1="0" x2="40" y2="30" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="20" y1="0" x2="40" y2="20" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="30" y1="0" x2="40" y2="10" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="10" x2="30" y2="40" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="20" x2="20" y2="40" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="0" y1="30" x2="10" y2="40" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="40" y1="0" x2="0" y2="40" stroke="#8B6914" stroke-width="0.4" opacity="0.08"/>
  <line x1="30" y1="0" x2="0" y2="30" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="20" y1="0" x2="0" y2="20" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="40" y1="10" x2="10" y2="40" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
  <line x1="40" y1="20" x2="20" y2="40" stroke="#8B6914" stroke-width="0.3" opacity="0.06"/>
</svg>```.text

// Celestial arc decoration for meridian-quote
#let _celestial-arc-svg = ```xml
<svg xmlns="http://www.w3.org/2000/svg" width="240" height="32" viewBox="0 0 240 32">
  <path d="M10,28 Q60,4 120,16 Q180,28 230,4" fill="none" stroke="#8B6914" stroke-width="1.5" opacity="0.5" stroke-linecap="round"/>
  <path d="M20,26 Q60,8 120,18 Q180,28 220,8" fill="none" stroke="#1B2B4A" stroke-width="0.8" opacity="0.3" stroke-linecap="round"/>
  <circle cx="10" cy="28" r="2.5" fill="#8B6914" opacity="0.6"/>
  <circle cx="120" cy="16" r="2" fill="#4A7C59" opacity="0.5"/>
  <circle cx="230" cy="4" r="2.5" fill="#8B6914" opacity="0.6"/>
  <circle cx="60" cy="8" r="1.5" fill="#1B2B4A" opacity="0.4"/>
  <circle cx="90" cy="12" r="1" fill="#8B6914" opacity="0.3"/>
  <circle cx="150" cy="20" r="1" fill="#8B6914" opacity="0.3"/>
  <circle cx="180" cy="24" r="1.5" fill="#1B2B4A" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render sundial radiating background
#let sundial-bg() = {
  image(bytes(_sundial-bg-svg), width: 100%, height: 100%)
}

/// Render bookend frame overlay (title/ending shared)
#let bookend-frame() = {
  image(bytes(_bookend-frame-svg), width: 100%, height: 100%)
}

/// Render dial divider
#let dial-divider-render(width: 100%) = {
  box(width: width, image(bytes(_dial-divider-svg), width: width, height: 12pt))
}

/// Render gnomon pointer ornament
#let gnomon-pointer(size: 36pt) = {
  box(image(bytes(_gnomon-pointer-svg), width: size, height: size))
}

/// Render gear border
#let gear-border-render(width: 100%) = {
  box(width: width, image(bytes(_gear-border-svg), width: width, height: 6pt))
}

/// Render armillary rings ornament
#let armillary-rings(size: 48pt) = {
  box(image(bytes(_armillary-rings-svg), width: size, height: size))
}

/// Render celestial arc decoration
#let celestial-arc-render(width: 100%) = {
  box(width: width, image(bytes(_celestial-arc-svg), width: width, height: 24pt))
}


// ═══ Background Atmosphere ═══

/// Persistent background atmosphere for content slides — sundial hour lines + brass accents
#let _content-atmosphere() = {
  // Faint sundial radiating lines across entire slide
  place(top + left, box(width: 100%, height: 100%, sundial-bg()))
  // Corner brass gnomon markers
  place(top + right, dx: -1.4em, dy: 0.9em,
    circle(radius: 2.5pt, fill: palette.brass.transparentize(70%)))
  place(bottom + left, dx: 1.4em, dy: -0.9em,
    circle(radius: 2pt, fill: palette.patina.transparentize(75%)))
  place(bottom + right, dx: -2em, dy: -1.4em,
    circle(radius: 1.8pt, fill: palette.brass.transparentize(80%)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — ivory bg, sundial hour-line atmosphere, brass/navy accents
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
        set text(fill: palette.ink, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Dial divider under title
      dial-divider-render(width: 160pt),
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
        // Brass gnomon dot separator
        box(width: 5pt, height: 5pt, radius: 2.5pt, fill: palette.brass)
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

/// Title slide — bookend frame, sundial bg, armillary center, centered title
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm ivory background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Sundial radiating background
    place(top + left, box(width: 100%, height: 100%, sundial-bg()))
    // Bookend frame (shared with ending slide)
    place(top + left, box(width: 100%, height: 100%, bookend-frame()))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Armillary rings ornament above title
      #armillary-rings(size: 48pt)
      #v(0.5em)
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.ink, info.title)
      #v(0.4em)
      // Dial divider
      #std.align(center, dial-divider-render(width: 220pt))
      #v(0.6em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.navy-muted, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.ink, weight: "regular", info.author)
        v(0.3em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.text-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.brass)[#utils.display-info-date(self)]
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

/// New section slide — brass accent, gnomon pointer, gear-teeth top
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
    // Sundial atmosphere
    place(top + left, box(width: 100%, height: 100%, sundial-bg()))
    // Left accent bar — brass
    place(top + left, block(width: 4pt, height: 100%, fill: palette.brass))
    // Gear border at top
    place(top + left, dx: 4pt, box(width: 100%, gear-border-render(width: 100%)))
    // Decorative corner gnomon pointer
    place(top + right, dx: -3em, dy: 2.5em, gnomon-pointer(size: 32pt))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in brass
      #text(size: 3.5em, fill: palette.brass, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "I")
      ]
      #v(0.3em)
      // Dial divider decoration
      #dial-divider-render(width: 140pt)
      #v(0.4em)
      // Section title
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(1fr)
    ]
    // Bottom accent line
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.brass.transparentize(50%)))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — ivory bg with radiating emphasis from center gnomon
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.ivory))
    // Sundial atmosphere
    place(top + left, box(width: 100%, height: 100%, sundial-bg()))
    // Corner brass nodes
    place(top + left, dx: 2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.brass.transparentize(30%)))
    place(top + right, dx: -2em, dy: 1.5em,
      circle(radius: 3.5pt, fill: palette.navy.transparentize(50%)))
    place(bottom + left, dx: 2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.patina.transparentize(40%)))
    place(bottom + right, dx: -2em, dy: -1.5em,
      circle(radius: 2.5pt, fill: palette.brass.transparentize(30%)))
    // Center content in normal flow so diagnostics can measure it.
    set std.align(center + horizon)
    block(width: 72%, height: auto,
      align(center)[
        #set text(fill: palette.ink, size: 1.4em, weight: "bold")
        #body
        #v(.8em)
        #dial-divider-render(width: 180pt)
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — ivory bg with bookend frame (shared with title), armillary, farewell
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
    // Background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Sundial atmosphere
    place(top + left, box(width: 100%, height: 100%, sundial-bg()))
    // Bookend frame (shared with title slide)
    place(top + left, box(width: 100%, height: 100%, bookend-frame()))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Armillary rings above
      #armillary-rings(size: 52pt)
      #v(0.6em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.ink, body)
      #v(0.5em)
      // Dial divider below
      #dial-divider-render(width: 200pt)
      #v(0.4em)
      // Small brass accent bar
      #block(width: 4em, height: 2pt, fill: palette.brass, radius: 1pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// Hour card — card with radiating hour-line accent from top-left corner
#let hour-card(title, body, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    // Radiating line accent indicator at top-left
    #place(top + left, dx: -1pt, dy: 4pt,
      box(width: 20pt, height: 1pt, fill: accent.transparentize(40%)))
    #place(top + left, dx: -1pt, dy: 8pt,
      box(width: 14pt, height: 0.7pt, fill: accent.transparentize(60%)))
    // Title with brass dot
    #stack(dir: ltr, spacing: 6pt,
      box(width: 7pt, height: 7pt, radius: 3.5pt, fill: accent),
      text(weight: "bold", fill: palette.ink, size: 0.92em, title),
    )
    #stack(
      spacing: .8em,
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Gnomon stat — metric with sundial shadow-angle indicator
#let gnomon-stat(label, value, description: none, color: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (top: 3pt + color, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.45em),
    radius: (bottom: 4pt),
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      align: (left + horizon, left + horizon),
      stack(dir: ltr, spacing: 6pt,
        gnomon-pointer(size: 22pt),
        text(fill: color, size: 1.45em, weight: "bold", value),
      ),
      stack(
        spacing: .8em,
        text(fill: palette.ink, size: 0.82em, weight: "semibold", label),
        if description != none {
          text(fill: palette.text-muted, size: 0.68em, description)
        },
      ),
    )
    #lazy-v(1fr)
  ]
}

/// Gear box — highlighted box with gear-teeth border at top and bottom
#let gear-box(title, body, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.ivory,
    stroke: 1pt + palette.border,
    inset: 0pt,
    radius: 4pt,
    clip: true,
  )[
    // Gear teeth top border
    #gear-border-render(width: 100%)
    #pad(x: 1em, y: 0.45em)[
      #stack(dir: ltr, spacing: 6pt,
        box(width: 6pt, height: 6pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: accent, size: 0.92em, title),
      )
      #v(5pt)
      #set text(fill: palette.ink, size: 0.82em)
      #body
    ]
    // Gear teeth bottom border
    #gear-border-render(width: 100%)
    #lazy-v(1fr)
  ]
}

/// Meridian quote — quote with celestial arc decoration
#let meridian-quote(body, attribution: none) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 4pt + palette.navy),
    inset: (x: 1.2em, y: 0.55em),
    radius: (right: 4pt),
  )[
    #stack(
      spacing: .8em,
      celestial-arc-render(width: 80%),
      {
        set text(fill: palette.ink, size: 0.88em, style: "italic")
        body
      },
      if attribution != none {
        text(fill: palette.text-muted, size: 0.75em, weight: "medium", style: "normal")[— #attribution]
      },
      lazy-v(1fr),
    )
  ]
}

/// Epoch tag — time-period style tag with Roman numeral aesthetic
#let epoch-tag(content, color: palette.brass) = {
  box(
    fill: color.lighten(88%),
    stroke: 1pt + color.transparentize(40%),
    inset: (x: 0.7em, y: 0.3em),
    radius: 2pt,
  )[
    #stack(dir: ltr, spacing: 4pt,
      box(width: 5pt, height: 5pt, fill: color, radius: 1pt),
      text(fill: color, size: 0.75em, weight: "bold", content),
    )
  ]
}

/// Dial divider — radiating line separator (component wrapper)
#let dial-divider(color: palette.brass, width: 80%) = {
  std.align(center, box(width: width, dial-divider-render(width: 100%)))
}

/// Armillary box — feature box with concentric ring decoration in corner
#let armillary-box(title, body, accent: palette.navy) = {
  block(
    width: 100%,
    fill: accent.lighten(94%),
    stroke: 1.5pt + accent.transparentize(40%),
    inset: (x: 1.2em, y: 0.55em),
    radius: 6pt,
  )[
    // Armillary rings decoration top-right
    #place(top + right, dx: -4pt, dy: 4pt, armillary-rings(size: 28pt))
    #stack(spacing: .8em,
      text(weight: "bold", fill: accent, size: 0.92em, title),
      block(width: 30pt, height: 2pt, fill: accent.transparentize(40%), radius: 1pt),
      {
        set text(fill: palette.ink, size: 0.82em)
        body
      },
      lazy-v(1fr),
    )
  ]
}

/// Chronometer list — numbered list with clock-position indicators
#let chronometer-list(items, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.8em),
    radius: 4pt,
  )[
    #for (i, item) in items.enumerate() {
      grid(columns: (20pt, 1fr), column-gutter: 8pt,
        box(width: 20pt, height: 20pt, radius: 10pt,
          fill: if calc.rem(i, 2) == 0 { accent } else { palette.navy },
          align(center + horizon, text(fill: white, size: 0.65em, weight: "bold", str(i + 1)))),
        text(fill: palette.ink, size: 0.82em, item),
      )
      if i < items.len() - 1 {
        v(6pt)
      }
    }
    #lazy-v(1fr)
  ]
}

/// Engraving card — card with cross-hatch texture background
#let engraving-card(title, body, accent: palette.brass) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: 0pt,
    radius: 4pt,
    clip: true,
  )[
    // Cross-hatch pattern overlay (subtle, tiling)
    #place(top + left, box(width: 100%, height: 100%,
      image(bytes(_crosshatch-svg), width: 40pt, height: 40pt)))
    #pad(x: 1em, y: 0.8em)[
      #stack(dir: ltr, spacing: 6pt,
        box(width: 7pt, height: 7pt, fill: accent, radius: 1pt),
        text(weight: "bold", fill: palette.ink, size: 0.92em, title),
      )
      #stack(
        spacing: .8em,
        {
          set text(fill: palette.ink, size: 0.82em)
          body
        },
      )
    ]
    #lazy-v(1fr)
  ]
}


// ═══ 3. Theme Entry Point ═══

#let sundial-brass-theme(
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
      primary: palette.brass,
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
