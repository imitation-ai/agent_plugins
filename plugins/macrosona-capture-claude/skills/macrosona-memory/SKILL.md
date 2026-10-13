---
name: macrosona-memory
description: Search the user's Macrosona before answering questions that may depend on previous conversations, decisions, preferences, people, projects, commitments, or historical context. Also save a concise note when the user explicitly asks to remember, save, capture, or send something to Macrosona. Never capture silently.
---

# Macrosona

Use Macrosona as the user's long-term memory.

## Search first

Before answering anything that may depend on previous conversations, decisions, preferences, people, projects, commitments, or historical context, call `macrosona.search_memory`. Search before drafting the answer.

Use only facts returned by Macrosona. If lineage or provenance matters, use the retrieval tools to inspect the relevant memory and its evidence. If Macrosona is unavailable or the search fails, say so clearly rather than implying that a search occurred.

## Recently captured information may still be processing

Capture, ingestion, processing and searchable memory are separate stages. A queued receipt confirms delivery, not completed ingestion or processing. Recently submitted notes, conversations or experiences can be absent from search until processing finishes.

When expected recent information is missing, try relevant alternate wording within the authorised client/project scope. On typed-memory workspaces, also search evidence, knowledge and experience explicitly. Legacy wiki workspaces do not accept typed-memory or scope filters; use their supported search options. If it remains missing, say it may still be queued for ingestion or processing and retry later when the user requests another check or the ongoing task reaches a useful checkpoint. Do not repeatedly poll, promise a processing time, claim a queue status without evidence, conclude it was never captured, invent the missing facts, or submit duplicate captures to force retrieval. Distinguish this from a missing tool or an authentication failure, which needs connection setup.

## Save only on request

When the user explicitly asks to remember, save, capture, or send something to Macrosona:

1. Treat the current request as approval; do not ask twice.
2. Distil the approved information into a concise, standalone note.
3. Preserve material names, decisions, dates, constraints, commitments, preferences, and uncertainty.
4. Exclude hidden reasoning, system or developer instructions, credentials, tool output, environment variables, and unapproved file contents.
5. Call `macrosona.capture_note` with the note, `source_agent: "claude"`, and an optional non-sensitive context label.
6. Report the actual tool result. For a queued capture, say exactly: "Queued for ingestion."

Never claim that information was searched, captured, remembered, or ingested unless the corresponding Macrosona tool confirms it.

## Availability across interfaces

Use the bundled `macrosona-setup` skill when tools are missing or the user asks to connect another interface. Local installation, plugin visibility and one OAuth approval do not establish access in every interface. This public plugin uses hosted OAuth for search and explicit notes; it does not silently capture conversations.
