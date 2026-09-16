#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/tiaoma:0.3.0"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Tiaoma Demo — Barcodes & QR Codes

=== QR Code

#align(center)[
  #tiaoma.qrcode(
    "https://typst.app/universe/package/tiaoma",
    width: 4cm,
    alt: "QR code linking to the Tiaoma package page",
  )
]

=== Barcode (Code 128)

#align(center)[
  #tiaoma.code128(
    "TOUYING-2025",
    width: 8cm,
    height: 1.5cm,
    alt: "Code 128 barcode containing TOUYING-2025",
  )
]
