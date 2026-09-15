#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"
#let question-counter = counter("exam-question")

#let exam(
  title: [],
  course: [],
  duration: [],
  total: 0,
  instructions: [],
  body,
) = {
  set page(paper: "a4", margin: (x: 19mm, top: 18mm, bottom: 20mm), numbering: "1 / 1")
  set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.5pt)
  set par(leading: 0.68em)

  align(center)[
    #text(size: 18pt, weight: "bold")[#title]
    #v(0.3em)
    #text(fill: luma(35%))[#course · #duration · #total points]
    #if show-solutions { v(0.3em); text(weight: "bold", fill: rgb("#8b2d2d"))[Answer edition] }
  ]
  if not show-solutions {
    v(0.8em)
    grid(
      columns: (1.3fr, 1fr, 0.7fr),
      column-gutter: 12pt,
      [Name: #line(length: 70%)],
      [ID: #line(length: 65%)],
      [Seat: #line(length: 55%)],
    )
  }
  block(
    above: 0.8em,
    inset: 8pt,
    fill: luma(96%),
    stroke: 0.5pt + luma(80%),
    radius: 3pt,
  )[#instructions]
  body
}

#let question(points: 0, body) = {
  question-counter.step()
  block(above: 1.15em, below: 0.5em, breakable: true)[
    #context text(weight: "bold")[#question-counter.display("1"). #body]
    #h(0.5em)
    #text(fill: luma(40%))[(#points points)]
  ]
}

#let working(height: 32mm) = if not show-solutions {
  block(width: 100%, height: height, stroke: 0.45pt + luma(80%), radius: 2pt)
}

#let answer(body) = if show-solutions {
  block(
    width: 100%,
    inset: 8pt,
    fill: rgb("#f7f1e8"),
    stroke: 0.6pt + rgb("#bc9461"),
    radius: 3pt,
  )[*Expected answer and scoring:* #body]
}
