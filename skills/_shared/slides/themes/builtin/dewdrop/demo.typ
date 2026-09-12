#import "@preview/touying:0.7.4": *
#import themes.dewdrop: *
#import "@preview/mitex:0.2.7": *

#import "@preview/numbly:0.1.0": numbly

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  config-common(breakable: false),
  config-info(
    title: [Dewdrop Theme Demo],
    subtitle: [Elegant Navigation],
    author: [Author Name],
    date: datetime.today(),
    institution: [Institution],
    contact: [contact\@mail.com],
  ),
)

#set text(font: ("Libertinus Serif", "New Computer Modern"))
#set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

#outline-slide(depth: 1)

= Navigation

== Mini-Slides

Mini-slides keep section context visible while leaving the body open for lecture material. Mathematical notation retains a clear focal point:

#mitex(`x_{n+1} = \frac{x_n + \frac{a}{x_n}}{2}`)

== Sidebar and Footer

Choose the navigation mode that matches the audience and delivery setting.

- `sidebar` keeps a detailed outline beside dense material
- `mini-slides` provides compact progress across the top
- `none` leaves the full canvas to the lecture content

= Delivery

== Academic Content

#cols(columns: (1fr, 1fr), gutter: 2em)[
  *Why the structure works*

  Dewdrop separates navigation, content, and footer into stable zones, so technical explanations stay predictable across sections.
][
  *Use it for*

  - Multi-section lectures
  - Incremental workshops
  - Course reference decks
]

#focus-slide[Navigation should reveal structure, not compete with it.]

== Progressive Reveals

Use `#pause` to reveal the next teaching step.

#pause

The explanation appears only when it becomes relevant.

#meanwhile

Parallel thread: a question appears first.

#pause

Parallel thread: evidence arrives next.

#pause

Parallel thread: the conclusion lands last.

= Reference

== Numbering Check

The outline, navigation markers, and footer agree on the same final slide count.
