---
name: stage-note-sync
description: Answer questions about selected text from `lectures/<topic>/...` or `labs/<topic>/docs/...` and, by default, write the explanation into the corresponding stage note under `notes/<topic>/docs/`. Use when the user asks to explain, expand, clarify, summarize, or supplement learning content and does not explicitly forbid file edits.
---

# Stage Note Sync

Use this skill when the user is working inside a staged learning pack and asks about selected content from a lecture or a lab doc.

The default behavior is not just to answer. Also update the corresponding notes file unless the user explicitly says not to modify files.

## Read the minimum context

Read only what is needed:

- the source file the question is about
- the corresponding note file, if it exists
- the topic notes `README.md` when you need help confirming the mapping

Do not load unrelated lectures, labs, or notes unless the mapping is unclear.

## Source patterns

This skill applies to:

- `lectures/<topic>/<nn>-...md`
- `labs/<topic>/docs/<nn>-...md`

It does not apply to project docs, review templates, or global notes unless the user explicitly asks for a similar sync behavior there.

## Mapping rule

1. Identify the topic directory and the stage number `<nn>` from the source file path.
2. Map to `notes/<topic>/docs/`.
3. Find the note file with the same stage number.
4. If the source is a lecture and the note file already matches the lecture filename, use it directly.
5. If the source is a lab doc and the slug differs, use the shared stage number to find the note file.
6. If no note file exists yet, create one that matches the current topic notes pattern.

## Editing rule

When the user asks for explanation, clarification, expansion, examples, or补充:

- answer the question in chat
- add the explanation to the mapped note file

Prefer updating an existing section such as:

- `## Lecture 理解`
- `## Lab 记录`
- `## 易错点和排查顺序`
- another clearly relevant local subsection

If needed, add a short new subsection. Do not dump a long free-form block at the end if a better local insertion point exists.

## Writing style

- Use concise Chinese prose consistent with the repository
- Keep the note focused on the current stage
- Explain mechanisms, failure modes, and practical judgment, not just definitions
- Avoid repeating the lecture text verbatim

## When not to edit

Do not modify files when:

- the user explicitly says to only answer
- the user explicitly says not to update notes
- the request is brainstorming that is clearly not intended as note content

If the mapping is unclear after checking the topic notes README, ask a short clarifying question.

## Completion

Before finishing, verify:

- the answer was given in chat
- the correct note file was updated or created
- the note addition is placed in the most relevant section
- the change stays local to the current stage rather than turning into a topic-wide rewrite

