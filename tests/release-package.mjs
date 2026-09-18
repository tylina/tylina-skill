import assert from 'node:assert/strict'
import { execFile } from 'node:child_process'
import { createHash } from 'node:crypto'
import { mkdtemp, readFile, rm, writeFile } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { promisify } from 'node:util'
import test from 'node:test'

import { unzipSync } from 'fflate'

const run = promisify(execFile)
const root = new URL('../', import.meta.url)
const packageVersion = JSON.parse(
  await readFile(new URL('../package.json', import.meta.url), 'utf8')
).version
const collection = JSON.parse(
  await readFile(new URL('../skills/catalog.json', import.meta.url), 'utf8')
).collection

test('release builder emits one complete atomic Skill collection', {
  skip: packageVersion.includes('-')
}, async () => {
  const output = await mkdtemp(join(tmpdir(), 'tylina-skill-release-'))
  try {
    const previousIndex = join(output, 'previous.json')
    await writeFile(previousIndex, JSON.stringify({
      schemaVersion: 1,
      channel: 'stable',
      releases: [
        fakeRelease('0.4.9', '0.14.0'),
        fakeRelease('0.4.8', collection.minimumTylinaVersion)
      ]
    }))
    await run(process.execPath, [
      'scripts/build-release.mjs',
      output,
      '--previous-index',
      previousIndex
    ], { cwd: root })
    const manifest = JSON.parse(await readFile(join(output, 'tylina-skill-release.json'), 'utf8'))
    const current = manifest.releases.find(({ version }) => version === packageVersion)
    assert.ok(current)
    const archiveName = `tylina-skill-${current.version}.zip`
    const archive = await readFile(join(output, archiveName))
    assert.equal(manifest.schemaVersion, 1)
    assert.equal(manifest.channel, 'stable')
    assert.deepEqual(manifest.releases.map(({ version }) => version), [packageVersion, '0.4.9'])
    assert.equal(current.archive.bytes, archive.byteLength)
    assert.equal(current.archive.sha256, createHash('sha256').update(archive).digest('hex'))
    assert.equal(
      current.archive.url,
      `https://github.com/tylina/tylina-skill/releases/download/v${current.version}/${archiveName}`
    )

    const files = unzipSync(archive)
    assert.ok(files['skills/catalog.json'])
    assert.ok(files['skills/typst-authoring/SKILL.md'])
    assert.ok(files['LICENSE'])
    assert.ok(Object.keys(files).every((path) => path === 'LICENSE' || path.startsWith('skills/')))
    const catalog = JSON.parse(new TextDecoder().decode(files['skills/catalog.json']))
    assert.deepEqual(catalog.collection, {
      version: current.version,
      minimumTylinaVersion: current.minimumTylinaVersion
    })
  } finally {
    await rm(output, { recursive: true, force: true })
  }
})

function fakeRelease(version, minimumTylinaVersion) {
  return {
    version,
    minimumTylinaVersion,
    archive: {
      url: `https://github.com/tylina/tylina-skill/releases/download/v${version}/tylina-skill-${version}.zip`,
      bytes: 1,
      sha256: 'a'.repeat(64)
    }
  }
}
