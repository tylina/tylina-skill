# Source Document Ingestion

Read this only when a PDF, DOCX, PPTX, or XLSX file in the current workspace is evidence for
the requested Typst document.

## Portable Import

Use `document.import` before a host-specific converter. It is the shared Web, DSH, Electron, and
standalone SDK path and does not require Python. It captures one bounded binary snapshot, verifies
its SHA-256, extracts conservative Markdown off the interactive editing path, and publishes through
the same version-checked workspace transaction as other Agent writes.

1. Choose a conflict-free `.md` destination. Use `expectedDestinationSha256: null` only when it is
   absent. To replace an existing text destination, read it first and pass its exact current hash.
2. Read the binary with a host tool that returns SHA-256 and pass that as
   `expectedSourceSha256`. If no binary-safe reader is available, omit this field on the first call.
   A `source-hash-required` result reports the captured format, byte count, and hash without parsing
   or writing; repeat the command with that exact hash.
3. Keep `allowIncomplete: false`. A text-bearing PDF or supported Office file writes conservative
   Markdown and returns a receipt plus bounded warnings.
4. If a PDF returns `ocr-required`, decide from the source and task whether OCR is justified. Retry
   only with explicit `ocr.languages`; available pinned languages are `eng`, `chi_sim`, `chi_tra`,
   and `jpn`. Set `maxPages` or `rasterPpi` only for a real quality or cost reason.
5. Never silently use `allowIncomplete: true`. Use it only when the user accepts partial evidence,
   retain every warning, and keep unresolved pages visible in the handoff.

Example discovery call:

```json
{
  "command": "document.import",
  "args": {
    "source": "sources/paper.pdf",
    "destination": "sources/paper.extracted.md",
    "expectedDestinationSha256": null
  }
}
```

Repeat with the returned `sourceSha256` as `expectedSourceSha256`. If OCR is required and warranted,
add, for example, `"ocr":{"languages":["eng","chi_sim"]}` to that second call.

## Evidence Boundary

The immutable binary remains the source artifact. Imported Markdown is a reviewable evidence layer,
not canonical Typst source and not proof that extraction is correct. Do not overwrite the original.

- Compare quotations, headings, lists, table cells, page order, and reading order against the source.
- Treat formulas, subscripts, superscripts, footnotes, ligatures, handwriting, multi-column order,
  charts, diagrams, SmartArt, images, and speaker-note relationships as requiring source inspection.
- OCR confidence is a triage signal, not factual or mathematical verification. Preserve uncertain
  characters and page locations instead of completing them from context.
- Use the extracted Markdown to build a source brief or evidence table. Author verified content in
  `.typ`, then validate and visually review the resulting document through Tylina.
- Report unsupported structures, extraction warnings, unavailable OCR assets, truncated warnings,
  and any comparison that the host could not perform.

Do not use a package Skill's bundled Python converters as a fallback. If the shared importer cannot
recover required evidence, ask for accessible source text or page images and keep the limitation
explicit.
