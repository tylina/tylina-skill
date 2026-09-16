# Reviewable Image Sourcing

Use this workflow only when the requested document needs a new external raster image. Prefer an
existing workspace asset, a semantic Typst diagram, or a package-owned asset when it already fits.
Do not search merely to decorate a document.

## Search and Selection Gate

1. Form one concise query from the user's subject and visual need. Keep names and technical terms
   exact; `image.search` does not rewrite the query.
2. Call `image.search` with `licensePolicy: "public-domain"` when the result must avoid an
   attribution license. Use `"adaptable"` only when CC BY or CC BY-SA is acceptable in addition
   to CC0 and PDM. Add `aspectRatio` only when the layout really requires square, tall, or wide.
3. Review a short set of candidates by subject relevance, dimensions, crop, creator, source page,
   attribution, and license. Never choose from title or thumbnail alone. Do not treat ranking as a
   factual or licensing judgment.
4. Open the selected `sourcePageUrl` before publication. Openverse explicitly does not guarantee
   that catalog license metadata is accurate. Preserve uncertainty when the source page is missing,
   contradictory, or cannot be inspected; choose another asset or ask the user.
5. If the user has not delegated visual selection, present at most five materially distinct
   candidates and wait for a choice. If selection was delegated, explain the chosen source and why
   it fits; delegation does not waive license review.

Search results are discovery metadata, not workspace resources. Never copy `previewUrl`, a provider
URL, or an image fetched by an unrelated network helper into the document.

## Reviewed Import

For the selected candidate, pass its exact Openverse `id` and the intended `licensePolicy`:

```json
{
  "command": "image.import",
  "args": {
    "id": "93d7039b-2a78-41d0-b122-423e428e91ce",
    "licensePolicy": "adaptable",
    "destination": "assets/research-diagram.png"
  }
}
```

The destination must be new, and its extension must match the returned PNG, JPEG, or WebP bytes.
Use the Agent host's ordinary file workflow for an authorized replacement. Tylina refetches the
fixed Openverse detail endpoint and checks the current metadata and license policy. An invalid
license, response type, or unavailable preview fails before writing; search and review again.

`image.import` writes at most a 2 MiB Openverse preview through the same canonical resource and
History transaction as other workspace changes. It intentionally does not download the provider's
original URL. Treat the result as a layout-ready preview; if publication requires a higher-resolution
original, report that limitation and arrange an explicitly reviewed source workflow instead.

## Authoring and Attribution

Importing does not authorize a source edit. Add an image reference only when the requested document
change includes it. Reuse the returned workspace-relative destination, preserve the current document's
figure style, and validate and inspect every affected page. Do not embed Base64 or remote URLs in
Typst source.

Keep the returned creator, source page, license URL/version, and attribution together. Place the
credit where the artifact convention requires it—for example a figure note, credits slide, image
sources section, or adjacent source record. CC BY-SA may impose obligations beyond displaying a
credit, and PDM describes a rights statement rather than proving copyright status everywhere.
Do not claim that Tylina, Openverse, or the Agent verified legal reuse.
