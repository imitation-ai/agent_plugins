# Imitation AI agent plugins

Macrosona brings your long-term memory to ChatGPT Chat, Work and Codex, and Claude Chat, Cowork and Claude Code. Both plugins use one secure OAuth connection with three capabilities: **retrieve** evidence-backed memory, **capture** explicitly approved notes, and **distil** selected knowledge into a standalone wiki and offline skill using the client's file tools.

## Connect with one prompt

Paste this prompt into Claude Code or Codex. It detects the host and uses one native installation method, then follows the shared setup guide for OAuth and access across Chat, Work/Cowork and Coding.

> Install or update Macrosona. Read the setup guide first: https://raw.githubusercontent.com/imitation-ai/agent_plugins/main/SETUP.md. If you're in Claude Code, run `claude plugin marketplace add https://github.com/imitation-ai/agent_plugins.git`, then `claude plugin install macrosona-capture-claude@imitation-ai`. If you're in Codex, run `codex plugin marketplace add https://github.com/imitation-ai/agent_plugins.git`, then `codex plugin add macrosona-capture-codex@imitation-ai`. Use one local installation method. Then follow the macrosona-setup skill to connect OAuth at https://mcp.macrosona.com/plugin/mcp and complete Chat, Work and Coding setup. Verify memory search and approved-note capture, and tell me any remaining user steps. In another environment, follow the guide's account-installation route.

The readable source guide is [SETUP.md](SETUP.md). Both packages bundle that guide with the `macrosona-setup` skill. The development website serves its release-specific copy at `/plugins/setup.md`, alongside the development ZIPs. Detailed account setup and verification belong in the guide; processing-delay behaviour belongs in `macrosona-memory`.

## Manual fallback

For ChatGPT, open Plugins in the same account and workspace, enable Macrosona, and connect its hosted OAuth service. If it is missing, use **+ → Add custom MCP server** with `https://mcp.macrosona.com/plugin/mcp` and OAuth. Keep the memory skills enabled alongside the connection. Check both tools in new Chat and Work conversations as well as a Codex task.

For Claude, install on your account through **Customize → Plugins → Add → Add marketplace**, using the repository below. Open the plugin’s **Connectors** tab, add Macrosona if necessary, and select **Connect**. Account-installed plugins follow you to Chat and Cowork and sync into Claude Code signed into the same account/organisation. Local Code installations do not sync back to the account. Restart Code or run `/reload-plugins`; complete any separate OAuth prompt from `/mcp`.


Install **Macrosona** from the Imitation AI marketplace in your app, select **Connect**, then sign in to Macrosona and approve access. That single connection enables both search and approved-note capture. The plugin includes retrieval, capture and distil instructions; there is nothing to paste into your settings.

Marketplace: `https://github.com/imitation-ai/agent_plugins.git`

For Codex CLI, install with:

```shell
codex plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
codex plugin add macrosona-capture-codex@imitation-ai
```

If the Codex marketplace already exists, run `codex plugin marketplace upgrade imitation-ai` before installing. Start a new task after installation so the plugin instructions are loaded.

For Claude Code, run:

```text
/plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
/plugin install macrosona-capture-claude@imitation-ai
```

These Claude Code commands install locally. For Chat and Cowork, complete the account setup above. If marketplace installation is unavailable on your account, upload the Claude plugin folder as a ZIP through **Customize → Plugins → Add → Upload plugin**, then add/connect its bundled connector.

## Updating from an older plugin

Update the Imitation AI marketplace and reinstall/update Macrosona. Connect the new **Macrosona** service when prompted. Once it works, remove the old separate Capture and Retrieval connections in your app. Old keys are not required by this plugin; revoke them from Macrosona's existing-access list when no longer used.

## Distil a standalone package

Ask: “Create a standalone linked wiki and offline knowledge skill for this project from Macrosona.” The creator investigates relevant memories, compiles files, records coverage and checks, and keeps the recipient package independent of Macrosona. File creation requires a capable host. Current retrieval is best-effort; no exhaustive inventory or server-side export snapshot is claimed. A creation request syncs the finished package privately to the connected creator account unless local-only output is requested. It does not save a memory note, publish or share the package. Owners control versions and revocable download links from the Distilled Brains library. Sync requires distilled:write consent; existing retrieval/capture connections remain supported. Review sharing eligibility before distribution.

## Privacy

OAuth access is limited to your signed-in Macrosona workspace. Searches are read-only. Saving requires an explicit user request; the plugin does not silently capture conversations. Disconnect access in your app or Macrosona.

## Hosted connection

Both plugins use `https://mcp.macrosona.com/plugin/mcp`. This OAuth-only endpoint exposes memory retrieval and approved-note capture through one connection. Deploy the endpoint and its gateway route before releasing these plugin versions.

## Availability and processing

Both packages include `macrosona-retrieve`, `macrosona-capture` and `macrosona-distil`, plus `macrosona-setup` and the compatible `macrosona-memory` entry point. The OpenAI manifest declares the setup skill as onboarding. Portable `mcp.json` declares a remote Streamable HTTP server with OAuth DCR and all three requested scopes; `.mcp.json` is retained for Codex/Claude compatibility. There are no public-package hooks or local credential dependencies.

Verify search and capture-tool availability separately in each interface. Saving a test note requires an explicit request. These packages provide explicit notes, not automatic capture; ordinary Chat and cloud-orchestrated ChatGPT Work do not run local coding hooks. The Codex IDE extension does not currently support plugins.

A capture receipt, ingestion, processing and retrieval are separate stages. Recent experiences may still be queued or processing and therefore absent from search. Try alternate queries and memory kinds within the authorised scope and retry later; do not claim a specific queue status without evidence or create duplicate captures.

References: [OpenAI packaging](https://developers.openai.com/plugins/build/plugins), [ChatGPT interfaces](https://learn.chatgpt.com/docs/plugins), [Claude account plugins](https://claude.com/docs/plugins/overview), [Claude package structure](https://claude.com/docs/plugins/build).

## Repository layout

- `.agents/plugins/marketplace.json`: Codex marketplace
- `.claude-plugin/marketplace.json`: Claude marketplace
- `plugins/macrosona-capture-codex`: Codex package
- `plugins/macrosona-capture-claude`: Claude package
