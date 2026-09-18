#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls

#set page(paper: "a5", margin: 17mm)
#set text(size: 10.5pt)
#show: make-glossary

#let terms = (
  (
    key: "api",
    short: "API",
    long: "application programming interface",
    description: "A defined interface through which software components communicate.",
  ),
  (
    key: "lsp",
    short: "LSP",
    long: "Language Server Protocol",
    description: "A protocol for editor language features.",
  ),
)

#register-glossary(terms)

= Terms in context

The #gls("api") keeps the editor and compiler boundary explicit. A later reference to the
#gls("api") uses its short form. The #gls("lsp") supplies language-aware editor features.

= Glossary

#print-glossary(terms)
