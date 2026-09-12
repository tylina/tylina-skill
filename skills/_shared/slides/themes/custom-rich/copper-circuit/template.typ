// Copper Circuit Theme — PCB (Printed Circuit Board) design aesthetic
// Warm cream FR4 substrate background with copper traces, solder pads, via holes,
// and component outlines. Engineering elegance: the beauty of electronics rendered
// as a presentation aesthetic. NOT dark — uses warm cream/FR4 substrate background.
// Best for: Engineering presentations, hardware product launches, IoT demos, electronics courses, maker presentations.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette (PCB / Electronics) ═══

#let palette = (
  substrate: rgb("#FDF8F0"),    // Main background (PCB cream)
  copper: rgb("#C87941"),       // Primary accent (copper trace)
  solder: rgb("#A8B5A0"),       // Secondary accent (solder mask green)
  gold-pin: rgb("#D4A843"),     // Tertiary accent (gold plating)
  dark-text: rgb("#2A2420"),    // Heading text
  body-text: rgb("#4D4540"),    // Body copy
  card-bg: rgb("#FFFEF9"),      // Card backgrounds
  pad-fill: rgb("#F5F0E5"),     // Subtle fills (component area)
  border: rgb("#E0D5C5"),       // PCB edge borders
  via: rgb("#7B6B5A"),          // Via/connector marks
)


// ═══ SVG Definitions ═══

// Circuit trace — PCB-style right-angle and 45-degree copper traces connecting pads
// Full-page background overlay for content slides
#let _circuit-trace-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="38" y="22" width="6" height="6" rx="1" fill="#C87941" opacity="0.10"/>
  <path d="M44,25 L80,25 L95,40 L95,80" fill="none" stroke="#C87941" stroke-width="1.5" opacity="0.08"/>
  <circle cx="95" cy="80" r="4" fill="none" stroke="#C87941" stroke-width="1" opacity="0.10"/>
  <circle cx="95" cy="80" r="1.5" fill="#C87941" opacity="0.08"/>
  <path d="M750,30 L750,60 L720,90 L680,90" fill="none" stroke="#C87941" stroke-width="1.2" opacity="0.07"/>
  <rect x="747" y="27" width="6" height="6" rx="1" fill="#C87941" opacity="0.09"/>
  <circle cx="680" cy="90" r="3.5" fill="none" stroke="#C87941" stroke-width="1" opacity="0.08"/>
  <circle cx="680" cy="90" r="1.2" fill="#C87941" opacity="0.07"/>
  <path d="M60,420 L60,390 L90,360 L150,360" fill="none" stroke="#C87941" stroke-width="1.3" opacity="0.07"/>
  <rect x="57" y="420" width="6" height="6" rx="1" fill="#C87941" opacity="0.09"/>
  <circle cx="150" cy="360" r="3" fill="none" stroke="#C87941" stroke-width="1" opacity="0.08"/>
  <path d="M700,440 L700,410 L730,380" fill="none" stroke="#C87941" stroke-width="1.2" opacity="0.06"/>
  <rect x="727" y="375" width="6" height="6" rx="1" fill="#C87941" opacity="0.08"/>
</svg>```.text

// Via pattern — Scattered via holes (circles with center dots) as background atmosphere
#let _via-pattern-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <circle cx="120" cy="55" r="4" fill="none" stroke="#7B6B5A" stroke-width="0.8" opacity="0.08"/>
  <circle cx="120" cy="55" r="1.5" fill="#7B6B5A" opacity="0.10"/>
  <circle cx="300" cy="40" r="3.5" fill="none" stroke="#7B6B5A" stroke-width="0.7" opacity="0.07"/>
  <circle cx="300" cy="40" r="1.2" fill="#7B6B5A" opacity="0.09"/>
  <circle cx="550" cy="65" r="4" fill="none" stroke="#7B6B5A" stroke-width="0.8" opacity="0.06"/>
  <circle cx="550" cy="65" r="1.5" fill="#7B6B5A" opacity="0.08"/>
  <circle cx="750" cy="50" r="3" fill="none" stroke="#7B6B5A" stroke-width="0.7" opacity="0.07"/>
  <circle cx="750" cy="50" r="1" fill="#7B6B5A" opacity="0.09"/>
  <circle cx="80" cy="380" r="3.5" fill="none" stroke="#7B6B5A" stroke-width="0.8" opacity="0.07"/>
  <circle cx="80" cy="380" r="1.2" fill="#7B6B5A" opacity="0.09"/>
  <circle cx="250" cy="420" r="4" fill="none" stroke="#7B6B5A" stroke-width="0.7" opacity="0.06"/>
  <circle cx="250" cy="420" r="1.5" fill="#7B6B5A" opacity="0.08"/>
  <circle cx="600" cy="400" r="3.5" fill="none" stroke="#7B6B5A" stroke-width="0.8" opacity="0.07"/>
  <circle cx="600" cy="400" r="1.2" fill="#7B6B5A" opacity="0.09"/>
  <circle cx="780" cy="430" r="3" fill="none" stroke="#7B6B5A" stroke-width="0.7" opacity="0.06"/>
  <circle cx="780" cy="430" r="1" fill="#7B6B5A" opacity="0.08"/>
  <circle cx="420" cy="237" r="3" fill="none" stroke="#7B6B5A" stroke-width="0.6" opacity="0.05"/>
  <circle cx="420" cy="237" r="1" fill="#7B6B5A" opacity="0.06"/>
</svg>```.text

// Solder pads — Array of circular/square pads with drill holes for corner atmosphere
#let _solder-pads-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100">
  <rect x="10" y="10" width="12" height="12" rx="2" fill="#C87941" opacity="0.15"/>
  <circle cx="16" cy="16" r="2.5" fill="#FDF8F0"/>
  <rect x="30" y="10" width="12" height="12" rx="2" fill="#C87941" opacity="0.12"/>
  <circle cx="36" cy="16" r="2.5" fill="#FDF8F0"/>
  <rect x="50" y="10" width="12" height="12" rx="2" fill="#C87941" opacity="0.10"/>
  <circle cx="56" cy="16" r="2.5" fill="#FDF8F0"/>
  <circle cx="16" cy="40" r="6" fill="#C87941" opacity="0.14"/>
  <circle cx="16" cy="40" r="2.5" fill="#FDF8F0"/>
  <circle cx="36" cy="40" r="6" fill="#C87941" opacity="0.11"/>
  <circle cx="36" cy="40" r="2.5" fill="#FDF8F0"/>
  <circle cx="56" cy="40" r="6" fill="#C87941" opacity="0.09"/>
  <circle cx="56" cy="40" r="2.5" fill="#FDF8F0"/>
  <rect x="10" y="60" width="12" height="12" rx="2" fill="#D4A843" opacity="0.12"/>
  <circle cx="16" cy="66" r="2.5" fill="#FDF8F0"/>
  <rect x="30" y="60" width="12" height="12" rx="2" fill="#D4A843" opacity="0.10"/>
  <circle cx="36" cy="66" r="2.5" fill="#FDF8F0"/>
</svg>```.text

// Component outline — IC chip outline with pin labels (DIP package silhouette)
// Used on title-slide and ending-slide as bookending motif
#let _component-outline-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="200" height="160" viewBox="0 0 200 160">
  <rect x="40" y="20" width="120" height="120" rx="3" fill="none" stroke="#7B6B5A" stroke-width="1.5" opacity="0.15"/>
  <path d="M40,75 A5,5 0 0,1 40,85" fill="none" stroke="#7B6B5A" stroke-width="1.2" opacity="0.12"/>
  <line x1="20" y1="35" x2="40" y2="35" stroke="#C87941" stroke-width="2" opacity="0.18"/>
  <line x1="20" y1="55" x2="40" y2="55" stroke="#C87941" stroke-width="2" opacity="0.16"/>
  <line x1="20" y1="75" x2="40" y2="75" stroke="#C87941" stroke-width="2" opacity="0.14"/>
  <line x1="20" y1="95" x2="40" y2="95" stroke="#C87941" stroke-width="2" opacity="0.16"/>
  <line x1="20" y1="115" x2="40" y2="115" stroke="#C87941" stroke-width="2" opacity="0.18"/>
  <line x1="20" y1="125" x2="40" y2="125" stroke="#C87941" stroke-width="2" opacity="0.14"/>
  <line x1="160" y1="35" x2="180" y2="35" stroke="#C87941" stroke-width="2" opacity="0.18"/>
  <line x1="160" y1="55" x2="180" y2="55" stroke="#C87941" stroke-width="2" opacity="0.16"/>
  <line x1="160" y1="75" x2="180" y2="75" stroke="#C87941" stroke-width="2" opacity="0.14"/>
  <line x1="160" y1="95" x2="180" y2="95" stroke="#C87941" stroke-width="2" opacity="0.16"/>
  <line x1="160" y1="115" x2="180" y2="115" stroke="#C87941" stroke-width="2" opacity="0.18"/>
  <line x1="160" y1="125" x2="180" y2="125" stroke="#C87941" stroke-width="2" opacity="0.14"/>
  <rect x="60" y="55" width="80" height="50" rx="2" fill="#7B6B5A" opacity="0.05"/>
</svg>```.text

// PCB edge frame — Board outline with corner mounting holes and edge connectors
// Used on title-slide and ending-slide as bookending motif
#let _pcb-frame-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <rect x="20" y="15" width="800" height="444" rx="4" fill="none" stroke="#E0D5C5" stroke-width="2" opacity="0.7"/>
  <rect x="25" y="20" width="790" height="434" rx="3" fill="none" stroke="#C87941" stroke-width="1" opacity="0.3"/>
  <circle cx="40" cy="35" r="8" fill="none" stroke="#7B6B5A" stroke-width="1.5" opacity="0.25"/>
  <circle cx="40" cy="35" r="3" fill="#7B6B5A" opacity="0.15"/>
  <circle cx="800" cy="35" r="8" fill="none" stroke="#7B6B5A" stroke-width="1.5" opacity="0.25"/>
  <circle cx="800" cy="35" r="3" fill="#7B6B5A" opacity="0.15"/>
  <circle cx="40" cy="439" r="8" fill="none" stroke="#7B6B5A" stroke-width="1.5" opacity="0.25"/>
  <circle cx="40" cy="439" r="3" fill="#7B6B5A" opacity="0.15"/>
  <circle cx="800" cy="439" r="8" fill="none" stroke="#7B6B5A" stroke-width="1.5" opacity="0.25"/>
  <circle cx="800" cy="439" r="3" fill="#7B6B5A" opacity="0.15"/>
  <rect x="360" y="15" width="120" height="8" rx="2" fill="#D4A843" opacity="0.15"/>
  <rect x="370" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="385" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="400" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="415" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="430" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="445" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
  <rect x="460" y="17" width="8" height="4" rx="1" fill="#D4A843" opacity="0.25"/>
</svg>```.text

// PCB title trace — decorative copper traces for title slide connecting to center
#let _pcb-title-trace-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <path d="M30,237 L80,237 L110,200 L200,200" fill="none" stroke="#C87941" stroke-width="2.5" opacity="0.20"/>
  <circle cx="200" cy="200" r="5" fill="#C87941" opacity="0.15"/>
  <circle cx="200" cy="200" r="2" fill="#FDF8F0"/>
  <path d="M30,280 L60,280 L90,310 L160,310 L180,290" fill="none" stroke="#C87941" stroke-width="2" opacity="0.15"/>
  <circle cx="180" cy="290" r="4" fill="#C87941" opacity="0.12"/>
  <circle cx="180" cy="290" r="1.5" fill="#FDF8F0"/>
  <path d="M810,200 L760,200 L730,237 L680,237" fill="none" stroke="#C87941" stroke-width="2.5" opacity="0.20"/>
  <circle cx="680" cy="237" r="5" fill="#C87941" opacity="0.15"/>
  <circle cx="680" cy="237" r="2" fill="#FDF8F0"/>
  <path d="M810,310 L780,310 L750,280 L700,280" fill="none" stroke="#C87941" stroke-width="2" opacity="0.15"/>
  <circle cx="700" cy="280" r="4" fill="#C87941" opacity="0.12"/>
  <circle cx="700" cy="280" r="1.5" fill="#FDF8F0"/>
  <path d="M200,200 L250,200 L270,220" fill="none" stroke="#D4A843" stroke-width="1.5" opacity="0.12"/>
  <path d="M680,237 L630,237 L610,257" fill="none" stroke="#D4A843" stroke-width="1.5" opacity="0.12"/>
</svg>```.text

// Edge connector — Left panel styling for new-section-slide
#let _edge-connector-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="60" height="474" viewBox="0 0 60 474">
  <rect x="0" y="0" width="60" height="474" fill="#A8B5A0" opacity="0.12"/>
  <rect x="50" y="0" width="10" height="474" fill="#C87941" opacity="0.08"/>
  <rect x="15" y="40" width="25" height="10" rx="2" fill="#D4A843" opacity="0.30"/>
  <rect x="15" y="65" width="25" height="10" rx="2" fill="#D4A843" opacity="0.25"/>
  <rect x="15" y="90" width="25" height="10" rx="2" fill="#D4A843" opacity="0.30"/>
  <rect x="15" y="115" width="25" height="10" rx="2" fill="#D4A843" opacity="0.25"/>
  <rect x="15" y="140" width="25" height="10" rx="2" fill="#D4A843" opacity="0.30"/>
  <rect x="15" y="340" width="25" height="10" rx="2" fill="#D4A843" opacity="0.25"/>
  <rect x="15" y="365" width="25" height="10" rx="2" fill="#D4A843" opacity="0.30"/>
  <rect x="15" y="390" width="25" height="10" rx="2" fill="#D4A843" opacity="0.25"/>
  <rect x="15" y="415" width="25" height="10" rx="2" fill="#D4A843" opacity="0.30"/>
</svg>```.text

// Trace divider — SVG separator mimicking copper trace with vias
#let _trace-divider-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="400" height="12" viewBox="0 0 400 12">
  <line x1="0" y1="6" x2="120" y2="6" stroke="#C87941" stroke-width="2" opacity="0.4"/>
  <circle cx="130" cy="6" r="4" fill="none" stroke="#C87941" stroke-width="1.2" opacity="0.5"/>
  <circle cx="130" cy="6" r="1.5" fill="#C87941" opacity="0.5"/>
  <line x1="140" y1="6" x2="200" y2="6" stroke="#C87941" stroke-width="2" opacity="0.4"/>
  <circle cx="210" cy="6" r="3.5" fill="none" stroke="#7B6B5A" stroke-width="1" opacity="0.4"/>
  <circle cx="210" cy="6" r="1.2" fill="#7B6B5A" opacity="0.4"/>
  <line x1="220" y1="6" x2="270" y2="6" stroke="#C87941" stroke-width="2" opacity="0.4"/>
  <circle cx="280" cy="6" r="4" fill="none" stroke="#C87941" stroke-width="1.2" opacity="0.5"/>
  <circle cx="280" cy="6" r="1.5" fill="#C87941" opacity="0.5"/>
  <line x1="290" y1="6" x2="400" y2="6" stroke="#C87941" stroke-width="2" opacity="0.4"/>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Render circuit trace background overlay
#let circuit-trace-bg() = {
  image(bytes(_circuit-trace-svg), width: 100%, height: 100%)
}

/// Render via pattern background overlay
#let via-pattern-bg() = {
  image(bytes(_via-pattern-svg), width: 100%, height: 100%)
}

/// Render solder pads corner decoration
#let solder-pads-corner(width: 80pt) = {
  image(bytes(_solder-pads-svg), width: width)
}

/// Render component outline decoration
#let component-outline(width: 160pt) = {
  image(bytes(_component-outline-svg), width: width)
}

/// Render PCB frame overlay
#let pcb-frame() = {
  image(bytes(_pcb-frame-svg), width: 100%, height: 100%)
}

/// Render PCB title traces overlay
#let pcb-title-traces() = {
  image(bytes(_pcb-title-trace-svg), width: 100%, height: 100%)
}

/// Render edge connector panel
#let edge-connector() = {
  image(bytes(_edge-connector-svg), width: 100%, height: 100%)
}

/// Render trace divider
#let trace-divider(width: 70%) = {
  std.align(center, box(width: width, image(bytes(_trace-divider-svg), width: width, height: 10pt)))
}


// ═══ 1. Slide Functions ═══

/// Standard content slide — substrate bg, copper trace header accent, via pattern atmosphere, corner solder pads
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.8em, top: 0.6em, bottom: 0.2em))
    set std.align(horizon + left)
    stack(
      spacing: 0.8em,
      {
        set text(fill: palette.dark-text, size: 1.3em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Copper trace accent bar under title
      box(width: 48pt, height: 2.5pt, fill: palette.copper, radius: 1pt),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.8em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.body-text, size: 0.6em)
    grid(columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Via marker as separator
        box(width: 8pt, height: 8pt,
          place(center + horizon, circle(radius: 3pt, fill: none, stroke: 0.8pt + palette.copper)) +
          place(center + horizon, circle(radius: 1pt, fill: palette.copper))
        )
      },
      {
        set std.align(right)
        context text(fill: palette.via, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number]
      },
    )
  }
  // Background decoration: via pattern + circuit traces + corner solder pads
  let bg-decoration = {
    place(top + left, box(width: 100%, height: 100%, via-pattern-bg()))
    place(top + left, box(width: 100%, height: 100%, circuit-trace-bg()))
    place(top + right, dx: -8pt, dy: 8pt, solder-pads-corner(width: 70pt))
    place(bottom + left, dx: 8pt, dy: -8pt, solder-pads-corner(width: 60pt))
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
      background: bg-decoration,
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide — Full PCB board frame with mounting holes, circuit traces connecting to title, component outlines
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Substrate background
    place(top + left, block(width: 100%, height: 100%, fill: palette.substrate))
    // Via pattern atmosphere
    place(top + left, box(width: 100%, height: 100%, via-pattern-bg()))
    // PCB frame with mounting holes
    place(top + left, box(width: 100%, height: 100%, pcb-frame()))
    // Copper traces connecting to center
    place(top + left, box(width: 100%, height: 100%, pcb-title-traces()))
    // Component outline top-right
    place(top + right, dx: -40pt, dy: 30pt, component-outline(width: 140pt))
    // Component outline bottom-left
    place(bottom + left, dx: 30pt, dy: -30pt, component-outline(width: 120pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.4em, weight: "bold", fill: palette.dark-text, info.title)
      #v(0.2em)
      // Copper trace accent bar
      #std.align(center, box(width: 80pt, height: 3pt, fill: palette.copper, radius: 1.5pt))
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1.05em, fill: palette.copper, weight: "medium", info.subtitle)
        v(0.5em)
      }
      // Author
      #if info.author != none {
        text(size: 1em, fill: palette.dark-text, weight: "regular", info.author)
        v(0.25em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.via, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.15em)
        text(size: 0.8em, fill: palette.body-text)[#utils.display-info-date(self)]
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

/// New section slide — Left panel styled as PCB edge connector, section number in solder pad
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
    // Substrate background
    place(top + left, block(width: 100%, height: 100%, fill: palette.substrate))
    // Via pattern
    place(top + left, box(width: 100%, height: 100%, via-pattern-bg()))
    // Left edge connector panel
    place(top + left, box(width: 60pt, height: 100%, edge-connector()))
    // Content area
    pad(left: 6em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in solder pad shape
      #box(
        width: 50pt, height: 50pt,
        fill: palette.copper.lighten(80%),
        stroke: 2pt + palette.copper,
        radius: 25pt,
      )[
        #set std.align(center + horizon)
        #text(size: 1.8em, fill: palette.copper, weight: "bold")[
          #utils.display-current-heading-number(depth: 1, numbering: "1")
        ]
      ]
      #v(0.5em)
      // Section title
      #set text(fill: palette.dark-text, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.3em)
      // Copper accent bar
      #box(width: 60pt, height: 3pt, fill: palette.copper, radius: 1.5pt)
      #v(1fr)
    ]
    // Bottom border (PCB edge)
    place(bottom + left, block(width: 100%, height: 2pt, fill: palette.border))
  }
  touying-slide(self: self, main-body)
})

/// Outline slide — Clean TOC with via bullet markers
#let outline-slide(title: [Outline], enum-args: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      header: none,
      footer: none,
      margin: 0pt,
    ),
  )
  let main-body = {
    // Substrate background
    place(top + left, block(width: 100%, height: 100%, fill: palette.substrate))
    // Via pattern
    place(top + left, box(width: 100%, height: 100%, via-pattern-bg()))
    // Content
    pad(x: 5em, top: 2.8em, bottom: 1.8em)[
      // Title
      #text(size: 1.8em, weight: "bold", fill: palette.dark-text, title)
      #v(0.3em)
      #box(width: 50pt, height: 2.5pt, fill: palette.copper, radius: 1pt)
      #v(1em)
      // TOC entries
      #set text(fill: palette.body-text, size: 1.1em)
      #context {
        let headings = query(heading.where(level: 1))
        for (idx, h) in headings.enumerate() {
          stack(dir: ltr, spacing: 10pt,
            // Via bullet
            box(width: 12pt, height: 12pt,
              place(center + horizon, circle(radius: 5pt, fill: none, stroke: 1.2pt + palette.copper)) +
              place(center + horizon, circle(radius: 2pt, fill: palette.copper))
            ),
            text(fill: palette.dark-text, weight: "medium", h.body),
          )
          v(0.6em)
        }
      }
    ]
  }
  touying-slide(self: self, main-body)
})

/// Focus slide — Copper background, cream text, circuit trace border
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
    // Copper background
    place(top + left, block(width: 100%, height: 100%, fill: palette.copper))
    // Circuit trace pattern (subtle on copper)
    place(top + left, box(width: 100%, height: 100%, circuit-trace-bg()))
    // PCB frame border
    place(top + left, box(width: 100%, height: 100%, pcb-frame()))
    // Center content
    place(center + horizon,
      block(width: 100%, inset: (x: 1em))[
        #set std.align(center)
        #set text(fill: palette.substrate, size: 1.4em, weight: "bold")
        #body
        #v(0.5em)
        #std.align(center, box(width: 60pt, height: 2.5pt, fill: palette.substrate.transparentize(40%), radius: 1pt))
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide — Bookend with title: PCB frame, traces, component outlines
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
    // Substrate background
    place(top + left, block(width: 100%, height: 100%, fill: palette.substrate))
    // Via pattern
    place(top + left, box(width: 100%, height: 100%, via-pattern-bg()))
    // PCB frame
    place(top + left, box(width: 100%, height: 100%, pcb-frame()))
    // Copper traces
    place(top + left, box(width: 100%, height: 100%, pcb-title-traces()))
    // Component outlines
    place(top + right, dx: -40pt, dy: 30pt, component-outline(width: 130pt))
    place(bottom + left, dx: 30pt, dy: -30pt, component-outline(width: 110pt))
    // Center content
    set std.align(center + horizon)
    block(width: 65%)[
      #set std.align(center)
      // Copper accent bar above
      #box(width: 60pt, height: 3pt, fill: palette.copper, radius: 1.5pt)
      #v(0.7em)
      // Main text
      #text(size: 2.4em, weight: "bold", fill: palette.dark-text, body)
      #v(0.4em)
      // Trace divider below
      #trace-divider(width: 50%)
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ 2. Reusable Components ═══

/// IC card — Card styled like IC chip: pins on left/right edges, content in center
#let ic-card(title, body, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + palette.border,
    inset: (x: 1.4em, y: 0.8em),
    radius: 3pt,
  )[
    // Left "pin" markers
    #place(top + left, dx: -1.4em, dy: 0.4em,
      // Decorative IC-pin column; keep the vertical rhythm explicit.
      stack(spacing: 0.8em,
        box(width: 8pt, height: 3pt, fill: accent),
        box(width: 8pt, height: 3pt, fill: accent),
        box(width: 8pt, height: 3pt, fill: accent),
      ))
    // Right "pin" markers
    #place(top + right, dx: 1.4em, dy: 0.4em,
      // Decorative IC-pin column; keep the vertical rhythm explicit.
      stack(spacing: 0.8em,
        box(width: 8pt, height: 3pt, fill: accent),
        box(width: 8pt, height: 3pt, fill: accent),
        box(width: 8pt, height: 3pt, fill: accent),
      ))
    // Notch indicator (IC orientation mark)
    #place(top + left, dx: -0.2em, dy: -0.4em,
      circle(radius: 3pt, fill: none, stroke: 0.8pt + accent))
    #text(weight: "bold", fill: palette.dark-text, size: 0.92em, title)
    #v(5pt)
    #set text(fill: palette.body-text, size: 0.82em)
    #set par(spacing: 0.35em)
    #body
    #lazy-v(1fr)
  ]
}

/// Trace box — Left-bordered callout with copper trace styling
#let trace-box(title, body, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1em, y: 0.55em),
    radius: (right: 3pt),
  )[
    // Copper trace marker
    #stack(dir: ltr, spacing: 6pt,
      box(width: 12pt, height: 2.5pt, fill: accent, radius: 1pt),
      text(weight: "bold", fill: palette.dark-text, size: 0.92em, title),
    )
    #set text(fill: palette.body-text, size: 0.82em)
    #set par(spacing: 0.35em)
    #body
    #lazy-v(1fr)
  ]
}

/// Pad stat — KPI in a circular solder pad shape
#let pad-stat(value, label, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 0.8em, y: 0.35em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      box(width: 10pt, height: 10pt,
        place(center + horizon, circle(radius: 5pt, fill: none, stroke: 1.5pt + accent)) +
        place(center + horizon, circle(radius: 2pt, fill: accent))
      ),
      // Large value
      text(fill: accent, size: 1.7em, weight: "bold", value),
      // Label
      text(fill: palette.body-text, size: 0.72em, weight: "medium", upper(label)),
      lazy-v(1fr),
    )
    // Circular pad indicator
  ]
}

/// Signal quote — Quote with oscilloscope-wave left border
#let signal-quote(quote-text, author, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.pad-fill,
    stroke: (left: 3pt + accent, rest: 1pt + palette.border),
    inset: (x: 1.2em, y: 0.9em),
    radius: (right: 3pt),
  )[
    // Wave indicator
    #place(top + left, dx: -0.6em, dy: 0em,
      text(fill: accent, size: 1.2em)[~])
    #v(0.1em)
    #set text(fill: palette.dark-text, size: 0.88em, style: "italic")
    #set par(spacing: 0.35em)
    #quote-text
    #if author != none {
      v(0.4em)
      set text(fill: palette.via, size: 0.78em, style: "normal", weight: "medium")
      [--- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Component card — Card with component outline (resistor/capacitor symbol) header
#let component-card(title, body, accent: palette.copper) = {
  block(
    width: 100%,
    stroke: 1pt + palette.border,
    radius: 4pt,
    clip: true,
  )[
    #stack(spacing: 0pt,
      // Header bar with component symbol hint
      block(width: 100%, fill: palette.pad-fill, inset: (x: 0.9em, y: 0.5em))[
        #stack(dir: ltr, spacing: 8pt,
          // Resistor zigzag symbol
          box(width: 18pt, height: 8pt,
            place(horizon,
              line(start: (0pt, 4pt), end: (3pt, 0pt), stroke: 0.8pt + accent) +
              line(start: (3pt, 0pt), end: (6pt, 8pt), stroke: 0.8pt + accent) +
              line(start: (6pt, 8pt), end: (9pt, 0pt), stroke: 0.8pt + accent) +
              line(start: (9pt, 0pt), end: (12pt, 8pt), stroke: 0.8pt + accent) +
              line(start: (12pt, 8pt), end: (15pt, 4pt), stroke: 0.8pt + accent)
            )
          ),
          text(weight: "bold", fill: palette.dark-text, size: 0.88em, title),
        )
      ],
      // Body
      block(width: 100%, fill: palette.card-bg, inset: (x: 0.9em, y: 0.5em))[
        #set text(fill: palette.body-text, size: 0.78em)
        #set par(spacing: 0.35em)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// Solder tag — Small tag shaped like a rounded solder pad
#let solder-tag(content, color: palette.copper) = {
  box(
    fill: color.lighten(85%),
    stroke: 1.2pt + color.transparentize(40%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 10pt,
  )[
    #text(fill: color, size: 0.72em, weight: "semibold", content)
  ]
}

/// Bus entry — Timeline with data bus lines as connector
#let bus-entry(step, title, body, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1pt + palette.border,
    inset: (x: 1em, y: 0.45em),
    radius: 3pt,
  )[
    #stack(dir: ltr, spacing: 10pt,
      // Step number in pad
      box(width: 28pt, height: 28pt,
        fill: accent.lighten(85%),
        stroke: 1.5pt + accent,
        radius: 14pt,
      )[
        #set std.align(center + horizon)
        #text(fill: accent, size: 0.85em, weight: "bold", step)
      ],
      // Content
      text(fill: palette.body-text, size: 0.74em)[
        #set par(spacing: 0.35em)
        #stack(
          spacing: 0.8em,
          text(weight: "bold", fill: palette.dark-text, size: 1.2em, title),
          body,
        )
      ],
    )
    // Bus lines at bottom
    #place(bottom + left, dx: 0pt, dy: 0.5em,
      stack(dir: ltr, spacing: 3pt,
        box(width: 20pt, height: 1.5pt, fill: accent.transparentize(60%)),
        box(width: 20pt, height: 1.5pt, fill: accent.transparentize(70%)),
        box(width: 20pt, height: 1.5pt, fill: accent.transparentize(80%)),
      ))
    #lazy-v(1fr)
  ]
}

/// Datasheet table — Technical table with PCB-green header and substrate rows
#let datasheet-table(align: center + horizon, headers, rows) = {
  set text(size: 0.72em)
  table(
    columns: headers.len() * (1fr,),
    fill: (_, row) => if row == 0 { palette.solder.lighten(60%) }
      else if calc.odd(row) { palette.card-bg } else { palette.pad-fill },
    stroke: 0.5pt + palette.border,
    inset: (x: 0.6em, y: 0.3em),
    align: align,
    table.header(..headers.map(h => text(weight: "bold", fill: palette.dark-text, size: 0.8em, h))),
    ..rows.flatten(),
  )
}

/// Module card — Card with PCB module outline (rectangular with corner notches)
#let module-card(title, body, accent: palette.copper) = {
  block(
    width: 100%,
    fill: palette.card-bg,
    stroke: 1.5pt + palette.border,
    inset: (x: 1em, y: 0.55em),
    radius: 2pt,
  )[
    // Corner notch indicators
    #place(top + left, dx: -0.6em, dy: -0.5em,
      box(width: 6pt, height: 6pt, fill: palette.pad-fill, stroke: 0.8pt + accent))
    #place(top + right, dx: 0.6em, dy: -0.5em,
      box(width: 6pt, height: 6pt, fill: palette.pad-fill, stroke: 0.8pt + accent))
    #place(bottom + left, dx: -0.6em, dy: 0.5em,
      box(width: 6pt, height: 6pt, fill: palette.pad-fill, stroke: 0.8pt + accent))
    #place(bottom + right, dx: 0.6em, dy: 0.5em,
      box(width: 6pt, height: 6pt, fill: palette.pad-fill, stroke: 0.8pt + accent))
    // Title with module icon
    #stack(dir: ltr, spacing: 8pt,
      box(width: 10pt, height: 10pt, fill: none, stroke: 1pt + accent, radius: 1pt)[
        #set std.align(center + horizon)
        #box(width: 4pt, height: 4pt, fill: accent)
      ],
      text(weight: "bold", fill: palette.dark-text, size: 0.92em, title),
    )
    #v(5pt)
    #set text(fill: palette.body-text, size: 0.75em)
    #set par(spacing: 0.35em)
    #body
    #lazy-v(1fr)
  ]
}


// ═══ 3. Theme Entry Point ═══

#let copper-circuit-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 20pt, fill: palette.body-text)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.substrate,
      margin: (top: 2.7em, bottom: 0.95em, x: 2.2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.copper,
      neutral-lightest: palette.card-bg,
      neutral-darkest: palette.dark-text,
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
