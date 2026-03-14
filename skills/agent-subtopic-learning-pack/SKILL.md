---
name: agent-subtopic-learning-pack
description: Create or update a topic-scoped learning pack for a subtopic in the Agent Engineer learning plan. Use when Codex needs to turn an existing child roadmap in `notes/roadmaps/` into structured learning content across `lectures/`, `labs/`, `notes/`, `projects/`, and `reviews/`, or to incrementally extend one part of an existing learning pack such as lectures first, lab scaffolding later, or project/review templates after deeper study.
---

# Agent Subtopic Learning Pack

## Overview

Use this skill after a child roadmap already exists and the next step is to turn it into executable learning content.
Optimize for staged learning workflow, not generic content generation: the output should fit the repo's `lecture -> lab -> notes -> project -> review` loop and live under topic-scoped folders in each top-level directory.

## Workflow

### 1. Read the minimal context set

Always read:

- `AGENT.md`
- `notes/learning-workflow.md`
- The relevant child roadmap in `notes/roadmaps/`
- `lectures/README.md`
- `labs/README.md`
- `notes/README.md`
- `projects/README.md`
- `reviews/README.md`

Then read only the relevant existing topic pack, if one exists and is a good structural reference.

Use the current Python learning pack as the default reference shape for cross-directory organization.
In that reference shape, labs and projects keep instructions in `docs/` and runnable code in `code/`.
Also preserve the environment policy used by that pack:

- `lab 01` is allowed to use its own temporary `.venv` because environment creation is part of the exercise
- later labs in the same topic should share `labs/<topic>/.venv`
- each project should keep its own `.venv` inside its implementation directory

### 2. Confirm the generation mode from the request

Select a mode using [references/generation-modes.md](references/generation-modes.md).

Default behavior:

- If the user asks for a full learning pack, use `full-pack`
- If the user says labs or projects can wait, use `lecture-first`
- If the user only wants the topic structure prepared, use `skeleton`
- If the user asks to extend one part of an existing pack, use `incremental`

Do not force detailed labs or project content if the user explicitly wants them deferred.

### 3. Translate roadmap stages into learning-pack units

Use the child roadmap as the source of truth for:

- What each stage is trying to teach
- Which stages deserve lectures
- Which stages need corresponding labs now versus later
- When enough capability has accumulated to justify a project
- What should be captured in stage-aligned notes and reviews

The learning pack is the execution layer of the roadmap, not a second roadmap.

### 4. Use the topic-scoped folder structure

Create or update the pack using this layout:

- `lectures/<topic>/`
- `labs/<topic>/`
- `notes/<topic>/`
- `projects/<topic>/`
- `reviews/<topic>/`

Within topic-scoped `labs/` and `projects/` folders, prefer:

- `docs/` for instructions, task cards, and project specs
- `code/` for runnable implementations and scaffolding

When generating lab and project scaffolding, encode the repo's environment convention in the relevant READMEs rather than leaving environment layout implicit.
For notes, prefer numbered files that align with the corresponding lecture/lab pair rather than one topic-wide catch-all notes file.

Use [references/learning-pack-template.md](references/learning-pack-template.md) for the default structure and file expectations.

For topic names, reuse the lecture directory name across all top-level folders unless there is a strong reason not to.

### 5. Keep the pack staged and executable

Every generated pack should answer these questions clearly:

- What should the learner read now?
- What should the learner do immediately after reading?
- What should be written down while learning?
- When is the learner ready for a project?
- What should be reviewed after the project?

Avoid writing static theory that never connects to a lab, project, or review.

### 6. Update navigation after writing

When you create a new topic pack, update the root README in each affected top-level directory so the topic is discoverable:

- `lectures/README.md`
- `labs/README.md`
- `notes/README.md`
- `projects/README.md`
- `reviews/README.md`

Prefer linking to the topic root directory README rather than every child file from the top level.

### 7. Validate before finishing

Check [references/quality-checklist.md](references/quality-checklist.md).

At minimum verify:

- The pack follows the repo's topic-scoped folder convention
- The mode matches the user's requested depth
- Lectures, labs, notes, projects, and reviews fit together as one workflow
- The pack does not duplicate the roadmap's role
- Navigation links are updated only where useful

## Output Rules

- Default to Chinese prose consistent with the existing repository style
- Keep lecture content practical and bounded by the roadmap
- Do not generate runnable code unless the user explicitly asks for code or starter files
- When labs are deferred, create only the minimum scaffolding or references implied by the selected mode
- Reuse stable section patterns from existing learning-pack files instead of inventing new ones per topic

## Anti-Patterns

- Treating the learning pack like a link collection or reading list
- Rewriting the roadmap instead of implementing it
- Generating detailed labs when the user explicitly wants lab content later
- Scattering one topic across top-level directories without a shared topic root
- Creating projects before enough lecture and lab stages have accumulated
