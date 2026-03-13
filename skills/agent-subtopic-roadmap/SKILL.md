---
name: agent-subtopic-roadmap
description: Create or update a focused standalone learning roadmap for a subtopic in the Agent Engineer learning plan. Use when Codex needs to turn a bullet or theme from `notes/roadmaps/01-agent-engineer-roadmap.md` such as Python basics, Git, tool calling, evals, observability, or RAG into its own Markdown roadmap file under `notes/roadmaps/` that will guide future lecture generation, preserve repo voice, emphasize what matters for becoming an Agent Engineer, and explicitly state what not to cover yet.
---

# Agent Subtopic Roadmap

## Overview

Use this skill to create a child roadmap file under `notes/` for one specific learning subtopic.
Optimize for reusable reference quality, not breadth: define scope, learning order, outputs, and stopping boundaries so later lecture generation stays focused.

## Workflow

### 1. Gather local context first

Read only the files needed to anchor the roadmap:

- `AGENT.md`
- `notes/learning-workflow.md`
- `notes/roadmaps/01-agent-engineer-roadmap.md`
- `notes/README.md`
- Existing sibling roadmap files in `notes/` that match the same pattern, if any

If the subtopic comes from an external resource already stored in the repo, read only the relevant local file sections rather than loading unrelated references.

### 2. Translate the parent topic into an Agent-oriented scope

Before writing, decide these four things explicitly:

- Why this subtopic matters for future `LLM app / RAG / AI Agents / eval / observability` work
- Which capabilities are genuinely high-frequency for an Agent Engineer
- Which adjacent topics should be deferred
- What concrete outputs would prove the topic is learned well enough to move on

Bias toward the minimum useful scope. The roadmap is a boundary-setting tool, not a comprehensive tutorial.

### 3. Create or update the child roadmap file

Default location: `notes/roadmaps/`.

Default naming pattern:

- `notes/roadmaps/<nn>-<subtopic>-for-agent-engineer-roadmap.md` when the topic is singular and skills-oriented
- Choose the next available numeric prefix inside `notes/roadmaps/`
- Keep names lowercase and hyphenated
- Prefer stable topic words over temporary phrasing from the user's prompt

When the user asks to refine an existing child roadmap, update that file instead of creating a new variant.

Use the section template in [references/roadmap-template.md](references/roadmap-template.md).

### 4. Keep the document opinionated and bounded

Every roadmap created with this skill should:

- Serve the goal of becoming an Agent Engineer
- Explicitly say what to prioritize now
- Explicitly say what not to study yet
- Prefer scripts, workflows, debugging, evaluation, interfaces, and system behavior over academic completeness
- Connect the topic to later stages in `notes/roadmaps/01-agent-engineer-roadmap.md`

Avoid generic educational sprawl such as long language histories, full taxonomies, or broad ecosystem surveys unless they directly unblock future Agent work.

### 5. Update navigation after writing

After creating a new child roadmap:

- Replace the relevant bullet in `notes/roadmaps/01-agent-engineer-roadmap.md` with a link when appropriate
- Add a short navigation entry in `notes/README.md` if the file is likely to be reused
- Do not add noisy navigation for one-off drafts

### 6. Validate quality before finishing

Check the quality checklist in [references/quality-checklist.md](references/quality-checklist.md).

At minimum verify:

- The roadmap has a clear target and stopping boundary
- The scope is narrowed for Agent Engineer outcomes
- The file includes concrete completion criteria
- The file points back to the main roadmap by context or linkage
- The text does not drift into "learn everything about X"

## Output Requirements

Include these sections unless the user explicitly asks for a shorter variant:

- `## 目的`
- `## 设计原则`
- `## 学习边界`
- Staged learning sections with `目标 / 学什么 / 为什么重要 / 典型产出 / 完成标志`
- `## 推荐学习顺序`
- `## 每一阶段都应该留下的仓库产出`
- `## 适合这个主题的阶段项目`
- `## 这一主题里的 Codex 协作主线`
- `## 学完这个主题后，你应该具备什么能力`
- `## 判断是否可以进入下一主题`

Use concise Chinese prose that matches the repository's current note style.

## Editing Rules

- Prefer modifying the smallest relevant set of files
- Keep links absolute when following repo conventions already present in `notes/`
- Reuse section patterns from existing roadmap files instead of inventing a new voice each time
- Do not create lecture content, labs, or project code unless the user asks for them separately

## Anti-Patterns

- Turning the roadmap into a full textbook
- Listing advanced topics without explaining why they are deferred
- Copying generic internet learning paths into the repo voice
- Writing a document that cannot be used later as a boundary for lecture generation
- Creating a new child roadmap file when a suitable existing file should be updated
