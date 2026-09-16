# Source Document Ingestion

Read this only when a PDF, DOCX, PPTX, or XLSX file in the current workspace is evidence for
the requested Typst document.

## Portable Import

Use `document.import` before a host-specific converter. It is the shared Web, DSH, Electron, and
standalone SDK path and does not require Python. In one call it captures a bounded binary snapshot,
extracts conservative Markdown off the interactive editing path, and publishes through the same
canonical workspace transaction as other Agent writes.

1. Choose a conflict-free new `.md` destination. `document.import` never replaces an existing file.
   If replacement is really requested, import to a new path, review it, then use the Agent host's
   ordinary read/edit/write workflow.
2. Keep `allowIncomplete: false`. A text-bearing PDF or supported Office file writes conservative
   Markdown and returns a receipt plus bounded warnings.
3. If a PDF returns `ocr-required`, decide from the source and task whether OCR is justified. Retry
   only with explicit `ocr.languages`; available pinned languages are `eng`, `chi_sim`, `chi_tra`,
   and `jpn`. Set `maxPages` or `rasterPpi` only for a real quality or cost reason.
4. Never silently use `allowIncomplete: true`. Use it only when the user accepts partial evidence,
   retain every warning, and keep unresolved pages visible in the handoff.

Example:

```json
{
  "command": "document.import",
  "args": {
    "source": "sources/paper.pdf",
    "destination": "sources/paper.extracted.md",
    "allowIncomplete": false
  }
}
```

If OCR is required and warranted, repeat with, for example,
`"ocr":{"languages":["eng","chi_sim"]}`. The host captures the source again for that call;
the Agent never computes or returns a content hash.

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
