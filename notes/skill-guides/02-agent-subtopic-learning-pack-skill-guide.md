# agent-subtopic-learning-pack 使用说明

这份说明告诉你怎么用 `agent-subtopic-learning-pack` skill，把一个已经存在的子主题 roadmap 进一步落成真正可执行的学习包。

## 这个 skill 是干什么的

它是 `agent-subtopic-roadmap` 的下一阶段。

两者关系是：

1. `agent-subtopic-roadmap`
   负责定义某个子主题的学习边界、阶段和完成标准
2. `agent-subtopic-learning-pack`
   负责把这个 roadmap 变成 `lectures / labs / notes / projects / reviews` 里的实际内容

如果说 roadmap 解决的是“学什么”，那 learning pack 解决的是“具体怎么学、学完做什么、做到哪里该做项目、做完怎么复盘”。

## 什么时候用

适合这些场景：

- 已经有子主题 roadmap，下一步要开始真正生成学习内容
- 想把一个主题按统一结构落到五个目录里
- 想先生成讲义，再晚点补 lab 或项目
- 想增量更新已有学习包，而不是每次重来

不适合这些场景：

- 子主题的学习边界还没定义清楚
- 当前只想先做 roadmap，不想生成学习内容
- 当前只想讨论概念，不需要产出文件

## skill 在哪里

仓库内源文件在：

- [SKILL.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-learning-pack/SKILL.md)
- [generation-modes.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-learning-pack/references/generation-modes.md)
- [learning-pack-template.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-learning-pack/references/learning-pack-template.md)
- [quality-checklist.md](/Users/xzh/Tech/CS/Agent/skills/agent-subtopic-learning-pack/references/quality-checklist.md)

## 当前默认目录结构

这个 skill 默认会按主题根目录统一管理：

- `lectures/<topic>/`
- `labs/<topic>/`
- `notes/<topic>/`
- `projects/<topic>/`
- `reviews/<topic>/`

也就是说，一个主题的学习包不会再散落在各目录顶层。

## 生成模式

这个 skill 支持 4 种模式：

1. `skeleton`
   只先搭结构和导航
2. `lecture-first`
   先生成讲义和学习包骨架，lab 后面再细化
3. `full-pack`
   直接生成完整学习包
4. `incremental`
   给已有学习包做增量更新

## 怎么调用

如果你已经有某个子主题 roadmap，最稳的调用方式是显式写 skill 名。

### 例子 1：生成完整学习包

```text
使用 $agent-subtopic-learning-pack，
基于 notes/roadmaps/xx-xxx-roadmap.md 生成这个主题的完整学习包，
按当前仓库的 topic-scoped 结构落到 lectures、labs、notes、projects、reviews。
```

### 例子 2：先生成讲义，lab 后面再说

```text
使用 $agent-subtopic-learning-pack，
基于 notes/roadmaps/xx-xxx-roadmap.md 生成这个主题的学习包，
先用 lecture-first 模式，只生成讲义、notes、项目时机和复盘结构，lab 先不要细写。
```

### 例子 3：只给已有学习包补 lab

```text
使用 $agent-subtopic-learning-pack，
给现有的 00-xxx 主题学习包补 lab 内容，
用 incremental 模式，只更新 labs/<topic>/ 和相关导航。
```

## 推荐提示词模板

```text
使用 $agent-subtopic-learning-pack，
基于 [<子主题 roadmap>](notes/roadmaps/<nn-roadmap-file>.md) 生成对应学习包。
要求：
1. 按 topic-scoped 结构落到 lectures、labs、notes、projects、reviews
2. 服务于 Agent Engineer 的实际能力形成，不写成泛泛课程说明
3. 明确 lecture 和 lab 的对应关系
4. 明确什么时候该进入 project
5. 如果我没有要求 full-pack，就不要默认把所有 lab 细节写满
```

## 它和 roadmap skill 的衔接方式

推荐链路是：

1. 先用 `$agent-subtopic-roadmap` 生成子主题 roadmap
2. 确认 roadmap 的边界和阶段没问题
3. 再用 `$agent-subtopic-learning-pack` 把它落成学习包

后续如果这条链路再增加新阶段，例如评估包、项目 starter、复盘增强，也应该继续沿这条固定链路往后接，而不是把所有阶段揉进一个 skill。

## 当前安装和使用建议

这个 skill 的仓库源文件已经在当前项目里，可用于版本管理和迭代。

当前我已经把它安装到了：

- `/Users/xzh/.codex/skills/agent-subtopic-learning-pack`

这意味着后续新会话里，直接显式写 `$agent-subtopic-learning-pack` 会更稳。

需要注意：

- 当前这个正在进行的会话不一定会立刻把新 skill 加入“可用 skills 列表”
- 重新开始一个新会话后再调用，最可靠
