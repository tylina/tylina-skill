# Office Forms and Template Selection

Select the artifact and jurisdictional boundary before selecting a visual template. Continue a
working implementation when it already fits. When a new template or package is actually needed,
call the corresponding `template.list` or `package.list`; inspect an exact template candidate with
`template.inspect`, or read the package's routed recipe/demo before escalating to official
versioned documentation. Names below are search seeds, not stable API promises.

## Artifact Routing

| Artifact | Search seeds | Verify before use |
|---|---|---|
| General or branded letter | `letterloom`, `letter-pro`, `tiefletter` | supported locale, sender and recipient blocks, reference line, folding marks, continuation pages, attachments |
| Invoice, quote, or estimate | `invoice-pro`; also search by locale and `invoice` | currency precision, tax fields, discounts, payment terms, totals, locale, required identifiers, multipage rows |
| Meeting agenda or minutes | `quick-minutes` | attendee and absence model, agenda linkage, decisions, actions, owners, deadlines, approval and revision state |
| Policy or governance document | `govern`, `briefs` | status, owner, approver, effective and review dates, version history, references, distribution and archival needs |
| Operational checklist or form | `cheq`, `check-six` | check state semantics, writable controls, reset behavior, print marks, identifiers, accessibility |
| QR code or barcode | `tiaoma` | exact encoded payload, symbology, quiet zone, print size, error correction, privacy, and scanner verification when available |

The names above are search seeds, not pinned recommendations. Use the active host's
`template.list`/`package.list` result and inspect its exact version before authoring; do not copy a
version from this document.

## Letters and Correspondence

- Preserve the sender, recipient, reference, subject, salutation, body, signatory role, enclosure,
  copy list, and delivery status as separate supplied fields.
- Do not infer honorifics, gender, authority, or signature. A typed name is not proof of execution.
- Verify locale-specific address order, date style, paper size, window-envelope marks, folding marks,
  and postal conventions with user-supplied or authoritative requirements.
- Keep accessibility and copy/paste order intact even when the visual layout uses multiple aligned
  blocks.

## Invoices and Quotations

- Keep quantity, unit price, currency, discount, tax category, tax rate, subtotal, total, paid amount,
  and balance distinct. Do not mix currencies or round intermediate values without an explicit rule.
- Recompute from the supplied records and compare with supplied totals. Report disagreements and the
  calculation rule used; do not silently alter a contractual figure.
- Jurisdictions differ on numbering, registration fields, tax wording, payment terms, and retention.
  Ask for or verify the applicable requirement; a generic template is not compliant by default.
- Test the longest description, zero or exempt tax, negative adjustment, multiple currencies when
  allowed, and multipage continuation headers.

## Meetings, Policies, and Forms

- Minutes distinguish discussion, proposal, decision, vote, dissent, action, owner, and due date.
  Do not turn notes into an approved decision or assign an absent owner.
- Policies distinguish draft, approved, effective, superseded, and archived states. Preserve the
  version and approval trail supplied by the organization.
- Printed forms need sufficient writing space, stable labels, clear required fields, and a logical
  reading order. Interactive-looking boxes do not imply fillable-PDF behavior.
- Generate barcodes or QR codes only from an explicitly supplied payload. Check physical size,
  contrast, and quiet space in the final render. When an independent decoder or scanner is
  available and authorized, verify the final raster or printed proof against the exact payload;
  otherwise report machine readability as unverified rather than claiming a successful scan.
