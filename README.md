# Imitation AI agent plugins

Macrosona Memory brings your long-term memory to Codex and Claude. Both plugins use one secure OAuth connection to search memory and save notes you explicitly approve.

## Connect with one prompt

Paste the matching prompt into a new Codex or Claude conversation. The agent will add or refresh the marketplace, install the plugin and start OAuth. You only need to approve the Macrosona sign-in when it opens.

### Codex

> Install or update Macrosona Memory for Codex. Use the Imitation AI plugin marketplace at https://github.com/imitation-ai/agent_plugins.git. Add the marketplace if it is missing, or refresh it if it already exists, then install macrosona-capture-codex@imitation-ai. Start the plugin's OAuth connection and pause while I approve access in Macrosona. After approval, verify that the single Macrosona connection exposes both search_memory and capture_note. Do not ask for, copy, or print any access token. If an older duplicate Macrosona plugin is installed, keep it until the new connection passes both checks, then disable the duplicate. If a new chat is required to load the plugin, tell me clearly and give me the exact final step.

### Claude

> Install or update Macrosona Memory for Claude. Use the Imitation AI plugin marketplace at https://github.com/imitation-ai/agent_plugins.git. Add the marketplace if it is missing, or refresh it if it already exists, then install macrosona-capture-claude@imitation-ai. Start the plugin's OAuth connection and pause while I approve access in Macrosona. After approval, verify that the single Macrosona connection exposes both search_memory and capture_note. Do not ask for, copy, or print any access token. If an older duplicate Macrosona plugin is installed, keep it until the new connection passes both checks, then disable the duplicate. If a new chat is required to load the plugin, tell me clearly and give me the exact final step.

## Manual fallback

Install **Macrosona Memory** from the Imitation AI marketplace in your app, select **Connect**, then sign in to Macrosona and approve access. That single connection enables both search and approved-note capture. The plugin includes the memory instructions; there is nothing to paste into your settings.

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

In the Claude desktop app, add the marketplace in **Settings → Plugins**, install **Macrosona Memory**, and select **Connect**.

## Updating from an older plugin

Update the Imitation AI marketplace and reinstall/update Macrosona Memory. Connect the new **Macrosona** service when prompted. Once it works, remove the old separate Capture and Retrieval connections in your app. Old keys are not required by this plugin; revoke them from Macrosona's existing-access list when no longer used.

## Privacy

OAuth access is limited to your signed-in Macrosona workspace. Searches are read-only. Saving requires an explicit user request; the plugin does not silently capture conversations. Disconnect access in your app or Macrosona.

## Hosted connection

Both plugins use `https://api.dev.macrosona.com/plugin/mcp`. This OAuth-only endpoint exposes memory retrieval and approved-note capture through one connection. Deploy the endpoint and its gateway route before releasing these plugin versions.

## Repository layout

- `.agents/plugins/marketplace.json`: Codex marketplace
- `.claude-plugin/marketplace.json`: Claude marketplace
- `plugins/macrosona-capture-codex`: Codex package
- `plugins/macrosona-capture-claude`: Claude package
