# Agent Engineer 学习 Roadmap

## 目的

这份 roadmap 基于 [AI Engineering Field Guide](https://github.com/alexeygrigorev/ai-engineering-field-guide) 中的 `General learning path - what to learn and in what order` 整理而成，但做了两层适配：

1. 适配当前仓库目标：从零基础成长为具备工作能力的 Agent Engineer。
2. 适配当前仓库方法：不只学 Agent 工程，也渐进式学习如何使用 Codex 提升效率。

这不是“看完资料的顺序”，而是“应该按什么顺序形成能力”的路线图。

## 设计原则

- 先掌握最小闭环，再扩展复杂度。
- 先学高频必需能力，再学差异化能力。
- 先做单 Agent 和单点实验，再做复杂系统。
- 评估、测试、监控、生产化不能留到最后才碰。
- `MCP / skills` 只在真实需求出现后再引入，不提前堆能力。

## 如何使用这份 Roadmap

每个阶段都应该在仓库里留下对应产出：

- `lectures/`：讲义和概念拆解
- `labs/`：最小实验
- `projects/`：阶段项目
- `notes/`：术语、踩坑、调试笔记
- `reviews/`：阶段复盘

如果某一阶段只有阅读，没有实验和项目，就不算完成。

## 阶段 0：软件与 AI 应用基础

### 目标

先补足后续所有 Agent 开发都会依赖的基础能力。

### 学什么

- Python 基础
- 命令行、Git、虚拟环境、依赖管理
- HTTP / API 的基本概念
- JSON、文件读写、异常处理
- 用 API 调用 LLM 的最小闭环

### 为什么放在最前面

上游资料把 `Python and Software Engineering` 放在“Other Skills”，但对于零基础学习者，这一块必须前置。不然你会在后面所有阶段反复被基础问题卡住。

### 这个阶段的 Codex 主线

- 学会给 Codex 一个清晰任务
- 学会让 Codex 先读代码再改代码
- 学会让 Codex 解释报错并给出排查顺序

### 完成标志

- 能独立跑通一次模型调用
- 能读懂最小 Python 项目结构
- 能在 Codex 协助下完成一次最小修改

## 阶段 1：LLM Fundamentals

### 目标

理解 LLM 应用的最小能力模型，为后续 RAG 和 Agent 打基础。

### 学什么

- LLM 能做什么，不能做什么
- OpenAI / Anthropic API 的基本调用方式
- Prompt engineering
- Structured output
- 基础上下文管理

### 典型产出

- 一个最小聊天或问答程序
- 一个结构化输出实验
- 一份“常见 prompt 失败模式”笔记

### 这个阶段的 Codex 主线

- 学会让 Codex 生成最小 demo，而不是一上来生成完整系统
- 学会让 Codex 对比两种 prompt 写法的差异
- 学会要求 Codex 解释某个 API 调用为什么这样设计

### 完成标志

- 你知道什么时候该调 prompt，什么时候不是 prompt 的问题
- 你能稳定拿到结构化输出

## 阶段 2：RAG and Search

### 目标

学会让 LLM 使用你自己的数据，而不是只靠参数记忆。

### 学什么

- RAG 基本流程
- 文本搜索与向量搜索
- Chunking 策略
- 数据清洗和预处理
- 处理不同数据源：网页、PDF、视频字幕、文档

### 典型产出

- FAQ assistant
- 文档问答系统
- 一个对比不同 chunking / retrieval 效果的实验

### 这个阶段的 Codex 主线

- 学会让 Codex 帮你拆解 RAG 流程，而不是一次性写全套框架
- 学会让 Codex 协助分析 retrieval 失败原因
- 学会让 Codex 帮你生成最小评测样本

### 完成标志

- 你知道 RAG 失败可能出在数据、切分、召回还是生成
- 你能做一个最小可验证的检索问答系统

## 阶段 3：AI Agents

### 目标

从“LLM 回答问题”进入“LLM 可以调用工具并完成任务”。

### 学什么

- Function calling / tool use
- Agentic tool-call loop
- 单 Agent 工作流
- Agent frameworks 的基本取舍
- MCP 的作用与边界
- 多 Agent 的适用场景，不急着实现复杂系统

### 典型产出

- 一个会调用工具的 Agent
- 一个 web research 或 data extraction 小项目
- 一份“什么时候不该上多 Agent”的笔记

### 这个阶段的 Codex 主线

- 学会让 Codex 先帮你定义工具接口，再写 Agent loop
- 学会让 Codex 协助定位问题是在 prompt、tool schema 还是 control flow
- 在真实痛点出现时，再学习是否需要 MCP

### MCP 学习边界

这一阶段可以开始理解 MCP，但默认不是一开始就接很多外部系统。只有当外部上下文的搬运成本明显上升时，才值得进一步接入。

### 完成标志

- 你能独立解释 Agent 和普通 LLM app 的差别
- 你能做一个带工具调用的最小 Agent
- 你知道 MCP 什么时候值得上，什么时候不值得

## 阶段 4：Testing and Evaluation

### 目标

学会验证 Agent 是否真的可用，而不是“跑通了看起来差不多”。

### 学什么

- Agent 测试基础
- 测试 tool calls 和结构化输出
- LLM-as-judge
- Offline evaluation
- Retrieval evaluation
- Synthetic data generation
- 用 eval 驱动 prompt 优化

### 典型产出

- 一个最小 eval 集
- 一个 LLM-as-judge 实验
- 一份“当前系统的失败模式清单”

### 这个阶段的 Codex 主线

- 学会让 Codex 帮你设计测试样例
- 学会让 Codex 帮你分类失败案例
- 学会让 Codex 先做 review，再决定是否重构

### 完成标志

- 你能解释“为什么这个 Agent 现在不可靠”
- 你有最小评估数据，而不只是主观感受

## 阶段 5：Monitoring and Observability

### 目标

学会在系统运行时看见发生了什么。

### 学什么

- Logging
- Tracing
- Cost monitoring
- Usage tracking
- Feedback collection
- 基础 dashboard 思维

### 典型产出

- 一套最小日志方案
- 一份“关键运行指标”清单
- 一个简单的 tracing / run record 实验

### 这个阶段的 Codex 主线

- 学会让 Codex 帮你定义要采哪些日志，而不是盲目打点
- 学会让 Codex 帮你对运行记录做归因分析

### 完成标志

- 你能回答系统为什么失败、失败在哪一步、成本花在哪

## 阶段 6：Production Basics

### 目标

把 notebook 或实验变成更接近真实工作的项目。

### 学什么

- 项目结构化
- 部署基础
- 原型应用发布
- Guardrails
- 并行处理和任务队列基础
- 云平台基本概念

### 典型产出

- 一个能运行、能演示、能说明架构的项目
- 一份部署或运行说明
- 一份“从实验到项目”的重构记录

### 这个阶段的 Codex 主线

- 学会让 Codex 帮你做项目结构整理
- 学会让 Codex 帮你做风险扫描和代码 review
- 当某类重复任务变得稳定时，再判断是否值得安装或创建 skill

### 完成标志

- 你能把一个实验收敛成像样的项目，而不是一堆脚本

## 阶段 7：并行补强的工程能力

这一阶段不是单独做完，而是从阶段 0 开始就逐步补。

### 需要并行补的内容

- Python 和软件工程习惯
- FastAPI / Web 基础
- PostgreSQL / Redis / 向量数据库
- Docker
- 至少一个云平台
- Git workflows 和 code review
- TypeScript 或前端基础

### 原则

- 不要为了“学全栈”而偏离主线
- 只在当前项目真的需要时补对应工程能力
- 以项目倒逼工程能力，而不是先囤积技术栈

## 当前仓库推荐顺序

结合当前仓库目标，建议按下面顺序实际推进：

1. 阶段 0：软件与 AI 应用基础
2. 阶段 1：LLM Fundamentals
3. 阶段 2：RAG and Search
4. 阶段 3：AI Agents
5. 阶段 4：Testing and Evaluation
6. 阶段 5：Monitoring and Observability
7. 阶段 6：Production Basics
8. 阶段 7：并行补强工程能力

注意：

- `阶段 7` 是伴随式推进，不是最后才学
- `MCP` 默认在 `阶段 3` 之后按需引入
- `skills` 默认在 `阶段 6` 附近，当重复工作流稳定后再考虑

## 建议的仓库落地方式

可以按这个 roadmap 逐步建立内容：

- `lectures/00-foundations/`
- `lectures/01-llm-fundamentals/`
- `lectures/02-rag-and-search/`
- `lectures/03-ai-agents/`
- `lectures/04-testing-and-evaluation/`
- `lectures/05-monitoring-and-observability/`
- `lectures/06-production-basics/`

对应地建立：

- `labs/lab-01-first-llm-call/`
- `labs/lab-02-structured-output/`
- `labs/lab-03-basic-rag/`
- `labs/lab-04-tool-calling-agent/`
- `labs/lab-05-mini-eval/`

以及每个阶段至少一个 `project` 和一个 `review`。

## 什么叫学完

每一阶段至少满足下面条件，才算基本完成：

- 你能解释核心概念
- 你能完成最小实验
- 你知道常见失败模式
- 你能把该能力放进一个更大的项目
- 你知道 Codex 在这个阶段最适合帮你做什么

如果只是“看懂资料”，不算学完。如果只是“让 Codex 生成了一段代码”，也不算学完。
