# 01 运行环境与最小脚本能力

## 本次目标

建立最基本的运行心智模型：代码在哪执行、依赖装到哪里、环境变量从哪里来、为什么同一份代码在不同环境下结果会不一样。

## 前置知识

- 无

## 核心概念

1. Python 解释器
   你运行的不是“代码文件”，而是“解释器执行这个文件”。
2. 虚拟环境
   目标是把当前项目依赖和其他项目隔离开。
3. `pip` 和依赖
   安装包时，要明确“装进了哪个解释器”。
4. 环境变量
   适合放 API key、运行模式、默认配置，不适合硬编码在脚本里。
5. 运行入口
   一个脚本应该有明确入口，而不是散乱地堆执行逻辑。

## 最小可运行示例

```python
import os


def main() -> None:
    agent_name = os.getenv("AGENT_NAME", "agent-student")
    print(f"hello, {agent_name}")


if __name__ == "__main__":
    main()
```

这段代码对应了后面项目里最常见的三件事：

- 从环境里读配置
- 用函数组织主流程
- 用明确入口启动程序

## 常见错误

- 没激活虚拟环境，就直接安装依赖
- 以为 `python` 和 `python3` 一定指向同一个解释器
- 看到 `ModuleNotFoundError` 只会重装，不先确认装错环境没有
- 把密钥直接写进代码文件

## 思考题或练习

1. 为什么 Agent 项目里环境变量比硬编码更常见？
2. 为什么后续每个 lab 都应该先确认解释器和虚拟环境？
3. 如果同学说“我明明装了包，为什么还是找不到”，你先排查什么？

## 这讲学完后立刻去做

- Lab：[01-run-a-script-in-a-clean-env.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/01-run-a-script-in-a-clean-env.md)
- Notes：把解释器、虚拟环境、依赖安装和环境变量的排查顺序记到 [study-notes.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/study-notes.md)

## 下一步建议

不要停留在环境配置本身，下一讲就进入函数和控制流。对 Agent 工程来说，环境只是起点，不是学习重点。
