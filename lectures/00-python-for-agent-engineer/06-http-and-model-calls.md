# 06 HTTP 请求与最小模型调用

## 本次目标

理解“发请求、收响应、处理错误”的最小闭环，并把 Python 基础接到真实模型调用上。

## 前置知识

- 已完成 `05 I/O、JSON、异常处理与日志`

## 核心概念

1. 请求
   你发出的不是“魔法调用”，而是带参数、头信息和输入体的请求。
2. 响应
   你拿到的不是“答案本身”，而是一个结构化响应对象。
3. 超时和失败
   模型调用失败可能出在认证、参数、网络、服务端或解析逻辑。
4. 包装一层客户端函数
   比把请求逻辑直接写在 `main()` 里更稳。
5. 运行记录
   记录输入、关键信息和错误类型，后续才能排查和复盘。

## 最小可运行示例

```python
def call_model(user_input: str) -> str:
    # 这里先用伪实现代表真实模型调用
    if not user_input.strip():
        raise ValueError("user_input cannot be empty")
    return f"mocked-model-response: {user_input}"


def main() -> None:
    reply = call_model("Summarize this text")
    print(reply)
```

先把“接口包装”和“错误处理”结构想明白，再替换成你实际使用的 SDK。

## 常见错误

- 直接把供应商 SDK 调用散落在业务逻辑里
- 不区分认证错误、请求参数错误和网络错误
- 只 `print(response)`，不做结构化提取
- 没有超时意识，挂住后不知道发生了什么

## 思考题或练习

1. 为什么模型调用应该先包成一个独立函数或模块？
2. 如果调用失败，你如何区分“是请求没发出去”还是“响应结构没处理对”？
3. 为什么这一步已经不再只是 Python 语法问题？

## 这讲学完后立刻去做

- Lab：[06-build-a-minimal-llm-caller.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/06-build-a-minimal-llm-caller.md)
- Notes：记录错误分类和排查顺序到 [06-http-and-model-calls.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/docs/06-http-and-model-calls.md)
- Project：做 [project-01-python-llm-cli.md](/Users/xzh/Tech/CS/Agent/projects/00-python-for-agent-engineer/docs/project-01-python-llm-cli.md)

## 下一步建议

第一次模型调用完成后，不要急着上框架。先做完项目 1，再进入下一讲的 Agent 代码形态。
