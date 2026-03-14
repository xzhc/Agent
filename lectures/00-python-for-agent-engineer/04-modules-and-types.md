# 04 模块组织、命名与最小类型标注

## 本次目标

让代码从“能写脚本”升级到“能被你自己和 Codex 持续读懂并修改”。

## 前置知识

- 已完成 `03 数据结构`

## 核心概念

1. 模块边界
   把配置、模型调用、工具逻辑、数据转换分开。
2. 入口文件
   `main.py` 负责串流程，不负责装下所有细节。
3. 命名
   参数名和返回值名应该能表达意图，而不是缩写堆砌。
4. 最小类型标注
   目标是减少理解成本，不是追求类型系统完整性。
5. 小函数 + 清晰模块
   是后续 Agent 项目可维护性的起点。

## 最小可运行示例

```python
# client.py
def build_payload(user_input: str) -> dict[str, str]:
    return {"input": user_input}


# main.py
from client import build_payload


def main() -> None:
    payload = build_payload("hello")
    print(payload)


if __name__ == "__main__":
    main()
```

## 常见错误

- 把所有函数塞进一个文件
- 模块之间相互调用，最后变成循环依赖
- 变量命名只图省事，不图含义
- 一上来过度设计类和继承

## 思考题或练习

1. 为什么 Agent 项目里更容易出现“一个文件越来越胖”？
2. `main.py` 该保留什么，不该保留什么？
3. 类型标注什么时候有帮助，什么时候只是噪音？

## 这讲学完后立刻去做

- Lab：[04-split-a-script-into-modules.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/04-split-a-script-into-modules.md)
- Notes：记录你自己的模块拆分原则到 [04-modules-and-types.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/docs/04-modules-and-types.md)

## 下一步建议

代码开始有形状了，下一讲补文件、JSON、异常和日志，这些是“接触真实世界”的关键能力。
