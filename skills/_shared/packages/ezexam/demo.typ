#import "@preview/ezexam:0.3.1": *

#let show-solutions = sys.inputs.at("solutions", default: "false") == "true"

#show: setup.with(
  mode: EXAM,
  paper: a4,
  show-answer: show-solutions,
  show-seal-line: false,
  par-justify: false,
  font: ("New Computer Modern", "Noto Serif CJK SC"),
  heading-font: ("New Computer Modern", "Noto Sans CJK SC"),
)

#title[代数小测]
#subject[数学]

#notice(
  [本示例只演示排版 API；实际题目、分值和考试说明应来自教师或课程要求。],
  [请在答题区域写出必要步骤。],
)

= 选择题：本题 4 分。

#question(points: 4)[
  若 $x + 2 = 5$，则 $x$ 等于 #paren(placeholder: [])[B]
  #choices(1, 3, 5, 7)
]

= 填空题：本题 4 分。

#question(points: 4)[
  一个正方形的边长为 $3 "cm"$，面积为 #fillin(placeholder: [])[$9 "cm"^2$].
]

= 解答题：本题 12 分。

#question(points: 12, bottom: 4cm)[
  说明方程 $x + 2 = 5$ 的求解过程。
]

#solution-block[
  #solution(title: "解析")[选择题答案为 B，因为 $5 - 2 = 3$。]
  #solution[正方形面积为 $3 "cm" times 3 "cm" = 9 "cm"^2$。]
  #solution[等式两边同时减去 2，得到 $x = 3$。]
]
