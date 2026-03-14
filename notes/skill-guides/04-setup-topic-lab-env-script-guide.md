# setup_topic_lab_env.sh 使用说明

这份说明告诉你怎么用 [setup_topic_lab_env.sh](/Users/xzh/Tech/CS/Agent/scripts/setup_topic_lab_env.sh) 来创建或复用某个主题的 labs 共享虚拟环境。

## 这个脚本是干什么的

它服务的是这个仓库已经确定下来的 labs 环境约定：

- `lab 01` 可以在自己的实验目录里单独建临时 `.venv`
- 同一主题下后续 labs 共用 `labs/<topic>/.venv`

这个脚本就是用来稳定创建或复用那个“主题级共享 `.venv`”。

## 什么时候用

适合这些场景：

- 你准备开始某个主题的 `lab 02` 及之后实验
- 你不想每次手工判断 `.venv` 有没有创建过
- 你希望当前主题的 labs 共用一套干净环境

不适合这些场景：

- 你正在做 `lab 01`，因为那一步本来就在练“从零创建环境”
- 你在做 `projects/` 里的项目环境
- 你想在仓库根目录建一个全仓库共享 `.venv`

## 脚本在哪里

- [setup_topic_lab_env.sh](/Users/xzh/Tech/CS/Agent/scripts/setup_topic_lab_env.sh)

## 怎么用

以当前 Python 主题为例：

```bash
./scripts/setup_topic_lab_env.sh labs/00-python-for-agent-engineer
```

如果目录存在但 `.venv` 还没有，它会创建：

- `labs/00-python-for-agent-engineer/.venv`

如果这个 `.venv` 已经存在，它会直接复用，不会重建。

## 跑完之后要做什么

这个脚本不会替你自动激活环境，所以你还需要手工执行：

```bash
source labs/00-python-for-agent-engineer/.venv/bin/activate
```

退出时：

```bash
deactivate
```

## 它具体做了什么

给定一个 `labs/<topic>` 目录后，它会：

1. 检查参数个数是否正确
2. 检查你给的是不是一个存在的 `labs/<topic>` 目录
3. 计算主题级 `.venv` 路径
4. 如果环境不存在，就执行 `python3 -m venv`
5. 如果环境已存在，就告诉你直接复用
6. 最后打印激活命令

## 它不会做什么

它不会：

- 自动安装依赖
- 自动激活虚拟环境
- 自动判断你该装哪些包
- 给 `projects/` 创建环境

所以它解决的是“环境目录的创建和复用”，不是“整个环境初始化的全部工作”。

## 一个完整例子

```bash
./scripts/setup_topic_lab_env.sh labs/00-python-for-agent-engineer
source labs/00-python-for-agent-engineer/.venv/bin/activate
python --version
deactivate
```

## 常见误区

- 误区：这个脚本适合所有 Python 环境
  不是。它只服务这个仓库的“主题级 labs 共享环境”约定。

- 误区：运行完脚本就等于进入虚拟环境了
  不是。它只创建或复用环境，激活要你自己 `source .../activate`。

- 误区：项目也应该复用 labs 的 `.venv`
  不对。`projects/` 应该维护自己的独立环境。

## 什么时候该改这个脚本

如果后面出现这些情况，就该回头改它：

- 所有主题 labs 都需要装一组固定基础依赖
- 你想让它支持更多安全检查
- 你想把 topic labs 的环境初始化再自动化一层

如果只是想记住怎么用，不需要改脚本，直接看这份说明就够了。
