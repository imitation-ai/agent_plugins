# Set up Macrosona

The plugin is named **Macrosona**. If an existing installation still shows **Macrosona Capture** or **Macrosona Memory**, refresh its marketplace and update the plugin. The installation commands and existing connections stay the same.

Use this guide to install, update or repair Macrosona in Chat, Work/Cowork and Coding. Complete the steps available to your tools and give exact user steps for account installation or consent that you cannot complete yourself.

## Choose the source and installation method

Detect the current host before running commands. Use one local installation method per environment. Prefer the native plugin so both skills and the remote MCP connector are installed together; installing a skill alone does not connect Macrosona.

If the user or this guide supplies a development archive, marketplace or version, use it instead of the default repository. Download the marketplace ZIP and extract it to a new directory. The marketplace root is the folder containing `.agents/plugins/marketplace.json` and `.claude-plugin/marketplace.json`; read its `name` to choose the installation suffix. The development name is `imitation-ai-dev`. Resolve relative download links against the address from which you read this guide.

Check existing installations first. Add a marketplace only if missing; refresh an existing marketplace before updating the plugin. Keep a previous working connection until the replacement is verified in the interfaces using it. Do not remove a legacy automatic-capture hook just because approved-note OAuth works.

### Claude Code

For the default repository, run in the terminal:

```sh
claude plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
claude plugin install macrosona-capture-claude@imitation-ai
```

For the development archive, run from the directory containing the extracted folder:

```sh
claude plugin marketplace add ./imitation-ai-dev
claude plugin install macrosona-capture-claude@imitation-ai-dev
```

Refresh an existing source with `claude plugin marketplace update MARKETPLACE_NAME`, then update the installed plugin through the host. In a Claude Code session the equivalent commands are `/plugin marketplace add ...` and `/plugin install ...`. Use the terminal or session method, not both. Check `/mcp` for the Macrosona connection, complete OAuth if requested, then restart or run `/reload-plugins`.

### Codex

For the default repository, run:

```sh
codex plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
codex plugin add macrosona-capture-codex@imitation-ai
```

For the development archive, run from the directory containing the extracted folder:

```sh
codex plugin marketplace add ./imitation-ai-dev
codex plugin add macrosona-capture-codex@imitation-ai-dev
```

Refresh an existing source with `codex plugin marketplace upgrade MARKETPLACE_NAME`. If the CLI is absent or unusable, use the desktop app's plugin-management tools or give the user the exact desktop installation step. Do not also install a separate skills-only copy. Start a new task if needed to load the plugin. Select Connect, or use `codex mcp login macrosona` when that server is listed by the CLI.

## Complete account-level access

A local coding install or a plugin appearing in a picker does not establish access in another interface. Use the same intended account, organisation and Macrosona workspace throughout.

### Claude Chat and Cowork

In Claude web or Desktop, open **Customize → Plugins**. For a development test, use **Add → Upload plugin** with the supplied individual Claude plugin ZIP. For the published repository, use **Add → Add marketplace**, add the repository above, then install Macrosona. If repository installation is unavailable, upload the matching plugin ZIP instead. An upload must contain the plugin's `.claude-plugin/plugin.json`, `.mcp.json` and `skills/` together.

Open the plugin's **Connectors** tab. Add Macrosona if it is Not added, and Connect if it is Not connected. A managed organisation's owner may need to add the connector before the user signs in; report that step instead of changing organisation policy.

Start new Chat and Cowork tasks. Account-installed plugins sync one-way into Claude Code signed in to the same Claude account and organisation on supported versions. Restart Code or run `/reload-plugins`; if needed, sign in again with `/login`. API-key or cloud-provider sign-in does not perform account plugin sync, which can also be disabled by `syncClaudeAiPlugins`. Local Code installation does not sync back to the Claude account. Check which copy is loaded and avoid retaining duplicate skill copies for the same workflow.

### ChatGPT Chat and Work

Open **ChatGPT Plugins** in the same account and workspace as Codex. Enable the requested Macrosona package if the local marketplace is exposed there. If its hosted connection is missing, use **+ → Add custom MCP server**, enter the release's HTTPS MCP endpoint, select OAuth and complete Macrosona sign-in. Create the personal plugin if the host asks.

If the local marketplace cannot be used in Chat or Work, use the host's plugin creator to combine the memory and setup skills from the requested Codex plugin ZIP with the registered hosted connector. Use the actual `plugin_asdk_app...` ID returned by registration if a mapping is needed. Never invent an account ID or publish a user's ID in the shared package. Start new Chat and Work conversations with the plugin selected, then verify each.

The Codex IDE extension currently does not support plugins. Direct the user to Codex desktop or CLI for plugin installation instead of promising availability there.

## OAuth and verification

Use the release's public HTTPS endpoint from its MCP configuration. The default is `https://mcp.macrosona.com/plugin/mcp`. Use OAuth for each host that requires its own sign-in; the user approves memory search and approved-note capture. Never ask for, print or copy access tokens, move credentials between hosts, or substitute localhost servers or legacy environment tokens.

In each intended interface, discover `search_memory` and `capture_note`, then run a read-only search. Tool discovery verifies capture availability; writing a test note requires an explicit request for that note. A successful empty search is valid for a new workspace. On legacy wiki workspaces, omit typed-memory and scope filters. Use the `macrosona-memory` skill for normal retrieval and guidance about information awaiting ingestion or processing.

Report each interface as verified, awaiting user action, unavailable or untested, with exact remaining steps. One OAuth receipt or a website badge does not prove that every host can use the tools.

These OAuth packages provide memory retrieval and explicit approved-note capture. They contain no automatic-capture hooks. Ordinary Chat and cloud-orchestrated ChatGPT Work do not run local coding hooks; describe automatic capture only when the installed package and runtime support it.

For changes in host behaviour, consult [OpenAI plugin packaging](https://developers.openai.com/plugins/build/plugins), [OpenAI supported interfaces](https://learn.chatgpt.com/docs/plugins), [Claude account plugins](https://claude.com/docs/plugins/overview) and [Claude plugin structure](https://claude.com/docs/plugins/build).
