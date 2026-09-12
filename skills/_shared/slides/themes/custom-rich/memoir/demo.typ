// Memoir Theme -- Demo
// "The History of Typography: From Gutenberg to Digital" -- elegant lecture

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("Libertinus Serif", "Noto Serif SC"), size: 18pt)

#show: memoir-theme.with(
  aspect-ratio: "16-9",
  footer: [The History of Typography],
  config-common(breakable: false),
  config-info(
    title: [The History of Typography],
    subtitle: [From Gutenberg to Digital],
    author: [Professor Eleanor Blackwood],
    date: datetime.today(),
    institution: [The Aldine Press Society],
  ),
)

#title-slide()

= The Printed Word

== The Gutenberg Revolution

#cols(columns: (2fr, 1fr))[
  In 1440, Johannes Gutenberg's invention of movable type transformed
  the dissemination of knowledge across Europe. The printing press did
  not merely reproduce text -- it democratized literacy, collapsed
  the monopoly of monastic scriptoria, and gave rise to the
  modern concept of authorship.

  #v(0.6em)
  #sidenote[The Gutenberg Bible (1455) required approximately 300 individual letter molds.]
][
  #folio-stat([1455], [Year of the Gutenberg Bible])
  #v(0.8em)
  #folio-stat([180], [Copies printed in the first edition])
]

== The Art of the Letter

#stack(
  spacing: 18pt,
  memoir-quote(
    [Typography is the craft of endowing human language with a durable visual form.],
    attribution: [Robert Bringhurst, The Elements of Typographic Style],
  ),
  [
    The earliest typefaces were designed to mimic the handwriting of scribes.
    Blackletter dominated Northern Europe while the humanist minuscule
    of Italy gave birth to the roman letterforms we read today.
  ],
)

== Early Typeface Pioneers

#cols(lazy-layout: true, columns: (1fr, 1fr, 1fr))[
  #chapter-card([Nicolas Jenson], [Venice, 1470. Created the first true roman typeface, praised for its readability and elegant proportions.])
][
  #chapter-card([Aldus Manutius], [Venice, 1495. Pioneered italic type and the portable octavo format -- books for the pocket.])
][
  #chapter-card([Claude Garamond], [Paris, 1530. His refined romans became the standard for French printing and endure to this day.])
]

= The Golden Age

== The Enlightenment & Typography

#cols(columns: (2fr, 1fr))[
  The eighteenth century witnessed a profound shift in type design.
  Influenced by Enlightenment rationalism, punchcutters moved from
  calligraphic models toward mathematically constructed letterforms.

  #v(0.6em)
  John Baskerville in Birmingham and Giambattista Bodoni in Parma
  independently developed "modern" typefaces characterized by extreme
  contrast between thick and thin strokes, vertical stress, and
  unbracketed hairline serifs.

  #v(0.6em)
  #binding-tag[Transitional Period]
  #h(0.5em)
  #binding-tag[Modern Faces]
][
  #folio-stat([1757], [Baskerville's first specimen])
  #v(0.8em)
  #folio-stat([1818], [Bodoni's Manuale Tipografico])
]

== The Industrial Revolution

#fleuron-divider()

The nineteenth century explosion of commerce demanded attention-grabbing
display types. Fat faces, Egyptians, and grotesques proliferated --
typography became advertising. The careful balance of the book page
gave way to the cacophony of the broadside and the poster.

#v(0.8em)
Yet amidst this typographic excess, William Morris and the
Arts & Crafts movement sought a return to beauty. His Kelmscott
Press (1891) reimagined the medieval manuscript for the industrial age,
inspiring a century of fine press printing.

#v(0.6em)
#sidenote[Morris designed three typefaces: Golden, Troy, and Chaucer -- all inspired by fifteenth-century Venetian models.]

= The Modern Era

== Twentieth Century Revolutions

#cols(columns: (1fr, 1fr))[
  === The Bauhaus & Sans Serif

  - Futura (Paul Renner, 1927)
  - Gill Sans (Eric Gill, 1928)
  - Univers (Adrian Frutiger, 1957)
  - Helvetica (Max Miedinger, 1957)

  #v(0.4em)
  The International Typographic Style proclaimed:
  _form follows function._
][
  === The Phototype Era

  - Freed type from metal constraints
  - Tight letter-spacing became possible
  - Herb Lubalin's expressive typography
  - The ITC explosion of new faces

  #v(0.4em)
  #sidenote[Over 1,000 new typefaces were released between 1970--1985.]
]

== The Digital Watershed

#stack(
  spacing: 18pt,
  memoir-quote(
    [The computer does not replace the hand; it extends the mind.],
    attribution: [Matthew Carter],
  ),
  [
    In 1984, the Macintosh brought typography to the desktop. PostScript
    (1985) and TrueType (1991) made digital fonts a reality. Suddenly,
    every writer was a typesetter -- for better and for worse.
  ],
)

= Legacy & Future

== The Contemporary Landscape

#cols(columns: (1fr, 1fr, 1fr))[
  #folio-stat([200k+], [Digital typefaces available today])
][
  #folio-stat([92%], [Web content rendered in variable fonts by 2025])
][
  #folio-stat([2016], [OpenType variable fonts specification])
]

== Enduring Principles

#colophon-box(
  [*Readability* remains the supreme measure of typographic success.],
  [*Contrast* between text sizes creates hierarchy without color.],
  [*Whitespace* is not empty -- it is the silence between notes.],
  [*Consistency* in spacing and alignment produces harmony.],
  [*Restraint* in the use of typefaces demonstrates mastery.],
)

#focus-slide[
  The history of typography is the history of civilisation itself --
  each letterform a fossil record of the culture that shaped it.
]

#ending-slide[
  #stack(
    spacing: 0.8em,
    [Typeset in the tradition of Aldus Manutius],
    [The Aldine Press Society #sym.dot.c MMXXVI],
  )
]
