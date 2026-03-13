# agent-subtopic-roadmap 使用说明

这份说明面向这个仓库的维护者，告诉你怎么使用 `agent-subtopic-roadmap` skill 来快速生成后续各个子主题的学习路线图。

## 这个 skill 是干什么的

它专门用于把 [01-agent-engineer-roadmap.md](/Users/xzh/Tech/CS/Agent/notes/roadmaps/01-agent-engineer-roadmap.md) 里的某个主题拆成独立的子路线图文件。

它的目标不是“自动写一篇泛泛的学习笔记”，而是：

- 为后续讲义生成提供稳定参考
- 提前定义学习边界和取舍
- 保持仓库文风一致
- 让每个子主题都服务于“成为 Agent Engineer”

## 什么时候用

适合这些场景：

- 你准备把主 roadmap 里的某个点单独展开
- 你预计同类子主题以后会持续增加
- 你不想每次都重新写一遍提示词来约束 Codex 的输出结构
- 你希望新文档自动遵循这个仓库已有的写法和导航习惯

不适合这些场景：

- 你只是想临时问一个概念，不需要沉淀文件
- 你要的是讲义、实验代码或项目实现，而不是 roadmap
- 当前主题还没有明确边界，连为什么要学都说不清

## skill 在哪里

仓库内源文件在：

- [SKILL.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/SKILL.md)
- [roadmap-template.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/references/roadmap-template.md)
- [quality-checklist.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/references/quality-checklist.md)

## 怎么调用

最直接的方式是在新任务里显式提到 skill 名：

```text
使用 $agent-subtopic-roadmap，为“命令行、Git、虚拟环境、依赖管理”生成一个独立学习路线图文件。
```

或者：

```text
用 $agent-subtopic-roadmap 把“Testing and Evaluation”细化成子主题 roadmap，并更新主 roadmap 里的链接。
```

如果你不想显式写 `$agent-subtopic-roadmap`，也可以直接说：

```text
把主 roadmap 里的“tool calling”拆成独立 roadmap，按已有 Python 那份的结构写，强调 Agent Engineer 的取舍。
```

但显式调用更稳，因为它能明确告诉 Codex 应该加载这个 skill。

## 推荐提示词模板

你后面可以直接复用这个模板：

```text
使用 $agent-subtopic-roadmap，
把 [01-agent-engineer-roadmap.md](notes/roadmaps/01-agent-engineer-roadmap.md) 里的“<主题名>”拆成独立 roadmap。
要求：
1. 服务于后续成为 Agent Engineer，不追求面面俱到
2. 明确写出现在优先学什么、现在不用展开学什么
3. 形成一个新文件，并按需要更新主 roadmap 和 notes 导航
4. 保持和已有子主题 roadmap 一致的结构与文风
```

## skill 默认会做什么

正常情况下，这个 skill 会让 Codex：

1. 先读取 `AGENT.md`、`notes/learning-workflow.md`、`notes/roadmaps/01-agent-engineer-roadmap.md`、`notes/README.md`
2. 再读取已有同类子 roadmap 作为风格参考
3. 判断这个主题对 Agent Engineer 的高频价值和学习边界
4. 创建或更新 `notes/` 里的子主题 roadmap 文件
5. 在需要时更新主 roadmap 和 `notes/README.md`

## 一个具体例子

例如你下一步想拆：

- `命令行、Git、虚拟环境、依赖管理`

可以直接这样说：

```text
使用 $agent-subtopic-roadmap，
把主 roadmap 里的“命令行、Git、虚拟环境、依赖管理”拆成独立学习路线图。
重点是服务后续 Agent 开发，不要写成通用开发者全套入门。
形成一个新文件，并更新相关导航。
```

## 输出长什么样才算对

一个合格的子主题 roadmap 应该至少包含：

- `目的`
- `设计原则`
- `学习边界`
- 分阶段路线
- `推荐学习顺序`
- 阶段项目建议
- 这个主题中的 Codex 协作主线
- 进入下一主题前的判断标准

而且它必须明确回答两件事：

- 为什么这个主题现在值得学
- 为什么某些相邻内容现在先不学

## 当前安装和使用建议

这个 skill 的仓库源文件已经在当前项目里，可用于版本管理和迭代。

当前我已经把它安装到了：

- `/Users/xzh/.codex/skills/agent-subtopic-roadmap`

这意味着后续新会话里，直接显式写 `$agent-subtopic-roadmap` 会更稳。

需要注意：

- 当前这个正在进行的会话不一定会立刻把新 skill 加入“可用 skills 列表”
- 重新开始一个新会话后再调用，最可靠

## 以后怎么迭代这个 skill

当你发现下面情况时，就该回头改 skill，而不是继续堆提示词：

- 新生成的 roadmap 经常漏掉边界部分
- 文风开始漂移
- 导航更新步骤经常被忘
- 某些主题需要固定的新章节

这时优先修改：

- [SKILL.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/SKILL.md)
- [roadmap-template.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/references/roadmap-template.md)
- [quality-checklist.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-roadmap/references/quality-checklist.md)
