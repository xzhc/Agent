---
name: learning-repo-git-ops
description: Classify working-tree changes in this staged Agent Engineer learning repo, split them into coherent commits using the repo's learning taxonomy, generate commit messages, and optionally drive the local helper script to stage, commit, and push.
---

# Learning Repo Git Ops

Use this skill when the user wants Codex to help turn the current repo changes into clean commits for this learning repository.

This skill is repo-specific. It is not a generic Git workflow skill.

## What this skill is for

Use it when the user asks to:

- generate commit messages from current changes
- split one working tree into multiple coherent commits
- decide whether a change is repo-system work or learning-content work
- commit changes with the repo helper script
- push the resulting commits to GitHub

## Workflow

### 1. Read the minimum local context

Always read:

- `AGENT.md`
- `notes/learning-workflow.md`
- `notes/README.md`
- [references/commit-taxonomy.md](references/commit-taxonomy.md)

Then inspect the current Git state:

- `git status --short`
- `git diff --stat`
- `git diff --cached --stat` when staged changes may already exist

Read file diffs only for files that are needed to classify the change set.

### 2. Classify the current changes before touching Git

Use the taxonomy in [references/commit-taxonomy.md](references/commit-taxonomy.md).

Default split:

1. `repo-system` changes
   Includes skills, scripts, file organization, repo workflow docs, global README updates, and other repository operating-system work.
2. `learning-content` changes
   Split further into the smallest coherent outcome such as:
   - roadmap
   - learning pack
   - lecture
   - lab
   - notes
   - project
   - review

Prefer multiple small commits over one mixed commit.

If two changes are truly inseparable, choose the dominant outcome and explain that tradeoff in chat before committing.

### 3. Generate commit messages in repo style

Default to concise English Conventional-Commit-style subjects because the existing Git history already uses that pattern.

Use:

- `chore(repo): ...`
- `docs(roadmap): ...`
- `feat(pack): ...`
- `docs(lecture): ...`
- `feat(lab): ...`
- `docs(notes): ...`
- `feat(project): ...`
- `docs(review): ...`

Keep the summary outcome-oriented and specific to the current diff.

### 4. Use the helper script for deterministic execution

For actual execution, prefer:

- `scripts/git_learning_commit.sh`

The helper script is intentionally narrow:

- it requires an explicit file list
- it requires an explicit commit message
- it aborts if unrelated staged changes already exist
- it only pushes when `--push` is explicitly requested

Do not replace this with `git add -A && git commit ... && git push ...`.

### 5. Execution rules

When the user wants a preview only:

- inspect the diff
- propose commit groups
- generate the messages
- do not stage, commit, or push

When the user wants commits but not push:

- run the helper script once per commit group
- omit `--push`

When the user explicitly asks to upload or push:

- verify the remote if needed
- run the helper script with `--push`
- report which commits were pushed

### 6. Safety rules

- Never blindly stage the whole repository.
- Never push unless the user explicitly asks to push, upload, or sync.
- If staged changes already exist, explain that the helper script expects a clean index and either clear the ambiguity first or commit manually with care.
- If a file set mixes repo-system and learning-content work, split it unless the diff is genuinely inseparable.

## Output expectations

When answering in chat, show:

1. the proposed commit groups
2. the message for each group
3. whether you will only plan, commit, or commit and push

After execution, report:

- the commit hashes and subjects you created
- whether push was performed
- any leftover uncommitted files

## Anti-patterns

- Treating this repo like a generic monorepo with one flat commit style
- Mixing skill/script/structure work into the same commit as lecture/lab/note learning updates
- Auto-pushing without an explicit user instruction
- Using a giant script to infer semantic grouping without Codex reviewing the diff
