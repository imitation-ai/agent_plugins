# Connect and verify Macrosona

Install Macrosona from the host’s Plugins directory in the intended ChatGPT or Codex account and workspace. If installed, open its existing connection rather than adding a duplicate.

Select Connect and sign in to Macrosona. Authorise memory retrieval and approved-note capture. An organisation administrator may need to enable the plugin. If the user has no Macrosona account or workspace access, explain that prerequisite and link to the [support page](https://www.macrosona.com/support). Do not initiate an upgrade or payment.

The plugin connects to `https://mcp.macrosona.com/plugin/mcp` using OAuth. Do not request or copy passwords, access tokens or API keys into the conversation, and do not substitute a development endpoint or local token configuration.

Start a new conversation in the interface the user intends to use. Confirm that `search_memory` and `capture_note` are available, then run a read-only search the user requests. An empty search can be valid for a new workspace. Tool discovery verifies note-tool availability; a saved test note requires the user’s explicit request.

When checking ChatGPT Chat, Work or Codex separately, report only the interfaces actually exercised. If tools remain missing after sign-in, identify the pending host connection or workspace permission and link to support. Do not assert all-interface readiness from a consent receipt.

A queued note is not yet ingested or searchable. Follow the memory skill’s processing guidance. Disconnect the plugin through the host or the Macrosona workspace when requested. Disconnection revokes access and does not delete saved memory.
