import assert from 'node:assert/strict'
import { readFile, readdir, stat } from 'node:fs/promises'
import { dirname, extname, isAbsolute, relative, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import test from 'node:test'

const root = fileURLToPath(new URL('../', import.meta.url))
const within = (path) => { const local = relative(root, path); return !isAbsolute(local) && local !== '..' && !local.startsWith('../') }
async function files(directory) {
  const found = []
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (['.git', 'node_modules', '.benchmarks', '.DS_Store'].includes(entry.name)) continue
    assert.equal(entry.isSymbolicLink(), false, `External content link: ${entry.name}`)
    const path = resolve(directory, entry.name)
    if (entry.isDirectory()) found.push(...await files(path))
    else found.push(path)
  }
  return found
}

test('Skill discovery stays compact and installable without the core repository', async () => {
  const directory = resolve(root, 'skills/tylina')
  const skill = await readFile(resolve(directory, 'SKILL.md'), 'utf8')
  const frontmatter = /^---\n([\s\S]+?)\n---\n/u.exec(skill)?.[1]
  assert.ok(frontmatter, 'Skill frontmatter is required')
  assert.match(frontmatter, /^name: tylina$/mu)
  assert.match(frontmatter, /^description: .+/mu)
  assert.ok(Buffer.byteLength(skill) < 10 * 1024, 'Move detailed workflows to focused references')
  assert.ok((await stat(resolve(directory, 'agents/openai.yaml'))).isFile())
  for (const path of await files(root)) {
    const contents = await readFile(path, 'utf8')
    assert.ok(!['.rs', '.wasm', '.map', '.tsx'].includes(extname(path)), `Unexpected runtime source: ${path}`)
    assert.ok(!/npm_[A-Za-z0-9]{36,}|github_pat_[A-Za-z0-9_]{40,}/u.test(contents), `Credential in ${path}`)
    if (!path.endsWith('.md')) continue
    for (const [, target] of contents.matchAll(/\]\(([^)]+)\)/gu)) {
      if (target.startsWith('#') || URL.canParse(target)) continue
      const linked = resolve(dirname(path), decodeURIComponent(target.split('#')[0]))
      assert.ok(within(linked), `Reference escapes the standalone repository: ${target}`)
      await stat(linked)
    }
  }
})
