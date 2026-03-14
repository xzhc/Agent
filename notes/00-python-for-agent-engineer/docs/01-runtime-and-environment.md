# 01 运行环境与最小脚本能力

对应 lecture：[01-runtime-and-environment.md](/Users/xzh/Tech/CS/Agent/lectures/00-python-for-agent-engineer/01-runtime-and-environment.md)

对应 lab：[01-run-a-script-in-a-clean-env.md](/Users/xzh/Tech/CS/Agent/labs/00-python-for-agent-engineer/docs/01-run-a-script-in-a-clean-env.md)

## Lecture 理解

- 我之前不知道的点：
- 我最容易混淆的点：
- 现在我能解释的点：

### 这段最小脚本在做什么

```python
import os


def main() -> None:
    agent_name = os.getenv("AGENT_NAME", "agent-student")
    print(f"hello, {agent_name}")


if __name__ == "__main__":
    main()
```

- `import os` 是为了使用标准库里的环境变量能力，这里要用到 `os.getenv(...)`
- `def main() -> None:` 定义了程序主入口函数，表示这个函数不返回值，只负责执行主流程
- `os.getenv("AGENT_NAME", "agent-student")` 的意思是：
  - 先去当前进程环境里找 `AGENT_NAME`
  - 如果找到了，就把它的值赋给 `agent_name`
  - 如果没找到，就退回默认值 `"agent-student"`
- `print(f"hello, {agent_name}")` 用 f-string 把变量值插进输出文本里
- `if __name__ == "__main__":` 用来区分“这个文件是被直接运行”还是“被别的文件 import”
- 只有直接运行这个脚本时，才会执行 `main()`；如果只是被导入，就不会自动打印

### 这段代码为什么适合当第一讲示例

- 它同时覆盖了环境变量、函数入口、字符串输出这三个最小但高频的基础点
- 它足够小，方便我把注意力放在“代码是怎么被执行的”上，而不是被业务逻辑分散
- 这也是后面 Agent 脚本的常见雏形：启动程序，读取配置，执行主流程

### 这段代码最容易误解的地方

- `os.getenv(...)` 不是去 `.env` 文件里自动找值，它读的是当前进程已经拿到的环境变量
- `main()` 不是 Python 的强制语法，只是一种更清晰、更可维护的组织方式
- `if __name__ == "__main__":` 不是“固定要背的咒语”，它解决的是脚本入口控制问题

### Python 代码的执行过程

1. 我在 shell 里输入命令，比如 `python hello_env.py`
2. shell 先找到当前要调用的 `python` 是哪个解释器
3. 这个解释器进程启动后，读取 `hello_env.py` 文件内容
4. 解释器先检查语法，再把代码编译成 Python 自己可执行的字节码
5. 然后解释器按顺序执行模块顶层代码
6. 当执行到 `if __name__ == "__main__":` 时，如果这个文件是直接运行的入口文件，条件成立，就继续调用 `main()`
7. `main()` 运行时再去执行具体语句，比如读取环境变量、打印结果
8. 程序执行结束后，解释器进程退出，shell 再把控制权交还给我

### 我现在对“谁在执行代码”的理解

- 不是 `hello_env.py` 自己在执行自己
- 真正执行代码的是某个具体的 Python 解释器进程
- 同一个文件被不同解释器执行，结果可能不同，因为版本、依赖位置、环境变量都可能不同
- 所以排查问题时，先确认“我到底用了哪个 `python`”，通常比直接重装依赖更重要

### 虚拟环境的作用

- 虚拟环境的核心作用是给当前主题或当前项目准备一个独立的 Python 解释器和依赖安装位置
- 这样我在这个环境里安装的包，不会直接污染别的项目
- 反过来，别的项目装过什么包，也不会偷偷影响我当前这个实验

### 如果没有虚拟环境，常见会怎么坏

- 我在项目 A 里装的包版本，可能把项目 B 需要的版本覆盖掉
- 我明明记得“装过这个包”，但其实装到了另一个解释器里
- 同一台机器上做多个主题时，依赖会越积越乱，最后很难判断“现在到底在用哪一套环境”
- 报错出现时，我会分不清是代码问题，还是环境里混入了旧依赖

### 我现在对虚拟环境的理解

- 虚拟环境不是 Python 的另一门语法，它本质上是一个隔离出来的运行上下文
- 它最重要的不是“激活命令怎么敲”，而是让我明确三件事：
  - 现在用的是哪个 `python`
  - 包会被装到哪里
  - 当前代码到底依赖哪一套环境
- 对 Agent 项目来说，这很重要，因为后面会逐渐引入 SDK、HTTP 库、数据处理库和测试工具，不隔离的话排错成本会越来越高

### 在这个仓库里的实际使用原则

- `lab 01` 单独建临时虚拟环境，因为这个 lab 本身就在练“从零创建环境”
- 同一主题下后续 labs 共用 `labs/<topic>/.venv`
- 每个 project 自己维护独立 `.venv`
- 不在仓库根目录维护一个全仓库共享 `.venv`，避免不同主题和项目互相污染

### 怎么创建虚拟环境

最常用的方式是用 `venv`：

```bash
python3 -m venv .venv
```

这条命令的意思是：

- 用当前这个 `python3` 解释器去执行 `venv` 模块
- 在当前目录创建一个叫 `.venv` 的虚拟环境目录

创建完成后，目录里通常会有这些内容：

- `bin/python`
- `bin/pip`
- 一套独立的包安装位置

也就是说，环境建好之后，这个 `.venv` 里已经有了自己的 `python` 和 `pip`。

### 怎么启用虚拟环境

在 `zsh` 或 `bash` 里，最常见的是：

```bash
source .venv/bin/activate
```

启用后，当前 shell 会临时切换到这个虚拟环境，对我最重要的影响是：

- `python` 会指向 `.venv/bin/python`
- `pip` 会指向 `.venv/bin/pip`
- 我后面安装的依赖会默认进这个虚拟环境

### 怎么确认我真的启用了正确的环境

我至少会检查这几件事：

```bash
which python
python --version
which pip
pip --version
```

如果启用成功，`which python` 和 `which pip` 应该指向 `.venv/bin/` 下面。

### 什么时候退出虚拟环境

做完当前实验或当前项目后，可以执行：

```bash
deactivate
```

这会让当前 shell 回到原来的系统环境。

### 在这个仓库里的最小操作范式

`lab 01` 里我会这样做：

```bash
cd labs/00-python-for-agent-engineer/code/01-run-a-script-in-a-clean-env
python3 -m venv .venv
source .venv/bin/activate
python hello_env.py
deactivate
```

同一主题后续 labs 的共享环境则是：

```bash
./scripts/setup_topic_lab_env.sh labs/00-python-for-agent-engineer
source labs/00-python-for-agent-engineer/.venv/bin/activate
```

### `pip` 是什么

- `pip` 是 Python 生态里最常用的包安装工具
- 它的作用是把某个第三方库安装到当前解释器对应的环境里
- 所以 `pip install ...` 真正重要的问题不是“装了没有”，而是“装进了哪个 Python 环境”

### 依赖是什么

- 依赖就是我的代码运行时需要借助的其他库
- 例如后面做 Agent 项目时，HTTP 请求库、OpenAI SDK、数据处理库、测试工具都属于依赖
- 如果代码里 `import` 了某个包，但当前环境里没有这个包，就会报 `ModuleNotFoundError`

### 为什么 `pip` 和依赖总是和解释器、虚拟环境绑在一起

- 因为包不是“装在项目名下”，而是装在某个具体解释器对应的环境里
- 同一台机器可能同时有系统 Python、Homebrew Python、虚拟环境 Python
- 如果我用 A 解释器运行代码，却把依赖装进了 B 解释器，就会出现“明明装了包，为什么还是找不到”

### 我现在对 `pip` 的正确心智模型

- `pip` 不是一个抽象的全局装包按钮
- 它总是属于某个具体环境
- 最稳的方式不是直接相信 `pip`，而是确认：
  - `which python`
  - `which pip`
  - 这两个是不是指向同一个虚拟环境

### 最稳的安装方式

在已经激活虚拟环境后，可以直接用：

```bash
pip install package-name
```

如果我不想依赖 shell 当前状态，更稳的是：

```bash
python -m pip install package-name
```

这条命令的好处是：

- 我明确指定“用当前这个 `python` 去运行它自己的 `pip` 模块”
- 这样更不容易出现 `python` 和 `pip` 指向不同环境的问题

### 这类问题常见会怎么坏

- `pip install` 成功了，但运行代码还是报缺包
- `pip` 装到了系统环境，代码却在 `.venv` 里跑
- 一个项目升级了包版本，另一个项目马上跟着坏掉
- 我只记得“我装过”，却说不清“我装到哪去了”

### 在这个阶段我该记住的最小判断

- 先确认解释器，再安装依赖
- 先确认当前环境，再判断缺包
- 遇到 `ModuleNotFoundError` 时，先查环境归属，不要先盲目重装

### 思考题理解

#### 为什么 Agent 项目里环境变量比硬编码更常见

- Agent 项目经常要放 API key、base URL、模型名、运行模式这类会随环境变化的配置
- 如果硬编码，这些值会混进代码仓库，既不安全，也会让切换开发、测试、生产环境变得很笨重
- 环境变量的本质价值不是“高级”，而是把“代码逻辑”和“部署配置”分开，让同一份代码在不同机器和环境里复用

#### 为什么后续每个 lab 都应该先确认解释器和虚拟环境

- 因为真正执行代码的是某个具体解释器，不是项目目录本身
- 只要解释器错了，后面的 `pip install`、`import`、运行结果都会跟着错
- lab 一开始先确认解释器和虚拟环境，相当于先确认“我现在站在哪个运行上下文里”，这样排错才不会一开始就跑偏

#### 如果同学说“我明明装了包，为什么还是找不到”，先排查什么

- 第一反应不是重装，而是确认运行代码的 `python` 和安装包的 `pip` 是不是属于同一个环境
- 先看 `which python`、`which pip`、`python -m pip --version`
- 如果这几个路径不在同一个 `.venv` 下，问题通常不是“没装”，而是“装错地方了”
- 只有先确认环境归属后，才有必要继续看包名拼写、解释器版本或导入路径

## Lab 记录

- 我实际怎么创建环境的：
- 我遇到的报错：
- 我最后怎么确认解释器和依赖没搞错：

## 易错点和排查顺序

- 环境变量没生效时我先检查：
- 这个变量有没有真的导出到当前进程环境
- 代码读的是不是同一个变量名
- 我是不是以为 `.env` 会自动生效，但实际上根本没有加载
- `python` 和 `python3` 不一致时我先检查：
- `which python`
- `which python3`
- 当前 shell 有没有激活预期的 `.venv`
- 包明明装了却找不到时我先检查：
- 运行脚本的解释器是谁
- 安装依赖时用的 `pip` 属于谁
- 优先用 `python -m pip` 避免 `python` 和 `pip` 指向不同环境

## Codex 协作记录

- 这一步让 Codex 帮我加速了什么：
- 哪些判断还是必须我自己做：
