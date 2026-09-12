#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

#show: simple-theme.with(aspect-ratio: "16-9")
#show: show-theorion

#set text(size: 18pt)

== Theorion Demo — Theorem Environments

#theorem[Euclid's Theorem][
  There are infinitely many prime numbers.
] <thm:euclid>

#proof[
  Suppose there are only finitely many primes $p_1, p_2, ..., p_n$.
  Consider $N = p_1 dot p_2 dot ... dot p_n + 1$.
  Then $N$ is not divisible by any $p_i$, contradiction.
]

#definition[Prime Number][
  A natural number $p > 1$ is *prime* if its only divisors are $1$ and $p$.
]

#lemma[
  Every integer $n > 1$ has a prime factor.
]

#corollary[
  The set of primes is unbounded.
]
