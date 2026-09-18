import { spawn } from 'node:child_process'

export const typst = process.env.TYPST_BIN || 'typst'

export function typstEnvironment(environment = process.env) {
  return {
    ...environment,
    // Release examples must not pass only because one runner happens to
    // have a preferred font installed. Audit host fonts outside this release gate.
    TYPST_IGNORE_SYSTEM_FONTS: 'true'
  }
}

export function typstWarnings(stderr) {
  const messages = [...stderr.matchAll(/^warning: (.+)$/gmu)].map((match) => match[1])
  const diagnostics = [...stderr.matchAll(
    /^warning: (.+)\n\s*┌─ (.+):\d+:\d+$/gmu
  )].map((match) => ({ message: match[1], source: match[2].replaceAll('\\', '/') }))
  return { messages, diagnostics }
}

export function runTypst(args, cwd) {
  return new Promise((resolvePromise, reject) => {
    const child = spawn(typst, args, {
      cwd,
      env: typstEnvironment(),
      stdio: ['ignore', 'ignore', 'pipe']
    })
    let stderr = ''
    child.stderr.setEncoding('utf8')
    child.stderr.on('data', (chunk) => { stderr += chunk })
    child.once('error', reject)
    child.once('exit', (code, signal) => {
      if (code === 0) resolvePromise(stderr)
      else reject(new Error(stderr.trim() || `${typst} exited with ${code ?? signal}`))
    })
  })
}
