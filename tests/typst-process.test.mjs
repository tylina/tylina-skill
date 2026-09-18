import assert from 'node:assert/strict'
import test from 'node:test'

import { typstEnvironment } from './typst-process.mjs'

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
