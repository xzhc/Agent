# 02 最小语法、控制流与函数拆分

## 本次目标

掌握后续所有 Agent 工作流都会用到的最基本表达能力：条件、循环、函数、参数、返回值。

## 前置知识

- 已完成 `01 运行环境与最小脚本能力`

## 核心概念

1. 函数是后续工具函数、配置加载器、解析器、验证器的基础单位。
2. `if / elif / else` 是后续工作流路由和错误处理的基础。
3. `for` 循环是后续消息处理、批量转换、agent loop 的基础。
4. `return` 比 `print` 更重要。
   `print` 是展示，`return` 才是组合逻辑的基础。
5. 参数边界
   一个函数如果参数太多、职责太多，后面就会难改。

## 最小可运行示例

```python
def classify_task(user_input: str) -> str:
    if "json" in user_input.lower():
        return "data"
    if "file" in user_input.lower():
        return "io"
    return "general"


def build_reply(task_type: str) -> str:
    if task_type == "data":
        return "Focus on dict/list processing."
    if task_type == "io":
        return "Focus on file and config handling."
    return "Focus on basic control flow first."


def main() -> None:
    user_input = "Help me parse a JSON file"
    task_type = classify_task(user_input)
    reply = build_reply(task_type)
    print(reply)
```

## 常见错误

- 函数内部只 `print()`，没有 `return`
- 什么都写在 `main()` 里
- 用全局变量偷偷传状态
- `if` 分支越来越多，却不愿意拆函数

## 思考题或练习

1. 为什么“能跑”不等于“后面还敢改”？
2. 什么时候应该拆出新函数？
3. 如果一个函数既做分类、又做格式化、又做输出，它后面会怎么坏？

## 这讲学完后立刻去做

- Lab：[02-build-a-small-router.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/02-build-a-small-router.md)
- Notes：记录“什么时候拆函数”和“我最容易把逻辑堆在一起的地方”

## 下一步建议

函数和控制流只是骨架。下一讲要补最常见的数据结构，不然后续工具参数和模型响应处理会卡住。
