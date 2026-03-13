# 07 面向 Agent 的 Python 代码形态

## 本次目标

把前面学到的 Python 基础映射到 Agent 工程里的常见代码结构：工具函数、状态对象、最小 loop、输入验证和运行记录。

## 前置知识

- 已完成 `06 HTTP 请求与最小模型调用`
- 已完成项目 1 更稳

## 核心概念

1. 函数 = 工具
   每个工具要有清晰输入、输出和错误边界。
2. `dict` 或数据对象 = 状态
   消息、工具参数、运行记录、最终输出都需要清晰结构。
3. 循环 = agent 执行轮次
   没有停止条件的 loop 很快会失控。
4. 验证
   工具输入、模型输出、最终结果都应该有最小验证。
5. 分层
   模型决策逻辑、工具实现、日志记录要分开。

## 最小可运行示例

```python
def search_tool(query: str) -> str:
    if not query.strip():
        raise ValueError("query cannot be empty")
    return f"search-result-for: {query}"


def run_agent(user_input: str) -> dict:
    state = {"input": user_input, "steps": []}
    tool_result = search_tool(user_input)
    state["steps"].append({"tool": "search_tool", "result": tool_result})
    state["final"] = tool_result
    return state
```

## 常见错误

- 工具函数没有输入校验
- 模型逻辑和工具逻辑混在一起
- loop 没有最大轮次
- 运行记录只记最后答案，不记中间步骤
- 一上来上多 Agent，跳过最小单 Agent 原型

## 思考题或练习

1. 为什么函数边界和状态结构在 Agent 项目里比语法技巧更重要？
2. 一个最小 agent loop 至少要控制什么？
3. 如果工具参数错了，你希望错误暴露在哪一层？

## 这讲学完后立刻去做

- Lab：[07-build-a-local-tool-agent-loop.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/07-build-a-local-tool-agent-loop.md)
- Notes：记录“控制流先坏在哪里”和“工具边界怎么定”
- Project：做 [project-02-python-local-tool-agent/README.md](/Users/xzh/Tech/CS/Agent/projects/00-python-for-agent-engineer/project-02-python-local-tool-agent/README.md)

## 下一步建议

这一讲完成后，Python 主题就不该继续扩展广度了。下一步应该进入更高层的 `LLM Fundamentals`、`AI Agents` 和 `Testing and Evaluation`。
