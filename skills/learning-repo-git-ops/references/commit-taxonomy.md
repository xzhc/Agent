# Learning Repo Commit Taxonomy

这份分类不是通用 Git 教程，而是这个仓库的提交语义约定。

目标只有两个：

1. 让 commit 一眼看出“这是在搭仓库系统，还是在推进具体学习”
2. 让以后回看历史时，能按学习流程快速定位变化

## 一级分类

### 1. 仓库系统构建

这类提交处理的是仓库怎么运转，不是学了什么具体知识。

常见内容：

- skill 新建或更新
- 本地脚本、自动化命令、helper
- 文件组织结构调整
- 全局工作流文档
- `AGENT.md`、`AGENTS.md`、顶层 README、导航规则

默认 commit 类型：

- `chore(repo): ...`

例子：

- `chore(repo): add learning repo git automation skill`
- `chore(repo): reorganize topic pack layout`

### 2. 具体学习内容

这类提交处理的是学习产物本身。

#### 路线图

用于定义某个主题学什么、不学什么。

- `docs(roadmap): ...`

例子：

- `docs(roadmap): add git and shell workflow roadmap`

#### 学习包

当一次改动跨 `lectures / labs / notes / projects / reviews` 多个目录，目标是生成或重组某个主题学习包本身，而不是只补一讲内容时，用这个类型。

- `feat(pack): ...`

例子：

- `feat(pack): scaffold git workflow learning pack`

#### Lecture

用于具体讲义内容编辑。

- `docs(lecture): ...`

例子：

- `docs(lecture): clarify runtime and environment mental model`

#### Lab

用于实验说明或实验实现的实质推进，尤其是 runnable code。

- `feat(lab): ...`

例子：

- `feat(lab): implement clean environment hello script`

#### Notes

用于笔记、理解沉淀、排错顺序、术语解释等。

- `docs(notes): ...`

例子：

- `docs(notes): capture runtime environment debugging checklist`

#### Project

用于项目实现、项目 starter、项目结构或项目规格的实质推进。

- `feat(project): ...`

例子：

- `feat(project): scaffold python llm cli starter`

#### Review

用于复盘、review 模板、review 结论。

- `docs(review): ...`

例子：

- `docs(review): add python project review checklist`

## 拆分原则

优先按“结果”拆，而不是按目录名机械拆。

例如：

- skill + script + README 说明，应该进 `chore(repo)`
- 一次补完某讲 lecture 和 notes，不一定要硬拆成两条；如果重点是讲义内容，可用 `docs(lecture)`
- 如果 lab 代码和同编号 notes 都有明显增量，通常拆成 `feat(lab)` 和 `docs(notes)` 更清楚

## 什么时候不要硬拆

可以不拆的场景：

- 文件移动和路径修正只是同一个结构调整的一部分
- 某个学习包骨架生成天然跨多个目录
- 一个极小的补丁拆开后会比合在一起更难理解

此时选择主导结果对应的类型即可，但要能在聊天说明里讲清楚为什么不拆。

## 提交信息写法

推荐格式：

```text
<type>(<scope>): <summary>
```

约定范围：

- `repo`
- `roadmap`
- `pack`
- `lecture`
- `lab`
- `notes`
- `project`
- `review`

`summary` 要写结果，不要写动作流水账。

更好：

- `docs(notes): capture runtime environment debugging checklist`

更差：

- `docs(notes): update files`
