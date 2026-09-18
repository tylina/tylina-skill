import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { isAbsolute, join, relative, resolve, sep } from 'node:path'
import { fileURLToPath } from 'node:url'

import { runTypst } from './typst-process.mjs'

const repositoryRoot = fileURLToPath(new URL('../', import.meta.url))
const scenarioRoot = join(repositoryRoot, 'skills', '_shared', 'scenarios')
const catalog = JSON.parse(await readFile(join(scenarioRoot, 'index.json'), 'utf8'))
const outputRoot = await mkdtemp(join(tmpdir(), 'tylina-scenarios-'))

try {
  let compiled = 0
  const failures = []
  for (const definition of catalog.scenarios) {
    const index = JSON.parse(await readFile(join(scenarioRoot, definition.index), 'utf8'))
    for (const entry of index.entries) {
      compiled += await tryCompile(failures, definition.id, entry, [], 'default')
      for (const variant of entry.compile_variants ?? []) {
        const args = Object.entries(variant.inputs ?? {}).flatMap(([name, value]) => [
          '--input',
          `${name}=${value}`
        ])
        compiled += await tryCompile(failures, definition.id, entry, args, variant.id)
      }
    }
  }
  assert.equal(failures.length, 0,
    `Scenario compilation reported ${failures.length} failure(s):\n\n${failures.join('\n\n')}`)
  process.stdout.write(`Compiled ${compiled} Tylina-owned scenario variants with Typst.\n`)
} finally {
  await rm(outputRoot, { recursive: true, force: true })
}

async function tryCompile(failures, scenario, entry, extraArgs, variant) {
  try {
    await compile(scenario, entry, extraArgs, variant)
    return 1
  } catch (error) {
    failures.push(error instanceof Error ? error.message : String(error))
    return 0
  }
}

async function compile(scenario, entry, extraArgs, variant = 'default') {
  const scenarioDirectory = resolve(scenarioRoot, scenario)
  const sourcePath = resolve(scenarioDirectory, entry.entry)
  const localPath = relative(scenarioDirectory, sourcePath)
  assert.ok(localPath && !isAbsolute(localPath) && localPath !== '..' &&
    !localPath.startsWith(`..${sep}`), `Entrypoint escapes its scenario: ${scenario}/${entry.id}`)
  const outputPath = join(outputRoot, `${scenario}-${entry.id}-${variant}.pdf`)
  const stderr = await runTypst([
    'compile',
    '--root',
    '.',
    ...extraArgs,
    relative(scenarioRoot, sourcePath),
    outputPath
  ], scenarioRoot)
  const pdf = await readFile(outputPath)
  assert.equal(pdf.subarray(0, 5).toString('ascii'), '%PDF-', `Invalid PDF: ${entry.id}/${variant}`)
  const actualWarnings = [...stderr.matchAll(/^warning: (.+)$/gmu)].map((match) => match[1])
  const warningDiagnostics = [...stderr.matchAll(
    /^warning: (.+)\n\s*┌─ (.+):\d+:\d+$/gmu
  )].map((match) => ({ message: match[1], source: match[2].replaceAll('\\', '/') }))
  assert.deepEqual(
    warningDiagnostics.map((warning) => warning.message),
    actualWarnings,
    `Could not identify the source of every warning for ${scenario}/${entry.id}/${variant}`
  )
  const knownWarnings = entry.known_warnings ?? []
  const knownFontWarnings = entry.known_font_warnings ?? []
  const unexpectedWarnings = warningDiagnostics.filter((warning) =>
    !knownWarnings.includes(warning.message) &&
    !knownFontWarnings.some((known) =>
      known.message === warning.message && known.source === warning.source
    )
  )
  assert.deepEqual(unexpectedWarnings, [],
    `Unexpected Typst warning for ${scenario}/${entry.id}/${variant}:\n${stderr.trim()}`)
  if (actualWarnings.length > 0) {
    process.stdout.write(`Known warning for ${scenario}/${entry.id}/${variant}: ` +
      `${[...new Set(actualWarnings)].join('; ')}\n`)
  }
}
