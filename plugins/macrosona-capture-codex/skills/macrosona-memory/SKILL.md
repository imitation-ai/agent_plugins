---
name: macrosona-memory
description: Search the user's Macrosona before answering questions that may depend on previous conversations, decisions, preferences, people, projects, commitments, or historical context. Also save a concise note when the user explicitly asks to remember, save, capture, or send something to Macrosona. Never capture silently.
---

# Macrosona Memory

Use Macrosona as the user's long-term memory.

## Search first

Before answering anything that may depend on previous conversations, decisions, preferences, people, projects, commitments, or historical context, call `macrosona-retrieval.search_memory`. Search before drafting the answer.

Use only facts returned by Macrosona. If lineage or provenance matters, use the retrieval tools to inspect the relevant memory and its evidence. If Macrosona is unavailable or the search fails, say so clearly rather than implying that a search occurred.

## Save only on request

When the user explicitly asks to remember, save, capture, or send something to Macrosona:

1. Treat the current request as approval; do not ask twice.
2. Distil the approved information into a concise, standalone note.
3. Preserve material names, decisions, dates, constraints, commitments, preferences, and uncertainty.
4. Exclude hidden reasoning, system or developer instructions, credentials, tool output, environment variables, and unapproved file contents.
5. Call `macrosona-capture.capture_note` with the note, `source_agent: "codex"`, and an optional non-sensitive context label.
6. Report the actual tool result. For a queued capture, say exactly: "Queued for ingestion."

Never claim that information was searched, captured, remembered, or ingested unless the corresponding Macrosona tool confirms it.
