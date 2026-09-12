# Scenario: CV and Resume (Typst)

Use this scenario for professional résumés, academic CVs, research CVs, and closely related
application documents. Treat the deliverable as a print document authored in Typst. The editable
source of truth must be one or more .typ files: the user must be able to change facts, ordering,
layout, and theme without editing YAML, TOML, JSON, or generated code.

Do not use RenderCV or another YAML-first system as the default architecture. If imported material
arrives in a data file, preserve it under sources/ for provenance, verify its facts, and move the
approved content into Typst.

## Contents

1. [Scenario contract](#scenario-contract)
2. [Choose the document and implementation route](#choose-the-document-and-implementation-route)
3. [Run the workflow](#run-the-workflow)
4. [Build the content system](#build-the-content-system)
5. [Design the page system](#design-the-page-system)
6. [Handle typography, links, icons, and photos](#handle-typography-links-icons-and-photos)
7. [Implement with a reviewed template](#implement-with-a-reviewed-template)
8. [Support variants and academic CVs](#support-variants-and-academic-cvs)
9. [Build, inspect, and correct](#build-inspect-and-correct)
10. [Quick Mode defaults](#quick-mode-defaults)
11. [Non-negotiables](#non-negotiables)

## Scenario contract

- Treat the CV as a print document, not a slide deck. Do not use Touying, speaker notes,
  presentation pacing, or slide transitions.
- Keep personal facts, section content, and package configuration in one visible `.typ` entry per
  deliverable by default.
- Start from a reviewed Typst Universe package or its published starter. Do not create a parallel
  local theme or fallback framework for an ordinary CV.
- Use real text, semantic headings, real links, and a logical source order. Do not convert body
  text into images.
- Preserve source truth. Never invent dates, titles, degrees, metrics, publication metadata,
  skills, affiliations, awards, or credentials.
- Never add invisible keywords, white-on-white text, hidden prompt injection, or any other content
  intended to manipulate an ATS, recruiter, or reviewer.
- Include only personal information the user approves. Do not infer a photo, age, gender,
  citizenship, marital status, or full street address.
- Compile and inspect every page. Inspect extracted PDF text and link behavior before delivery.
- Deliver the Typst source, local assets, PDF, preview images, and dependency notes together.

The scenario does not promise universal ATS compatibility. It can verify real text, conventional
headings, logical extraction order, readable links, and the absence of hidden content.

## Choose the document and implementation route

### Distinguish a résumé from an academic CV

A résumé is selective and targeted. An academic CV is a cumulative record whose length follows the
evidence. Do not compress publications, teaching, grants, service, talks, supervision, and
appointments into a one-page résumé grid.

| Document | Typical emphasis | Length rule | Default structure |
|---|---|---|---|
| Professional résumé | Relevant experience and measurable evidence | Usually one or two pages | Restrained single column |
| Student résumé | Education, projects, internships, skills | Often one page | Education-first or project-first |
| Academic CV | Appointments, research, publications, teaching, service | Content-driven | Multi-page package-backed Typst entry |
| Research-industry CV | Research impact plus production evidence | One to three pages as allowed | Single column with selected publications |
| Creative CV | Portfolio evidence and visual identity | Audience-dependent | Expressive only when expected |

Application instructions override every default.

### Use a Typst-native template route

A reviewed Universe template is the default implementation route. Typst-native means the user
edits facts, order, package options, and visible content directly in `.typ`; it does not mean
rebuilding an existing template's styling system.

Copy the closest reviewed `demo.typ` into the project and keep one entry per deliverable:

```text
project/
├── cv.typ
├── assets/
│   └── photo.jpg
├── sources/
└── output/
```

Import a pinned package in `cv.typ` and write the content through its documented API. The package
owns page styling and repeated entry layout; the project owns facts, section order, package
configuration, assets, and quality checks.

For a targeted variant or another language, create a sibling entry such as `resume-ml.typ` or
`cv-zh.typ`. For a genuinely long academic CV, content-only `.typ` section imports are acceptable
when they make the record easier to maintain, but the selected package still owns presentation.
Do not introduce a separate theme file, package wrapper, or external metadata layer.

A Typst array or dictionary inside the entry is acceptable when repeated records are easier to
render from data. Typst remains the authoring interface and source of truth.

### Audit a Universe template before adopting it

Typst Universe templates are implementation references, not a mandatory theme catalogue. The
versions below were the current public releases when this scenario was revised; check the package
page again before importing one.

| Reference | Reviewed release | Pattern worth learning | Important boundary |
|---|---:|---|---|
| [chicv](https://typst.app/universe/package/chicv/) | 0.1.0 | Direct Typst markup and a tiny helper layer | Copy the source faithfully; Linux Biolinum must be available or deliberately replaced |
| [basic-resume](https://typst.app/universe/package/basic-resume/) | 0.2.9 | Conventional single-column entry functions | Good conservative starting point; audit its `scienceicons` dependency |
| [heading-resume](https://typst.app/universe/package/heading-resume/) | 0.1.0 | Editorial two-column composition with semantic Typst records | Verify extraction order before using it in a strict screening flow |
| [simple-technical-resume](https://typst.app/universe/package/simple-technical-resume/) | 0.1.1 | Dense one-page technical résumé with conventional headings | Treat “ATS-friendly” as a design goal, not a compatibility guarantee |
| [resume-ng](https://typst.app/universe/package/resume-ng/) | 1.0.0 | Dense Chinese technical résumé in direct Typst | Verify Noto Serif CJK SC and the package's date-first extraction behavior |
| [modern-cv](https://typst.app/universe/package/modern-cv/) | 0.10.0 | Visual header, show-rule configuration, and modular sections | Reviewed demo uses public text-contact options; built-in icon contacts require Font Awesome 7 |
| [pro-academic-cv](https://typst.app/universe/package/pro-academic-cv/) | 0.1.0 | Multi-page academic records, publications, teaching, and service | Prefer it for cumulative evidence; audit Palatino and package warnings |
| [brilliant-cv](https://typst.app/universe/package/brilliant-cv/) | 4.1.0 | Modular multilingual section boundaries | Audited but not bundled: do not adopt its metadata-first route or hidden-keyword feature |

Ready-to-copy, pinned examples live in
[`../../templates/scenarios/cv/`](../../templates/scenarios/cv/README.md). Each example contains one
`demo.typ` plus a README that records the upstream package, reviewed version, license, dependency
notes, source fidelity, and local changes. The catalogue intentionally omits copied `typst.toml`
files and separate upstream license files; the source and license links belong in the README.

The examples use two explicit provenance modes:

- an unchanged published starter when its source already demonstrates the design well, as with
  `chicv` and `heading-resume`;
- a package-backed content adaptation when the upstream starter contains placeholders, joke copy,
  or a record that does not exercise the intended scenario, as with `simple-technical-resume` and
  `pro-academic-cv`.

Do not blur these modes. Never claim that an adapted file is the upstream source, and never
“improve” a fidelity snapshot while continuing to describe it as unchanged. Copy the selected
source file into the project; do not add a package-template manifest or an external data layer
merely to use the demo.

Choose the starting point from the document's evidence and delivery constraints, not from the most
decorative preview:

| Need | First reviewed examples | Why |
|---|---|---|
| Conservative professional résumé | `basic-resume`, `simple-technical-resume` | Conventional headings, a restrained single column, and a simple extraction order |
| Editorial or portfolio-adjacent résumé | `heading-resume` | Stronger visual hierarchy when a two-column reading order is acceptable |
| Simplified Chinese technical résumé | `resume-ng` | A package-backed CJK composition whose configured font can be audited explicitly |
| Visual professional CV | `modern-cv` | Richer header and section treatment when its font and icon dependencies are available |
| Cumulative academic CV | `pro-academic-cv` | Public APIs for appointments, publications, teaching, supervision, and service across pages |
| Minimal direct-Typst source | `chicv` | A small, inspectable one-file starter without an external metadata layer |

Before using any package:

1. Check the current release, minimum Typst version, license, fonts, icons, and transitive
   dependencies.
2. Read its actual function signatures; do not infer an API from a screenshot.
3. Pin the reviewed release in the import.
4. Keep content in .typ even if the package supports external metadata.
5. Compile a representative page with the actual build environment.
6. If the dependency is not reproducible, evaluate another reviewed template before authoring.

Use the reviewed package when it fits. Let its starter establish the page geometry, type hierarchy,
section rules, entry anatomy, and visual identity before changing content. If its API, fonts,
license, assets, or dependencies do not satisfy the document contract, choose another reviewed
package or simplify the one-file composition. Do not respond by redrawing the same design in a
second local styling framework.

## Run the workflow

### 1. Preserve and convert source material

Accept an existing PDF, DOCX, Markdown file, portfolio, publication list, job description, or
structured notes. Keep originals under sources/. Use the standard source converters when needed;
do not overwrite the originals.

```bash
python3 ${SKILL_DIR}/scripts/source_to_md/pdf_to_md.py sources/cv.pdf -o sources/cv-extracted.md
python3 ${SKILL_DIR}/scripts/source_to_md/doc_to_md.py sources/cv.docx -o sources/cv-extracted.md
```

Treat extracted text as an aid, not as verified truth. PDF extraction often loses column order,
superscripts, ligatures, and link targets.

### 2. Build a fact inventory

Create a working ledger before editing prose.

| Field | Record | Verification |
|---|---|---|
| Identity | Exact name and preferred display form | User or authoritative source |
| Contact | Approved email, phone, location, portfolio, profiles | Test every link |
| Target | Role, program, grant, award, or academic purpose | User request or application brief |
| Experience | Employer, title, location, start/end dates | Reconcile source conflicts |
| Education | Institution, degree, field, dates, distinctions | Preserve official names |
| Projects/research | Role, method, output, impact, links | Separate individual and team claims |
| Skills | Truthful, relevant, supportable abilities | Remove unsupported proficiency labels |
| Publications | Author order, title, venue, year, DOI/URL | Compare with canonical record |
| Awards/grants | Name, body, year, role, amount if public | Do not infer missing details |

Mark each consequential claim as verified, user-confirmed, ambiguous, or missing. If sources
conflict, retain both candidates in working notes and ask the user; do not silently choose one.

### 3. Resolve only decisions that change the document

Bundle missing blockers into one question:

- target role or application purpose;
- locale and required paper size;
- language and spelling convention;
- application page limit;
- conservative, balanced, or expressive visual direction;
- whether a photo is explicitly required or desired;
- which private contact details may be published.

In Quick Mode, use the defaults below and record assumptions in the handoff. Do not turn visual
preference gathering into a long interview.

### 4. Map the target to evidence

Extract the target's repeated responsibilities, domain vocabulary, and evaluation criteria. For
each important requirement, point to existing evidence in the fact inventory. Tailoring may change
section order, emphasis, and wording; it may not manufacture experience or copy unsupported claims
from the target description.

Use a simple traceability table during drafting:

| Target requirement | Source-backed evidence | CV location | Action |
|---|---|---|---|
| Production ownership | Ranking-service rollout | Experience entry 1 | Lead bullet |
| Evaluation rigor | Benchmark and release criteria | Project + experience | Keep both, remove repetition |
| Team leadership | Four product teams | Experience entry 1 | State exact scope |

### 5. Plan sections and page breaks

Choose section order from the target and strongest evidence.

- Lead with experience for an experienced professional.
- Lead with education for a student or recent graduate when it is the strongest qualification.
- Move projects early when they provide the best proof.
- Lead an academic CV with current position, education, research focus, or appointments as
  appropriate.
- Omit empty, weak, private, or irrelevant sections.

Draft a page map before fine styling. Keep each entry header with its first evidence line. Prefer a
clean break between sections over compressing the entire document.

### 6. Implement, compile early, and revise

Compile once after the header, one representative entry, one long bullet, one link, and one CJK
line are present. This exposes font, date-column, link, and glyph problems before the document is
complete. After all content is present, perform at least one full revise-and-rebuild cycle.

## Build the content system

### Write evidence-led bullets

Use concise fragments that connect action, scope, method, and result. Include a metric only when it
exists in the source and its meaning is clear.

```text
Reduced model-serving latency 31% by batching feature retrieval and profiling the hot path.
```

Avoid responsibility-only phrasing:

```text
Responsible for AI systems and helped improve performance significantly.
```

Use this drafting order:

1. State the action and owned object.
2. Add scope or audience.
3. Add the method only when it distinguishes the work.
4. Add an outcome or artifact.
5. Add a metric only when verified.

Do not force every bullet into the same formula. A research bullet may emphasize method and
finding; a leadership bullet may emphasize scope and decision; a project bullet may emphasize the
artifact and adoption.

### Normalize without falsifying

Normalize:

- date format and dash style;
- tense and punctuation;
- organization and degree naming;
- capitalization of technologies;
- location format;
- DOI and URL presentation;
- author-name emphasis in publications.

Do not normalize away a factual distinction. “Intern,” “contractor,” “research assistant,” and
“employee” are not interchangeable. “Submitted,” “accepted,” and “published” are not
interchangeable.

### Control density through editing

Use this correction order when content does not fit:

1. Remove duplicated summary claims.
2. Remove weak or irrelevant bullets.
3. Shorten long link labels and repeated context.
4. Merge closely related bullets.
5. Move lower-priority sections to page two.
6. Tighten section and entry spacing slightly.
7. Reduce body size only as a final small adjustment.

Do not solve overflow by clipping, scaling the whole page, or pushing body text below 9 pt.

### Use conventional, readable headings

Prefer direct headings such as Experience, Education, Projects, Skills, Publications, Teaching,
Awards, and Service. A creative heading may be visually appealing but can reduce scanning speed or
extraction clarity. If the audience is conservative or ATS screening is likely, keep the
conventional label.

### Protect privacy and integrity

- Publish only approved contact details.
- Remove document metadata that exposes an unintended name or source path.
- Do not expose notes, tracked changes, comments, prompt text, or source-only annotations.
- Do not add a photograph by default.
- Do not create fake logos, certifications, testimonials, publications, or employer marks.
- Do not add an invisible keyword layer under any circumstances.

## Design the page system

### Set a physical paper size

Use Typst's physical paper definitions.

```typst
#set page(
  paper: "a4",
  margin: (x: 17mm, y: 15mm),
  numbering: none,
)
```

Use paper: "us-letter" for North American delivery or when requested. A4 is the unattended
international default. Start near 15–20 mm margins for A4 or 0.65–0.8 in for Letter, then adjust
after reviewing content and print conditions.

### Keep the reading order obvious

A restrained single column is the default. Use a sidebar only when it provides real value and the
extracted reading order remains correct. Do not place dates, skills, and essential context in
decorative floating layers.

Use a consistent entry anatomy:

1. role, degree, project, or publication title;
2. organization or context;
3. date range in a stable right column;
4. location when useful;
5. evidence immediately below.

Keep the title/date header together with the first content line. Do not make a long entry entirely
unbreakable; doing so can create a large blank area or an overflow.

### Establish a restrained spacing scale

Start with a small named scale rather than unrelated values:

| Token | Typical use | Starting value |
|---|---|---:|
| micro | title-to-organization, compact metadata | 1–2 pt |
| compact | bullet spacing, row spacing | 2–4 pt |
| entry | between entries | 5–8 pt |
| section | before a new section | 8–12 pt |
| header | identity block to first section | 8–14 pt |

Adjust the tokens, not isolated elements. Dense does not mean cramped: dates, bullets, and links
must remain distinguishable at 100% zoom and in print.

### Decide page count deliberately

- One page is common for students and early-career applicants.
- One or two pages are common for experienced professional résumés.
- Academic CV length follows the record.
- A two-page résumé should use page two for meaningful evidence, not a few stranded lines.
- If a page limit is explicit, edit content before shrinking typography.

## Handle typography, links, icons, and photos

### Typography

Start near 10–11.5 pt body text with approximately 1.15–1.35 line height. Font metrics and script
matter more than the nominal value. Inspect bold faces, punctuation, numerals, and dense lines.

Use fonts available in the build environment. Check before committing:

```bash
typst fonts | rg 'IBM Plex Sans|Noto Sans SC|Noto Serif SC'
```

For mixed Latin and Chinese, define explicit fallbacks, for example:

```typst
#set text(
  font: ("IBM Plex Sans", "Noto Sans SC"),
  size: 10.2pt,
)
```

Do not assume a font exists because a template names it. If a package requires Roboto, Source Sans,
Font Awesome, or another font, verify and document it or replace the dependency.

### Links and contact information

Use clickable mailto:, tel:, portfolio, DOI, ORCID, and profile links where appropriate. Show a
readable label as well as the link target. Do not make an icon the only representation of critical
contact information.

Prefer:

```typst
#link("mailto:jane@example.com", "jane@example.com")
#link("https://example.com")[example.com]
```

Avoid raw tracking URLs and shortened links whose destination is unclear.

### Icons

Text labels or separators are the reproducible default. If icons improve scanning:

- pair every icon with readable text;
- use a pinned SVG package or a local SVG;
- avoid emoji and system-dependent glyphs;
- verify every icon in the PDF;
- include a text-only fallback.

Do not add Font Awesome merely to display email, phone, or website labels.

### Photos

Do not include a headshot by default. Add one only when the user requests it or the destination
explicitly expects it. Use a local image, preserve a natural crop, confirm consent, and keep a
no-photo layout that does not leave a hole.

```typst
#cv-header(
  name: [Jane Smith],
  headline: [Machine Learning Engineer],
  photo: image(
    "assets/photo.jpg",
    width: 25mm,
    height: 25mm,
    fit: "cover",
  ),
)
```

## Implement with a reviewed template

### Template-first example with basic-resume

The following complete example uses the actual basic-resume 0.2.9 API. It keeps every personal fact
and section in one `.typ` entry while delegating page styling and entry alignment to the package.

```typst
#import "@preview/basic-resume:0.2.9": *

#show: resume.with(
  author: "Jane Smith",
  location: "Shanghai",
  email: "jane@example.com",
  github: "github.com/janesmith",
  personal-site: "example.com",
  accent-color: "#1F4E79",
  font: "IBM Plex Sans",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

== Experience

#work(
  title: "Senior Machine Learning Engineer",
  company: "Example Company",
  location: "Shanghai",
  dates: dates-helper(
    start-date: "2022",
    end-date: "Present",
  ),
)
- Reduced retrieval latency by 31% after profiling the
  hot path and batching feature access.
- Led the production rollout of a multilingual ranking
  service used by four product teams.

== Projects

#project(
  role: "Maintainer",
  name: "Multilingual Retrieval Benchmark",
  url: "example.com/benchmark",
  dates: "2024",
)
- Designed a reproducible benchmark and documented
  dataset limits, scoring, and failure cases.

== Education

#edu(
  institution: "Example University",
  location: "Beijing",
  dates: dates-helper(
    start-date: "2018",
    end-date: "2020",
  ),
  degree: "M.S. in Computer Science",
  consistent: true,
)
- Thesis: Efficient representation learning for
  low-resource retrieval.

== Skills

- *Languages*: Python, Rust, SQL
- *ML systems*: PyTorch, retrieval, evaluation,
  model serving
```

Compile this exact entry before committing to the template:

```bash
typst compile demo.typ output/resume.pdf
```

During maintenance of this scenario, the example compiled with Typst 0.15.0. basic-resume 0.2.9
also imports scienceicons 0.1.0 for optional ORCID support, so that transitive dependency is fetched
even when ORCID is unused and currently emits raw-text deprecation warnings under Typst 0.15. Treat
that as part of the dependency audit; do not hide package warnings from the handoff.

For a Chinese technical résumé, start from resume-ng 1.0.0 and verify its configured CJK font before
authoring all content. For modern-cv, the reviewed demo uses its public custom-contact API to avoid
missing icon boxes; enabling built-in contact icons reintroduces the Font Awesome dependency. Do not
choose a template solely from its preview image.

### Adapt the selected demo without recreating its theme

Treat the registry demo as the source-level starting point, not merely as visual inspiration. Copy its
single `demo.typ` into the project, keep the package import pinned, and replace the sample content in
that file. Do not edit Typst's package cache or copy the package implementation into the project.

Decide how much to change before editing:

| Situation | Route | Design boundary |
|---|---|---|
| The published starter already fits the audience, paper, fonts, assets, and content anatomy | Adopt it directly | Change verified facts and package-supported configuration only; preserve its layout language and record the source snapshot |
| The starter uses placeholders, joke copy, or an unrepresentative sample but its API fits | Make a content adaptation | Replace records and exercise the intended sections while retaining package typography, geometry, components, and print behavior |
| One local need is supported by a documented option | Apply a local configuration change | Keep the change visible in the entry and within the public API |
| Several overrides, copied internals, or new layout helpers are becoming necessary | Switch reviewed templates | The API-design mismatch is structural; do not disguise it with a wrapper theme |
| A direct-file starter such as `chicv` must be changed beyond facts | Mark it as adapted | Do not continue claiming byte-identical or unchanged-upstream provenance |

Direct adoption is preferable when it is honest: it preserves a design that has already been
composed and reviewed. Content adaptation is preferable when the starter's sample record is the
problem rather than the design. A local redesign is not the next step when the package itself is a
poor fit; selecting a different reviewed package is.

Use the package's documented public options for the changes it already supports:

- page format and margins;
- font families and sizes;
- accent and text colors;
- header alignment and contact fields;
- section order and package-supported density controls;
- optional photo, icon, or publication features.

Keep factual content in ordinary Typst markup. Compile after replacing the header, after the longest
section is present, and after the final content pass. Test the longest real name, title, date, link,
bullet, publication, and CJK line rather than relying on the short upstream placeholders.

Use this boundary when adapting a demo:

| Change | Preferred action | Do not do |
|---|---|---|
| Content differs | Replace sample facts and reorder package-supported sections | Introduce YAML or a second data model |
| Page feels too sparse or dense | Use documented spacing, paper, and font options | Patch package internals in the cache |
| A font or icon is unavailable | Install the documented asset or choose another reviewed demo | Accept silent fallback as final output |
| A required section is missing | Compose it with ordinary markup supported by the package | Build a parallel component library |
| Package API fights the document contract | Switch to the next reviewed template | Add a wrapper theme to conceal the mismatch |

A few direct Typst adjustments inside the copied entry are reasonable when they are local and
legible—for example, a small `#set par(...)`, a package-supported color value, or a one-off content
block. Repeated overrides, copied internal functions, or a growing collection of layout helpers are
signals that the chosen template is wrong. Return to the audit table and select a better fit.

Before accepting the adaptation:

1. confirm that every call in the copied demo belongs to the pinned package version;
2. remove unused imports, sample assets, optional icons, and placeholder sections;
3. record required fonts and transitive packages;
4. compile in the actual delivery environment;
5. inspect page count, clipping, line wrapping, hierarchy, and text extraction;
6. compare the result with the document contract, not only with the upstream preview.

## Support variants and academic CVs

### Keep each deliverable explicit

A normal résumé should remain one package-backed `.typ` entry. For targeted, multilingual, or
academic variants, create explicit sibling entries such as `resume-ml.typ`, `resume-manager.typ`,
`resume-zh.typ`, or `cv-academic.typ`. Each entry imports a reviewed pinned package, declares its
own package options, and makes its own section-order decisions. There is no separate local theme
layer.

Targeted variants may select, shorten, and reorder evidence, but they must not contradict verified
dates, organization names, publication metadata, or metrics. Use the supplied source documents and
a review checklist as the factual ledger; do not introduce YAML as the authoring interface merely to
deduplicate a short résumé.

For a long academic CV, first choose a template whose public API and page-breaking behavior already
support multi-page records. Let the package own typography, headings, entry alignment, and page
geometry. Content length should determine the page count; do not force a complete academic history
into a one-page résumé template.

### Keep optional academic modules content-only

Only split a genuinely long academic CV when separate Typst content files materially improve
maintenance—for example, publications, teaching, talks, and service maintained by different source
records. The visible entry still owns the package import, package configuration, document metadata,
and assembly order.

Optional modules may return ordinary Typst content or fact records consumed directly by the selected
package. They must not define a second heading system, page wrapper, color palette, entry API, or
theme abstraction. A reader should be able to open the entry file and immediately see which Universe
package controls the document.

### Handle publications carefully

- Preserve canonical author order.
- Emphasize the candidate's name without changing the text.
- Distinguish published, accepted, in press, submitted, and preprint status.
- Keep venue, year, DOI, and URL consistent.
- Use a complete bibliography package only when it improves accuracy; otherwise explicit Typst
  publication entries are easier to audit.
- Do not reduce a long academic record to “selected publications” unless the title clearly says so.

### Handle multilingual variants

Create explicit entries such as `resume-en.typ` and `resume-zh.typ`. Use the same reviewed package
when it genuinely fits both languages, but keep each entry's package options and content order
visible in that file. Allow language-specific line breaks, date widths, section order, and font
choices. Do not add a local styling abstraction merely to synchronize the variants, and do not
assume a literal translation has the same page geometry.

Verify:

- full glyph coverage;
- bold and medium CJK faces;
- punctuation and Latin/CJK spacing;
- URL wrapping;
- date ranges and location widths;
- translated institution and degree names approved by the user.

## Build, inspect, and correct

### Compile the requested entry

```bash
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project> --all --ppi 144 --entry <entry.typ>
python3 ${SKILL_DIR}/scripts/typst_quality_checker.py <project> --expected-pages <N> --entry <entry.typ> --json output/cv-audit.json
python3 ${SKILL_DIR}/scripts/validate_project.py <project> --mode delivery --entry <entry.typ>
```

The compiler's --all mode produces PDF, page PNGs, and an overview. PDF is the primary CV
artifact. Do not produce PPTX unless the user explicitly asks for it and accepts fidelity loss.

### Inspect visually

Inspect output/overview.png first, then every page PNG at full size, then the PDF at 100% and at a
typical laptop width. Also inspect a low-resolution thumbnail of every page: the name, section
sequence, date rhythm, and major groups should remain legible as hierarchy even when body copy is
not readable. Simulate grayscale or print a page when practical.

Check:

- correct paper size, orientation, margins, and page count;
- no overflow, collision, clipping, accidental blank page, or stranded heading;
- stable date and location alignment;
- body text readable at 100% and in print;
- deliberate page density without a crowded final line;
- no unexplained hole caused by an unbreakable entry;
- consistent section, entry, bullet, and link spacing;
- natural photo crop and consent when a photo is present;
- complete glyph rendering for every language.

### Inspect the PDF as a document

Use Poppler tools when available:

```bash
pdfinfo <project>/output/slides.pdf
pdffonts <project>/output/slides.pdf
pdftotext <project>/output/slides.pdf <project>/output/cv-extracted.txt
```

Verify:

- physical page dimensions and page count;
- embedded or reproducibly available fonts;
- name, headings, dates, bullets, and publications in logical extraction order;
- accurate visible labels for clickable links;
- no important content represented only by an image, logo, or icon;
- no hidden text, source notes, placeholders, or prompt leakage.

If extracted order is poor, simplify the layout. Do not claim ATS suitability based only on visual
appearance.

### Use a proportional correction ladder

For a small overflow, make a small correction:

1. edit the offending line or label;
2. tighten the local entry or section spacing;
3. shorten repeated context;
4. move a complete low-priority entry to the next page;
5. adjust margins within the accepted range;
6. reduce body size by a small step.

For a structural overflow, change the content plan or page count. Do not repeatedly shrink the
entire document.

### Record the handoff

State:

- target and paper size;
- entry point and page count;
- content assumptions and unresolved factual gaps;
- font and package dependencies;
- selected template, pinned version, and whether the entry is an unchanged snapshot or a documented
  content adaptation;
- whether a photo was included and why;
- visual, text-extraction, and link checks actually performed;
- any alternate variants delivered.

## Quick Mode defaults

When the user requests a CV without design details:

1. Use A4, one column, 17 mm horizontal margins, and a restrained blue or grayscale accent.
2. Select a reviewed, pinned Universe template whose API and dependencies fit the document:
   `basic-resume` or `simple-technical-resume` for a conservative professional résumé,
   `resume-ng` for a Chinese technical résumé, `heading-resume` for an editorial résumé whose
   two-column order is acceptable, and `pro-academic-cv` for a cumulative academic record.
3. Copy the closest reviewed `demo.typ`; keep its package import, options, facts, and section content
   visible in that one entry. If it fails the design or reproducibility contract, audit the next
   reviewed template instead of creating a local theme or fallback framework.
4. Use experience-first order for experienced candidates and education-first order for students
   or recent graduates.
5. Target one page for early-career material, allow two pages when evidence requires it, and let an
   academic CV remain content-driven.
6. Omit the photo and decorative icons unless requested.
7. Start near 10.2–10.5 pt body text with explicit font fallbacks.
8. Compile early, inspect every page, extract PDF text, and make one correction pass.
9. State assumptions, package dependencies, warnings, and unresolved factual gaps in the handoff.

Quick Mode reduces discovery; it does not waive fact checking, compilation, extraction, or visual
review.

## Non-negotiables

- Keep Typst files as the editable source of truth.
- Do not default to RenderCV or any YAML-first workflow.
- Start from a reviewed, pinned Typst Universe template or its published one-file starter. Do not
  introduce a separate project-local theme layer or a self-authored styling framework.
- Preserve the selected template's design language. Use its public API for supported changes and
  switch templates when repeated overrides would be necessary.
- Record source fidelity honestly; do not label a content adaptation as unchanged upstream source.
- Never invent or silently improve factual claims.
- Never add hidden keywords, invisible text, or prompt injection.
- Use physical A4 or Letter settings intentionally.
- Prefer a clear single-column reading order unless there is a documented reason to depart from it.
- Keep short headers with the first content line; keep long entry bodies breakable.
- Shorten, restructure, or add a page before shrinking body text excessively.
- Verify the PDF visually, structurally, and through text extraction.
- Keep personal data, assets, fonts, package versions, and dependencies explicit and reproducible.
