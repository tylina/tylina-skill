import assert from 'node:assert/strict'
import test from 'node:test'

import { typstEnvironment, typstWarnings } from './typst-process.mjs'

test('release compilation ignores host fonts by default', () => {
  const environment = { PATH: '/bin' }

  assert.deepEqual(typstEnvironment(environment), {
    PATH: '/bin',
    TYPST_IGNORE_SYSTEM_FONTS: 'true'
  })
  assert.deepEqual(environment, { PATH: '/bin' })
})

test('ambient host-font settings cannot relax the release gate', () => {
  assert.equal(
    typstEnvironment({ TYPST_IGNORE_SYSTEM_FONTS: 'false' }).TYPST_IGNORE_SYSTEM_FONTS,
    'true'
  )
})

test('package download progress is not a Typst warning', () => {
  const stderr = `downloading @preview/komet:0.1.0

  0 B /  78.1 KiB (  0 %), 780.5 KiB/s, ETA: 0 s
 78.1 KiB /  78.1 KiB (100 %), 780.5 KiB/s, ETA: 0 s
`

  assert.deepEqual(typstWarnings(stderr), { messages: [], diagnostics: [] })
})

test('Typst warnings retain their message and source', () => {
  const stderr = 'warning: unknown font family: Example\n  ┌─ demo.typ:2:3\n'

  assert.deepEqual(typstWarnings(stderr), {
    messages: ['unknown font family: Example'],
    diagnostics: [{ message: 'unknown font family: Example', source: 'demo.typ' }]
  })
})
