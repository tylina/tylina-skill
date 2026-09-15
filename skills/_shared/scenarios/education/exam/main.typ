#import "assessment.typ": exam, question, working, answer

#show: exam.with(
  title: [End-of-unit assessment],
  course: [Course · Learner level · Locale],
  duration: [60 minutes],
  total: 20,
  instructions: [Replace with supplied rules for allowed aids, units, rounding, and how work is graded.],
)

#question(points: 4)[
  Replace with a concise recall or interpretation task tied to a supplied objective.
]
#working(height: 24mm)
#answer[Replace with the verified response and a four-point criterion.]

#question(points: 6)[
  Replace with a multi-step application task. State every necessary datum and assumption.
]
#working(height: 42mm)
#answer[Replace with the supported method, result, units, and allocation of six observable points.]

#pagebreak()

#question(points: 10)[
  Replace with a synthesis task whose scope and expected form are explicit. Avoid testing language
  complexity unless language itself is the learning objective.
]
#working(height: 105mm)
#answer[
  Replace with the verified solution and a ten-point rubric that separates reasoning, evidence,
  correctness, and communication where those dimensions are actually required.
]

#block(above: 1.2em, stroke: (top: 0.7pt + luma(55%)), inset: (top: 7pt))[
  *Declared total:* 20 points. Recalculate after every question or rubric change.
]
