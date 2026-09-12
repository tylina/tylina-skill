// Gauge Panel Theme — Analog instrument control panel aesthetic
// Light warm gray background with deep graphite text, steel blue accent, warm copper highlights
// Features: measurement-grid SVG atmosphere, gauge-dial decorations, ruler-tick dividers
// Perfect for project reviews, experiment reports, data-focused dashboard presentations
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// === Color Palette (Direct -- Rich Theme) ===

#let palette = (
  bg: rgb("#F5F4F2"),
  ink: rgb("#2D2D2D"),
  accent: rgb("#4A6FA5"),
  copper: rgb("#B87333"),
  ink-muted: rgb("#2D2D2D").transparentize(30%),
  bg-card: rgb("#FFFFFF"),
  grid-faint: rgb("#2D2D2D").transparentize(92%),
  border-light: rgb("#2D2D2D").transparentize(80%),
  success: rgb("#4A8C5C"),
  warning: rgb("#D4A943"),
  danger: rgb("#C0504D"),
)


// === SVG Definitions ===

// Measurement-grid SVG — subtle oscilloscope-style grid with tick marks (background atmosphere)
#let _measurement-grid-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="840" height="474" viewBox="0 0 840 474">
  <line x1="84" y1="0" x2="84" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="168" y1="0" x2="168" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="252" y1="0" x2="252" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="336" y1="0" x2="336" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="420" y1="0" x2="420" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="504" y1="0" x2="504" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="588" y1="0" x2="588" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="672" y1="0" x2="672" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="756" y1="0" x2="756" y2="474" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="47" x2="840" y2="47" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="94" x2="840" y2="94" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="142" x2="840" y2="142" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="189" x2="840" y2="189" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="237" x2="840" y2="237" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="284" x2="840" y2="284" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="332" x2="840" y2="332" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="379" x2="840" y2="379" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="0" y1="427" x2="840" y2="427" stroke="#2D2D2D" stroke-width="0.3" opacity="0.07"/>
  <line x1="42" y1="0" x2="42" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="84" y1="0" x2="84" y2="10" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="126" y1="0" x2="126" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="168" y1="0" x2="168" y2="10" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="210" y1="0" x2="210" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="252" y1="0" x2="252" y2="10" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="294" y1="0" x2="294" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="336" y1="0" x2="336" y2="10" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="378" y1="0" x2="378" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="420" y1="0" x2="420" y2="10" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="462" y1="0" x2="462" y2="6" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="0" y1="47" x2="6" y2="47" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="0" y1="94" x2="10" y2="94" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="0" y1="142" x2="6" y2="142" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="0" y1="189" x2="10" y2="189" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="0" y1="237" x2="6" y2="237" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="0" y1="284" x2="10" y2="284" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="0" y1="332" x2="6" y2="332" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
  <line x1="0" y1="379" x2="10" y2="379" stroke="#2D2D2D" stroke-width="0.7" opacity="0.1"/>
  <line x1="0" y1="427" x2="6" y2="427" stroke="#2D2D2D" stroke-width="0.5" opacity="0.1"/>
</svg>```.text

// Gauge-dial SVG — semi-circular arc with tick marks (for title/ending and gauge-card)
#let _gauge-dial-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="120" height="70" viewBox="0 0 120 70">
  <path d="M 10 65 A 50 50 0 0 1 110 65" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
  <line x1="14" y1="52" x2="20" y2="48" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="22" y1="36" x2="29" y2="34" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="38" y1="22" x2="43" y2="18" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="57" y1="14" x2="60" y2="8" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="77" y1="18" x2="82" y2="22" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="91" y1="34" x2="98" y2="36" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="100" y1="48" x2="106" y2="52" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
  <line x1="18" y1="44" x2="22" y2="41" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <line x1="30" y1="29" x2="34" y2="26" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <line x1="47" y1="17" x2="50" y2="13" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <line x1="70" y1="13" x2="67" y2="17" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <line x1="86" y1="26" x2="90" y2="29" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <line x1="98" y1="41" x2="102" y2="44" stroke="currentColor" stroke-width="0.8" stroke-linecap="round"/>
  <circle cx="60" cy="65" r="3" fill="currentColor"/>
</svg>```.text

// Ruler-tick SVG — horizontal ruler marks (for panel-section divider)
#let _ruler-tick-svg = ``` <svg xmlns="http://www.w3.org/2000/svg" width="300" height="10" viewBox="0 0 300 10">
  <line x1="0" y1="5" x2="300" y2="5" stroke="currentColor" stroke-width="1" opacity="0.4"/>
  <line x1="0" y1="2" x2="0" y2="8" stroke="currentColor" stroke-width="1.2"/>
  <line x1="15" y1="3" x2="15" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="30" y1="2" x2="30" y2="8" stroke="currentColor" stroke-width="0.8"/>
  <line x1="45" y1="3" x2="45" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="60" y1="1" x2="60" y2="9" stroke="currentColor" stroke-width="1.2"/>
  <line x1="75" y1="3" x2="75" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="90" y1="2" x2="90" y2="8" stroke="currentColor" stroke-width="0.8"/>
  <line x1="105" y1="3" x2="105" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="120" y1="1" x2="120" y2="9" stroke="currentColor" stroke-width="1.2"/>
  <line x1="135" y1="3" x2="135" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="150" y1="2" x2="150" y2="8" stroke="currentColor" stroke-width="0.8"/>
  <line x1="165" y1="3" x2="165" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="180" y1="1" x2="180" y2="9" stroke="currentColor" stroke-width="1.2"/>
  <line x1="195" y1="3" x2="195" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="210" y1="2" x2="210" y2="8" stroke="currentColor" stroke-width="0.8"/>
  <line x1="225" y1="3" x2="225" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="240" y1="1" x2="240" y2="9" stroke="currentColor" stroke-width="1.2"/>
  <line x1="255" y1="3" x2="255" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="270" y1="2" x2="270" y2="8" stroke="currentColor" stroke-width="0.8"/>
  <line x1="285" y1="3" x2="285" y2="7" stroke="currentColor" stroke-width="0.6"/>
  <line x1="300" y1="2" x2="300" y2="8" stroke="currentColor" stroke-width="1.2"/>
</svg>```.text


// === SVG Rendering Helpers ===

/// Render the measurement grid background
#let measurement-grid() = {
  image(bytes(_measurement-grid-svg), width: 100%, height: 100%)
}

/// Render gauge dial with a given color
#let gauge-dial(color: palette.copper, width: 80pt) = {
  let svg = _gauge-dial-svg.replace("currentColor", color.to-hex())
  box(image(bytes(svg), width: width))
}

/// Render ruler-tick divider
#let ruler-tick(color: palette.copper, width: 100%) = {
  let svg = _ruler-tick-svg.replace("currentColor", color.to-hex())
  box(width: width, image(bytes(svg), width: width, height: 8pt))
}


// === 1. Slide Functions ===

/// Standard content slide -- warm gray bg, measurement-grid atmosphere, graphite text
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = {
    set std.align(top)
    show: components.cell.with(inset: (x: 1.5em, top: 0.4em, bottom: 0.1em))
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
      // Copper accent line under title
      block(width: 60pt, height: 2pt, fill: palette.copper),
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 1.5em, y: 0.4em))
    set std.align(horizon)
    set text(fill: palette.ink-muted, size: 0.65em)
    stack(dir: ltr, spacing: 8pt,
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      box(width: 4pt, height: 4pt, fill: palette.copper, radius: 2pt),
      context text(fill: palette.ink-muted, size: 0.9em)[#utils.slide-counter.display() / #utils.last-slide-number],
    )
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  let setting(body) = {
    show: std.align.with(self.store.align)
    body
  }
  touying-slide(self: self, setting: setting, ..args)
})

/// Title slide -- panel frame with gauge-dial SVG decorations
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    // Warm gray background
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Measurement grid atmosphere
    place(top + left, box(width: 100%, height: 100%, measurement-grid()))
    // Panel frame border
    place(center + horizon,
      rect(width: 99%, height: 97%,
        fill: none,
        stroke: (paint: palette.ink.transparentize(70%), thickness: 3pt)))
    place(center + horizon,
      rect(width: 96%, height: 94%,
        fill: none,
        stroke: (paint: palette.copper.transparentize(50%), thickness: 1pt)))
    // Gauge dial decorations (top corners)
    place(top + left, dx: 30pt, dy: 20pt, gauge-dial(color: palette.copper.transparentize(40%), width: 60pt))
    place(top + right, dx: -90pt, dy: 20pt, gauge-dial(color: palette.accent.transparentize(50%), width: 60pt))
    // Center content
    set std.align(center + horizon)
    pad(x: 5em)[
      // Title
      #text(size: 2.2em, weight: "bold", fill: palette.ink, info.title)
      #v(0.3em)
      // Copper accent line
      #std.align(center, block(width: 120pt, height: 2.5pt, fill: palette.copper))
      #v(0.5em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.accent, info.subtitle)
        v(0.4em)
      }
      // Author
      #if info.author != none {
        text(size: 0.95em, fill: palette.ink, weight: "regular", info.author)
        v(0.25em)
      }
      // Institution
      #if info.institution != none {
        text(size: 0.8em, fill: palette.ink-muted, info.institution)
        v(0.2em)
      }
      // Date
      #if info.date != none {
        v(0.2em)
        text(size: 0.8em, fill: palette.copper.darken(18%))[#utils.display-info-date(self)]
      }
    ]
    // Bottom gauge decoration
    place(bottom + center, dy: -20pt, gauge-dial(color: palette.copper.transparentize(30%), width: 100pt))
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

/// New section slide -- steel blue section number, graphite title, ruler-tick separator
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
    // Measurement grid
    place(top + left, box(width: 100%, height: 100%, measurement-grid()))
    // Content
    pad(left: 5em, right: 4em, top: 3em, bottom: 2em)[
      #v(1fr)
      // Section number in steel blue
      #text(size: 3em, fill: palette.accent, weight: "bold")[
        #utils.display-current-heading-number(depth: 1, numbering: "01")
      ]
      #v(0.3em)
      // Section title in graphite
      #set text(fill: palette.ink, size: 2em, weight: "bold")
      #utils.display-current-heading(level: 1, numbered: false)
      #v(0.4em)
      // Ruler-tick divider
      #ruler-tick(color: palette.copper, width: 200pt)
      #v(1fr)
    ]
    // Gauge dial at bottom-right
    place(bottom + right, dx: -40pt, dy: -30pt, gauge-dial(color: palette.copper.transparentize(50%), width: 70pt))
  }
  touying-slide(self: self, main-body)
})

/// Focus slide -- single statement, width-constrained, with instrument styling
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
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Measurement grid
    place(top + left, box(width: 100%, height: 100%, measurement-grid()))
    // Copper frame accent
    place(center + horizon,
      rect(width: 72%, height: 50%,
        fill: none,
        stroke: (paint: palette.copper.transparentize(40%), thickness: 1.5pt)))
    // Gauge decorations
    place(top + center, dy: 40pt, gauge-dial(color: palette.accent.transparentize(60%), width: 60pt))
    // Keep the statement in flow so Touying can measure the slide correctly.
    std.align(center + horizon,
      block(width: 60%, height: auto)[
        #set text(fill: palette.ink, size: 1.4em, weight: "bold")
        #set std.align(center)
        #stack(
          spacing: 0.8em,
          body,
          block(width: 80pt, height: 2pt, fill: palette.copper),
        )
      ]
    )
  }
  touying-slide(self: self, main-body)
})

/// Ending slide -- panel frame with gauge-dial decorations, thank you text
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
    // Measurement grid
    place(top + left, box(width: 100%, height: 100%, measurement-grid()))
    // Panel frame border (same as title)
    place(center + horizon,
      rect(width: 99%, height: 97%,
        fill: none,
        stroke: (paint: palette.ink.transparentize(70%), thickness: 3pt)))
    place(center + horizon,
      rect(width: 96%, height: 94%,
        fill: none,
        stroke: (paint: palette.copper.transparentize(50%), thickness: 1pt)))
    // Gauge dial decorations
    place(top + left, dx: 30pt, dy: 20pt, gauge-dial(color: palette.copper.transparentize(30%), width: 70pt))
    place(top + right, dx: -100pt, dy: 20pt, gauge-dial(color: palette.accent.transparentize(40%), width: 70pt))
    place(bottom + center, dy: -25pt, gauge-dial(color: palette.copper.transparentize(20%), width: 90pt))
    // Center content
    set std.align(center + horizon)
    block(width: 60%)[
      #set std.align(center)
      // Main text
      #text(size: 2.2em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      // Copper accent line
      #std.align(center, block(width: 140pt, height: 2.5pt, fill: palette.copper))
      #v(0.5em)
      // Ruler tick decoration
      #ruler-tick(color: palette.ink-muted, width: 160pt)
    ]
  }
  touying-slide(self: self, main-body)
})


// === 2. Reusable Components ===

/// Gauge card -- metric card with small arc/dial SVG indicator
#let gauge-card(label, value, unit: none, color: palette.accent) = {
  block(
    width: 100%,
    fill: palette.bg-card,
    stroke: (paint: palette.border-light, thickness: 0.75pt),
    inset: (x: 0.8em, y: 0.6em),
    radius: 4pt,
  )[
    #set std.align(center)
    #stack(
      spacing: 0.8em,
      gauge-dial(color: color, width: 50pt),
      {
        text(size: 1.6em, weight: "bold", fill: color, font: ("IBM Plex Mono", "Menlo"), value)
        if unit != none {
          h(2pt)
          text(size: 0.7em, fill: palette.ink-muted, unit)
        }
      },
      text(size: 0.72em, fill: palette.ink-muted, label),
      lazy-v(1fr),
    )
  ]
}

/// Reading block -- data readout with monospace number + label, NO border (typography-only)
#let reading-block(label, value, delta: none, color: palette.ink) = {
  block(width: 100%, inset: (x: 0.5em, y: 0.4em))[
    #set text(fill: palette.ink-muted, size: 0.72em)
    #stack(
      spacing: .8em,
      label,
      [
        #text(size: 1.5em, weight: "bold", fill: color, font: ("IBM Plex Mono", "Menlo"))[#value]
        #if delta != none {
          h(4pt)
          text(size: 0.7em, fill: palette.accent)[#delta]
        }
        #lazy-v(1fr)
      ]
    )
  ]
}

/// Panel section -- section header with horizontal gauge-mark SVG (ruler ticks)
#let panel-section(title) = {
  block(width: 100%)[
    #stack(
      spacing: 0.8em,
      text(fill: palette.ink, size: 1em, weight: "bold", title),
      ruler-tick(color: palette.copper, width: 100%),
    )
  ]
}

/// Meter tag -- inline status badge with colored dot indicator
#let meter-tag(content, color: palette.accent) = {
  let readable-color = color.darken(25%)
  box(
    fill: color.transparentize(90%),
    inset: (x: 0.6em, y: 0.25em),
    radius: 3pt,
  )[
    #box(width: 6pt, height: 6pt, fill: color, radius: 3pt)
    #h(4pt)
    #set text(fill: readable-color, size: 0.75em, weight: "semibold")
    #content
  ]
}

/// Dial divider -- SVG measurement-tick divider line
#let dial-divider(color: palette.copper, width: 80%) = {
  std.align(center, ruler-tick(color: color, width: width))
}

/// Instrument quote -- blockquote with copper left border (not a full box)
#let instrument-quote(quote, author: none) = {
  block(
    width: 100%,
    stroke: (left: (paint: palette.copper, thickness: 3pt)),
    inset: (left: 1.2em, y: 0.6em, right: 0.5em),
  )[
    #set text(fill: palette.ink, size: 0.88em, style: "italic")
    #quote
    #if author != none {
      v(0.2em)
      set text(fill: palette.copper.darken(18%), size: 0.78em, weight: "bold", style: "normal")
      [-- #author]
    }
    #lazy-v(1fr)
  ]
}

/// Data table wrap -- styled table wrapper with top accent line
#let data-table-wrap(body, accent: palette.accent) = {
  block(
    width: 100%,
    clip: true,
    radius: 4pt,
    stroke: (paint: palette.border-light, thickness: 0.75pt),
  )[
    #stack(
      spacing: 0pt,
      block(width: 100%, height: 3pt, fill: accent),
      block(width: 100%, fill: palette.bg-card, inset: (x: 0.6em, y: 0.5em), body),
    )
  ]
}


// === 3. Theme Entry Point ===

#let gauge-panel-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  show raw: set text(font: ("IBM Plex Mono", "Menlo"))
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
      primary: palette.accent,
      neutral-lightest: palette.bg,
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
