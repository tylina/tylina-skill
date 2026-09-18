import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { isAbsolute, join, relative, resolve, sep } from 'node:path'
import { fileURLToPath } from 'node:url'

import { runTypst, typstWarnings } from './typst-process.mjs'

const repositoryRoot = fileURLToPath(new URL('../', import.meta.url))
const skillsRoot = join(repositoryRoot, 'skills')
const packageRoot = join(skillsRoot, '_shared', 'packages')
const catalog = JSON.parse(await readFile(join(packageRoot, 'index.json'), 'utf8'))
const requested = new Set(process.argv.slice(2).filter((argument) => argument !== '--'))
const recipes = requested.size === 0
  ? catalog.packages
  : catalog.packages.filter((recipe) => requested.has(recipe.name))

for (const name of requested) {
  assert.ok(recipes.some((recipe) => recipe.name === name), `Unknown package recipe: ${name}`)
}

const outputRoot = await mkdtemp(join(tmpdir(), 'tylina-package-examples-'))

try {
  let compiled = 0
  const failures = []
  for (const recipe of recipes) {
    compiled += await tryCompile(failures, recipe, [], 'default')
    for (const variant of recipe.compile_variants ?? []) {
      assert.match(variant.id, /^[a-z][a-z0-9-]*$/u, `Invalid variant id: ${recipe.name}`)
      const args = Object.entries(variant.inputs ?? {}).flatMap(([name, value]) => [
        '--input',
        `${name}=${value}`
      ])
      compiled += await tryCompile(failures, recipe, args, variant.id)
    }
  }
  assert.equal(failures.length, 0,
    `Package example compilation reported ${failures.length} failure(s):\n\n${failures.join('\n\n')}`)
  process.stdout.write(`Compiled ${compiled} curated package example variants with Typst.\n`)
} finally {
  await rm(outputRoot, { recursive: true, force: true })
}

async function tryCompile(failures, recipe, extraArgs, variant) {
  try {
    await compile(recipe, extraArgs, variant)
    return 1
  } catch (error) {
    failures.push(error instanceof Error ? error.message : String(error))
    return 0
  }
}

async function compile(recipe, extraArgs, variant) {
  const sourcePath = resolve(packageRoot, recipe.demo_path)
  const localPath = relative(packageRoot, sourcePath)
  assert.ok(localPath && !isAbsolute(localPath) && localPath !== '..' &&
    !localPath.startsWith(`..${sep}`), `Demo escapes package root: ${recipe.name}`)
  const outputPath = join(outputRoot, `${recipe.name}-${recipe.version}-${variant}.pdf`)
  const stderr = await runTypst(
    ['compile', '--root', skillsRoot, ...extraArgs, sourcePath, outputPath],
    skillsRoot
  )
  const pdf = await readFile(outputPath)
  assert.equal(pdf.subarray(0, 5).toString('ascii'), '%PDF-',
    `Invalid PDF: ${recipe.name}/${variant}`)
  const { messages: actualWarnings, diagnostics: warningDiagnostics } = typstWarnings(stderr)
  assert.deepEqual(
    warningDiagnostics.map((warning) => warning.message),
    actualWarnings,
    `Could not identify the source of every warning for ${recipe.name}/${variant}`
  )
  const knownWarnings = recipe.known_warnings ?? []
  const knownFontWarnings = recipe.known_font_warnings ?? []
  const unexpectedWarnings = warningDiagnostics.filter((warning) =>
    !knownWarnings.includes(warning.message) &&
    !knownFontWarnings.some((known) =>
      known.message === warning.message && known.source === warning.source
    )
  )
  assert.deepEqual(unexpectedWarnings, [],
    `Unexpected Typst warning for ${recipe.name}/${variant}:\n${stderr.trim()}`)
  if (actualWarnings.length > 0) {
    process.stdout.write(`Known warning for ${recipe.name}/${variant}: ` +
      `${[...new Set(actualWarnings)].join('; ')}\n`)
  }
}
