// Chalkboard Theme Demo — Introduction to Graph Theory
// Academic lecture style presentation
// Touying 0.7.4

#import "@preview/touying:0.7.4": *
#import "@preview/mitex:0.2.7": *
#import "@preview/lovelace:0.3.1": *
#import "template.typ": *

#show: chalkboard-theme.with(
  aspect-ratio: "16-9",
  config-common(breakable: false),
  footer: [MATH 301 -- Introduction to Graph Theory],
  config-info(
    title: [Introduction to Graph Theory],
    subtitle: [Fundamentals, Structures, and Applications],
    author: [Prof. Eleanor Whitmore],
    institution: [Department of Mathematics, Evergreen University],
    date: datetime(year: 2026, month: 5, day: 23),
  ),
)
#set text(font: ("Chalkboard SE", "Noto Sans SC"))
#show raw: set text(font: "Menlo")

// ══════════════════════════════════════
// Title Slide
// ══════════════════════════════════════
#title-slide()

// ══════════════════════════════════════
// Section 1: Foundations
// ══════════════════════════════════════
= Foundations

== What is a Graph?

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chalk-card([Definition], [
    A *graph* #mi(`G = (V, E)`) consists of:
    - A set #mi(`V`) of _vertices_ (or nodes)
    - A set #mi(`E`) of _edges_ connecting pairs of vertices

    Each edge #mi(`e \in E`) is a 2-element subset of #mi(`V`).
  ], accent: palette.ink),
  chalk-card([Key Properties], [
    - *Order*: number of vertices #mi(`|V|`)
    - *Size*: number of edges #mi(`|E|`)
    - *Degree* #mi(`\deg(v)`): edges incident to vertex #mi(`v`)
    - *Adjacent*: vertices connected by an edge
  ], accent: palette.secondary),
)

#v(0.5em)

#formula-box[
  *Handshaking Lemma:*
  #mitex(`\sum_{v \in V} \deg(v) = 2|E|`)

  *Euler's Formula (Planar Graphs):* #h(0.6em) #mi(`V - E + F = 2`)
]

== Types of Graphs

#cols(columns: (1fr, 1fr, 1fr), gutter: 1em, lazy-layout: true,
  chalk-card([Simple Graphs], [
    No loops or multiple edges. The most common type studied in introductory courses.

    Example: friendship networks, road maps.
  ], accent: palette.accent),
  chalk-card([Directed Graphs], [
    Edges have direction (ordered pairs). Also called _digraphs_.

    Example: web links, one-way streets, dependencies.
  ], accent: palette.chalk-pink),
  chalk-card([Weighted Graphs], [
    Edges carry numerical values (weights or costs).

    Example: distances, capacities, signal strengths.
  ], accent: palette.chalk-orange),
)

#v(0.4em)

#eraser-box([Historical Note], [
  Graph theory originated in 1736 when Leonhard Euler solved the Konigsberg Bridge Problem, proving no walk could cross all seven bridges exactly once.
])

// ══════════════════════════════════════
// Section 2: Paths and Connectivity
// ══════════════════════════════════════
= Paths & Connectivity

== Paths, Walks, and Cycles

#cols[
  #board-section([Definitions], [
    - *Walk*: A sequence of vertices where consecutive vertices are adjacent
    - *Path*: A walk with no repeated vertices
    - *Cycle*: A path that starts and ends at the same vertex
    - *Trail*: A walk with no repeated edges
  ])

  #v(0.5em)

  #formula-box(color: palette.secondary)[
    *Theorem (Euler):* A connected graph has an Eulerian circuit if and only if every vertex has even degree.
  ]
][
  #chalk-quote(
    [The solution of the Konigsberg bridge problem is the birth of graph theory and topology alike.],
    author: [Biggs, Lloyd & Wilson, 1976]
  )

  #v(0.5em)

  #chalk-card([Eulerian vs Hamiltonian], [
    - *Eulerian path*: visits every _edge_ exactly once
    - *Hamiltonian path*: visits every _vertex_ exactly once

    Finding Hamiltonian paths is NP-complete; Eulerian paths can be found in polynomial time.
  ], accent: palette.accent)
]

== Connectivity

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chalk-card([Connected Graphs], [
    A graph is *connected* if there exists a path between every pair of vertices.

    *Components*: maximal connected subgraphs.

    A graph with $n$ vertices needs at least $n - 1$ edges to be connected.
  ], accent: palette.secondary),
  chalk-card([Bridges and Cut Vertices], [
    - *Bridge*: edge whose removal disconnects the graph
    - *Cut vertex*: vertex whose removal disconnects the graph

    These are critical points in network reliability analysis.
  ], accent: palette.chalk-pink),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
  chalk-stat([Min edges (connected)], [$n - 1$]),
  chalk-stat([Max edges (simple)], [$binom(n, 2)$], color: palette.secondary),
  chalk-stat([Complete graph $K_n$], [$n(n-1)/2$], color: palette.chalk-orange),
)

// ══════════════════════════════════════
// Section 3: Trees and Spanning Trees
// ══════════════════════════════════════
= Trees

== Tree Fundamentals

#cols[
  #chalk-card([Definition], [
    A *tree* is a connected graph with no cycles.

    Equivalent characterizations:
    - Connected and has exactly $n - 1$ edges
    - Any two vertices are connected by a unique path
    - Connected, but removing any edge disconnects it
    - Acyclic, but adding any edge creates a cycle
  ], accent: palette.accent)

  #v(0.4em)

  #stack(dir: ltr, spacing: 0.6em,
    lesson-tag([Acyclic], color: palette.accent),
    lesson-tag([Connected], color: palette.secondary),
    lesson-tag([Minimal], color: palette.chalk-pink),
  )
][
  #formula-box[
    *Cayley's Formula:* The number of labeled trees on $n$ vertices is $n^(n-2)$
  ]

  #v(0.5em)

  #eraser-box([Applications of Trees], [
    - File system hierarchies
    - Decision trees in machine learning
    - Parse trees in compilers
    - Phylogenetic trees in biology
    - Network spanning trees
  ])
]

== Spanning Trees

#cols(columns: (1fr, 1fr), gutter: 1.2em)[
  #stack(
    spacing: .8em,
    chalk-card([Minimum Spanning Tree], [
      Given a weighted graph, find a spanning tree with minimum total edge weight.

      *Key algorithms:*
      - *Kruskal's*: sort edges by weight, add if no cycle forms
      - *Prim's*: grow tree greedily from a start vertex

      Both run in #mi(`O(E \log V)`) time.
    ], accent: palette.accent),
    eraser-box([Properties], [
      - Every connected graph has a spanning tree
      - A spanning tree on #mi(`n`) vertices has exactly #mi(`n-1`) edges
      - *Cut property*: lightest edge crossing any cut belongs to some MST
    ]),
  )
][
  #set text(size: 0.78em)
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[Kruskal's MST])[
      + Sort all edges by weight: #mi(`e_1 \le e_2 \le \cdots \le e_m`)
      + Initialize forest #mi(`T \leftarrow \emptyset`)
      + Initialize Union-Find on vertex set #mi(`V`)
      + *for each* edge #mi(`(u, v)`) in sorted order *do*
        + *if* #mi(`\text{Find}(u) \ne \text{Find}(v)`) *then*
          + Add #mi(`(u, v)`) to #mi(`T`)
          + #mi(`\text{Union}(u, v)`)
        + *end if*
      + *end for*
      + *return* #mi(`T`)
    ]
  )
]

// ══════════════════════════════════════
// Section 4: Graph Coloring
// ══════════════════════════════════════
= Graph Coloring

== Chromatic Number

#cols[
  #board-section([The Coloring Problem], [
    A *proper coloring* assigns colors to vertices such that no two adjacent vertices share the same color.

    The *chromatic number* $chi(G)$ is the minimum number of colors needed.
  ])

  #v(0.4em)

  #cols(columns: (1fr, 1fr, 1fr), gutter: 0.8em, lazy-layout: true,
    chalk-stat([Complete $K_n$], [$chi = n$]),
    chalk-stat([Bipartite], [$chi = 2$], color: palette.secondary),
    chalk-stat([Odd cycle], [$chi = 3$], color: palette.chalk-pink),
  )
][
  #formula-box(color: palette.chalk-pink)[
    *Four Color Theorem:* Every planar graph can be properly colored with at most 4 colors.
  ]

  #v(0.4em)

  #eraser-box([Proof History], [
    First conjectured in 1852. Proved by Appel & Haken in 1976 using computer assistance -- the first major theorem proved by computer. Verified multiple times since.
  ])

  #v(0.3em)

  #stack(dir: ltr, spacing: 0.5em,
    lesson-tag([Planar], color: palette.accent),
    lesson-tag([NP-hard], color: palette.chalk-pink),
    lesson-tag([Scheduling], color: palette.chalk-orange),
  )
]

== Applications of Coloring

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chalk-card([Scheduling Problems], [
    *Exam scheduling*: vertices are exams, edges connect exams with common students. Colors represent time slots.

    *Register allocation*: variables are vertices, edges connect simultaneously live variables. Colors are CPU registers.
  ], accent: palette.accent),
  chalk-card([Map Coloring], [
    *Geographic maps*: regions are vertices, edges connect bordering regions. The four-color theorem guarantees 4 colors suffice.

    *Frequency assignment*: radio towers are vertices, edges connect towers with interference. Colors are frequencies.
  ], accent: palette.chalk-orange),
)

#v(0.4em)

#chalk-quote(
  [Graph coloring transforms abstract combinatorics into a practical tool for resource allocation under conflict constraints.],
  author: [Jensen & Toft, Graph Coloring Problems, 1995]
)

// ══════════════════════════════════════
// Section 5: Applications
// ══════════════════════════════════════
= Real-World Applications

== Network Analysis

#cols(columns: (1fr, 1fr), gutter: 1.2em, lazy-layout: true,
  chalk-card([Social Networks], [
    - Vertices: people; Edges: friendships
    - *Degree centrality*: most connected individuals
    - *Betweenness*: key intermediaries
    - *Clustering coefficient*: measure of local cohesion
    - *Small world phenomenon*: six degrees of separation
  ], accent: palette.secondary),
  chalk-card([Internet & Web], [
    - Web graph: pages linked by hyperlinks (directed)
    - *PageRank*: importance via random walks
    - *Shortest paths*: routing algorithms (Dijkstra, Bellman-Ford)
    - *Max-flow/min-cut*: bandwidth optimization
    - Scale-free network structure
  ], accent: palette.chalk-pink),
)

#v(0.4em)

#cols(columns: (1fr, 1fr, 1fr, 1fr), gutter: 0.6em, lazy-layout: true,
  chalk-stat([Facebook], [2.9B nodes], color: palette.secondary),
  chalk-stat([WWW], [~50B pages], color: palette.chalk-pink),
  chalk-stat([Avg path], [~4.7 hops], color: palette.accent),
  chalk-stat([Clustering], [0.6 avg], color: palette.chalk-orange),
)

== Graph Traversal Algorithms

#cols[
  #board-section([BFS vs DFS Complexity], [
    Both algorithms run in #mi(`O(V + E)`) time and #mi(`O(V)`) space.

    - *BFS*: explores layer by layer — finds shortest paths (unweighted)
    - *DFS*: explores depth-first — detects cycles, topological sort

    For weighted shortest paths, Dijkstra runs in #mi(`O((V + E) \log V)`)
    using a binary heap.
  ])

  #v(0.4em)

  #formula-box(color: palette.secondary)[
    *Dijkstra's relaxation step:*

    #mitex(`d[v] \leftarrow \min\!\bigl(d[v],\; d[u] + w(u, v)\bigr)`)
  ]
][
  #set text(size: 0.78em)
  #figure(
    kind: "algorithm",
    supplement: [Algorithm],
    pseudocode-list(booktabs: true, numbered-title: smallcaps[Breadth-First Search])[
      + *Input:* graph #mi(`G = (V, E)`), source #mi(`s \in V`)
      + Mark all vertices unvisited; set #mi(`d[v] \leftarrow \infty`)
      + Set #mi(`d[s] \leftarrow 0`); enqueue #mi(`s`) into queue #mi(`Q`)
      + *while* #mi(`Q \ne \emptyset`) *do*
        + Dequeue #mi(`u \leftarrow Q.\text{dequeue}()`)
        + *for each* neighbour #mi(`v`) of #mi(`u`) *do*
          + *if* #mi(`v`) is unvisited *then*
            + Mark #mi(`v`) visited; set #mi(`d[v] \leftarrow d[u] + 1`)
            + Enqueue #mi(`v`)
          + *end if*
        + *end for*
      + *end while*
      + *return* distances #mi(`d`)
    ]
  )
]

// ══════════════════════════════════════
// Focus Slide
// ══════════════════════════════════════

#focus-slide[
  _"The theory of graphs is one of the few fields of mathematics where one can begin to do research after learning very little."_

  #text(size: 0.6em, weight: "regular", fill: palette.ink-muted)[-- Frank Harary]
]

// ══════════════════════════════════════
// Ending Slide
// ══════════════════════════════════════

#ending-slide[Class Dismissed]
