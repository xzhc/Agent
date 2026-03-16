---
name: learning-code-review-sync
description: Review code in this staged Agent Engineer learning repo and sync the review back into the matching learning artifact. Use when the user asks to review lab code against a lab guide, inspect a stage implementation, or review project code and wants findings, fix suggestions, and note or review updates. Especially useful for paths like `labs/topic-name/code/...`, `labs/topic-name/docs/...`, and future `projects/topic-name/...` review requests where the analysis should also be written into `notes/` or `reviews/`.
---

# Learning Code Review Sync

Review the code first, then sync the stable conclusions into the matching note or review file.

## Default workflow

1. Identify the review target.
   Common inputs:
   - lab code under `labs/<topic>/code/...`
   - lab guide under `labs/<topic>/docs/...`
   - project code under `projects/<topic>/...`
   - a combination of code file plus the corresponding lab/project doc

2. Read the minimum context needed.
   Always prefer the smallest set that lets you judge correctness:
   - the code files under review
   - the matching lab doc or project doc
   - the destination note or review file that will be updated
   - `AGENT.md` only when the task touches `labs/`, `notes/`, `projects/`, or `reviews/`

3. Review in code-review mode.
   Prioritize:
   - bugs
   - requirement mismatches
   - behavioural regressions
   - risky structure or coupling
   - missing validation or tests when relevant

4. Sync the review into the matching learning artifact.
   Do this by default unless the user explicitly says not to edit files.

5. Answer in chat with findings first, then open questions or assumptions, then a brief change summary or fix direction.

## Mapping rules

### Lab review -> stage notes

For lab review requests, sync into the stage note under `notes/<topic>/docs/`.

Mapping process:

1. Identify the topic directory and stage number `<nn>`.
2. If the source path is `labs/<topic>/docs/<nn>-...md`, use stage `<nn>` directly.
3. If the source path is `labs/<topic>/code/<nn>-.../`, use the code directory's numeric prefix as the stage number.
4. Find the note file in `notes/<topic>/docs/` with the same stage number.
5. If the note file does not exist, create it using the topic's current note pattern.

Examples:

- `labs/00-python-for-agent-engineer/code/04-modules-and-types/...`
  -> `notes/00-python-for-agent-engineer/docs/04-modules-and-types.md`
- `labs/00-python-for-agent-engineer/docs/02-build-a-small-router.md`
  -> `notes/00-python-for-agent-engineer/docs/02-control-flow-and-functions.md`

### Project review -> reviews

For project review requests, sync into `reviews/<topic>/`.

Preferred order:

1. Reuse an existing review file that already matches the project slug or explicitly mentions that project.
2. Otherwise create a dated review file under `reviews/<topic>/` named:
   `YYYY-MM-DD-<project-slug>-code-review.md`
3. If the project mapping is genuinely unclear after reading `projects/<topic>/README.md` and `reviews/<topic>/README.md`, ask a short clarifying question.

## Review writing rules

When updating notes or reviews:

- keep the addition local to the current lab stage or project
- prefer a short subsection such as `## Code Review`, `## Review 记录`, or `## 本次代码审查`
- capture both:
  - the main findings
  - the proposed fix direction
- do not paste a giant diff dump into the note
- do not copy long passages from the lab/project doc

For stage notes, prefer writing under:

- `## Lab 记录`
- `## 易错点和排查顺序`
- or a short new `## Code Review`

For project reviews, prefer sections such as:

- `## 这次做成了什么`
- `## 最大问题在哪里`
- `## 根因是什么`
- `## 如果重做一次`

## Output format expectations

In chat:

1. List findings first, ordered by severity, with file/line references.
2. Then list open questions or assumptions if any.
3. Then give a short summary of the recommended fix path.

If no findings are found:

- say that explicitly
- mention any residual risk or testing gap

## Editing boundaries

Do not modify files when:

- the user explicitly says `only review` or `do not edit files`
- the review target is ambiguous and cannot be safely mapped after minimal inspection

If the user asks for the fixes as well as the review:

- perform the review first
- report findings
- then implement fixes if requested
- keep the synced note/review focused on the review conclusions, not a full edit log
