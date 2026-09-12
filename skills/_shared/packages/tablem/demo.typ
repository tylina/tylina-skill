#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/tablem:0.3.0": tablem, three-line-table

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Tablem Demo — Markdown-like Tables

=== Basic Table

#figure(
  tablem[
    | *Framework* | *Language* | *Stars* | *License* |
    | ----------- | ---------- | ------- | --------- |
    | Touying     | Typst      | 2.5k    | Apache-2  |
    | Beamer      | LaTeX      | N/A     | LPPL      |
    | Slidev      | Vue        | 35k     | MIT       |
    | Marp        | Markdown   | 8k      | MIT       |
  ]
)

=== Three-line Table (Academic Style)

#figure(
  three-line-table[
    | *Method* | *Accuracy* | *F1 Score* | *Time (ms)* |
    | :------: | :--------: | :--------: | :---------: |
    | Ours     | *95.2%*  | *0.943*  | 12.3        |
    | Baseline | 89.7%      | 0.891      | 15.8        |
    | Previous | 91.3%      | 0.908      | 14.1        |
  ]
)
