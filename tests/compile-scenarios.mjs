import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { dirname, join, relative } from 'node:path'
import { spawn } from 'node:child_process'
import { fileURLToPath } from 'node:url'

const repositoryRoot = fileURLToPath(new URL('../', import.meta.url))
const scenarioRoot = join(repositoryRoot, 'skills', '_shared', 'scenarios')
const catalog = JSON.parse(await readFile(join(scenarioRoot, 'index.json'), 'utf8'))
const outputRoot = await mkdtemp(join(tmpdir(), 'tylina-scenarios-'))

try {
  let compiled = 0
  for (const definition of catalog.scenarios) {
    if (typeof definition.version !== 'string') continue
    const index = JSON.parse(await readFile(join(scenarioRoot, definition.index), 'utf8'))
    for (const entry of index.entries) {
      await compile(definition.id, entry, [])
      compiled += 1
      for (const variant of entry.compile_variants ?? []) {
        const args = Object.entries(variant.inputs ?? {}).flatMap(([name, value]) => [
          '--input',
          `${name}=${value}`
        ])
        await compile(definition.id, entry, args, variant.id)
        compiled += 1
      }
    }
  }
  process.stdout.write(`Compiled ${compiled} Tylina-owned scenario variants with Typst.\n`)
} finally {
  await rm(outputRoot, { recursive: true, force: true })
}

async function compile(scenario, entry, extraArgs, variant = 'default') {
  const sourcePath = join(scenarioRoot, scenario, dirname(entry.entry), 'main.typ')
  assert.equal(sourcePath, join(scenarioRoot, scenario, entry.entry),
    `Entrypoint must remain main.typ: ${scenario}/${entry.id}`)
  const outputPath = join(outputRoot, `${entry.id}-${variant}.pdf`)
  await execute('typst', [
    'compile',
    '--root',
    '.',
    ...extraArgs,
    relative(scenarioRoot, sourcePath),
    outputPath
  ], scenarioRoot)
  const pdf = await readFile(outputPath)
  assert.equal(pdf.subarray(0, 5).toString('ascii'), '%PDF-', `Invalid PDF: ${entry.id}/${variant}`)
}

async function execute(command, args, cwd) {
  await new Promise((resolvePromise, reject) => {
    const child = spawn(command, args, { cwd, stdio: ['ignore', 'ignore', 'pipe'] })
    let stderr = ''
    child.stderr.setEncoding('utf8')
    child.stderr.on('data', (chunk) => { stderr += chunk })
    child.once('error', reject)
    child.once('exit', (code, signal) => {
      if (code === 0) resolvePromise()
      else reject(new Error(stderr.trim() || `${command} exited with ${code ?? signal}`))
    })
  })
}
