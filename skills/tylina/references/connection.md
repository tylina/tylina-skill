# Connecting to Tylina

This Skill uses the command-capable Tylina SDK and a live editor endpoint. A normal static Web tab
does not automatically expose a local HTTP endpoint. DSH's Tylina integration can grant one from its
MCP connection control. Standalone local workspace launch is still being developed.

The CLI/stdio gateway is currently a development capability, not part of published SDK 0.4.2.
Check the installed SDK and `tylina --help`; do not repeatedly reinstall an incompatible published
version. The repository README tracks release availability.

## MCP

When the Agent already has the `tylina` tool, call it directly. Otherwise use the connection supplied
by the editor as Streamable HTTP, or configure a local stdio server with executable `tylina` and args
`["mcp"]`. Supply `TYLINA_MCP_URL` and `TYLINA_MCP_TOKEN` through the client's protected process
environment. Never put real tokens in a Skill, prompt, project file or command argument.

The bridge forwards the live editor's gateway, instructions, structured results and images. It does
not start a second model or own a separate document. Closing the bridge leaves the editor open.
An expired endpoint requires an explicitly granted new connection; it cannot be repaired by picking
a different running editor automatically.

## CLI

With the connection environment already supplied:

```sh
tylina help
tylina editor.state
tylina help --args '{"command":"file.edit"}'
tylina file.read --args '{"file":"main.typ"}'
tylina document.validate
```

Pass a JSON object using `--args` or explicit `--stdin`. Stdout is one JSON tool receipt, including
`content`, optional `structuredContent`, and `isError`. Exit codes are 0 for success, 1 for command or
connection failure, 2 for invalid CLI input, and 130 for a cancelled one-shot command.
Treat command failure as a result to resolve, not a request to fall back to blind disk writes.

## SDK scripts

Reuse one authenticated connection when composing operations in JavaScript:

```js
import { connectTylinaCommands } from 'tylina-sdk/commands'

const connection = await connectTylinaCommands({
  url: process.env.TYLINA_MCP_URL,
  headers: process.env.TYLINA_MCP_TOKEN
    ? { Authorization: `Bearer ${process.env.TYLINA_MCP_TOKEN}` } : undefined,
})
try {
  const state = await connection.query('editor.state')
  const validation = await connection.query('document.validate')
  console.log(JSON.stringify({ state, validation }))
} finally {
  await connection.close()
}
```

`query` returns structured data and throws on tool failure. `execute` preserves the complete receipt,
including image blocks. CLI/SDK image data is base64: decode it into a local image artifact and inspect
that artifact with the Agent's image viewer when needed; do not dump it into a text conversation.
MCP clients with image support can inspect image blocks directly. Do not claim visual verification
when the current Agent cannot view the returned image.

Ordinary JS variables, loops and functions can compose calls. This does not authorize arbitrary
JavaScript execution inside the editor or grant access to browser credentials, DOM or host files.
