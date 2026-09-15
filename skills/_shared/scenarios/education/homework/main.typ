#import "assignment.typ": assignment, question, response-space, solution

#show: assignment.with(
  title: [Homework 1],
  course: [Course · Learner level],
  due: [Replace with supplied date],
  instructions: [State allowed aids, submission method, units, and rounding policy.],
)

#question(points: 4)[
  Replace this prompt with a supplied learning objective and enough information for one
  unambiguous response.

  #response-space()
  #solution[Replace this text with the verified answer and observable scoring criteria.]
]

#question(points: 6)[
  Replace this prompt with a second task. Keep notation, units, and expected precision explicit.

  #response-space(height: 42mm)
  #solution[
    Replace this text with a supported worked solution. Allocate points to visible reasoning steps
    rather than an unstated impression of quality.
  ]
]

#block(above: 1.2em, stroke: (top: 0.7pt + luma(55%)), inset: (top: 7pt))[
  *Declared total:* 10 points. Verify this total manually whenever a question changes.
]
