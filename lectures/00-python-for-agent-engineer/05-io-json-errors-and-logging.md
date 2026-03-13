# 05 I/O、JSON、异常处理与日志

## 本次目标

让 Python 代码真正具备最小工程能力：能读写文件、处理 JSON、分类异常、留下调试线索。

## 前置知识

- 已完成 `04 模块组织、命名与最小类型标注`

## 核心概念

1. 文件和路径
   项目里不要依赖“刚好运气好”的相对路径。
2. JSON
   是后续配置、消息、结构化输出、运行记录的常见格式。
3. 异常处理
   目标不是吞掉错误，而是更早、更清楚地定位错误。
4. 日志
   不是只有线上系统才需要，学习阶段也需要最小运行记录。
5. 配置加载
   配置与主流程分离，是后续工程化的重要基础。

## 最小可运行示例

```python
from pathlib import Path
import json


def load_config(path: Path) -> dict:
    if not path.exists():
        raise FileNotFoundError(f"Missing config: {path}")
    return json.loads(path.read_text())


def main() -> None:
    config = load_config(Path("config.json"))
    print(config.get("model", "not-set"))
```

## 常见错误

- 用裸字符串乱拼路径
- `except Exception:` 一把抓，然后什么也不说
- 读取 JSON 失败时，不打印上下文信息
- 关键运行步骤没有日志，只能靠猜

## 思考题或练习

1. 为什么后续 Agent 项目里的很多 bug 其实属于“输入脏”或“配置错”？
2. 什么情况下应该直接抛异常，什么情况下应该捕获后补充信息？
3. 如果一个 agent 跑错了，但没有任何运行记录，你怎么调？

## 这讲学完后立刻去做

- Lab：[05-config-json-and-error-handling.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/05-config-json-and-error-handling.md)
- Notes：记录你常见的异常模式和日志字段

## 下一步建议

到这里为止，基础已经够支撑第一次模型调用。下一讲正式把 Python 接到 LLM 主线。
