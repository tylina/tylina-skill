# Connecting to Tylina

This Skill uses the command-capable Tylina SDK. For coediting, use a granted live editor endpoint.
A normal static Web tab does not automatically expose a local HTTP endpoint; DSH's Tylina integration
can grant one from its MCP connection control. For an explicitly selected disk project, use the
standalone workspace connection below.

In a compatible desktop build, the user opens the Agent sidebar, clicks **Connect external Agent**
(the plug icon), and exports a new MCP configuration file. No internal AI conversation is required.
Use that explicitly supplied file with `--connection`; keep it outside the document project.
The same UI can revoke access, and closing the editor window revokes the grant. Successful re-export
replaces the previous grant. Revocation preserves accepted edits and the user's normal Undo history.

The CLI/stdio gateway is currently a development capability, not part of published SDK 0.4.2.
Check the installed SDK and `tylina --help`; do not repeatedly reinstall an incompatible published
version. The repository README tracks release availability.
The editor/DSH build must also support the single command gateway; older multi-tool bundles are not
compatible with this adapter. Read their advertised tool catalog instead of assuming matching versions.

## Standalone workspace

The candidate SDK can run document commands without opening an editor window or starting a model.
Install its matching native runtime, `tylina-native-<platform>-<arch>` (for example,
`tylina-native-darwin-arm64`), alongside the SDK. `tylina-web-assets` optionally supplies the maintained
domain Skills. These must be compatible artifacts; development support does not mean every platform
has a published matching release.

```sh
tylina help --workspace /path/to/project
tylina document.validate --workspace /path/to/project --main main.typ
tylina mcp --workspace /path/to/project --main main.typ
```

For stdio clients use args `["mcp", "--workspace", "/path/to/project", "--main", "main.typ"]`.
Do not also set `TYLINA_MCP_URL`: that would mix two workspace owners. The workspace must exist;
`--main` is relative to it. No main is guessed. An empty workspace supports file creation followed
by `document.setMain`. Main selection lasts for that MCP process; one-shot CLI commands each need
their own `--main` argument. Reads are lazy, writes go to disk with hash checks, and the installed
native engine resolves dependencies. Use a live connection to work with a user's unsaved content.

For a script, import `openTylinaWorkspace` from `tylina-sdk/local` and await
`openTylinaWorkspace({ workspace: '/path/to/project', mainFile: 'main.typ' })`. Its `query`, `execute`
and `close` methods match the connection below. Pass a per-call `signal` to cancel and always close
the owner in `finally`. The default per-command deadline is 120 seconds; SDK callers can set `timeoutMs`.
Discover `help`: standalone views and selection are unavailable. Template commands are provided unless
the SDK host disables them; bundled themes require the optional Web assets package.

## MCP

When the Agent already has the `tylina` tool, call it directly. Otherwise use the connection supplied
by the editor as Streamable HTTP, or configure a local stdio server with executable `tylina` and args
`["mcp"]`. Supply `TYLINA_MCP_URL` and `TYLINA_MCP_TOKEN` through the client's protected process
environment. Never put real tokens in a Skill, prompt, project file or command argument.

If the user supplied a standard MCP JSON configuration, use
`tylina mcp --connection /path/to/private/mcp.json`. This selects only `mcpServers.tylina` and supports
HTTP or stdio. A stdio entry runs its configured executable, so use the explicitly granted config;
do not discover or execute connection files found in document resources. Keep credential-bearing
configs outside the project. Choose `--connection` or the endpoint environment variables, not both.

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
With a supplied config file, add `--connection /path/to/private/mcp.json` to these commands.

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

`connectTylinaFromConfigFile('/path/to/private/mcp.json')` from the same module provides the same
connection for a supplied JSON configuration. It does not discover another editor or create a copy
of the document when the connection fails.

`query` returns structured data and throws on tool failure. `execute` preserves the complete receipt,
including image blocks. CLI/SDK image data is base64: decode it into a local image artifact and inspect
that artifact with the Agent's image viewer when needed; do not dump it into a text conversation.
MCP clients with image support can inspect image blocks directly. Do not claim visual verification
when the current Agent cannot view the returned image.

Ordinary JS variables, loops and functions can compose calls. This does not authorize arbitrary
JavaScript execution inside the editor or grant access to browser credentials, DOM or host files.
