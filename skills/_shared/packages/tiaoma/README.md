# Tiaoma — Barcodes and QR Codes

**Package**: `@preview/tiaoma:0.3.0`

**Category**: Utility / barcode

**License**: MIT

## Verified Boundary

Tiaoma 0.3.0 wraps Zint in a Typst WebAssembly plugin and returns SVG through Typst's `image`
function. It covers QR Code, Data Matrix, Aztec, PDF417, Code 128, EAN/UPC, postal formats, and many
other Zint symbologies. It generates a machine-readable symbol from supplied data; it does not
validate the business meaning, destination, authorization, or safety of that data.

The package source verifies these API boundaries:

- `qrcode(data, options: (:), ..args)` is the QR shortcut;
- named shortcuts such as `code128`, `ean`, `data-matrix`, `aztec`, and `pdf417` select one Zint
  symbology;
- `barcode(data, symbology, options: (:), ..args)` is the generic entrypoint;
- `options` is passed to Zint, while trailing named arguments such as `width`, `height`, `fit`, and
  `alt` are forwarded to Typst `image`;
- `data` may be a string or byte-compatible array; preserve bytes when the payload is not ordinary
  text;
- `dm-size(height, width)` returns the Zint option value for a supported square or rectangular Data
  Matrix size. Unsupported dimensions fail instead of being rounded silently.

## Minimal Usage

```typst
#import "@preview/tiaoma:0.3.0" as tiaoma

#tiaoma.qrcode(
  "https://example.com/report",
  width: 28mm,
  alt: "QR code linking to the report",
)

#tiaoma.code128(
  "ASSET-000123",
  width: 55mm,
  height: 14mm,
  alt: "Code 128 asset identifier ASSET-000123",
)
```

Use the generic entrypoint only when a named shortcut does not cover the verified symbology:

```typst
#tiaoma.barcode(
  "12345678",
  "QRCode",
  options: (
    scale: 2.0,
    fg-color: black,
    bg-color: white,
    output-options: (barcode-dotty-mode: true),
    dot-size: 1.2,
  ),
  width: 28mm,
  alt: "Dot-style QR code containing 12345678",
)
```

The color and dot-style option names above are present in the 0.3.0 package source example. Inspect
the exact package documentation or source before using other Zint options; do not guess their names
from another Zint binding.

## Selection and Verification

- Keep the payload in ordinary Typst source or an explicit workspace resource. Do not encode a
  secret merely to make it less visible.
- Do not alter identifiers, check digits, URL parameters, capitalization, or byte encoding to make
  a barcode compile. A Zint error is a data or symbology issue to resolve explicitly.
- Pass physical size and alternative text as image arguments, not inside `options`.
- Preserve a high-contrast foreground/background and sufficient quiet space. Decorative recoloring,
  embedded logos, or aggressive cropping can make a visually attractive symbol unreadable.
- For a URL QR code, keep a human-readable destination nearby when space and audience permit.
- Validate the Typst document, inspect the rendered symbol at final physical size, and scan a final
  raster or printed proof with an independent reader. Compilation proves generation, not scanning.
- Use `package.list` for current alternatives when customization unsupported by Zint is required;
  keep the selected version and its source provenance explicit.
