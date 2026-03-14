# Learning Pack Template

Use this structure when generating a new topic-scoped learning pack.

## Topic folder layout

```text
lectures/<topic>/
  README.md
  01-...
  02-...

labs/<topic>/
  README.md
  docs/
    01-...
    02-...
  code/
    01-.../
    02-.../

notes/<topic>/
  README.md
  docs/
    01-...
    02-...

projects/<topic>/
  README.md
  docs/
    project-01-....md
    project-02-....md
  code/
    project-01-.../
    project-02-.../

reviews/<topic>/
  README.md
  <date>-stage-review-template.md
  <date>-project-review-template.md
```

## Required behavior

- Use the same `<topic>` directory name across all five top-level directories
- Give each topic root its own `README.md`
- Make the lecture root README the main orchestration entry for the pack
- Make the other topic root READMEs describe their role in the same pack

## Lecture pack expectations

The lecture root README should include:

- What the pack is for
- Recommended study order
- A mapping from lecture to lab, notes, and project timing
- Completion criteria
- Links to the other parts of the pack

Each lecture file should usually include:

- `本次目标`
- `前置知识`
- `核心概念`
- `最小可运行示例` or the minimum conceptual structure
- `常见错误`
- `思考题或练习`
- `这讲学完后立刻去做`
- `下一步建议`

## Lab pack expectations

If labs are in scope, the lab root README should include:

- Why the lab set exists
- Execution order
- When to enter projects
- Completion criteria
- A short note that lab instructions live in `docs/` and runnable files live in `code/`
- The environment rule: `lab 01` may use its own temporary `.venv`, later labs in the same topic should share `labs/<topic>/.venv`

If labs are deferred, the lab root README should still explain what will be added later and how labs map to lectures.

## Notes expectations

The notes area should capture reusable understanding, not chat history.

Prefer one notes file per lecture/lab stage rather than one monolithic topic-wide notebook.

Each stage note should usually include:

- Lecture understanding
- Lab records
- Error patterns
- Debugging paths
- Codex collaboration notes

The topic notes README should index the numbered note files and explain that the same-numbered lecture and lab share one notes file.

## Project expectations

Projects should appear only after enough lectures and labs justify integration.

Each project README should usually include:

- 项目目标
- 什么时候开始做
- 用户场景
- 架构说明
- 必做能力点
- 运行方法
- 评估方法
- 已知问题
- 后续迭代方向
- 项目完成标志

Project topic roots should also explain that project specs live in `docs/` and implementations live in `code/`.
Each project implementation should keep its own `.venv` instead of sharing the topic lab environment.

## Environment automation expectations

When a pack includes runnable labs or starter code, prefer adding or reusing a small local script that creates the topic-level lab environment.
Do not assume a root-level repo-wide `.venv`.

## Review expectations

Review templates should help the learner identify root causes and the next most important gap.
