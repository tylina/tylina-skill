# Tiaoma — Barcodes & QR Codes

**Package**: `@preview/tiaoma:0.3.0`
**Category**: Utility

## Description

Barcode and QR code generator for Typst via zint WASM. Supports nearly all common barcode types.

## Usage in Touying Slides

```typst
#import "@preview/tiaoma:0.3.0"

// QR Code
#tiaoma.qrcode("https://example.com", width: 4cm)

// Barcode
#tiaoma.barcode("12345", "Code128", width: 6cm)
```

## Supported Types

QR Code, EAN-13, EAN-8, Code 128, Code 39, UPC-A, Data Matrix, PDF417, Aztec Code, and 50+ more.

## Key Functions

| Function | Description |
|----------|-------------|
| `qrcode(data, width:)` | Generate QR code |
| `barcode(data, type, width:, height:)` | Generate barcode |
