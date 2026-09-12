#import "@preview/touying:0.7.4": *
#import "template.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

#set text(font: ("IBM Plex Sans", "Noto Sans SC"), size: 20pt)

#let pal = build-palette("light")

#show: neon-grid-theme.with(
  aspect-ratio: "16-9",
  preset: "light",
  config-common(breakable: false),
  footer: self => self.info.institution,
  config-info(
    title: [The Next Interface],
    subtitle: [Building spatial computing for the real world],
    author: [Vector Systems Lab],
    date: datetime.today(),
    institution: [VECTOR SYSTEMS],
  ),
)

// ===== Cover =====

#title-slide()

#speaker-note[
  Welcome to Vector Systems Lab. This presentation explores the next generation of spatial computing interfaces -- where wireframe prototypes become production reality.
]

// ============================================================
// Slide 1 -- Dark slide: Core metrics with wireframe atmosphere
// ============================================================

#dark-slide(
  title: none,
  header-left: [SYSTEM METRICS],
  header-right: [Q4 2025],
)[
  #text(size: 36pt, weight: "bold", fill: rgb("#FFFFFF"))[Rendering at Scale]

  #v(0.3em)

#text(size: 11pt, fill: rgb("#FFFFFF").transparentize(40%), font: "IBM Plex Mono", weight: "bold", tracking: 1.5pt)[PERFORMANCE OVERVIEW \/\/ PRODUCTION CLUSTER]

  #v(0.6em)

  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 20pt,
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: rgb("#E91E8C"), font: "IBM Plex Mono")[FRAME RATE]
      #v(0.15em)
      #text(size: 44pt, weight: "bold", fill: rgb("#FFFFFF"))[120]
      #v(0.1em)
      #block(width: 30pt, height: 2pt, fill: rgb("#00BCD4"))
      #v(0.15em)
      #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
        Sustained FPS at 4K resolution across all render nodes.
      ]
    ],
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: rgb("#E91E8C"), font: "IBM Plex Mono")[LATENCY]
      #v(0.15em)
      #text(size: 44pt, weight: "bold", fill: rgb("#FFFFFF"))[\<8ms]
      #v(0.1em)
      #block(width: 30pt, height: 2pt, fill: rgb("#00BCD4"))
      #v(0.15em)
      #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
        End-to-end motion-to-photon pipeline. Below perceptual threshold.
      ]
    ],
    block(width: 100%)[
      #text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: rgb("#E91E8C"), font: "IBM Plex Mono")[POLYGONS]
      #v(0.15em)
      #text(size: 44pt, weight: "bold", fill: rgb("#FFFFFF"))[42M]
      #v(0.1em)
      #block(width: 30pt, height: 2pt, fill: rgb("#00BCD4"))
      #v(0.15em)
      #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
        Real-time wireframe mesh with dynamic level-of-detail.
      ]
    ],
  )

  #v(0.5em)

  #block(width: 100%, height: 1pt, fill: rgb("#E91E8C").transparentize(60%))
]

#speaker-note[
  Opening dark slide with core rendering metrics. The wireframe grid and sphere in the background reinforce the technical theme. Three key stats establish our system capabilities.
]

// ============================================================
// Slide 2 -- Architecture overview with wire-cards
// ============================================================

== Spatial Engine Architecture

#grid(columns: (1fr, 1fr, 1fr), column-gutter: 16pt,
  wire-card([Geometry Pipeline], [
    Mesh generation from point clouds. Adaptive tessellation with LOD management. Real-time wireframe overlay for debugging.
  ]),
  wire-card([Render Cluster], [
    Distributed GPU farm with 128 nodes. Tile-based deferred rendering. Sub-pixel precision at 4K output resolution.
  ]),
  wire-card([Spatial Index], [
    Octree-based spatial partitioning. Frustum culling with 98.2% efficiency. Dynamic object insertion in O(log n).
  ]),
)

#v(0.3em)

#grid-divider()

#v(0.2em)

#render-note[All subsystems maintain < 16ms frame budget under peak load conditions.]

#speaker-note[
  Three pillars of our spatial engine: geometry pipeline, render cluster, and spatial indexing. Wire-cards give each a distinct container. The grid-divider and render-note add technical credibility below.
]

// ============================================================
// Slide 3 -- Innovation Roadmap with vertex badges
// ============================================================

== Innovation Roadmap

#grid(columns: (1fr, 1fr), column-gutter: 28pt,
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Phase Milestones]
    #v(0.5em)
    #polygon-list(
      [Wireframe validated -- 60fps achieved],
      [Spatial audio with 3D positional tracking],
      [120Hz hand tracking -- 21 joints],
      [Deployed across 12 global edge nodes],
    )
  ],
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Key Metrics]
    #v(0.5em)
    #grid(columns: (1fr, 1fr), column-gutter: 12pt,
      pixel-stat([RENDER NODES], [128], description: [4 continents]),
      pixel-stat([UPTIME], [99.97%], description: [90-day SLA]),
    )
    #v(0.4em)
    #glow-tag[GPU CLUSTER]
    #h(0.3em)
    #glow-tag(color: pal.secondary)[EDGE COMPUTE]
    #h(0.3em)
    #glow-tag(color: pal.deep-purple)[ML INFERENCE]
  ],
)

#speaker-note[
  Left column: phased roadmap using polygon-list with numbered vertex badges. Right column: key metrics displayed as pixel-stats with glow-tags for technology categories.
]

// ============================================================
// Slide 4 -- Section divider
// ============================================================

= The Wireframe Future

#speaker-note[
  Section transition. Moving from system architecture to vision -- the wireframe future we are building toward.
]

// ============================================================
// Slide 5 -- Technical deep-dive with frame-highlight and vector-box
// ============================================================

== Neural Mesh Generation

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    #frame-highlight[
      #text(size: 14pt, weight: "bold")[Procedural Geometry from ML]
      #v(0.3em)
      #text(size: 12pt, fill: pal.ink-light)[
        Our neural mesh generator converts sparse point clouds into production-ready wireframes in real-time. The model predicts topology, edge flow, and UV coordinates simultaneously.
      ]
      #v(0.3em)
      #glow-tag[TRANSFORMER]
      #h(0.2em)
      #glow-tag(color: pal.secondary)[REAL-TIME]
    ]
    #v(0.4em)
    #vector-box[
      *Input*: 10K points from LiDAR scan \
      *Output*: Watertight mesh, 50K polygons \
      *Latency*: 12ms per frame on A100
    ]
  ],
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Pipeline Stages]
    #v(0.4em)
    #polygon-list(
      [Point cloud acquisition and denoising],
      [Feature extraction via sparse convolution],
      [Topology prediction with attention layers],
      [Mesh reconstruction and UV unwrap],
      [Real-time LOD generation for streaming],
    )
  ],
)

#speaker-note[
  Neural mesh generation deep-dive. Left side uses frame-highlight for the key concept and vector-box for specifications. Right side details the pipeline stages with polygon-list.
]

// ============================================================
// Slide 6 -- Data comparison with pixel-stats
// ============================================================

== Neural Mesh: Core Inference

#grid(columns: (1fr, 1fr), column-gutter: 24pt,
  block(width: 100%)[
    ```python
    import torch
    from mesh_net import NeuralMesher

    model = NeuralMesher.from_pretrained(
        "vector-systems/mesh-v2",
        device="cuda",
    )

    def generate_mesh(point_cloud: torch.Tensor):
        with torch.inference_mode():
            vertices, faces, uvs = model(
                point_cloud,          # (N, 3) LiDAR points
                target_poly=50_000,   # polygon budget
            )
        return vertices, faces, uvs
    ```
  ],
  block(width: 100%)[
    #text(size: 14pt, weight: "bold", fill: pal.ink)[Output Guarantees]
    #v(0.4em)
    #polygon-list(
      [Watertight manifold mesh, no degenerate faces],
      [UV-unwrapped for texture baking in one pass],
      [LOD hierarchy auto-generated at export],
      [Latency: 12ms on A100, 45ms on RTX 4090],
    )
    #v(0.3em)
    #glow-tag[PyTorch 2.x]
    #h(0.2em)
    #glow-tag(color: pal.secondary)[CUDA 12]
    #h(0.2em)
    #glow-tag(color: pal.deep-purple)[TensorRT]
  ],
)

#speaker-note[
  Code slide showing the Python inference API for neural mesh generation. The model takes raw LiDAR point clouds and returns production-ready geometry. Right column highlights output guarantees and runtime stack.
]

== Benchmark Comparison

#text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.accent, font: "IBM Plex Mono")[PERFORMANCE ANALYSIS \/\/ VS. INDUSTRY STANDARD]

#v(0.3em)

#grid(columns: (1fr, 1fr, 1fr, 1fr), column-gutter: 14pt,
  block(width: 100%)[
    #block(width: 100%, fill: pal.card, stroke: 0.5pt + pal.accent-faint, inset: (x: 0.6em, y: 0.5em))[
      #pixel-stat([THROUGHPUT], [3.2x], description: [Faster than previous generation])
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.card, stroke: 0.5pt + pal.secondary-faint, inset: (x: 0.6em, y: 0.5em))[
      #pixel-stat([MEMORY], [0.4x], description: [Memory footprint reduction])
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.card, stroke: 0.5pt + pal.accent-faint, inset: (x: 0.6em, y: 0.5em))[
      #pixel-stat([ACCURACY], [98.7%], description: [Geometric fidelity score])
    ]
  ],
  block(width: 100%)[
    #block(width: 100%, fill: pal.card, stroke: 0.5pt + pal.secondary-faint, inset: (x: 0.6em, y: 0.5em))[
      #pixel-stat([SCALE], [10x], description: [Scene complexity handling])
    ]
  ],
)

#v(0.4em)

#grid-divider()

#v(0.3em)

#grid(columns: (1fr, auto), column-gutter: 16pt,
  text(size: 10pt, fill: pal.ink-muted)[
    All benchmarks measured on identical hardware (8x A100, 512GB VRAM). Scene: Stanford Bunny at progressive LOD.
  ],
  text(size: 9pt, weight: "bold", fill: pal.meta-color, font: "IBM Plex Mono")[REF: VEC-BENCH-2025],
)

#speaker-note[
  Four-column benchmark comparison using pixel-stat inside bordered cards. Each metric tells a clear story. Grid-divider separates data from methodology notes. Reference ID anchors credibility.
]

// ============================================================
// Slide 7 -- Dark slide: Vision statement
// ============================================================

#dark-slide(
  title: none,
  header-left: [VISION],
  header-right: [2026 AND BEYOND],
)[
  #text(size: 9pt, weight: "bold", tracking: 2pt, fill: rgb("#E91E8C"), font: "IBM Plex Mono")[THE WIREFRAME MANIFESTO]

  #v(0.4em)

  #text(size: 32pt, weight: "bold", fill: rgb("#FFFFFF"))[Every surface begins as a wireframe.]

  #v(0.5em)

  #grid(columns: (1fr, 1fr), column-gutter: 24pt,
    block(width: 100%)[
      #block(
        width: 100%,
        fill: rgb("#FFFFFF").transparentize(92%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: rgb("#FFFFFF"))[01 -- Geometry is truth]
        #v(0.2em)
        #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
          Before textures, before shading -- the wireframe reveals structure. Pure topology is the foundation of all rendering.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        fill: rgb("#FFFFFF").transparentize(92%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: rgb("#FFFFFF"))[02 -- Grids define space]
        #v(0.2em)
        #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
          The perspective grid is not decoration -- it is the coordinate system that makes spatial computing possible.
        ]
      ]
    ],
    block(width: 100%)[
      #block(
        width: 100%,
        fill: rgb("#FFFFFF").transparentize(92%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: rgb("#FFFFFF"))[03 -- Vertices are decisions]
        #v(0.2em)
        #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
          Every vertex placed is a design decision. Topology is intentional. Edge flow communicates function.
        ]
      ]
      #v(0.3em)
      #block(
        width: 100%,
        fill: rgb("#FFFFFF").transparentize(92%),
        inset: (x: 0.8em, y: 0.6em),
      )[
        #text(size: 12pt, weight: "bold", fill: rgb("#FFFFFF"))[04 -- Neon reveals edges]
        #v(0.2em)
        #text(size: 10pt, fill: rgb("#FFFFFF").transparentize(40%))[
          Accent lighting on wireframes reveals what flat shading hides. The edge is where understanding begins.
        ]
      ]
    ],
  )
]

#speaker-note[
  Vision statement on dark ground. Four principles of our wireframe-first philosophy. The perspective grid and sphere in the background reinforce the spatial computing theme while the manifesto text drives intellectual engagement.
]

// ============================================================
// Slide 8 -- Technology stack with vector-box
// ============================================================

== Technology Stack

#text(size: 9pt, weight: "bold", tracking: 1.5pt, fill: pal.accent, font: "IBM Plex Mono")[INFRASTRUCTURE \/\/ RUNTIME COMPONENTS]

#v(0.3em)

#grid(columns: (1fr, 1fr), column-gutter: 20pt,
  block(width: 100%)[
    #wire-card([Compute Layer], [
      #glow-tag[CUDA]
      #h(0.2em)
      #glow-tag(color: pal.secondary)[VULKAN]
      #h(0.2em)
      #glow-tag(color: pal.deep-purple)[WGPU]

      #v(0.3em)

      Hardware-accelerated mesh operations with custom CUDA kernels for topology optimization. Vulkan render backend with ray-tracing extensions.

      #v(0.3em)

      #grid(columns: (1fr, 1fr), column-gutter: 8pt,
        block(width: 100%)[
          #text(size: 9pt, weight: "bold", fill: pal.accent, font: "IBM Plex Mono")[SHADER UNITS]
          #v(0.1em)
          #text(size: 18pt, weight: "bold", fill: pal.ink)[10,240]
        ],
        block(width: 100%)[
          #text(size: 9pt, weight: "bold", fill: pal.accent, font: "IBM Plex Mono")[BANDWIDTH]
          #v(0.1em)
          #text(size: 18pt, weight: "bold", fill: pal.ink)[3.35 TB/s]
        ],
      )
    ])
  ],
  block(width: 100%)[
    #wire-card([Intelligence Layer], [
      #glow-tag[TRANSFORMER]
      #h(0.2em)
      #glow-tag(color: pal.secondary)[DIFFUSION]
      #h(0.2em)
      #glow-tag(color: pal.deep-purple)[GNN]

      #v(0.3em)

      Neural geometry prediction with graph neural networks for topology-aware mesh generation. Diffusion models for texture synthesis from wireframe inputs.

      #v(0.3em)

      #grid(columns: (1fr, 1fr), column-gutter: 8pt,
        block(width: 100%)[
          #text(size: 9pt, weight: "bold", fill: pal.accent, font: "IBM Plex Mono")[PARAMETERS]
          #v(0.1em)
          #text(size: 18pt, weight: "bold", fill: pal.ink)[7.2B]
        ],
        block(width: 100%)[
          #text(size: 9pt, weight: "bold", fill: pal.accent, font: "IBM Plex Mono")[INFERENCE]
          #v(0.1em)
          #text(size: 18pt, weight: "bold", fill: pal.ink)[12ms]
        ],
      )
    ])
  ],
)

#speaker-note[
  Technology stack split into compute and intelligence layers. Wire-cards contain glow-tags for technology categories, descriptive text, and key metrics. The two-column layout provides balance while maintaining information density.
]

// ============================================================
// Slide 9 -- Focus slide
// ============================================================

#focus-slide[
  The wireframe is not the prototype. #linebreak()
  The wireframe is the product.
]

#speaker-note[
  Bold thesis statement. The wireframe is not a stepping stone to the final render -- it IS the interface. Spatial computing shows structure directly.
]

// ===== Ending =====

#ending-slide[Thank You]

#speaker-note[
  Closing slide. The perspective grid and corner brackets bookend with the title slide, creating visual closure. The wireframe future starts now.
]
