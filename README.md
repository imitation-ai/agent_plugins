# Imitation AI agent plugins

Macrosona Memory brings your long-term memory to Codex and Claude. Both plugins use one secure OAuth connection to search memory and save notes you explicitly approve.

## Connect

Install **Macrosona Memory** from the Imitation AI marketplace in your app, select **Connect**, then sign in to Macrosona and approve access. That single connection enables both search and approved-note capture. The plugin includes the memory instructions; there is nothing to paste into your settings.

If you have not added the marketplace yet, add this repository in your app's Plugins settings:

`https://github.com/imitation-ai/agent_plugins.git`

For Codex CLI, install with:

```shell
codex plugin marketplace add https://github.com/imitation-ai/agent_plugins.git
codex plugin add macrosona-capture-codex@imitation-ai
```

Start a new task after installation so the plugin instructions are loaded. In Claude, add the marketplace in **Settings → Plugins**, then install **Macrosona Memory** and select **Connect**.

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
