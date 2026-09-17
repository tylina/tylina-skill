import assert from 'node:assert/strict'
import { readFile, readdir, stat } from 'node:fs/promises'
import { dirname, extname, isAbsolute, relative, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'
import test from 'node:test'

const root = fileURLToPath(new URL('../', import.meta.url))
const withinDirectory = (directory, path) => {
  const local = relative(directory, path)
  return !isAbsolute(local) && local !== '..' && !local.startsWith('../')
}
const within = (path) => withinDirectory(root, path)
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

  const skillsRoot = resolve(root, 'skills')
  const catalog = JSON.parse(await readFile(resolve(skillsRoot, 'catalog.json'), 'utf8'))
  assert.match(
    catalog.collection.version,
    /^\d+\.\d+\.\d+(?:-[0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*)?$/u
  )
  assert.match(catalog.collection.minimumTylinaVersion, /^\d+\.\d+\.\d+$/u)
  const packageMetadata = JSON.parse(await readFile(resolve(root, 'package.json'), 'utf8'))
  assert.equal(packageMetadata.version, catalog.collection.version)
  const catalogIds = catalog.skills.map((entry) => entry.id)
  const packageIds = (await readdir(skillsRoot, { withFileTypes: true }))
    .filter((entry) => entry.isDirectory() && entry.name !== 'tylina' && !entry.name.startsWith('_'))
    .map((entry) => entry.name)
    .sort()
  assert.deepEqual([...catalogIds].sort(), packageIds, 'The catalog must name every domain Skill package')
  const idSet = new Set(catalogIds)
  for (const entry of catalog.skills) {
    const skillPath = resolve(skillsRoot, entry.id, 'SKILL.md')
    const agentPath = resolve(skillsRoot, entry.id, 'agents/openai.yaml')
    assert.ok((await stat(skillPath)).isFile(), `Missing Skill entry: ${entry.id}`)
    assert.ok((await stat(agentPath)).isFile(), `Missing Skill UI metadata: ${entry.id}`)
    const domainSkill = await readFile(skillPath, 'utf8')
    const domainFrontmatter = /^---\n([\s\S]+?)\n---\n/u.exec(domainSkill)?.[1]
    assert.ok(domainFrontmatter, `Missing Skill frontmatter: ${entry.id}`)
    assert.match(domainFrontmatter, new RegExp(`^name: ${entry.id}$`, 'mu'))
    assert.match(domainFrontmatter, /^description: .+/mu)
    const agentMetadata = await readFile(agentPath, 'utf8')
    assert.match(agentMetadata, /^interface:\n/mu)
    assert.match(agentMetadata, /^  display_name: "[^"]+"$/mu)
    assert.match(agentMetadata, /^  short_description: "[^"]{25,64}"$/mu)
    assert.match(agentMetadata, new RegExp(`^  default_prompt: ".*\\$${entry.id}.*"$`, 'mu'))
    for (const dependency of entry.dependencies) assert.ok(idSet.has(dependency), `Unknown Skill dependency: ${dependency}`)
    for (const source of entry.source) {
      assert.ok(URL.canParse(source.url), `Invalid source URL for ${entry.id}: ${source.url}`)
      assert.ok(source.revision.trim(), `Missing source revision for ${entry.id}`)
    }
  }
  const entrypointIds = new Set()
  for (const entry of catalog.entrypoints) {
    assert.ok(!entrypointIds.has(entry.id), `Duplicate catalog entrypoint: ${entry.id}`)
    entrypointIds.add(entry.id)
    assert.ok(idSet.has(entry.skill), `Unknown Skill entrypoint target: ${entry.skill}`)
  }
  const packageSkillMap = JSON.parse(await readFile(
    resolve(skillsRoot, '_shared/packages/skill-map.json'),
    'utf8'
  ))
  assert.equal(packageSkillMap.reviewed_against.url, 'https://packages.typst.org/preview/index.json')
  assert.match(packageSkillMap.reviewed_against.date, /^\d{4}-\d{2}-\d{2}$/u)
  for (const [kind, routes] of [
    ['category', packageSkillMap.category_routes],
    ['discipline', packageSkillMap.discipline_routes]
  ]) {
    for (const [name, paths] of Object.entries(routes)) {
      assert.match(name, /^[a-z][a-z-]*$/u, `Invalid ${kind} route: ${name}`)
      assert.ok(paths.length > 0, `Empty ${kind} route: ${name}`)
      assert.equal(new Set(paths).size, paths.length, `Duplicate ${kind} route path: ${name}`)
    }
  }
  for (const [name, route] of Object.entries(packageSkillMap.package_routes)) {
    assert.match(name, /^[a-z0-9][a-z0-9-]*$/u, `Invalid package route: ${name}`)
    assert.ok(route.skill_paths.length > 0, `Empty package route: ${name}`)
    assert.equal(
      new Set(route.skill_paths).size,
      route.skill_paths.length,
      `Duplicate package route path: ${name}`
    )
  }
  const routedPaths = [
    ...packageSkillMap.default_paths,
    ...Object.values(packageSkillMap.category_routes).flat(),
    ...Object.values(packageSkillMap.discipline_routes).flat(),
    ...Object.values(packageSkillMap.package_routes)
      .flatMap((route) => [
        ...route.skill_paths,
        ...(route.recipe_path ? [route.recipe_path] : [])
      ])
  ]
  for (const path of new Set(routedPaths)) {
    const resolvedPath = resolve(skillsRoot, path)
    assert.ok(withinDirectory(skillsRoot, resolvedPath), `Package Skill route escapes root: ${path}`)
    assert.ok((await stat(resolvedPath)).isFile(), `Missing package Skill route: ${path}`)
  }

  const packageIndex = JSON.parse(await readFile(
    resolve(skillsRoot, '_shared/packages/index.json'),
    'utf8'
  ))
  const recipeNames = new Set()
  for (const recipe of packageIndex.packages) {
    assert.ok(!recipeNames.has(recipe.name), `Duplicate package recipe: ${recipe.name}`)
    recipeNames.add(recipe.name)
    assert.match(recipe.name, /^[a-z0-9][a-z0-9-]*$/u)
    assert.match(recipe.version, /^\d+\.\d+\.\d+(?:[-+].+)?$/u)
    const spec = `@preview/${recipe.name}:${recipe.version}`
    assert.ok(recipe.import.includes(spec), `Recipe import does not pin ${spec}`)
    const demoPath = resolve(skillsRoot, '_shared/packages', recipe.demo_path)
    const readmePath = resolve(skillsRoot, '_shared/packages', recipe.readme_path)
    assert.ok((await stat(demoPath)).isFile(), `Missing package demo: ${recipe.demo_path}`)
    assert.ok((await stat(readmePath)).isFile(), `Missing package README: ${recipe.readme_path}`)
    assert.ok((await readFile(demoPath, 'utf8')).includes(spec), `Demo does not pin ${spec}`)
    assert.ok((await readFile(readmePath, 'utf8')).includes(spec), `README does not pin ${spec}`)
    assert.equal(
      packageSkillMap.package_routes[recipe.name]?.recipe_path,
      `_shared/packages/${recipe.readme_path}`,
      `Package route does not expose recipe: ${recipe.name}`
    )
  }
  const recipeDirectories = (await readdir(resolve(skillsRoot, '_shared/packages'), {
    withFileTypes: true
  }))
    .filter((entry) => entry.isDirectory())
    .map((entry) => entry.name)
    .sort()
  assert.deepEqual([...recipeNames].sort(), recipeDirectories, 'Every package recipe directory must be indexed')
  const catalogSkillDocs = catalogIds.map((id) => resolve(skillsRoot, id, 'SKILL.md'))

  const themesRoot = resolve(skillsRoot, '_shared/slides/themes')
  for (const tier of ['builtin', 'custom-canvas', 'custom-plain', 'custom-rich', 'universe']) {
    const tierRoot = resolve(themesRoot, tier)
    const index = JSON.parse(await readFile(resolve(tierRoot, 'index.json'), 'utf8'))
    const themeNames = new Set()
    for (const theme of index.themes) {
      assert.match(theme.name, /^[a-z0-9][a-z0-9-]*$/u)
      assert.ok(!themeNames.has(theme.name), `Duplicate ${tier} theme: ${theme.name}`)
      themeNames.add(theme.name)
      if (theme.path !== undefined) {
        assert.equal(theme.path, `${tier}/${theme.name}`, `Invalid theme path: ${tier}/${theme.name}`)
      }
      assert.ok((await stat(resolve(tierRoot, theme.name, 'demo.typ'))).isFile(),
        `Missing theme demo: ${tier}/${theme.name}`)
    }
    const themeDirectories = (await readdir(tierRoot, { withFileTypes: true }))
      .filter((entry) => entry.isDirectory())
      .map((entry) => entry.name)
      .sort()
    assert.deepEqual([...themeNames].sort(), themeDirectories,
      `Every ${tier} theme directory must be indexed`)
  }

  const scenarioRoot = resolve(skillsRoot, '_shared/scenarios')
  const scenarioCatalog = JSON.parse(await readFile(resolve(scenarioRoot, 'index.json'), 'utf8'))
  const scenarioIds = new Set()
  for (const definition of scenarioCatalog.scenarios) {
    assert.match(definition.id, /^[a-z][a-z-]*$/u)
    assert.ok(!scenarioIds.has(definition.id), `Duplicate scenario: ${definition.id}`)
    scenarioIds.add(definition.id)
    const indexPath = resolve(scenarioRoot, definition.index)
    const readmePath = resolve(scenarioRoot, definition.readme)
    assert.ok(withinDirectory(scenarioRoot, indexPath), `Scenario index escapes root: ${definition.id}`)
    assert.ok(withinDirectory(scenarioRoot, readmePath), `Scenario README escapes root: ${definition.id}`)
    assert.ok((await stat(readmePath)).isFile(), `Missing scenario README: ${definition.id}`)
    if (definition.version) {
      assert.match(definition.version, /^\d+\.\d+\.\d+$/u)
      assert.ok(definition.authors.length > 0, `Missing scenario authors: ${definition.id}`)
      assert.ok(URL.canParse(definition.repository), `Invalid scenario repository: ${definition.id}`)
    }
    const scenario = JSON.parse(await readFile(indexPath, 'utf8'))
    assert.equal(scenario.scenario, definition.id)
    assert.ok(scenario.entries.length > 0, `Empty scenario: ${definition.id}`)
    const entryIds = new Set()
    for (const entry of scenario.entries) {
      assert.ok(!entryIds.has(entry.id), `Duplicate ${definition.id} entry: ${entry.id}`)
      entryIds.add(entry.id)
      const entryPath = resolve(scenarioRoot, definition.id, entry.entry)
      assert.ok(withinDirectory(resolve(scenarioRoot, definition.id), entryPath),
        `Scenario entry escapes root: ${definition.id}/${entry.id}`)
      assert.ok((await stat(entryPath)).isFile(), `Missing scenario entry: ${definition.id}/${entry.id}`)
      assert.ok((await stat(resolve(dirname(entryPath), 'README.md'))).isFile(),
        `Missing scenario leaf README: ${definition.id}/${entry.id}`)
    }
  }

  for (const path of await files(root)) {
    const contents = await readFile(path, 'utf8')
    assert.ok(!['.rs', '.wasm', '.map', '.tsx'].includes(extname(path)), `Unexpected runtime source: ${path}`)
    assert.ok(!/npm_[A-Za-z0-9]{36,}|github_pat_[A-Za-z0-9_]{40,}/u.test(contents), `Credential in ${path}`)
    if (!path.endsWith('.md') || (!path.startsWith(directory) && !catalogSkillDocs.includes(path))) continue
    for (const [, target] of contents.matchAll(/\]\(([^)]+)\)/gu)) {
      if (target.startsWith('#') || URL.canParse(target)) continue
      const linked = resolve(dirname(path), decodeURIComponent(target.split('#')[0]))
      assert.ok(within(linked), `Reference escapes the standalone repository: ${target}`)
      await stat(linked)
    }
  }
  for (const path of [
    'LICENSE',
    'skills/_shared/docs/touying/LICENSE',
    'skills/_shared/docs/typst/LICENSE'
  ]) assert.ok((await stat(resolve(root, path))).isFile(), `Missing retained license: ${path}`)
})
