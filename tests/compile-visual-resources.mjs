import assert from 'node:assert/strict'
import { mkdtemp, readFile, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { fileURLToPath } from 'node:url'

import { runTypst, typstWarnings } from './typst-process.mjs'

const repositoryRoot = fileURLToPath(new URL('../', import.meta.url))
const skillsRoot = join(repositoryRoot, 'skills')
const chartsRoot = join(skillsRoot, '_shared', 'charts')
const iconsRoot = join(skillsRoot, '_shared', 'icons')
const charts = JSON.parse(await readFile(join(chartsRoot, 'index.json'), 'utf8'))
const icons = JSON.parse(await readFile(join(iconsRoot, 'index.json'), 'utf8'))
const outputRoot = await mkdtemp(join(tmpdir(), 'tylina-visual-resources-'))

try {
  let compiled = 0
  for (const [id, chart] of Object.entries(charts.charts)) {
    await compile(`chart-${id}`, join(chartsRoot, chart.file))
    compiled += 1
  }
  for (const icon of icons.icons) {
    await compile(`icon-${icon.name}`, join(iconsRoot, icon.demo_path))
    compiled += 1
  }
  process.stdout.write(`Compiled ${compiled} chart and icon examples with Typst.\n`)
} finally {
  await rm(outputRoot, { recursive: true, force: true })
}

async function compile(id, sourcePath) {
  const outputPath = join(outputRoot, `${id}.pdf`)
  const stderr = await runTypst([
    'compile',
    '--root',
    skillsRoot,
    sourcePath,
    outputPath
  ], skillsRoot)
  assert.deepEqual(typstWarnings(stderr).messages, [],
    `Unexpected Typst warning for ${id}:\n${stderr.trim()}`)
  const pdf = await readFile(outputPath)
  assert.equal(pdf.subarray(0, 5).toString('ascii'), '%PDF-', `Invalid PDF: ${id}`)
}
