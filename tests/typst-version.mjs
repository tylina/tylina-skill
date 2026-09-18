import assert from 'node:assert/strict'
import { execFile } from 'node:child_process'
import { readFile } from 'node:fs/promises'
import { promisify } from 'node:util'

const run = promisify(execFile)
const typst = process.env.TYPST_BIN || 'typst'
const metadata = JSON.parse(await readFile(new URL('../package.json', import.meta.url), 'utf8'))
const expectedTrain = metadata.version.match(/^(\d+\.\d+)\./u)?.[1]
assert.ok(expectedTrain, `Invalid Skill collection version: ${metadata.version}`)

const { stdout } = await run(typst, ['--version'])
const actualVersion = /^typst (\d+\.\d+\.\d+)(?:\s|$)/u.exec(stdout.trim())?.[1]
assert.ok(actualVersion, `Cannot read the Typst version from: ${stdout.trim()}`)
assert.equal(
  actualVersion.split('.').slice(0, 2).join('.'),
  expectedTrain,
  `Skill ${metadata.version} must be compiled with Typst ${expectedTrain}.x, found ${actualVersion}`
)
process.stdout.write(`Verified Typst ${actualVersion} for Skill collection ${metadata.version}.\n`)
