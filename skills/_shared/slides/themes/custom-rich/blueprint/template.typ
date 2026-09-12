// Blueprint Theme — Architectural blueprint aesthetic on light backgrounds
// Crisp blue technical drawing lines, dimension markers, grid references,
// corner registration marks, dashed construction lines. Engineering drawings
// meet modern design. White paper with blue linework. Technical precision + beauty.
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *


// ═══ Color Palette ═══

#let palette = (
  bg: rgb("#FAFCFF"),
  ink: rgb("#111827"),
  blue: rgb("#1D4ED8"),
  gray: rgb("#6B7280"),
  red: rgb("#DC2626"),
  wash: rgb("#EFF6FF"),
  blue-light: rgb("#1D4ED8").transparentize(80%),
  blue-faint: rgb("#1D4ED8").transparentize(92%),
  ink-muted: rgb("#111827").transparentize(55%),
  grid-line: rgb("#1D4ED8").transparentize(88%),
  construction: rgb("#1D4ED8").transparentize(70%),
)


// ═══ SVG Definitions ═══

// 1. Full-page blueprint grid — fine engineering grid with major/minor divisions
#let _blueprint-grid-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <defs>
    <pattern id="minor" width="48" height="48" patternUnits="userSpaceOnUse">
      <path d="M 48 0 L 0 0 0 48" fill="none" stroke="#1D4ED8" stroke-width="0.3" opacity="0.08"/>
    </pattern>
    <pattern id="major" width="192" height="192" patternUnits="userSpaceOnUse">
      <rect width="192" height="192" fill="url(#minor)"/>
      <path d="M 192 0 L 0 0 0 192" fill="none" stroke="#1D4ED8" stroke-width="0.6" opacity="0.15"/>
    </pattern>
  </defs>
  <rect width="960" height="540" fill="url(#major)"/>
  <!-- Grid reference marks along top edge -->
  <text x="96" y="12" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">A</text>
  <text x="288" y="12" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">B</text>
  <text x="480" y="12" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">C</text>
  <text x="672" y="12" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">D</text>
  <text x="864" y="12" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">E</text>
  <!-- Grid reference marks along left edge -->
  <text x="4" y="135" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">1</text>
  <text x="4" y="270" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">2</text>
  <text x="4" y="405" font-size="7" fill="#1D4ED8" opacity="0.25" font-family="monospace">3</text>
  <!-- Subtle crosshair center mark -->
  <line x1="475" y1="270" x2="485" y2="270" stroke="#1D4ED8" stroke-width="0.4" opacity="0.12"/>
  <line x1="480" y1="265" x2="480" y2="275" stroke="#1D4ED8" stroke-width="0.4" opacity="0.12"/>
</svg>```.text

// 2. Corner registration marks (for title/ending bookend effect)
#let _registration-marks-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <!-- Top-left corner mark -->
  <line x1="20" y1="20" x2="50" y2="20" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <line x1="20" y1="20" x2="20" y2="50" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <circle cx="20" cy="20" r="3" fill="none" stroke="#1D4ED8" stroke-width="0.8" opacity="0.5"/>
  <!-- Top-right corner mark -->
  <line x1="940" y1="20" x2="910" y2="20" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <line x1="940" y1="20" x2="940" y2="50" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <circle cx="940" cy="20" r="3" fill="none" stroke="#1D4ED8" stroke-width="0.8" opacity="0.5"/>
  <!-- Bottom-left corner mark -->
  <line x1="20" y1="520" x2="50" y2="520" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <line x1="20" y1="520" x2="20" y2="490" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <circle cx="20" cy="520" r="3" fill="none" stroke="#1D4ED8" stroke-width="0.8" opacity="0.5"/>
  <!-- Bottom-right corner mark -->
  <line x1="940" y1="520" x2="910" y2="520" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <line x1="940" y1="520" x2="940" y2="490" stroke="#1D4ED8" stroke-width="1.2" opacity="0.7"/>
  <circle cx="940" cy="520" r="3" fill="none" stroke="#1D4ED8" stroke-width="0.8" opacity="0.5"/>
  <!-- Center crosshair -->
  <line x1="470" y1="270" x2="490" y2="270" stroke="#1D4ED8" stroke-width="0.6" opacity="0.4"/>
  <line x1="480" y1="260" x2="480" y2="280" stroke="#1D4ED8" stroke-width="0.6" opacity="0.4"/>
  <circle cx="480" cy="270" r="6" fill="none" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
</svg>```.text

// 3. Dimension arrow (horizontal) — technical measurement indicator
#let _dimension-arrow-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 20" preserveAspectRatio="none">
  <line x1="8" y1="10" x2="192" y2="10" stroke="#DC2626" stroke-width="0.8" opacity="0.7"/>
  <polygon points="5,10 12,7 12,13" fill="#DC2626" opacity="0.7"/>
  <polygon points="195,10 188,7 188,13" fill="#DC2626" opacity="0.7"/>
  <line x1="5" y1="3" x2="5" y2="17" stroke="#DC2626" stroke-width="0.6" opacity="0.5"/>
  <line x1="195" y1="3" x2="195" y2="17" stroke="#DC2626" stroke-width="0.6" opacity="0.5"/>
</svg>```.text

// 4. Construction lines — dashed diagonal guides
#let _construction-lines-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <line x1="0" y1="0" x2="960" y2="540" stroke="#1D4ED8" stroke-width="0.4" stroke-dasharray="8,12" opacity="0.06"/>
  <line x1="960" y1="0" x2="0" y2="540" stroke="#1D4ED8" stroke-width="0.4" stroke-dasharray="8,12" opacity="0.06"/>
  <line x1="480" y1="0" x2="480" y2="540" stroke="#1D4ED8" stroke-width="0.3" stroke-dasharray="4,8" opacity="0.05"/>
  <line x1="0" y1="270" x2="960" y2="270" stroke="#1D4ED8" stroke-width="0.3" stroke-dasharray="4,8" opacity="0.05"/>
  <!-- Golden ratio guides -->
  <line x1="594" y1="0" x2="594" y2="540" stroke="#1D4ED8" stroke-width="0.3" stroke-dasharray="3,9" opacity="0.04"/>
  <line x1="366" y1="0" x2="366" y2="540" stroke="#1D4ED8" stroke-width="0.3" stroke-dasharray="3,9" opacity="0.04"/>
</svg>```.text

// 5. Section divider — technical drawing section break with zone markers
#let _section-divider-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 24">
  <line x1="0" y1="12" x2="170" y2="12" stroke="#1D4ED8" stroke-width="1" opacity="0.6"/>
  <line x1="230" y1="12" x2="400" y2="12" stroke="#1D4ED8" stroke-width="1" opacity="0.6"/>
  <rect x="175" y="4" width="50" height="16" fill="none" stroke="#1D4ED8" stroke-width="1" opacity="0.5" rx="2"/>
  <circle cx="200" cy="12" r="3" fill="#1D4ED8" opacity="0.4"/>
  <!-- Extension ticks -->
  <line x1="0" y1="8" x2="0" y2="16" stroke="#1D4ED8" stroke-width="0.8" opacity="0.4"/>
  <line x1="400" y1="8" x2="400" y2="16" stroke="#1D4ED8" stroke-width="0.8" opacity="0.4"/>
  <line x1="100" y1="10" x2="100" y2="14" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <line x1="300" y1="10" x2="300" y2="14" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
</svg>```.text

// 6. Title frame — technical drawing border with title block zone
#let _title-frame-svg = ```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 540" preserveAspectRatio="none">
  <!-- Outer frame -->
  <rect x="16" y="16" width="928" height="508" fill="none" stroke="#1D4ED8" stroke-width="1.5" opacity="0.6"/>
  <!-- Inner frame -->
  <rect x="24" y="24" width="912" height="492" fill="none" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <!-- Title block zone (bottom-right) -->
  <rect x="640" y="460" width="296" height="52" fill="none" stroke="#1D4ED8" stroke-width="0.8" opacity="0.4"/>
  <line x1="640" y1="476" x2="936" y2="476" stroke="#1D4ED8" stroke-width="0.4" opacity="0.3"/>
  <line x1="780" y1="460" x2="780" y2="512" stroke="#1D4ED8" stroke-width="0.4" opacity="0.3"/>
  <!-- Corner ticks (fold marks) -->
  <line x1="48" y1="16" x2="48" y2="10" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <line x1="912" y1="16" x2="912" y2="10" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <line x1="16" y1="48" x2="10" y2="48" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <line x1="16" y1="492" x2="10" y2="492" stroke="#1D4ED8" stroke-width="0.5" opacity="0.3"/>
  <!-- Scale marker top-left -->
  <text x="28" y="38" font-size="6" fill="#1D4ED8" opacity="0.3" font-family="monospace">1:1</text>
</svg>```.text


// ═══ SVG Rendering Helpers ═══

/// Full-page blueprint grid background
#let blueprint-grid() = {
  place(top + left, image(bytes(_blueprint-grid-svg), width: 100%, height: 100%))
}

/// Construction lines overlay (diagonal + center guides)
#let construction-lines() = {
  place(top + left, image(bytes(_construction-lines-svg), width: 100%, height: 100%))
}

/// Corner registration marks (bookend element for title/ending)
#let registration-marks() = {
  place(top + left, image(bytes(_registration-marks-svg), width: 100%, height: 100%))
}

/// Title frame border (bookend element for title/ending)
#let title-frame() = {
  place(top + left, image(bytes(_title-frame-svg), width: 100%, height: 100%))
}

/// Dimension arrow (inline, configurable width)
#let dimension-arrow(width: 100%) = {
  box(width: width, image(bytes(_dimension-arrow-svg), width: width, height: 12pt))
}

/// Section divider with zone marker
#let section-divider(width: 70%) = {
  let svg = _section-divider-svg
  std.align(center, box(width: width, image(bytes(svg), width: width, height: 16pt)))
}

/// Grid reference label (small monospace zone identifier)
#let grid-ref(label) = {
  box(
    inset: (x: 4pt, y: 2pt),
    stroke: 0.5pt + palette.blue.transparentize(60%),
    radius: 2pt,
    text(size: 0.55em, fill: palette.blue, weight: "medium", font: "Menlo", label)
  )
}


// ═══ Reusable Components ═══

/// concept-card: Technical specification card with blue left border and zone reference
#let concept-card(title, body, zone: none) = {
  block(
    width: 100%,
    fill: palette.wash,
    stroke: (left: 2.5pt + palette.blue, rest: 0.5pt + palette.blue.transparentize(70%)),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 6pt,
        text(size: 0.85em, weight: "bold", fill: palette.blue, title),
        if zone != none { h(1fr); grid-ref(zone) },
      ),
      [
        #set text(size: 0.8em, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// insight-box: Highlighted insight with dimension arrow decoration
#let insight-box(body) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 1pt + palette.blue,
    inset: (x: 1em, y: 0.8em),
    radius: 3pt,
  )[
    #stack(spacing: .8em,
      dimension-arrow(width: 60pt),
      [
        #set text(size: 0.85em, weight: "medium", fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// stat-card: Large metric with technical measurement styling
#let stat-card(value, caption, unit: none) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: 0.5pt + palette.blue.transparentize(50%),
    inset: (x: 0.8em, y: 0.6em),
    radius: 2pt,
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 4pt,
        text(size: 2em, weight: "bold", fill: palette.blue, value),
        if unit != none { text(size: 0.8em, fill: palette.gray, baseline: -0.8em, unit) },
      ),
      block(width: 100%, height: 1pt, fill: palette.blue.transparentize(70%)),
      [
        #text(size: 0.65em, fill: palette.gray, weight: "medium", upper(caption))
        #lazy-v(1fr)
      ],
    )
  ]
}

/// spec-card: Technical specification block with header bar
#let spec-card(title, body, rev: none) = {
  block(width: 100%, radius: 3pt, clip: true, stroke: 0.5pt + palette.blue.transparentize(60%))[
    #stack(spacing: 0pt,
      block(fill: palette.blue, width: 100%, inset: (x: 0.8em, y: 0.4em))[
        #set text(fill: white, size: 0.75em, weight: "bold")
        #stack(dir: ltr, spacing: 1fr,
          title,
          if rev != none { text(size: 0.85em, weight: "regular")[Rev. #rev] },
        )
      ],
      block(fill: palette.bg, width: 100%, inset: (x: 0.8em, y: 0.6em))[
        #set text(size: 0.8em, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// dimension-box: Callout with dimension markers on sides (measurement metaphor)
#let dimension-box(title, body) = {
  block(width: 100%, inset: (x: 0.6em, y: 0.5em))[
    #stack(spacing: .8em,
      block(width: 100%, image(bytes(_dimension-arrow-svg), width: 100%, height: 8pt)),
      stack(spacing: .8em,
        text(size: 0.8em, weight: "bold", fill: palette.red, title),
        [
          #set text(size: 0.78em, fill: palette.ink)
          #body
          #lazy-v(1fr)
        ],
      ),
    )
  ]
}

/// quote-card: Technical quotation with SVG construction line decoration
#let quote-card(body, attribution: none) = {
  block(
    width: 100%,
    fill: palette.wash,
    inset: (x: 1.2em, y: 0.8em),
    radius: 2pt,
    stroke: (left: 3pt + palette.blue.transparentize(40%)),
  )[
    // Construction dash marker
    #place(top + right, dx: -0.5em, dy: 0.2em, grid-ref("REF"))
    #stack(spacing: .8em,
      [
        #set text(size: 1em, fill: palette.ink, style: "italic")
        #text(size: 2em, fill: palette.blue.transparentize(40%), baseline: -0.15em)[\u{201C}]
        #h(-0.2em)
        #body
      ],
      if attribution != none { text(size: 0.7em, fill: palette.gray, weight: "medium")[\u{2014} #attribution] },
      lazy-v(1fr),
    )
  ]
}

/// schematic-card: Blueprint-style info card with dashed border (construction drawing feel)
#let schematic-card(title, body) = {
  block(
    width: 100%,
    fill: palette.bg,
    stroke: (
      paint: palette.blue,
      thickness: 1pt,
      dash: "dashed",
    ),
    inset: (x: 1em, y: 0.7em),
    radius: 0pt,
  )[
    #stack(spacing: .8em,
      stack(dir: ltr, spacing: 4pt,
        box(circle(radius: 3pt, fill: palette.blue)),
        text(size: 0.8em, weight: "bold", fill: palette.blue, title),
      ),
      [
        #set text(size: 0.78em, fill: palette.ink)
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// callout-box: Warning/note with red accent (deviation from spec notation)
#let callout-box(title, body, accent: palette.red) = {
  block(
    width: 100%,
    fill: accent.transparentize(95%),
    stroke: (left: 3pt + accent, rest: 0.5pt + accent.transparentize(70%)),
    inset: (x: 1em, y: 0.7em),
    radius: (right: 3pt),
  )[
    #stack(spacing: .8em,
      text(size: 0.8em, weight: "bold", fill: accent, title),
      [
      #set text(size: 0.78em, fill: palette.ink)
      #body
      #lazy-v(1fr)
      ],
    )
  ]
}

/// blueprint-tag: Inline tag/badge element (zone identifier style)
#let blueprint-tag(label, accent: palette.blue) = {
  box(
    inset: (x: 6pt, y: 3pt),
    fill: accent.transparentize(88%),
    stroke: 0.5pt + accent.transparentize(50%),
    radius: 2pt,
    text(size: 0.65em, fill: accent, weight: "bold", upper(label))
  )
}

/// blueprint-divider: SVG-based section divider (not just line())
#let blueprint-divider() = {
  section-divider(width: 80%)
}


// ═══ Background Atmosphere ═══

/// Persistent background for content slides — grid + subtle construction lines
#let _content-atmosphere() = {
  blueprint-grid()
  construction-lines()
  // Small corner reference marks on content slides (subtle)
  place(top + right, dx: -1.2em, dy: 0.3em,
    text(size: 5pt, fill: palette.blue.transparentize(70%), font: "Menlo")[DWG])
  place(bottom + left, dx: 1.2em, dy: -0.2em,
    text(size: 5pt, fill: palette.blue.transparentize(70%), font: "Menlo")[SCL 1:1])
}


// ═══ Slide Functions ═══

/// slide: Content slide with blueprint grid atmosphere, blue header line
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
      spacing: .8em,
      {
        set text(fill: palette.ink, size: 1.4em, weight: "bold")
        if self.store.title != none {
          utils.call-or-display(self, self.store.title)
        } else {
          utils.display-current-heading(level: 2)
        }
      },
      // Technical accent line with endpoint marks
      {
        box(width: 80pt)[
          #line(length: 100%, stroke: 1.5pt + palette.blue)
          #place(left, dy: -2pt, circle(radius: 2pt, fill: palette.blue))
          #place(right, dy: -2pt, dx: -4pt, circle(radius: 2pt, fill: palette.blue))
        ]
      },
    )
  }
  let footer(self) = {
    set std.align(bottom)
    show: components.cell.with(inset: (x: 2em, y: 0.3em))
    set std.align(horizon)
    set text(fill: palette.gray, size: 0.6em)
    grid(
      columns: (1fr, auto, 1fr),
      {
        if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        // Small blueprint crosshair as center marker
        box(width: 8pt, height: 8pt)[
          #place(center + horizon, line(length: 8pt, stroke: 0.5pt + palette.blue))
          #place(center + horizon, rotate(90deg, line(length: 8pt, stroke: 0.5pt + palette.blue)))
        ]
      },
      {
        set std.align(right)
        context { text(fill: palette.gray, size: 0.85em, font: "Menlo")[#utils.slide-counter.display() / #utils.last-slide-number] }
      }
    )
  }
  let setting(body) = {
    show: std.align.with(self.store.align)
    _content-atmosphere()
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

/// title-slide: Full technical drawing frame with registration marks (bookend)
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    // Blueprint grid background
    blueprint-grid()
    // Title frame border (bookend element)
    title-frame()
    // Registration marks (bookend element)
    registration-marks()
    // Main content - centered
    set std.align(left + horizon)
    pad(left: 4.5em, right: 5em, top: 3em, bottom: 3em)[
      // Zone reference
      #grid-ref("TITLE-01")
      #v(0.8em)
      // Main title
      #{
        set par(leading: 0.6em)
        text(size: 2.6em, weight: "bold", fill: palette.ink, info.title)
      }
      #v(0.4em)
      // Dimension arrow under title
      #dimension-arrow(width: 140pt)
      #v(0.4em)
      // Subtitle
      #if info.subtitle != none {
        text(size: 1em, fill: palette.gray, info.subtitle)
        v(0.3em)
      }
      #v(1fr)
      // Author and date in title-block style
      #stack(dir: ltr, spacing: 2em,
        if info.author != none {
          stack(spacing: .8em,
            text(size: 0.55em, fill: palette.blue, weight: "bold", upper[Prepared by]),
            text(size: 0.8em, fill: palette.ink, info.author),
          )
        },
        if info.date != none {
          stack(spacing: .8em,
            text(size: 0.55em, fill: palette.blue, weight: "bold", upper[Date]),
            text(size: 0.8em, fill: palette.ink)[#utils.display-info-date(self)],
          )
        },
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide: Section break with blueprint section divider, large number
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    blueprint-grid()
    construction-lines()
    // Large section number (technical drawing style)
    place(top + right, dx: -3em, dy: 1.5em,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(size: 7em, weight: "bold", fill: palette.blue.transparentize(85%), font: "Menlo", num-str)
      }
    )
    // Section content centered-left
    place(left + horizon, dx: 4em,
      block(width: 65%)[
        #set std.align(left)
        #grid-ref("SECTION")
        #v(0.5em)
        #{
          set text(size: 2.2em, weight: "bold", fill: palette.ink)
          utils.display-current-heading(level: 1, numbered: false)
        }
        #v(0.5em)
        // Section divider SVG
        #box(width: 200pt, image(bytes(_section-divider-svg), width: 200pt, height: 14pt))
      ]
    )
    // Dimension arrow at bottom
    place(bottom + center, dy: -2em,
      box(width: 300pt, image(bytes(_dimension-arrow-svg), width: 300pt, height: 10pt))
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide: Technical emphasis — blue background with white text, registration marks
#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: palette.blue,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Inverted grid on blue background
    place(top + left,
      image(bytes(
        _blueprint-grid-svg
          .replace("#1D4ED8", "#ffffff")
      ), width: 100%, height: 100%)
    )
    // Registration marks in white
    place(top + left,
      image(bytes(
        _registration-marks-svg
          .replace("#1D4ED8", "#ffffff")
      ), width: 100%, height: 100%)
    )
    set text(fill: white, size: 2em, weight: "bold")
    place(center + horizon, block(width: 80%, inset: (x: 1em))[
      #set par(leading: 0.6em)
      #set std.align(center)
      #body
    ])
  }
  touying-slide(self: self, main-body)
})

/// ending-slide: Technical close-out frame — matches title bookend
#let ending-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    place(top + left, block(width: 100%, height: 100%, fill: palette.bg))
    blueprint-grid()
    // Title frame (bookend — same as title-slide)
    title-frame()
    // Registration marks (bookend — same as title-slide)
    registration-marks()
    // Content centered
    set std.align(center + horizon)
    pad(x: 5em)[
      #grid-ref("END-01")
      #v(0.6em)
      #text(size: 3em, weight: "bold", fill: palette.ink, body)
      #v(0.4em)
      #dimension-arrow(width: 180pt)
      #v(0.6em)
      #text(size: 0.7em, fill: palette.gray, font: "Menlo")[DRAWING COMPLETE \u{2014} ALL REVISIONS FINAL]
    ]
  }
  touying-slide(self: self, main-body)
})


// ═══ Theme Entry Point ═══

#let blueprint-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  ..args,
  body,
) = {
  set text(size: 18pt, fill: palette.ink)
  set par(leading: 0.8em)
  show raw: set text(font: "Menlo")
  set heading(numbering: "1.")

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header-ascent: 30%,
      footer-descent: 30%,
      fill: palette.bg,
      margin: (top: 4em, bottom: 1.8em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: palette.blue,
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
