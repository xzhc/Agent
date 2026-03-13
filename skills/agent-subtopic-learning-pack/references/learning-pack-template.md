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
  01-...
  02-...

notes/<topic>/
  README.md
  study-notes.md

projects/<topic>/
  README.md
  project-01-.../
    README.md
  project-02-.../
    README.md

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

If labs are deferred, the lab root README should still explain what will be added later and how labs map to lectures.

## Notes expectations

The notes area should capture reusable understanding, not chat history.

The study notes file should usually include:

- Lecture understanding
- Lab records
- Error patterns
- Debugging paths
- Codex collaboration notes
- Project readiness checks

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

## Review expectations

Review templates should help the learner identify root causes and the next most important gap.
