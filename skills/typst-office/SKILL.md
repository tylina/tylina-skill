---
name: typst-office
description: Create or review Typst letters, invoices, quotations, minutes, agendas, forms, checklists, and governance documents with locale-aware fields and print-ready output.
---

# Typst Office Documents

Compose this Skill with Typst Authoring. This Skill covers document production, not legal,
accounting, tax, records-management, or signature advice.

## Entry Modes

- `write`: create or revise a business letter, invoice, quotation, minutes, agenda, form,
  checklist, policy, or governance artifact from supplied content and requirements.
- `review`: inspect completeness, internal consistency, privacy, locale, accessibility, and layout
  without changing business or legal meaning unless requested.

## Contract

1. Use only the fields relevant to the artifact. Locale, currency, tax treatment, approval,
   signatures, delivery, and retention matter for some invoices, forms, or governance records,
   but are not prerequisites for a simple letter, agenda, or checklist.
2. Do not present an unsupplied legal entity, address, registration or tax identifier, bank detail,
   line item, rate, total, due date, attendee, vote, decision, signature, approval, or policy
   obligation as real. A requested blank form or example may use unmistakable placeholders or
   labeled synthetic data.
3. Keep fields and repeated records semantic. Derive totals only from source values, or from
   clearly labeled synthetic values in a requested example, using an explicit calculation rule;
   expose unresolved inconsistencies instead of forcing agreement.
4. Treat templates as layout aids. A package name, official-looking seal, signature line, or
   successful compilation does not establish legal validity, tax compliance, or authorization.
5. Minimize personal and financial data. Do not leak sensitive fields through examples, filenames,
   metadata, QR codes, clipboard content, or exported variants.
6. Compile and inspect the final medium. Check addresses, tables, continuation pages, totals,
   signatures, writable fields, page marks, duplex behavior, and grayscale readability.

## Artifact and Tool Information

- `typst-office/references/office-forms.md` identifies fields and package choices that are specific
  to letters, invoices, minutes, agendas, forms, checklists, and governance documents.
- Workspace PDF, DOCX, PPTX, or XLSX evidence uses
  `typst-authoring/references/source-ingestion.md`. Extracted Markdown is not an authorized record;
  verify material fields and tables against the original.
- Preserve an existing verified template. Use `template.list` for a new scaffold and a focused
  `package.list` query for a reusable component, then inspect the selected exact version.
- Export is a view of validated Typst source. Follow `tylina/references/workflow.md` for
  `document.export` destinations and format semantics; PDF, PNG, and SVG preserve rendered output,
  while `pptx-visual` is fidelity-oriented and `pptx-editable` is experimental. Do not imply that
  an exported Office file is canonical or round-trippable.
- Validate calculations and inspect the page classes the artifact actually has, including
  continuation or exception pages when present. Separate visible document defects from legal,
  tax, accounting, or jurisdiction-specific questions.

## Adaptive Workflow

1. Identify the artifact, source records, material fields, calculations, locale, branding,
   approvals, signatures, attachments, delivery medium, and only the regulatory fields that apply.
2. Read the relevant part of `typst-office/references/office-forms.md` and preserve existing
   template ownership.
3. Import PDF or Office evidence only through the source-ingestion gate; compare material fields and
   tables with the original artifact rather than treating extracted Markdown as authoritative.
4. Continue a verified template. For new work, inspect one exact scaffold or package version before
   using it, and use labeled placeholders or synthetic records only when the request calls for them.
5. Verify representative repeated records and every calculation against its source or explicit
   example rule before applying the pattern broadly.
6. Produce only requested variants, redact deliberately, validate, and inspect first,
   continuation, final, and exception pages that exist.
7. Keep fields needing human authorization visible and separate layout defects from legal, tax,
   accounting, signature, or jurisdiction-specific questions.

## Progressive Resources

- Artifact and package routing: `typst-office/references/office-forms.md`.
- General templates and packages: `typst-authoring/references/templates-and-packages.md`.
- Tables and repeated records: `typst-tables/SKILL.md` when available.
- QR codes or barcodes: `_shared/packages/tiaoma/README.md` and its artifact-neutral
  `_shared/packages/tiaoma/demo.typ` only when explicitly required.
