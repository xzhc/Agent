# AGENTS.md

## Scope

This repository is a staged learning repo for becoming an Agent Engineer.

For deeper repository context, pedagogy, and long-term learning goals, also read [AGENT.md](/Users/xzh/Tech/CS/Agent/AGENT.md) when the task touches `lectures/`, `labs/`, `notes/`, `projects/`, or `reviews/`.

## Default Note Sync Rule

When the user asks to explain, expand, clarify, summarize, or supplement content selected from:

- `lectures/<topic>/...`
- `labs/<topic>/docs/...`

treat that as a request to do both of these by default:

1. answer the question in chat
2. write the explanation into the corresponding stage note under `notes/<topic>/docs/`

Do this without waiting for the user to explicitly repeat "also update the notes", unless the user says not to edit files.

## Stage Mapping

- `lectures/<topic>/<nn>-...md` maps to `notes/<topic>/docs/<nn>-...md` for the same stage
- `labs/<topic>/docs/<nn>-...md` maps to the note file in `notes/<topic>/docs/` with the same numeric prefix
- if the lab filename and note filename differ after the numeric prefix, use the shared stage number to find the right note file
- if the matching note file does not exist yet, create it following the topic's current notes pattern

## Editing Behavior

- Prefer adding the new explanation to the most relevant existing section instead of appending a disconnected dump
- Keep additions concise, stage-local, and consistent with the note style already used in that topic
- Avoid copying long passages from the lecture or lab into the notes
- If the user's request is explicitly "only explain" or "do not modify files", answer without editing
- If the source file or stage mapping is genuinely ambiguous, inspect the topic README and ask only if ambiguity remains

