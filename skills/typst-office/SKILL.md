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

1. Establish artifact type, parties, jurisdiction and locale, language, currency, tax treatment,
   date and numbering convention, approval state, delivery channel, and retention needs.
2. Never invent a legal entity, address, registration or tax identifier, bank detail, line item,
   rate, total, due date, attendee, vote, decision, signature, approval, or policy obligation.
3. Keep fields and repeated records semantic. Derive totals only from supplied values and an
   explicit calculation rule; expose unresolved inconsistencies instead of forcing agreement.
4. Treat templates as layout aids. A package name, official-looking seal, signature line, or
   successful compilation does not establish legal validity, tax compliance, or authorization.
5. Minimize personal and financial data. Do not leak sensitive fields through examples, filenames,
   metadata, QR codes, clipboard content, or exported variants.
6. Compile and inspect the final medium. Check addresses, tables, continuation pages, totals,
   signatures, writable fields, page marks, duplex behavior, and grayscale readability.

## Workflow

1. Read `references/office-forms.md` for the requested artifact and locale boundary.
2. Inventory source records, required fields, calculations, branding, signatures, attachments,
   page size, print or screen target, and existing template ownership.
3. Preserve an existing verified template. For a new scaffold, call `template.list`; for a reusable
   component, call `package.list` with the artifact or discipline, then inspect the exact version.
4. Build one representative record or page and verify its fields and calculations against the
   supplied source before scaling to repeated items.
5. Produce only requested variants, redact deliberately, validate, and inspect first, continuation,
   final, and exception pages. Report fields that still require human authorization.
6. In `review` mode, separate observable document defects from jurisdiction-specific questions.

## Progressive Resources

- Artifact and package routing: `typst-office/references/office-forms.md`.
- General templates and packages: `typst-authoring/references/templates-and-packages.md`.
- Tables and repeated records: `typst-tables/SKILL.md` when available.
- QR codes or barcodes: `_shared/packages/tiaoma/README.md` only when explicitly required.
