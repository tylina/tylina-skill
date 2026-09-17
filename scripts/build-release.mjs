import { createHash } from 'node:crypto'
import { lstat, mkdir, readFile, readdir, writeFile } from 'node:fs/promises'
import { dirname, join, relative, resolve, sep } from 'node:path'
import { fileURLToPath } from 'node:url'

import { zipSync } from 'fflate'

const root = fileURLToPath(new URL('../', import.meta.url))
const { output, previousIndexPath } = parseArguments(process.argv.slice(2))
const catalog = JSON.parse(await readFile(join(root, 'skills/catalog.json'), 'utf8'))
const collection = catalog.collection

if (!collection || typeof collection.version !== 'string' ||
  typeof collection.minimumTylinaVersion !== 'string') {
  throw new Error('skills/catalog.json must declare the collection version and minimum Tylina version')
}

const packageMetadata = JSON.parse(await readFile(join(root, 'package.json'), 'utf8'))
if (packageMetadata.version !== collection.version) {
  throw new Error('package.json and skills/catalog.json must use the same collection version')
}

const files = Object.create(null)
for (const path of await listFiles(join(root, 'skills'))) {
  const archivePath = relative(root, path).split(sep).join('/')
  files[archivePath] = await readFile(path)
}
files.LICENSE = await readFile(join(root, 'LICENSE'))

const archiveBytes = zipSync(files, {
  level: 9,
  mtime: new Date(1980, 0, 1)
})
const archiveName = `tylina-skill-${collection.version}.zip`
const archiveUrl = `https://github.com/tylina/tylina-skill/releases/download/v${collection.version}/${archiveName}`
const release = {
  version: collection.version,
  minimumTylinaVersion: collection.minimumTylinaVersion,
  archive: {
    url: archiveUrl,
    bytes: archiveBytes.byteLength,
    sha256: createHash('sha256').update(archiveBytes).digest('hex')
  }
}
const previousReleases = previousIndexPath
  ? readPreviousReleases(JSON.parse(await readFile(previousIndexPath, 'utf8')))
  : []
const manifest = {
  schemaVersion: 1,
  channel: 'stable',
  releases: mergeCompatibilityReleases([...previousReleases, release])
}

await mkdir(output, { recursive: true })
await Promise.all([
  writeFile(join(output, archiveName), archiveBytes),
  writeFile(
    join(output, 'tylina-skill-release.json'),
    `${JSON.stringify(manifest, null, 2)}\n`
  )
])
process.stdout.write(
  `Built ${archiveName} (${archiveBytes.byteLength} bytes) for Tylina >= ${collection.minimumTylinaVersion}\n`
)

async function listFiles(directory) {
  const found = []
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    const path = join(directory, entry.name)
    const metadata = await lstat(path)
    if (metadata.isSymbolicLink()) throw new Error(`Release content cannot contain a symbolic link: ${path}`)
    if (metadata.isDirectory()) found.push(...await listFiles(path))
    else if (metadata.isFile()) found.push(path)
    else throw new Error(`Release content is not a regular file: ${path}`)
  }
  return found.sort((left, right) => left.localeCompare(right, 'en'))
}

function parseArguments(args) {
  let output = join(root, 'dist')
  let outputSeen = false
  let previousIndexPath
  for (let index = 0; index < args.length; index += 1) {
    const argument = args[index]
    if (argument === '--previous-index') {
      const value = args[index += 1]
      if (!value || previousIndexPath) throw new Error('Expected one --previous-index path')
      previousIndexPath = resolve(value)
    } else if (!argument.startsWith('-') && !outputSeen) {
      output = resolve(argument)
      outputSeen = true
    } else {
      throw new Error(`Unknown release builder argument: ${argument}`)
    }
  }
  return { output, previousIndexPath }
}

function readPreviousReleases(value) {
  if (!value || typeof value !== 'object' || value.schemaVersion !== 1 ||
    value.channel !== 'stable' || !Array.isArray(value.releases) ||
    value.releases.length < 1 || value.releases.length > 64) {
    throw new Error('Previous release index is invalid')
  }
  return value.releases.map(normalizeRelease)
}

function normalizeRelease(value) {
  if (!value || typeof value !== 'object' ||
    !stableVersion(value.version) || !stableVersion(value.minimumTylinaVersion) ||
    !value.archive || typeof value.archive !== 'object' ||
    !Number.isSafeInteger(value.archive.bytes) || value.archive.bytes < 1 ||
    typeof value.archive.sha256 !== 'string' ||
    !/^[a-f0-9]{64}$/u.test(value.archive.sha256)) {
    throw new Error('Release index contains an invalid collection')
  }
  const expected = `https://github.com/tylina/tylina-skill/releases/download/v${value.version}/tylina-skill-${value.version}.zip`
  if (value.archive.url !== expected) {
    throw new Error('Release index contains an invalid archive URL')
  }
  return {
    version: value.version,
    minimumTylinaVersion: value.minimumTylinaVersion,
    archive: {
      url: value.archive.url,
      bytes: value.archive.bytes,
      sha256: value.archive.sha256
    }
  }
}

function mergeCompatibilityReleases(releases) {
  const byMinimumVersion = new Map()
  for (const candidate of releases.map(normalizeRelease)) {
    const current = byMinimumVersion.get(candidate.minimumTylinaVersion)
    if (!current || compareVersion(candidate.version, current.version) > 0) {
      byMinimumVersion.set(candidate.minimumTylinaVersion, candidate)
    }
  }
  return [...byMinimumVersion.values()]
    .sort((left, right) => compareVersion(right.version, left.version))
}

function stableVersion(value) {
  return typeof value === 'string' &&
    /^(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)\.(?:0|[1-9]\d*)$/u.test(value)
}

function compareVersion(left, right) {
  const leftParts = left.split('.').map(Number)
  const rightParts = right.split('.').map(Number)
  for (let index = 0; index < 3; index += 1) {
    if (leftParts[index] !== rightParts[index]) {
      return leftParts[index] - rightParts[index]
    }
  }
  return 0
}
