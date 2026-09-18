#import "@preview/tiaoma:0.3.0"

#set page(paper: "a4", margin: 22mm)
#set text(size: 11pt)

= Tiaoma barcodes and QR codes

== QR code

#align(center)[
  #tiaoma.qrcode(
    "https://typst.app/universe/package/tiaoma",
    width: 28mm,
    alt: "QR code linking to the Tiaoma package page",
  )
]

The encoded destination is printed beside the symbol so a reader can inspect it without scanning:
`https://typst.app/universe/package/tiaoma`.

== Code 128

#align(center)[
  #tiaoma.code128(
    "ASSET-000123",
    width: 55mm,
    height: 14mm,
    alt: "Code 128 asset identifier ASSET-000123",
  )
]

Payload: `ASSET-000123`.
