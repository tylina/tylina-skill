#import "@preview/examora:0.2.0": documentclass

#set text(lang: "zh")

#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"

#let exam = documentclass(
  info: (
    school: "示例学校",
    subject: "数学",
    class: "七年级",
    date: datetime(year: 2026, month: 9, day: 18),
    duration: [45 分钟],
  ),
  margin: (
    top: 2.2cm,
    bottom: 2.2cm,
    outside: 1.8cm,
    inside: 1.8cm,
  ),
  student-info: ("班级", "姓名", "学号"),
  type: "A 卷",
  method: "闭卷",
  font: ("New Computer Modern", "Noto Serif CJK SC"),
  title-font: ("New Computer Modern", "Noto Serif CJK SC"),
  random: false,
  double-page: false,
  frame: false,
  show-answer: show-solutions,
  answer-color: rgb("#8b1f2d"),
)

#show: exam.mainmatter

#(exam.title)()
#(exam.at("score-table"))()

#(exam.at("question-header"))([选择题（每题 4 分，共 4 分）])

#(exam.at("choice-question"))((
  (
    [若 $x + 2 = 5$，则 $x$ 等于],
    ([1], [2], ([3], true), [4]),
    (fixed: true),
  ),
))

#(exam.at("question-header"))([填空题（每题 4 分，共 4 分）])

#(exam.at("fill-question"))((
  ([一个正方形的边长为 $3 "cm"$，面积为], ([$9 "cm"^2$], 3cm), [。]),
))

#(exam.at("question-header"))([解答题（12 分）])

#(exam.question)(
  question: [说明方程 $x + 2 = 5$ 的求解过程。],
  answer: [等式两边同时减去 2，得到 $x = 3$。],
  spacing: 4cm,
)
