# 03 数据结构：list、dict 与结构变换

## 本次目标

建立处理模型输入输出、工具参数和中间状态的基础数据结构能力。

## 前置知识

- 已完成 `02 最小语法、控制流与函数拆分`

## 核心概念

1. `list`
   适合有顺序的一组对象，例如消息列表、检索结果列表。
2. `dict`
   适合带字段名的结构，例如 tool 参数、结构化输出、配置对象。
3. 嵌套结构
   真实 Agent 数据很少是平的，通常是 `list[dict]` 或 `dict[str, list]`。
4. 推导式
   适合做短小清晰的结构变换，不适合写复杂业务逻辑。
5. `get()` 和默认值
   比直接索引更适合处理不稳定输入。

## 最小可运行示例

```python
raw_messages = [
    {"speaker": "user", "text": "summarize this file"},
    {"speaker": "assistant", "text": "sure"},
]

messages = [
    {"role": item["speaker"], "content": item["text"]}
    for item in raw_messages
]

latest_user_message = next(
    (item["content"] for item in messages if item["role"] == "user"),
    "",
)

print(messages)
print(latest_user_message)
```

## 常见错误

- 分不清“一个对象”和“一组对象”
- 嵌套 `dict` 取值时一路硬索引，遇到缺字段直接崩
- 推导式写得太复杂，自己第二天都看不懂
- 处理结构化输出时，不先把原始结构打印清楚

## 思考题或练习

1. 为什么很多 LLM 应用问题本质上是数据结构问题？
2. 什么场景该用 `list`，什么场景该用 `dict`？
3. 为什么 messages 天然适合 `list[dict]`？

## 这讲学完后立刻去做

- Lab：[03-normalize-message-data.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/03-normalize-message-data.md)
- Notes：记录你最容易写错的嵌套结构访问方式

## 下一步建议

现在你已经能写脚本和处理结构了，下一讲要解决“代码怎么组织”，否则复杂度一上来就会乱。
