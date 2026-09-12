#import "@preview/touying:0.7.4": *
#import "template.typ": *

#show raw: set text(font: "DejaVu Sans Mono")

#show: swiss-grid-theme.with(
  aspect-ratio: "16-9",
  footer: [Grid Systems in Visual Communication],
  config-info(
    title: [Grid Systems in Visual Communication],
    subtitle: [Principles of Systematic Design],
    author: [Brockmann Design Studio],
    date: datetime(year: 2026, month: 5, day: 23),
  ),
  config-common(breakable: false),
)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 18pt)

#title-slide()

= The Grid

== Fundamental Principles

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
  swiss-stat([12], [Columns]),
  swiss-stat([4:3], [Ratio]),
  swiss-stat([8pt], [Baseline]),
  swiss-stat([96%], [Precision]),
)

#rule-divider()

#poster-block[The grid system is an aid, not a guarantee. It permits a number of possible uses and each designer can look for a solution appropriate to his personal style.]

== Grid Construction Methods

#cols(columns: (1fr, 1fr, 1fr), gutter: 16pt, lazy-layout: true,
  grid-card([Modular Grid], [A modular grid subdivides the page both horizontally and vertically into modules. The modules govern the placement of text and images.], accent-top: true),
  grid-card([Column Grid], [The column grid divides the page into vertical columns. Text and images span one or more columns, creating rhythm.], accent-top: false),
  grid-card([Hierarchical Grid], [Based on intuitive placement of elements. Often used in web design where content varies in importance.], accent-top: false),
)

== Typography and Scale

#cols(columns: (2fr, 1fr), gutter: 20pt,
  swiss-quote(attribution: "Josef Mueller-Brockmann")[Typography has one plain duty before it and that is to convey information in writing.],
  stack(spacing: 0.8em,
    index-label[Type Scale],
    grid-card([Sizes], [
      Display: 48pt \
      Heading: 32pt \
      Body: 18pt \
      Caption: 12pt \
      Micro: 9pt
    ]),
  ),
)

= Composition

== Asymmetric Layouts

#stack(spacing: .8em,
  index-label[Design Principle],
  cols(columns: (1fr, 1fr), gutter: 16pt,
    stack(spacing: .8em,
      poster-block(size: 1.3em)[Asymmetry creates dynamic tension. The eye moves through the composition following the visual hierarchy established by size, weight, and position.],
      rule-divider(),
      cols(columns: (1fr, 1fr), gutter: 12pt,
        swiss-stat([61.8%], [Golden ratio]),
        swiss-stat([1:1.414], [DIN proportion]),
      ),
    ),
    stack(spacing: 0.8em,
    grid-card([Key Principles], [
      - Flush-left alignment creates a strong vertical axis
      - Generous whitespace is not empty space
      - Contrast in scale directs attention
      - Red as sole accent provides focus
      ], accent-top: true),
    grid-card([Applications], [
      - Poster design
      - Book typography
      - Wayfinding systems
      - Corporate identity
      ]),
    ),
  ),
)

== Color as Information

#stack(spacing: .8em,
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 12pt,
    color-swatch([Primary], palette.ink, [\#1A1A1A]),
    color-swatch([Accent], palette.accent, [\#FF0000]),
    color-swatch([Background], palette.bg, [\#FFFFFF], outline: true),
    color-swatch([Grid], palette.grid-line, [\#E5E5E5]),
  ),
  rule-divider(),
  swiss-quote[In Swiss design, color is never decorative. Red signals importance. Black carries content. White gives room to breathe.],
)

= Application

== Poster Design Process

#cols(columns: (1fr, 1fr, 1fr), gutter: 12pt, lazy-layout: true,
  grid-card([01 \u{2014} Research], [
    Study the subject matter. Understand constraints: format, reproduction method, viewing distance, context.
  ], accent-top: true),
  grid-card([02 \u{2014} Grid Setup], [
    Define the mathematical framework. Choose column count, baseline grid, margins. The grid precedes the design.
  ], accent-top: true),
  grid-card([03 \u{2014} Composition], [
    Place elements according to grid logic. Break the grid only with intention. Every deviation must be justified.
  ], accent-top: true),
)

#focus-slide[Less is more when more is too much]

== Case Study: Musica Viva

#stack(spacing: .8em,
  index-label[Analysis],
  cols(columns: (3fr, 2fr), gutter: 20pt,
    stack(spacing: 0.8em,
      poster-block(size: 1.4em)[Mueller-Brockmann's concert posters for the Tonhalle Zurich (1950s\u{2013}1970s) remain the pinnacle of Swiss graphic design.],
      text(size: 0.85em, fill: palette.ink-muted)[These posters demonstrate how pure geometric forms\u{2014}arcs, circles, grids\u{2014}can communicate musical concepts without illustration. The mathematical precision of the compositions mirrors the structure of the music itself.],
    ),
    stack(spacing: .8em,
      swiss-stat([23], [Years of posters]),
      swiss-stat([58], [Concert posters]),
      swiss-stat([4], [Color maximum]),
    ),
  ),
)

== Design System Components

#cols(columns: (1fr, 1fr), gutter: 20pt, lazy-layout: false,
  stack(spacing: .8em,
    grid-card([Grid Card], [Cards provide structured containers for information. Thin borders reference the grid system itself.], accent-top: true),
    grid-card([Without Accent], [Cards without the red top line serve as secondary containers for supporting information.]),
  ),
  stack(spacing: .8em,
    index-label[Statistics Display],
    cols(columns: (1fr, 1fr), gutter: 10pt,
      swiss-stat([42], [Modules]),
      swiss-stat([7], [Typefaces]),
    ),
    rule-divider(),
    index-label[Quotation Style],
    swiss-quote(attribution: "Brockmann")[Order.],
  ),
)

#focus-slide[The grid is the backbone of any creative work]

#ending-slide[Danke]
