// Parchment Theme Demo — The Art of the Medieval Manuscript
// Humanities presentation on illuminated manuscripts and book history
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "template.typ": *

#set text(font: ("IBM Plex Serif", "Noto Serif SC"))
#show raw: set text(font: "IBM Plex Mono")

#show: parchment-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [The Art of the Medieval Manuscript],
  config-info(
    title: [The Art of the Medieval Manuscript],
    subtitle: [Scribes, Illuminators, and the Transmission of Knowledge],
    author: [Dr. Eleanor Ashworth],
    institution: [Department of Medieval Studies, St. Andrews College],
    date: datetime(year: 2026, month: 5, day: 24),
  ),
)

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Origins
// ══════════════════════════════════════
= Origins of the Codex

== From Scroll to Codex

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  manuscript-card([The Ancient Scroll], [
    The _volumen_ (scroll) dominated the ancient world for millennia. Made from papyrus or parchment, scrolls were read by unrolling with both hands -- limiting access to sequential reading only.

    Key limitations:
    - No random access to content
    - Fragile when repeatedly opened
    - Single-sided writing only
  ]),
  manuscript-card([The Codex Revolution], [
    By the 4th century CE, the codex (bound book) had largely replaced the scroll in the Roman world. Christians adopted the codex early, perhaps to distinguish their texts from Jewish scrolls.

    Advantages:
    - Random access via page turning
    - Both sides of leaves used
    - Compact and portable
  ], accent: palette.secondary),
)

#v(0.4em)

#marginalia-note([_Note:_ The word "codex" derives from Latin _caudex_ (tree trunk), referring to the wooden tablets that preceded parchment leaves.])

== Materials and Preparation

#cols[
  #manuscript-card([Parchment Production], [
    Parchment (_pergamenum_) was made from animal skins -- typically calf (vellum), sheep, or goat. The process involved:

    + *Soaking* in lime solution for days
    + *Scraping* hair and flesh from both sides
    + *Stretching* on a wooden frame
    + *Drying* under tension
    + *Smoothing* with pumice stone

    A single large Bible could require 250--300 animal skins.
  ], accent: palette.accent)
][
  #stack(
    spacing: .8em,
    illuminated-box([Ink and Pigments], [
      Medieval scribes used two primary inks:
      - *Iron gall ink*: tannin + iron sulfate (turns black)
      - *Carbon ink*: lampblack + gum arabic (pure black)

      Colored pigments included lapis blue, vermilion red, verdigris green, and gold leaf.
    ]),
    cols(columns: (1fr, 1fr, 1fr), gutter: 0.6em,
      folio-stat([Calves per Bible], [250+], color: palette.primary),
      folio-stat([Prep time/skin], [2 weeks], color: palette.accent),
      folio-stat([Ink colors], [12+], color: palette.secondary),
    ),
  )
]

// ══════════════════════════════════════
// Section 2: The Scriptorium
// ══════════════════════════════════════
= The Scriptorium

== Monastic Book Production

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em,
    manuscript-card([The Writing Room], [
      The _scriptorium_ was the dedicated writing room in a monastery. Scribes worked in silence, copying texts letter by letter from an exemplar. A single manuscript could take months or years to complete.

      Key roles:
      - *Armarius*: librarian who assigned tasks
      - *Scriptor*: the copyist
      - *Rubricator*: added red headings
      - *Illuminator*: painted decorations
    ]),
    manuscript-card([Daily Life of a Scribe], [
      Scribes worked during daylight hours only -- candles were forbidden near precious manuscripts. The physical toll was considerable: cramped fingers, aching backs, and eye strain.

      Colophon complaints survive:
      - "Thank God it will soon be dark"
      - "Writing is excessive drudgery"
      - "Three fingers write but the whole body suffers"
    ], accent: palette.primary),
  ),
  stack(dir: ltr, spacing: 0.6em,
    colophon-tag([Benedictine], color: palette.primary),
    colophon-tag([Cistercian], color: palette.secondary),
    colophon-tag([Carolingian], color: palette.accent),
  ),
)

== Scripts and Calligraphy

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #stack(
    spacing: .8em,
    manuscript-card([Five Foundational Scripts], [
      + *Uncial (4th--8th c.)*: rounded capitals for early Christian texts
      + *Half-uncial (5th--9th c.)*: transitional insular script
      + *Carolingian minuscule (8th--12th c.)*: clear, standardized reform
      + *Gothic textura (12th--15th c.)*: angular liturgical hand
      + *Humanist minuscule (15th c.)*: model for Roman type
    ], accent: palette.accent),
    marginalia-note([Carolingian minuscule, commissioned by Charlemagne ca. 780 CE, ultimately became the model for modern lowercase letterforms.], accent: palette.accent),
  )
][
  #stack(
    spacing: .8em,
    illuminated-box([The Carolingian Reform], [
      Charlemagne's educational program (_correctio_) demanded consistent script, spelling, and grammar across the empire. Alcuin of York developed a minuscule that was:

      - Highly legible with distinct letter shapes
      - Economical in use of parchment
      - Consistent across distant monasteries
    ], color: palette.primary),
    folio-stat([Surviving Carolingian MSS], [7,000+], color: palette.accent),
  )
]

// ══════════════════════════════════════
// Section 3: Illumination
// ══════════════════════════════════════
= The Art of Illumination

== Decorative Programs

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  manuscript-card([Historiated Initials], [
    Large decorated letters containing narrative scenes. The initial "B" of _Beatus vir_ in Psalters often depicted King David playing the harp.

    These initials served as visual entry points, guiding the reader into the text.
  ], accent: palette.primary),
  manuscript-card([Border Decoration], [
    Marginal ornament evolved from simple vine scrolls (8th c.) to elaborate _baguette_ borders with hybrid creatures, grotesques, and naturalistic flora (14th--15th c.).

    _Bas-de-page_ scenes added humor or commentary below the text.
  ], accent: palette.accent),
  manuscript-card([Miniature Paintings], [
    Full or half-page paintings illustrating the text. Books of Hours contained cycles of miniatures depicting the life of the Virgin, calendar labors, and saints.

    Major schools: Parisian, Flemish, English, and Italian.
  ], accent: palette.secondary),
)

#v(0.4em)

#flourish-divider(color: palette.accent, width: 40%)

== Gold and Pigment

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #illuminated-box([Gold Application Techniques], [
    - *Shell gold*: powdered gold mixed with gum, painted directly
    - *Gold leaf on gesso*: raised gilding with burnished surface
    - *Chrysography*: writing in gold ink on purple parchment

    The burnished gold leaf technique created a three-dimensional, light-catching surface that made pages literally "illuminate" -- hence the term _illumination_.
  ], color: palette.accent)
][
  #stack(
    spacing: .8em,
    manuscript-card([The Cost of Color], [
      Certain pigments were extraordinarily expensive. A single ounce of ultramarine (ground lapis lazuli from Afghanistan) could cost as much as gold itself. Patrons sometimes specified which pigments to use in contracts.
    ]),
    cols(columns: (1fr, 1fr), gutter: 0.6em,
      folio-stat([Lapis per folio], [2--5g], color: palette.primary),
      folio-stat([Gold leaves/book], [100+], color: palette.accent),
    ),
  )
]

// ══════════════════════════════════════
// Section 4: Transmission of Knowledge
// ══════════════════════════════════════
= Transmission of Knowledge

== Libraries and Survival

#cols[
  #stack(
    spacing: .8em,
    manuscript-card([Monastic Libraries], [
      Medieval libraries were small by modern standards. Even major monasteries rarely held more than a few hundred volumes. The largest collections:

      - *Cluny* (11th c.): ~570 volumes
      - *Christ Church Canterbury* (14th c.): ~1,800 volumes
      - *Sorbonne* (14th c.): ~1,700 volumes
      - *Vatican* (15th c.): ~3,500 volumes

      Books were chained to desks or stored in armaria (book chests).
    ], accent: palette.primary),
    stack(dir: ltr, spacing: 0.5em,
      colophon-tag([Chained Libraries]),
      colophon-tag([Book Chests], color: palette.secondary),
      colophon-tag([Armaria], color: palette.accent),
    ),
  )
][
  #stack(
    spacing: .8em,
    illuminated-box([Survival Rates], [
      The vast majority of medieval manuscripts have been lost. Estimates suggest that only *1--2%* of all manuscripts produced before 1100 CE survive today. Losses came from:

      - Viking raids and fires
      - Dissolution of monasteries (Henry VIII)
      - Rebinding and scraping for reuse (palimpsests)
      - Simple neglect and decay
    ], color: palette.primary),
    cols(columns: (1fr, 1fr), gutter: 0.6em,
      folio-stat([Survival rate], [1--2%], color: palette.primary),
      folio-stat([Extant MSS (pre-1500)], [~500K], color: palette.accent),
    ),
  )
]

== From Manuscript to Print

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em,
    manuscript-card([Gutenberg's Revolution], [
      Johannes Gutenberg's movable type press (ca. 1450) transformed book production. His 42-line Bible deliberately imitated manuscript conventions:
      - Gothic textura typeface
      - Hand-rubricated initials
      - Two-column layout
      - Parchment and paper versions

      Early printed books (_incunabula_) were designed to look like manuscripts.
    ]),
    manuscript-card([Continuity and Change], [
      The transition from manuscript to print was gradual, not sudden. Manuscripts continued to be produced alongside printed books well into the 16th century, especially for:

      - Luxury commissions for aristocrats
      - Liturgical books for specific churches
      - Legal documents requiring unique authority
      - Personal devotional books (Books of Hours)
    ], accent: palette.secondary),
  ),
  marginalia-note([_Nota bene:_ The Gutenberg Bible (1455) was printed in an edition of approximately 180 copies -- 49 survive today, making each worth over \$25 million.], accent: palette.primary),
)

// ══════════════════════════════════════
// Section 5: Legacy
// ══════════════════════════════════════
= Legacy and Digital Futures

== Modern Manuscript Studies

#stack(
  spacing: .8em,
  cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
    manuscript-card([Codicology], [
      The study of manuscripts as physical objects. Examines:
      - *Collation*: gathering structure
      - *Ruling*: line patterns pricked and ruled
      - *Binding*: sewing, boards, covers
      - *Provenance*: ownership marks, bookplates

    ], accent: palette.secondary),
    manuscript-card([Digital Humanities], [
      Digital tools are transforming manuscript studies:
      - *IIIF*: International Image Interoperability Framework
      - *TEI encoding*: standardized text markup
      - *HTR*: Handwritten Text Recognition (AI-assisted)
      - *Virtual reunification*: reassembling dispersed collections

    ], accent: palette.accent),
  ),
  cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.5em, lazy-layout: true,
    folio-stat([Digitized MSS], [200K+], color: palette.secondary),
    folio-stat([IIIF manifests], [50M+], color: palette.accent),
    folio-stat([HTR accuracy], [95%+], color: palette.primary),
    folio-stat([Active projects], [300+], color: palette.secondary),
  ),
)

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"A book is not merely a collection of leaves; it is the vessel of civilization itself."_

  #text(size: 0.6em, weight: "regular", fill: palette.text-muted)[-- Richard de Bury, Philobiblon, 1345]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Finis]
