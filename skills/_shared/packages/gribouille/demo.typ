#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/gribouille:0.6.0": *

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 16pt)

== Gribouille Demo — Layered Analytical Plot

#align(center)[
  #plot(
    data: penguins,
    mapping: aes(
      x: "flipper-len",
      y: "body-mass",
      colour: "species",
    ),
    layers: (
      geom-point(size: 2pt, alpha: 0.35),
      geom-smooth(method: "lm", se: true, alpha: 0.15),
    ),
    scales: scales(
      x: scale-continuous(),
      y: scale-continuous(),
      colour: scale-discrete(),
    ),
    labels: labels(
      x: "Flipper length (mm)",
      y: "Body mass (g)",
      colour: "Species",
    ),
    theme: theme-minimal(text: element-text(size: 16pt)),
    width: 20cm,
    height: 10cm,
  )
]
