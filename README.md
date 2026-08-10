# Imitation AI agent plugins

This repository is the public Imitation AI plugin marketplace for Codex and Claude. It lets users install Macrosona Memory from Git without downloading and running a separate platform-specific installer.

## Macrosona Memory

Macrosona gives supported AI clients two separated capabilities:

- read-only retrieval from the user's Macrosona;
- write-only capture of concise notes the user explicitly approves.

The public marketplace package does not silently capture every conversation turn. This keeps installation cross-platform and avoids a Python or macOS dependency.

## Before installation

In Macrosona, open **Connections**, create a connection for the client, and keep both one-time keys available:

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

## Install in Claude Code

Inside Claude Code, add the marketplace and install the plugin:

```text
/plugin marketplace add imitation-ai/agent_plugins
/plugin install macrosona-capture-claude@imitation-ai
```

Set the two keys in the environment before starting a new Claude Code session.

macOS or Linux:

```shell
export MACROSONA_CAPTURE_TOKEN="your-capture-key"
export MACROSONA_MCP_TOKEN="your-retrieval-key"
claude
```

Windows PowerShell:

```powershell
$env:MACROSONA_CAPTURE_TOKEN = "your-capture-key"
$env:MACROSONA_MCP_TOKEN = "your-retrieval-key"
claude
```

## Add the Macrosona instructions

After installation, copy [SYSTEM_MESSAGE.md](./SYSTEM_MESSAGE.md) into the client's personal or custom instructions. This tells the AI when to search Macrosona and when it is permitted to save a note.

## Hosted connections

The plugins connect to these hosted Streamable HTTP MCP services:

- capture: `https://api.dev.macrosona.com/capture/mcp`
- retrieval: `https://api.dev.macrosona.com/retrieval/mcp`

The capture token is write-only and the retrieval token is read-only. Both are scoped to the user's Macrosona workspace.

## Repository layout

- `.agents/plugins/marketplace.json`: Codex marketplace
- `.claude-plugin/marketplace.json`: Claude marketplace
- `plugins/macrosona-capture-codex`: Codex package
- `plugins/macrosona-capture-claude`: Claude package
- `SYSTEM_MESSAGE.md`: shared AI usage instructions
