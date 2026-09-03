# Imitation AI™ agent plugins

This repository is the public Imitation AI plugin marketplace for Codex and Claude. It lets users install Macrosona Memory from Git without downloading and running a separate platform-specific installer.

## Macrosona™ Memory

Macrosona™ gives supported AI clients two separated capabilities:

- read-only retrieval from the user's Macrosona™;
- write-only capture of concise notes the user explicitly approves.

The public marketplace package does not silently capture every conversation turn. This keeps installation cross-platform and avoids a Python or macOS dependency.

## Before installation

Claude now connects through Macrosona's browser sign-in. You do not need to create, copy, or store API keys for Claude.

Codex and manual token-based integrations continue to use the existing PAT flow. In Macrosona™, open **Connections**, create a connection for the client, and keep both one-time keys available:

- capture key: `MACROSONA_CAPTURE_TOKEN`
- retrieval key: `MACROSONA_MCP_TOKEN`

Never commit either key to this or another Git repository.

## Install in Codex

Add the marketplace directly from Git, then install the plugin:

```shell
codex plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
codex plugin add macrosona-capture-codex@imitation-ai
```

When Codex asks for authentication, use the capture key for `MACROSONA_CAPTURE_TOKEN` and the retrieval key for `MACROSONA_MCP_TOKEN`. Start a new Codex task after installation so its tools and instructions are loaded.

To receive marketplace updates later:

```shell
codex plugin marketplace upgrade imitation-ai
```

## Install in Claude

Use Claude's manual plugin screens:

1. Open **Settings > Plugins**.
2. Select **Add custom marketplace**, choose the GitHub option, and add `https://github.com/imitation-ai/agent_plugins.git`.
3. Open the Imitation AI marketplace and add **Macrosona Memory**.
4. Select **Connect** for Macrosona Capture and Macrosona Retrieval.
5. Claude opens Macrosona in your browser. Sign in and approve the requested capture and retrieval permissions.

You do not need to create, copy, or store capture or retrieval keys for Claude. Existing PAT-based Codex and manual MCP connections continue to work unchanged.

## Add the Macrosona instructions

After installation, copy [SYSTEM_MESSAGE.md](./SYSTEM_MESSAGE.md) into the client's personal or custom instructions. This tells the AI when to search Macrosona and when it is permitted to save a note.

## Hosted connections

The plugins connect to these hosted Streamable HTTP MCP services:

- capture: `https://api.dev.macrosona.com/capture/mcp`
- retrieval: `https://api.dev.macrosona.com/retrieval/mcp`

OAuth access is scoped to the signed-in user's Macrosona workspace. Capture remains write-only and retrieval remains read-only. PAT authentication remains available for clients that require it.

## Repository layout

- `.agents/plugins/marketplace.json`: Codex marketplace
- `.claude-plugin/marketplace.json`: Claude marketplace
- `plugins/macrosona-capture-codex`: Codex package
- `plugins/macrosona-capture-claude`: Claude package
- `SYSTEM_MESSAGE.md`: shared AI usage instructions
