# 面向 Agent Engineer 的 Python 学习包

## 这套内容解决什么问题

这不是一套“Python 大全”，而是一套专门服务后续 Agent 开发的 Python 学习包。

目标是让你在这个仓库里按固定节奏推进：

1. 在 `lectures/` 学最小必要知识
2. 在 `labs/` 跑通对应能力
3. 在 `notes/` 记录术语、坑点、调试路径和自己的判断
4. 学到一定阶段后进入 `projects/`
5. 项目完成后在 `reviews/` 做复盘

## 学习顺序

按下面顺序走，不要跳：

1. [01-runtime-and-environment.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/01-runtime-and-environment.md)
2. [02-control-flow-and-functions.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/02-control-flow-and-functions.md)
3. [03-data-structures.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/03-data-structures.md)
4. [04-modules-and-types.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/04-modules-and-types.md)
5. [05-io-json-errors-and-logging.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/05-io-json-errors-and-logging.md)
6. [06-http-and-model-calls.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/06-http-and-model-calls.md)
7. [07-agent-oriented-python-patterns.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/07-agent-oriented-python-patterns.md)

## 每一步对应做什么

| 讲义 | 立即对应的 lab | notes 里要记什么 | 何时进入项目 |
| --- | --- | --- | --- |
| 01 | `lab-01` | 环境、解释器、依赖、运行方式 | 不做项目 |
| 02 | `lab-02` | 函数拆分、分支逻辑、返回值 | 不做项目 |
| 03 | `lab-03` | `list/dict` 结构、嵌套访问 | 不做项目 |
| 04 | `lab-04` | 模块边界、命名、类型提示 | 不做项目 |
| 05 | `lab-05` | JSON、异常、日志、配置 | 不做项目 |
| 06 | `lab-06` | 请求、响应、错误分类 | 完成后进入 `project-01` |
| 07 | `lab-07` | schema、状态、控制流、工具边界 | 完成后进入 `project-02` |

## 这套内容的完成标准

- 你不是只看完讲义，而是每一讲都做完了对应 lab。
- 你不是只跑通代码，而是把关键问题记录进了 notes。
- 你不是只完成 lab，而是在合适阶段做了组合项目。
- 你不是只“感觉懂了”，而是在 review 里说清楚哪里还不稳。

## 对应文件

- Labs 总览：[00-python-for-agent-engineer/README.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/README.md)
- Notes 索引：[00-python-for-agent-engineer/README.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/README.md)
- 项目区：[00-python-for-agent-engineer/README.md](/Users/xzh/Tech/CS/Agent/projects/00-python-for-agent-engineer/README.md)
- 阶段复盘区：[00-python-for-agent-engineer/README.md](/Users/xzh/Tech/CS/Agent/reviews/00-python-for-agent-engineer/README.md)

## 不要这样学

- 不要一上来先看 Web 框架和异步。
- 不要还没做 lab 就继续读下一讲。
- 不要只让 Codex 写代码，不自己判断控制流和异常。
- 不要没做项目就误以为自己已经掌握了 Python for Agent。
