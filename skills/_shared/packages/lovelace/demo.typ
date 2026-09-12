#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/lovelace:0.3.1": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 16pt)

== Lovelace Demo — Pseudocode

#figure(
  kind: "algorithm",
  supplement: [Algorithm],
  pseudocode-list(booktabs: true, numbered-title: smallcaps[Insertion Sort])[
    + *Input*: Array $A$ of $n$ elements #h(10em)
    + *Output*: Sorted array $A$
    + *for* $i = 1$ to $n - 1$ *do*
      + $"key" <- A[i]$
      + $j <- i - 1$
      + *while* $j >= 0$ and $A[j] > "key"$ *do*
        + $A[j + 1] <- A[j]$
        + $j <- j - 1$
      + *end*
      + $A[j + 1] <- "key"$
    + *end*
    + *return* $A$
  ]
) <insertion-sort>

See @insertion-sort for the insertion sort algorithm.
