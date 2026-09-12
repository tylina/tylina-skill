#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("concrete")

#show: brutalist-theme.with(
  aspect-ratio: "16-9",
  preset: "concrete",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [Structure Is Decoration],
    subtitle: [A brutalist approach to presentation design],
    author: [Design Research Lab],
    date: datetime.today(),
    institution: [BRUTALIST STUDIO],
  ),
)

// ===== Cover =====

#title-slide()

#speaker-note[
  Welcome to the Brutalist Studio. Today we explore how raw structure becomes visual language -- no ornament, no veneer, only the honest weight of concrete and type.
]

// ============================================================
// Slide 1 -- Manifesto: Bold opening statement
// ============================================================

#manifesto-slide[
  Nothing is hidden. #linebreak()
  Structure IS the decoration. #linebreak()
  Ornament is crime.
]

#speaker-note[
  This is our manifesto. Three principles that guide every decision in brutalist design. Read them as commandments carved into poured concrete.
]

// ============================================================
// Slide 2 -- Dark slide: Data Exposé with stats and commentary
// ============================================================

#dark-slide(
  title: none,
  ghost: [72],
  ghost-dy: -30pt,
  ghost-dx: -10pt,
  ghost-size: 240pt,
  header-left: [DATA REPORT],
  header-right: [BRUTALIST 2025],
)[
  #stack(
    spacing: .8em,
    text(size: 42pt, weight: "black")[72% of ornament is crime.],
    text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.inv-muted, font: _mono-font)[RAW STATISTICS \/\/ ANNUAL SURVEY],
    cols(
      columns: (1fr, 1fr, 1fr),
      gutter: 20pt,
      [
        #align(center)[
          #stack(
            spacing: .8em,
            text(size: 48pt, weight: "black")[2.4M],
            text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.inv-muted, font: _mono-font)[DECORATIVE ELEMENTS \ REMOVED THIS YEAR],
            text(size: 11pt, fill: pal.inv-muted)[Every gradient, every shadow, every rounded corner -- stripped back to reveal the skeleton beneath.],
          )
        ]
      ],
      [
        #align(center)[
          #stack(
            spacing: .8em,
            text(size: 48pt, weight: "black")[0],
            text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.inv-muted, font: _mono-font)[ROUNDED CORNERS \ ALLOWED],
            text(size: 11pt, fill: pal.inv-muted)[Square edges communicate honesty. A corner radius is a lie told to comfort the viewer.],
          )
        ]
      ],
      [
        #align(center)[
          #stack(
            spacing: .8em,
            text(size: 48pt, weight: "black")[100%],
            text(size: 9pt, weight: "bold", tracking: 1pt, fill: pal.inv-muted, font: _mono-font)[RAW CONCRETE \ SURFACE COVERAGE],
            text(size: 11pt, fill: pal.inv-muted)[Board-formed texture. Pour marks visible. Aggregate exposed where structural logic demands.],
          )
        ]
      ],
    ),
    block(
      width: 100%,
      stroke: (left: 3pt + pal.inv-muted),
      inset: (left: 1em, y: 0.3em),
    )[
      #text(size: 11pt, style: "italic", fill: pal.inv-muted)[
        "The surface is not a canvas for expression -- it is the expression itself."
      ]
    ],
  )
]

#speaker-note[
  72 percent of surveyed design systems still rely on ornamental elements that add no functional value. Our approach: strip everything. What remains is the structure itself -- and that IS the design.
]

// ============================================================
// Slide 3 -- Three Principles with slab cards + overlays
// ============================================================

== Three Principles of Raw Design

#stamp[CANON]

#kicker[DESIGN MANIFESTO \/\/ CORE TENETS]

#v(0.3em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt)[
    #place(top + left, dy: -8pt, section-number(1, size: 80pt, opacity: 8%))
    #v(28pt)
    #slab([Honesty], [
      Materials appear as they are.
      No veneer, no false surfaces.
      Concrete is concrete. Steel is steel.
      The join is visible. The weld is shown.
    ])
][
    #place(top + left, dy: -8pt, section-number(2, size: 80pt, opacity: 8%))
    #v(28pt)
    #slab([Weight], [
      Visual mass communicates importance.
      Heavy elements anchor the eye.
      Typography carries structural load.
      Whitespace is engineered, not decorative.
    ])
][
    #place(top + left, dy: -8pt, section-number(3, size: 80pt, opacity: 8%))
    #v(28pt)
    #slab([Exposure], [
      Show the construction method.
      Grid lines, borders, and joints
      are features, not flaws.
      The process is the product.
    ])
]

#speaker-note[
  Three pillars of brutalist design philosophy. Honesty of materials -- show what you are made of. Weight -- use visual mass to establish hierarchy. Exposure -- let the construction be visible and celebrated.
]

// ============================================================
// Slide 4 -- Material Specifications: data strip + pull quote
//            with placed decorative overlays
// ============================================================

#slide(title: [Material Specifications], align: top)[
#stack(
  spacing: .8em,
  kicker[PROJECT DATA \/\/ STRUCTURAL ANALYSIS],
  data-strip(
    ("Material", [Exposed Concrete]),
    ("Load", [47 kN/m2]),
    ("Finish", [Board-Formed]),
    ("Year", [2025]),
  ),
  cols(columns: (2fr, 1fr), gutter: 24pt,
    [
      #stack(
        spacing: .8em,
        pull-quote([
          Ornament is crime. Every surface must earn its place through function, not decoration. The material does not apologize for its presence.
        ], cite: [Adolf Loos, adapted]),
        text(size: 13pt, fill: pal.ink-light)[
          Board-formed concrete reveals the timber grain of its formwork.
          Each pour line marks a day of labor. The surface records time
          in a way that paint never could. This is architecture that
          refuses to forget its own making.
        ],
      )
    ],
    [
      #stack(
        spacing: .8em,
        block(
          width: 100%,
          stroke: 2pt + pal.ink,
          inset: (x: 0.8em, y: 0.7em),
        )[
          #stack(
            spacing: .8em,
            text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)[SPEC SHEET],
            text(size: 12pt, fill: pal.ink)[
              Compressive strength: 40 MPa \
              Density: 2,400 kg/m3 \
              Thermal conductivity: 1.7 W/mK \
              Water absorption: 5% \
              Fire rating: A1 (non-combustible)
            ],
          )
        ],
        mono-label[REF: ISO 19338:2024],
      )
    ],
  ),
)
]

#speaker-note[
  Material data presented raw -- no infographics, no icons. Just the numbers in their proper hierarchy. The pull quote from Loos anchors the philosophy. The spec sheet on the right uses a stroke border as its only decoration.
]

// ============================================================
// Slide 5 -- Grid Exposé: Exposed grid as visual element
// ============================================================

#grid-expose-slide(
  title: [Construction Phases],
  cols: 3,
  header-left: [STRUCTURE LOG],
  header-right: [PHASES 01-03],
)[
  #ghost-num(3, dx: 10pt, dy: -40pt, size: 120pt)

  #kicker[STRUCTURAL TIMELINE \/\/ PHASES 01-03]

  #v(0.3em)

  #exposed-grid(3,
    [
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)[PHASE 01]
      #v(0.2em)
      #text(weight: "bold", size: 16pt)[Foundation]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink-light)[
        Foundation poured. Raw structure emerges
        from the earth. Rebar grid exposed during
        curing. Load paths established.
      ]
      #v(0.3em)
      #text(size: 9pt, fill: pal.ink-muted, font: _mono-font)[DURATION: 12 WEEKS]
    ],
    [
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)[PHASE 02]
      #v(0.2em)
      #text(weight: "bold", size: 16pt)[Superstructure]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink-light)[
        Load-bearing walls rise without facade.
        Shear walls and cores provide lateral
        stability. No cladding applied.
      ]
      #v(0.3em)
      #text(size: 9pt, fill: pal.ink-muted, font: _mono-font)[DURATION: 28 WEEKS]
    ],
    [
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.ink-muted, font: _mono-font)[PHASE 03]
      #v(0.2em)
      #text(weight: "bold", size: 16pt)[Completion]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink-light)[
        Final form revealed. Structure is the finish.
        Services run exposed. Ductwork becomes
        ornament through honest expression.
      ]
      #v(0.3em)
      #text(size: 9pt, fill: pal.ink-muted, font: _mono-font)[DURATION: 8 WEEKS]
    ],
  )

  #v(0.4em)

  #grid(columns: (1fr, auto), column-gutter: 16pt,
    mono-label[REF: STRUCTURAL ANALYSIS 2025 \/\/ GRID MODULE 3x1 \/\/ LOAD CAPACITY VERIFIED],
    block(
      fill: pal.accent,
      inset: (x: 0.5em, y: 0.15em),
    )[
      #text(size: 8pt, weight: "bold", fill: pal.on-accent, tracking: 1pt)[ON SCHEDULE]
    ],
  )
]

#speaker-note[
  The exposed grid is both information architecture AND visual design. Cell borders become the decoration. Phase data is presented in structural cells -- the grid itself tells the story of systematic construction.
]

// ============================================================
// Slide 6 -- Section divider
// ============================================================

= Raw Materials

#speaker-note[
  Section break. We move from theory to application -- how brutalist principles manifest in real metrics and performance data.
]

// ============================================================
// Slide 7 -- Performance Metrics: raw-stats with dense layout
// ============================================================

== Performance Metrics

#stamp[APPROVED]

#stack(
  spacing: .8em,
  kicker[QUARTERLY REVIEW \/\/ Q4 2025],
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 16pt,
    raw-stat([340], [Projects Completed]),
    raw-stat([98%], [Structural Integrity]),
    raw-stat([12], [Load-Bearing Systems]),
    raw-stat([0], [Decorative Failures]),
  ),
  brutalist-rule(thickness: 3pt),
  cols(columns: (1fr, 1fr), gutter: 24pt,
    [
      #stack(
        spacing: .8em,
        text(size: 14pt, weight: "bold", fill: pal.ink)[Year-Over-Year Analysis],
        text(size: 12pt, fill: pal.ink-light)[
          Structural integrity maintained at 98% despite 40% increase in project volume.
          Zero decorative failures recorded -- because zero decoration was applied.
          Load-bearing system count reduced through consolidation: fewer, stronger elements.
        ],
      )
    ],
    [
      #stack(
        spacing: .8em,
        text(size: 14pt, weight: "bold", fill: pal.ink)[Methodology],
        data-strip(
          ("Sample", [N=340]),
          ("Period", [Q4]),
        ),
        text(size: 11pt, fill: pal.ink-light)[
          All metrics measured against ISO 19338 structural performance criteria.
          Non-load-bearing elements excluded from analysis by definition.
        ],
      )
    ],
  ),
)

#speaker-note[
  Four headline stats dominate the top. Below: the analysis text and methodology side by side. The thick rule separates data from interpretation -- a structural joint made visible.
]

// ============================================================
// Slide 8 -- Dark slide: Case Study with asymmetric layout
// ============================================================

#dark-slide(
  title: none,
  ghost: [08],
  ghost-dy: -20pt,
  ghost-dx: -10pt,
  ghost-size: 200pt,
  header-left: [CASE STUDY],
  header-right: [NATIONAL THEATRE 1976],
)[
  #stack(
    spacing: .8em,
    text(size: 9pt, weight: "bold", tracking: 2pt, fill: pal.inv-muted, font: _mono-font)[REFERENCE \/\/ DENYS LASDUN],
    text(size: 34pt, weight: "black")[The National Theatre, London],
    text(size: 14pt, fill: pal.inv-muted)[
      Completed 1976. Board-marked concrete throughout. The building makes no attempt to charm -- it commands.
    ],
    cols(columns: (1fr, 1fr, 1fr), gutter: 20pt,
      [
        #block(width: 100%, stroke: (left: 3pt + pal.accent), inset: (left: 0.8em, y: 0.3em))[
          #stack(
            spacing: .8em,
            text(size: 11pt, weight: "bold", fill: pal.inv-text)[Fly Towers],
            text(size: 10pt, fill: pal.inv-muted)[Three theatre volumes expressed as raw concrete masses on the skyline. No cladding.],
          )
        ]
      ],
      [
        #block(width: 100%, stroke: (left: 3pt + pal.accent), inset: (left: 0.8em, y: 0.3em))[
          #stack(
            spacing: .8em,
            text(size: 11pt, weight: "bold", fill: pal.inv-text)[Terraces],
            text(size: 10pt, fill: pal.inv-muted)[Horizontal strata of public space. Walkways cantilevered from the main structure.],
          )
        ]
      ],
      [
        #block(width: 100%, stroke: (left: 3pt + pal.accent), inset: (left: 0.8em, y: 0.3em))[
          #stack(
            spacing: .8em,
            text(size: 11pt, weight: "bold", fill: pal.inv-text)[Services],
            text(size: 10pt, fill: pal.inv-muted)[Ductwork and conduit exposed as ceiling ornament. Function becomes beauty.],
          )
        ]
      ],
    ),
    grid(columns: (auto, 1fr), column-gutter: 12pt,
      block(fill: pal.accent, inset: (x: 0.6em, y: 0.2em))[
        #text(size: 8pt, weight: "bold", fill: pal.on-accent, tracking: 1pt)[GRADE II\* LISTED]
      ],
      text(size: 10pt, fill: pal.inv-muted)[Once Britain's most hated building. Now its most celebrated concrete structure.],
    ),
  )
]

#speaker-note[
  A case study slide. Lasdun's National Theatre exemplifies brutalism at its purest -- the building's controversies only proved its power. Three architectural features presented as accent-bordered cards on dark ground.
]

// ============================================================
// Slide 9 -- Comparison: Before / After with exposed structure
// ============================================================

== Decoration vs. Structure

#stack(
  spacing: .8em,
  kicker[COMPARATIVE ANALYSIS \/\/ VISUAL AUDIT],
  cols(columns: (1fr, 1fr), gutter: 0pt,
    [
      #block(width: 100%, inset: (right: 1.2em))[
        #place(top + left, dy: -4pt, text(size: 60pt, weight: "black", fill: pal.ink-ghost, [A]))
        #v(24pt)
        #stack(
          spacing: .8em,
          text(size: 18pt, weight: "black", fill: pal.ink)[Before: Decorated],
          text(size: 12pt, fill: pal.ink-light)[
            - Rounded corners on every element \
            - Drop shadows for false depth \
            - Gradient backgrounds \
            - Icon embellishments \
            - Whitespace as filler
          ],
          block(width: 100%, fill: pal.accent-faint, inset: (x: 0.7em, y: 0.4em))[
            #stack(
              spacing: .8em,
              text(size: 10pt, weight: "bold", fill: pal.accent-text)[VERDICT: DISHONEST],
              text(size: 9pt, fill: pal.ink-muted)[Surface conceals structure],
            )
          ],
        )
      ]
    ],
    [
      #block(width: 100%, stroke: (left: 4pt + pal.ink), inset: (left: 1.2em))[
        #place(top + left, dy: -4pt, text(size: 60pt, weight: "black", fill: pal.ink-ghost, [B]))
        #v(24pt)
        #stack(
          spacing: .8em,
          text(size: 18pt, weight: "black", fill: pal.ink)[After: Exposed],
          text(size: 12pt, fill: pal.ink-light)[
            - Square edges, visible joints \
            - No shadows -- flat by conviction \
            - Monochrome with single accent \
            - Type as sole visual element \
            - Whitespace as structural void
          ],
          block(width: 100%, fill: pal.surface, stroke: (left: 3pt + pal.ink), inset: (x: 0.7em, y: 0.4em))[
            #stack(
              spacing: .8em,
              text(size: 10pt, weight: "bold", fill: pal.ink)[VERDICT: HONEST],
              text(size: 9pt, fill: pal.ink-muted)[Structure IS the surface],
            )
          ],
        )
      ]
    ],
  ),
  mono-label[AUDIT REF: VIS-2025-0042 \/\/ METHODOLOGY: HEURISTIC EVALUATION \/\/ ASSESSOR: DRL],
)

#speaker-note[
  A direct comparison. Column A shows the conventional decorated approach. Column B shows the brutalist resolution. The thick vertical divider is itself a brutalist element -- a structural joint that becomes composition.
]

// ============================================================
// Slide 10 -- Focus slide: Closing statement
// ============================================================

#focus-slide[
  The weight of a word #linebreak()
  is measured in concrete.
]

#speaker-note[
  Final statement. Let the weight of the typography do the work. No ornament needed -- the words themselves carry structural load.
]

// ===== Ending =====

#ending-slide[Thank You]

#speaker-note[
  End of presentation. The structure has spoken for itself. No applause decoration required.
]
