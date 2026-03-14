# labs

用于存放单点实验和最小练习，目标是把一个知识点真正跑通。

## 放什么

- prompt 实验
- tool calling 小实验
- structured output 实验
- memory / planning / evals 单点验证
- 调试练习

## 建议组织方式

- 每个主题目录保留一个 `README.md` 作为实验区入口
- 实验说明集中放在 `docs/`
- 实验代码集中放在 `code/`

## 环境约定

- `lab 01` 用单独的临时虚拟环境，目的是练会“从零创建干净环境”
- 同一主题下 `lab 02` 及之后的实验共用一个主题级虚拟环境，例如：`labs/<topic>/.venv`
- 不在仓库根目录维护一个全仓库共享 `.venv`
- 如果需要初始化主题级 labs 环境，优先使用 `scripts/setup_topic_lab_env.sh`

## 当前内容

- [00-python-for-agent-engineer/](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/README.md)

## 每个实验建议包含

1. 实验目标
2. 运行方式
3. 关键代码
4. 预期输出
5. 常见报错
6. 实验结论
