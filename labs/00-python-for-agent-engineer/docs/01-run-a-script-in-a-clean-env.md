# Lab 01：在干净环境里运行第一个脚本

## 实验目标

确认你能独立完成环境创建、依赖安装、脚本运行和环境变量读取。

## 运行方式

1. 创建一个新的虚拟环境
2. 激活环境
3. 写一个最小 Python 脚本
4. 设置一个环境变量
5. 运行脚本并观察输出

## 关键代码

```python
import os


def main() -> None:
    print(os.getenv("AGENT_NAME", "agent-student"))


if __name__ == "__main__":
    main()
```

## 预期输出

- 不设置环境变量时，输出默认值
- 设置 `AGENT_NAME` 后，输出你设置的新值

## 常见报错

- `command not found: python`
- 环境变量设置了但当前 shell 没生效
- 明明激活了环境，装包却装到了别处

## 实验结论

做完后你应该能解释：

- Python 脚本到底是谁在执行
- 虚拟环境解决什么问题
- 环境变量为什么适合放配置
