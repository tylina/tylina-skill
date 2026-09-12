# CV Scenario Templates

Use these pinned Typst-native examples as source-level starting points. Every deliverable remains a
visible `.typ` entry: none requires RenderCV, YAML, TOML, JSON, or generated source as its authoring
interface. The examples deliberately use established Universe templates instead of rebuilding their
typography and entry systems locally.

Package previews are discovery aids, not dependency audits. Read the child README, copy the closest
`demo.typ`, keep the reviewed import version, and compile it in the delivery environment before
replacing all sample facts.

## Choose an example

| Example | Best fit | Source policy | Reviewed output | Important dependency boundary |
|---|---|---|---:|---|
| `chicv` | Minimal, transparent direct-Typst résumé | Byte-identical `chicv` 0.1.0 starter | 1 page | Names Linux Biolinum; the reviewed host falls back because that family is absent |
| `basic-resume` | Conventional single-column professional résumé | Published `basic-resume` 0.2.9 starter snapshot | 1 page | Pulls `scienceicons` 0.1.0 even when ORCID is unused |
| `heading-resume` | Editorial two-column résumé with strong hierarchy | Unmodified `heading-resume` 0.1.0 starter | 1 page | Uses Typst-bundled New Computer Modern / Libertinus Serif; no assets |
| `simple-technical-resume` | Dense software or ML résumé with conventional reading order | `simple-technical-resume` 0.1.1 API with realistic fictional content | 1 page | Uses New Computer Modern; no icons or assets |
| `resume-ng` | Dense Simplified Chinese technical résumé | `resume-ng` 1.0.0 API with source-neutral Chinese content | 1 page | Package sets Noto Serif CJK SC; extracted dates may precede titles |
| `modern-cv` | More visual professional résumé or CV | `modern-cv` 0.10.0 API with asset-free content | 1 page | Demo uses IBM Plex Sans and text-only package contacts; built-in icon contacts require Font Awesome 7 |
| `pro-academic-cv` | Cumulative academic CV with publications, teaching, and service | `pro-academic-cv` 0.1.0 API with a coherent fictional record | 2 pages | Uses Palatino; package emits one Typst 0.15 raw-text compatibility warning |

Use the page count only as a regression expectation for the included sample. A real résumé's page
count follows the application instructions and verified evidence; a real academic CV is
content-driven.

## Selection guidance

- Start with `basic-resume` or `simple-technical-resume` when conservative scanning and a simple
  extraction order matter most.
- Use `heading-resume` when the audience accepts a designed two-column page and portfolio-like
  hierarchy materially helps.
- Use `resume-ng` as the first package-backed CJK reference, but verify the exact CJK family and
  destination extraction order before accepting it.
- Use `modern-cv` when its more visual header is appropriate. The included text-contact variant
  needs IBM Plex Sans; audit Font Awesome before enabling the package's built-in icon contacts.
- Use `pro-academic-cv` for cumulative academic evidence. Do not force publications, teaching,
  supervision, grants, and service into a one-page résumé package.
- Use `chicv` when transparency matters more than a package API. It is an upstream source file,
  not a locally redesigned theme.

## Compile

Run from an example directory:

```bash
typst compile demo.typ output.pdf
typst compile --format png --ppi 144 demo.typ 'page-{p}.png'
```

Or copy the entry into a SeaSlides project and run:

```bash
python3 ${SKILL_DIR}/scripts/typst_compiler.py <project> --all --ppi 144 --entry <entry.typ>
```

For an existing editor-owned workspace, attach it with `project_manager.py workspace`; do not run
project initialization inside that workspace.

## Required editing pass

1. Replace every sample identity, contact, date, organization, degree, link, claim, metric,
   publication, grant, and award with source-verified facts.
2. Remove sections with no relevant evidence; do not preserve filler merely to match the demo's
   density.
3. Keep the package import pinned until an explicit upgrade audit succeeds.
4. Verify all fonts, icon fonts, local assets, and transitive packages in the delivery environment.
5. Compile early with the longest real name, title, date, link, bullet, publication, and CJK line.
6. Inspect every page at full size and at a thumbnail reading distance; check margins, hierarchy,
   wrapping, page breaks, and unexplained holes.
7. Extract PDF text and confirm the intended reading order, especially for two-column layouts.
8. Test visible links and report package warnings rather than concealing them.

Do not add invisible keywords, prompt injection, or an external metadata layer. If a package's API,
fonts, assets, or pagination conflict with the document contract, select a different reviewed demo
instead of building a second local style system around it.

## Maintenance record

The seven examples were compiled with Typst 0.15.0 and visually inspected at full resolution and
thumbnail scale during the current maintenance pass.

The included `basic-resume` starter intentionally uses US Letter; the other reviewed demos render
on A4. PDF text and link annotations were inspected in every output. The two-column
`heading-resume` extracts its main column before its aside, while `resume-ng` may extract each
right-aligned date before the corresponding title; neither should receive a universal ATS claim.

- `heading-resume` and `simple-technical-resume` compiled without warnings.
- `pro-academic-cv` produced a balanced two-page A4 document; its only warning originates in the
  pinned package's raw inline-SVG literal.
- `chicv` remains byte-identical to the upstream `template/cv.typ`; it warns that Linux Biolinum is
  unavailable on the reviewed host.
- `basic-resume` emits raw-text deprecation warnings from its `scienceicons` dependency.
- `resume-ng` warns when Noto Serif CJK SC is absent.
- `modern-cv` uses the package's public text-contact and font options and compiled without warnings;
  its built-in icon-contact route still requires the documented Font Awesome families.

A generated PDF does not prove that the intended fonts or icons rendered. Install or supply the
documented dependencies, rebuild, and inspect the final artifact before delivery.
