#import "@preview/touying:0.7.4": *
#import themes.simple: *
#import "@preview/tiaoma:0.3.0"

#show: simple-theme.with(aspect-ratio: "16-9")

#set text(size: 18pt)

== Tiaoma Demo — Barcodes & QR Codes

=== QR Code

#align(center)[
  #tiaoma.qrcode("https://typst.app/universe/package/tiaoma", width: 4cm)
]

=== Barcode (Code 128)

#align(center)[
  #tiaoma.barcode("TOUYING-2025", "Code128", width: 8cm, height: 1.5cm)
]
