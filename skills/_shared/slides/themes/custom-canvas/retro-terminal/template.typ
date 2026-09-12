// Retro Terminal Theme -- CRT / Phosphor Display Touying presentation theme
// Vintage 1970s-80s computer terminal aesthetic: VT100, IBM 3270, amber phosphor monitors.
// Scan lines, phosphor glow, cursor block decoration, fixed-width everything.
// 3 presets: green (green phosphor), amber (amber phosphor), blue (IBM blue terminal)
// Touying 0.7.4 compatible.

#import "@preview/touying:0.7.4": *

// =====================================================================
// Preset Definitions
// =====================================================================
// Each preset: bg, phosphor, dim, glow-tint

#let presets = (
  green: (bg: rgb("#0D1117"), phosphor: rgb("#00FF41"), dim: rgb("#004D00"), glow-tint: rgb("#00FF41")),
  amber: (bg: rgb("#0D1117"), phosphor: rgb("#FFB000"), dim: rgb("#4D3600"), glow-tint: rgb("#FFB000")),
  blue:  (bg: rgb("#0A0E1A"), phosphor: rgb("#00BFFF"), dim: rgb("#003355"), glow-tint: rgb("#00BFFF")),
)


// =====================================================================
// Palette Builder
// =====================================================================
// Derives full palette from preset name.
// Exposed so users can do: #let pal = build-palette("green")

#let build-palette(preset-name) = {
  let p = presets.at(preset-name)
  let bg = p.bg
  let phosphor = p.phosphor
  let dim = p.dim
  let glow-tint = p.glow-tint
  (
    bg: bg,
    phosphor: phosphor,
    dim: dim,
    glow-tint: glow-tint,
    // Derived tones
    phosphor-bright: phosphor,
    phosphor-mid: phosphor.transparentize(30%),
    phosphor-faint: phosphor.transparentize(60%),
    phosphor-ghost: phosphor.transparentize(85%),
    phosphor-dim: phosphor.transparentize(92%),
    // Screen glow (the slight tint CRTs give to "black" areas)
    screen-glow: glow-tint.transparentize(95%),
    // Opaque surface for cards/blocks so scan lines never cross text.
    surface: bg.lighten(3%),
    surface-border: glow-tint.transparentize(70%),
    // Dim text
    dim-text: dim,
    // Meta/footer
    meta-color: phosphor.transparentize(50%),
  )
}

// Default palette (green phosphor)
#let palette = build-palette("green")


// =====================================================================
// Typography Constants
// =====================================================================

#let typo = (
  h2: 24pt,
  boot-size: 9pt,
  prompt-size: 11pt,
)


// =====================================================================
// 1. Reusable Components
// =====================================================================

/// scanline-overlay -- Horizontal scan lines at very low opacity (2-3%)
/// Creates the CRT monitor effect across the slide
#let scanline-overlay(opacity: 3%, color: palette.phosphor) = {
  let c = color.transparentize(100% - opacity)
  for i in range(0, 52) {
    place(top + left, dy: i * 9.2pt,
      line(length: 100%, stroke: 0.3pt + c))
  }
}

/// cursor-block -- Terminal cursor block (the signature element)
/// A filled rectangle that appears at the end of titles like a blinking cursor
#let cursor-block(color: palette.phosphor, width: 0.55em, height: 0.95em) = {
  h(0.2em)
  box(width: width, height: height, fill: color, baseline: 15%)
}

/// boot-text -- "Boot sequence" style label (dimmer, smaller, with > prompt)
#let boot-text(body, color: palette.phosphor) = {
  text(
    fill: color.transparentize(40%),
    size: typo.boot-size,
    tracking: 1pt,
  )[\> #body]
}

/// ok-marker -- [OK] style status marker
#let ok-marker(color: palette.phosphor) = {
  text(
    fill: color.transparentize(20%),
    size: typo.boot-size,
    weight: "bold",
  )[\[OK\]]
}

/// fail-marker -- [FAIL] style status marker
#let fail-marker(color: palette.phosphor) = {
  text(
    fill: rgb("#FF4444"),
    size: typo.boot-size,
    weight: "bold",
  )[\[FAIL\]]
}

/// terminal-card -- Bordered block that looks like a terminal window
/// with header bar showing user\@host
#let terminal-card(title, body, user: "user", host: "host", color: palette.phosphor) = {
  block(
    width: 100%,
    stroke: 1pt + color.transparentize(60%),
    clip: true,
  )[
    #stack(
      spacing: 0pt,
      block(
        width: 100%,
        fill: color.transparentize(85%),
        inset: (x: 0.6em, y: 0.3em),
      )[
        #text(size: typo.boot-size, fill: color.transparentize(20%))[#user\@#host:#title]
      ],
      block(
        width: 100%,
        fill: palette.surface,
        inset: (x: 0.8em, y: 0.6em),
      )[
        #set text(size: 13pt, fill: color.transparentize(15%))
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// process-stat -- Stat styled like a system process: PID + metric
#let process-stat(pid, label, value, color: palette.phosphor) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: 0.5pt + palette.surface-border,
    inset: (x: 0.5em, y: 0.55em),
  )[
    #set std.align(center)
    #stack(
      spacing: .8em,
      text(size: typo.boot-size, fill: color.transparentize(50%))[PID #pid],
      text(size: 36pt, weight: "bold", fill: color, value),
      text(size: typo.prompt-size, fill: color.transparentize(30%), label),
      lazy-v(1fr),
    )
  ]
}

/// stdout-box -- Output block with $ prompt prefix
#let stdout-box(body, color: palette.phosphor) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 2pt + color.transparentize(50%)),
    inset: (x: 0.8em, y: 0.5em),
  )[
    #set text(size: 13pt, fill: color.transparentize(10%))
    #text(fill: color.transparentize(40%))[\$ ]#body
    #lazy-v(1fr)
  ]
}

/// command-tag -- Inline code-style tag
#let command-tag(body, color: palette.phosphor) = {
  box(
    fill: color.transparentize(88%),
    stroke: 0.5pt + color.transparentize(60%),
    inset: (x: 0.4em, y: 0.15em),
  )[
    #text(size: typo.boot-size, fill: color, weight: "bold", body)
  ]
}

/// pipe-divider -- Divider that looks like |---|---|---|---
#let pipe-divider(color: palette.phosphor, segments: 8) = {
  block(width: 100%, inset: (y: 0.3em))[
    #text(size: typo.boot-size, fill: color.transparentize(60%))[
      #for i in range(segments) {
        if i > 0 { [|] }
        [\-\-\-]
      }
      [|]
    ]
  ]
}

/// man-quote -- Quote styled like a man page entry
#let man-quote(section, body, color: palette.phosphor) = {
  block(
    width: 100%,
    fill: palette.surface,
    stroke: (left: 2pt + color.transparentize(40%)),
    inset: (left: 1em, right: 0.5em, y: 0.5em),
  )[
    #stack(spacing: .8em,
      text(size: typo.boot-size, fill: color.transparentize(30%), weight: "bold")[#upper(section)#[(7)]],
      [
        #set text(size: 14pt, fill: color.transparentize(10%))
        #body
        #lazy-v(1fr)
      ],
    )
  ]
}

/// system-line -- Single line styled like system output
#let system-line(body, color: palette.phosphor) = {
  text(size: typo.prompt-size, fill: color.transparentize(30%), body)
}


// =====================================================================
// 2. Internal Helpers (header/footer factories)
// =====================================================================

/// _terminal-header -- Standard terminal-style header
#let _terminal-header(self) = {
  let pal = self.store.palette
  set std.align(top)
  show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
  set std.align(horizon + left)
  stack(
    spacing: .8em,
    {
      set text(size: 8pt, fill: pal.meta-color, tracking: 0.5pt)
      grid(
        columns: (1fr, 1fr),
        {
          if self.store.footer != none {
            utils.call-or-display(self, self.store.footer)
          }
        },
        {
          set std.align(right)
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        },
      )
    },
    {
      set text(fill: pal.phosphor, size: 1.4em, weight: "bold")
      if self.store.title != none {
        utils.call-or-display(self, self.store.title)
      } else {
        utils.display-current-heading(level: 2)
      }
      cursor-block(color: pal.phosphor)
    },
  )
}

/// _terminal-footer -- Standard footer for terminal slides
#let _terminal-footer(self) = {
  let pal = self.store.palette
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: pal.meta-color)
      upper[TERMINAL]
    },
    {
      text(size: 8pt, fill: pal.phosphor.transparentize(60%))[\>]
    },
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: pal.meta-color)
      context [#utils.slide-counter.display()]
    },
  )
}

/// _amber-header -- Header for amber/dark variant slides
#let _amber-header(custom-left: none, custom-right: none) = {
  (self) => {
    let pal = self.store.palette
    let amber = presets.amber.phosphor
    set std.align(top)
    show: components.cell.with(inset: (x: 2em, top: 0.7em, bottom: 0.1em))
    set std.align(horizon + left)
    set text(size: 8pt, fill: amber.transparentize(50%), tracking: 0.5pt)
    grid(
      columns: (1fr, 1fr),
      {
        if custom-left != none {
          custom-left
        } else if self.store.footer != none {
          utils.call-or-display(self, self.store.footer)
        }
      },
      {
        set std.align(right)
        if custom-right != none {
          custom-right
        } else {
          context [#utils.slide-counter.display() / #utils.last-slide-number]
        }
      },
    )
  }
}

/// _amber-footer -- Footer for amber variant slides
#let _amber-footer(self) = {
  let amber = presets.amber.phosphor
  set std.align(bottom)
  show: components.cell.with(inset: (x: 2em, y: 0.3em))
  set std.align(horizon)
  grid(
    columns: (1fr, auto, 1fr),
    {
      set text(size: 7pt, weight: "bold", tracking: 1.5pt, fill: amber.transparentize(50%))
      upper[TERMINAL]
    },
    {
      text(size: 8pt, fill: amber.transparentize(60%))[\>]
    },
    {
      set std.align(right)
      set text(size: 7pt, weight: "bold", fill: amber.transparentize(50%))
      context [#utils.slide-counter.display()]
    },
  )
}


// =====================================================================
// 3. Slide Functions
// =====================================================================

/// slide -- Standard content slide
/// CRT black bg + scanline overlay, green/amber title text (monospace), cursor block after title
#let slide(title: auto, align: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let header(self) = _terminal-header(self)
  let footer(self) = _terminal-footer(self)
  let setting(body) = {
    let pal = self.store.palette
    // Scanline overlay
    scanline-overlay(opacity: 3%, color: pal.phosphor)
    show: std.align.with(self.store.align)
    set text(fill: pal.phosphor.transparentize(10%))
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

/// dark-slide -- Amber accent variant (everything is dark, but with amber phosphor instead of green)
#let dark-slide(
  title: auto,
  align: auto,
  header-left: none,
  header-right: none,
  ..args,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if align != auto {
    self.store.align = align
  }
  let pal = self.store.palette
  let amber = presets.amber.phosphor

  let header = _amber-header(custom-left: header-left, custom-right: header-right)
  let footer(self) = _amber-footer(self)

  let setting(body) = {
    // Scanline overlay in amber
    scanline-overlay(opacity: 2%, color: amber)
    let main-content = {
      set text(fill: amber.transparentize(10%))
      show: std.align.with(self.store.align)
      body
    }
    if self.store.title != none and self.store.title != auto {
      stack(
        spacing: .8em,
        {
          text(size: typo.h2, weight: "bold", fill: amber,
            utils.call-or-display(self, self.store.title))
          cursor-block(color: amber)
        },
        main-content,
      )
    } else {
      main-content
    }
  }
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      header: header,
      footer: footer,
      margin: (top: 1.9em, bottom: 1.2em, x: 2em),
    ),
  )
  touying-slide(self: self, setting: setting, ..args)
})

/// title-slide -- CRT boot sequence style
/// Text appearing like a terminal boot: > LOADING..., then title in large green monospace, then [OK]
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let pal = self.store.palette
  let body = {
    // Full CRT black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Screen glow tint
    place(top + left, block(width: 100%, height: 100%, fill: pal.screen-glow))
    // Scanline overlay
    scanline-overlay(opacity: 3%, color: pal.phosphor)
    // Boot sequence content
    set std.align(left + horizon)
    pad(x: 3.5em, y: 3em)[
      #stack(
        spacing: 0.95em,
        stack(
          spacing: .8em,
          boot-text([LOADING SYSTEM...], color: pal.phosphor),
          grid(
            columns: (1fr, auto),
            boot-text([INIT DISPLAY DRIVER], color: pal.phosphor),
            ok-marker(color: pal.phosphor),
          ),
          grid(
            columns: (1fr, auto),
            boot-text([MOUNT /dev/presentation], color: pal.phosphor),
            ok-marker(color: pal.phosphor),
          ),
        ),
        {
          if info.subtitle != none {
            stack(
              spacing: .8em,
              {
                text(size: 2.2em, weight: "bold", fill: pal.phosphor, info.title)
                cursor-block(color: pal.phosphor, width: 0.4em, height: 0.8em)
              },
              text(size: typo.h2, fill: pal.phosphor.transparentize(30%), info.subtitle),
            )
          } else {
            text(size: 2.2em, weight: "bold", fill: pal.phosphor, info.title)
            cursor-block(color: pal.phosphor, width: 0.4em, height: 0.8em)
          }
        },
        {
          set text(size: typo.boot-size, fill: pal.phosphor.transparentize(40%), tracking: 0.5pt)
          if info.author != none {
            [\> USER: #upper[#info.author]]
            linebreak()
          }
          if info.date != none {
            [\> DATE: ]
            utils.display-info-date(self)
            linebreak()
          }
          if info.institution != none {
            [\> HOST: #upper[#info.institution]]
          }
        },
        text(size: typo.boot-size, fill: pal.phosphor.transparentize(20%))[\> READY.],
      )
    ]
  }
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  touying-slide(self: self, body)
})

/// new-section-slide -- Section divider with `> cd /section-01/` style
#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // CRT black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Screen glow
    place(top + left, block(width: 100%, height: 100%, fill: pal.screen-glow))
    // Scanline overlay
    scanline-overlay(opacity: 3%, color: pal.phosphor)
    // Ghost section number
    place(top + right, dx: -60pt, dy: 30pt,
      context {
        let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
        text(fill: pal.phosphor.transparentize(90%), size: 160pt, weight: "bold", num-str)
      },
    )
    std.align(
      left + horizon,
      pad(left: 3.5em, right: 4em, top: 4em, bottom: 2em)[
        #stack(
          spacing: .8em,
          text(size: typo.boot-size, fill: pal.phosphor.transparentize(40%), tracking: 1pt)[
            \> cd /section-#context {
              let num-str = utils.display-current-heading-number(level: 1, numbering: "01")
              num-str
            }/
          ],
          {
            set text(fill: pal.phosphor, size: 2.2em, weight: "bold")
            utils.display-current-heading(level: 1, numbered: false)
            cursor-block(color: pal.phosphor)
          },
          pipe-divider(color: pal.phosphor),
        )
      ],
    )
  }
  touying-slide(self: self, main-body)
})

/// focus-slide -- Brighter phosphor text, larger size, centered
#let focus-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(
      fill: pal.bg,
      margin: 3em,
      header: none,
      footer: none,
    ),
  )
  let main-body = {
    // Screen glow
    place(top + left, dx: -3em, dy: -3em, block(width: 200%, height: 200%, fill: pal.screen-glow))
    // Scanline overlay
    scanline-overlay(opacity: 2%, color: pal.phosphor)
    // Prompt decoration top-left
    place(top + left,
      text(size: typo.boot-size, fill: pal.phosphor.transparentize(50%))[\> FOCUS],
    )
    set text(fill: pal.phosphor, size: 1.8em, weight: "bold")
    set std.align(horizon + center)
    block(width: 100%, inset: (x: 1em))[
      #body#cursor-block(color: pal.phosphor, width: 0.4em, height: 0.7em)
    ]
  }
  touying-slide(self: self, std.align(horizon + center, main-body))
})

/// ending-slide -- `> EXIT 0` style farewell
#let ending-slide(body) = touying-slide-wrapper(self => {
  let pal = self.store.palette
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none, margin: 0pt),
  )
  let main-body = {
    // CRT black background
    place(top + left, block(width: 100%, height: 100%, fill: pal.bg))
    // Screen glow
    place(top + left, block(width: 100%, height: 100%, fill: pal.screen-glow))
    // Scanline overlay
    scanline-overlay(opacity: 3%, color: pal.phosphor)
    // Ghost EXIT text
    place(center + horizon,
      text(size: 160pt, weight: "bold", fill: pal.phosphor.transparentize(93%), [EXIT]),
    )
    std.align(center + horizon, pad(x: 4em)[
      #stack(
        spacing: 0.9em,
        text(size: typo.boot-size, fill: pal.phosphor.transparentize(30%), tracking: 1pt)[\> EXIT 0],
        {
          text(size: 2em, weight: "bold", fill: pal.phosphor, body)
          cursor-block(color: pal.phosphor)
        },
        text(size: typo.boot-size, fill: pal.phosphor.transparentize(40%))[
          \[SESSION TERMINATED\]
        ],
        text(size: 7pt, weight: "bold", tracking: 2pt, fill: pal.meta-color)[
          RETRO-TERMINAL v1.0
        ],
      )
    ])
  }
  touying-slide(self: self, main-body)
})


// =====================================================================
// 4. Theme Entry Point
// =====================================================================

#let retro-terminal-theme(
  aspect-ratio: "16-9",
  align: horizon,
  footer: none,
  preset: "green",
  ..args,
  body,
) = {
  let pal = build-palette(preset)

  set text(size: 20pt, fill: pal.phosphor)
  set heading(numbering: (..args) => none)

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      header-ascent: 30%,
      footer-descent: 30%,
      fill: pal.bg,
      margin: (top: 5.5em, bottom: 1.3em, x: 2em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(alert: utils.alert-with-primary-color),
    config-colors(
      primary: pal.phosphor,
      neutral-lightest: pal.phosphor,
      neutral-darkest: pal.bg,
    ),
    config-store(
      title: none,
      align: align,
      footer: footer,
      palette: pal,
    ),
    ..args,
  )

  body
}
