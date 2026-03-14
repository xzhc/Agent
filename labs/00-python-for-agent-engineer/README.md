# Python Agent Foundations Labs

## 这组 lab 的作用

这组实验不是为了刷题，而是为了把 [00-python-for-agent-engineer](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/README.md) 里的能力逐个跑通。

目录约定：

- 说明文件放在 `docs/`
- 可运行代码放在 `code/`

环境约定：

- `lab 01` 单独在自己的实验目录里创建临时 `.venv`，用于练习干净环境创建
- `lab 02` 到 `lab 07` 共用 `labs/00-python-for-agent-engineer/.venv`
- 不在仓库根目录创建全仓库共享 `.venv`
- 可用 `scripts/setup_topic_lab_env.sh labs/00-python-for-agent-engineer` 自动创建或复用这个共享环境

每做完一个 lab，都必须同步做两件事：

1. 把结论、报错和判断记录到对应编号的 notes 文件，例如 [01-runtime-and-environment.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/docs/01-runtime-and-environment.md)
2. 确认自己已经能解释“为什么这样写”，而不是只是“能跑”

## 实验顺序

1. [01-run-a-script-in-a-clean-env.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/01-run-a-script-in-a-clean-env.md)
2. [02-build-a-small-router.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/02-build-a-small-router.md)
3. [03-normalize-message-data.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/03-normalize-message-data.md)
4. [04-split-a-script-into-modules.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/04-split-a-script-into-modules.md)
5. [05-config-json-and-error-handling.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/05-config-json-and-error-handling.md)
6. [06-build-a-minimal-llm-caller.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/06-build-a-minimal-llm-caller.md)
7. [07-build-a-local-tool-agent-loop.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/07-build-a-local-tool-agent-loop.md)

## 进入项目的时机

- 完成 lab 01 到 lab 06 后，进入 [project-01-python-llm-cli](/Users/xzh/Tech/CS/Agent/projects/00-python-for-agent-engineer/docs/project-01-python-llm-cli.md)
- 完成 lab 07 后，进入 [project-02-python-local-tool-agent](/Users/xzh/Tech/CS/Agent/projects/00-python-for-agent-engineer/docs/project-02-python-local-tool-agent.md)

## 这组 lab 的完成标准

- 每个实验都有明确输入、输出和运行说明
- 每个实验都知道常见错误和排查顺序
- 至少做过一次不靠复制代码的独立实现
- notes 里已经沉淀了高频错误和自己的判断标准
