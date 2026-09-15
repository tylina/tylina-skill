#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"
#let question-counter = counter("homework-question")

#let assignment(title: [], course: [], due: [], instructions: [], body) = {
  set page(paper: "a4", margin: (x: 23mm, y: 22mm), numbering: "1")
  set text(font: ("Libertinus Serif", "New Computer Modern"), size: 11pt)
  set par(leading: 0.72em)

  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(size: 18pt, weight: "bold", title),
    text(weight: "semibold", if show-solutions { [Instructor edition] } else { [Learner edition] }),
  )
  grid(
    columns: (1fr, auto),
    text(fill: luma(35%), course),
    text(fill: luma(35%), [Due: #due]),
  )
  line(length: 100%, stroke: 0.7pt + luma(55%))
  if instructions != [] {
    block(inset: (y: 7pt), fill: luma(96%), radius: 3pt)[#instructions]
  }
  body
}

#let question(points: 0, body) = {
  question-counter.step()
  block(above: 1.1em, below: 0.55em, breakable: true)[
    #context text(weight: "bold")[Question #question-counter.display("1")]
    #h(1fr)
    #text(fill: luma(38%))[(#points points)]
    #v(0.35em)
    #body
  ]
}

#let response-space(height: 26mm) = if not show-solutions {
  block(
    width: 100%,
    height: height,
    stroke: 0.45pt + luma(78%),
    radius: 2pt,
  )
}

#let solution(body) = if show-solutions {
  block(
    width: 100%,
    inset: 8pt,
    fill: rgb("#eef6ee"),
    stroke: 0.6pt + rgb("#8cad8c"),
    radius: 3pt,
  )[
    #text(weight: "semibold", fill: rgb("#315f31"))[Solution]
    #h(0.45em)
    #body
  ]
}
