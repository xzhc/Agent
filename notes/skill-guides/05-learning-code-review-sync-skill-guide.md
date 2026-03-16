# learning-code-review-sync 使用说明

这份说明告诉你怎么用 `learning-code-review-sync`，让 Codex 在这个学习仓库里做代码审查，并把审查结论同步到对应的 stage note 或 project review 文件。

## 这个 skill 是干什么的

它解决的不是“能不能看懂代码”，而是下面这类会反复出现的协作问题：

- 我写完一个 lab，想让 Codex 按 lab guide review 我的实现
- 我不只想听口头 review，还想把稳定结论沉淀进对应 note
- 我后面做 project 时，也希望 review 结果能进入 `reviews/`
- 我希望 Codex 默认按 code review 的方式回答，而不是只给泛泛解释

这个 skill 负责两件事：

1. 做 findings-first 的代码审查
2. 把审查结论和修正方向写回匹配的学习产物

## skill 在哪里

- [SKILL.md](/Users/xzh/Tech/CS/Agent/.agents/skills/learning-code-review-sync/SKILL.md)
- [openai.yaml](/Users/xzh/Tech/CS/Agent/.agents/skills/learning-code-review-sync/agents/openai.yaml)

## 当前默认支持什么场景

### 1. review lab code

这是当前最主要的场景。

例如你可以这样说：

```text
使用 $learning-code-review-sync，
根据 [04-split-a-script-into-modules.md](labs/00-python-for-agent-engineer/docs/04-split-a-script-into-modules.md)
review 我在 labs/00-python-for-agent-engineer/code/04-modules-and-types/ 下的实现，
并把分析结果和修正方案补到对应 note。
```

它会做的事：

- 读 lab guide
- 读你指定的 lab 代码
- 按 code review 方式给 findings
- 把审查结论补进对应 stage note

### 2. review project code

这个场景已经预留了 workflow。

例如：

```text
使用 $learning-code-review-sync，
review `projects/00-python-for-agent-engineer/...` 下面的实现，
并把问题分析和修正方向写到对应 review 文件。
```

对于项目代码，它会优先：

- 找已经存在的项目 review 文件
- 如果没有合适文件，再在 `reviews/<topic>/` 下创建一个 dated code review 文件

## 它怎么决定把结果写到哪里

### Lab -> notes

如果你 review 的是：

- `labs/<topic>/docs/<nn>-...md`
- 或 `labs/<topic>/code/<nn>-.../`

它会按 stage number `<nn>` 去找：

- `notes/<topic>/docs/` 下同编号的 note 文件

例如：

- `labs/00-python-for-agent-engineer/code/04-modules-and-types/...`
  会同步到
  [04-modules-and-types.md](/Users/xzh/Tech/CS/Agent/notes/00-python-for-agent-engineer/docs/04-modules-and-types.md)

### Project -> reviews

如果你 review 的是：

- `projects/<topic>/...`

它会优先复用：

- `reviews/<topic>/` 下已经存在且能对应上该项目的 review 文件

如果还没有，就创建一个：

- `YYYY-MM-DD-<project-slug>-code-review.md`

## 它输出什么

聊天里默认是 code review 风格：

1. 先给 findings
2. 严重问题排前面
3. 带文件和行号
4. 再给修正方向
5. 如果没有明显问题，也会明确说没有 findings，并补充剩余风险或测试缺口

同步到 note/review 里的内容默认会更短，重点写：

- 主要问题是什么
- 为什么会坏
- 修正方案是什么

不会把整段聊天原样贴进去。

## 推荐提示词模板

以后你可以直接复用这个模板：

```text
使用 $learning-code-review-sync，
根据 [对应 lab 或 project 文档路径](...)
review 我在 [代码路径](...) 的实现。
要求：
1. 按 code review 风格给 findings，严重度高的排前面
2. 给出修正方向
3. 把 review 结论同步到对应的 note 或 review 文件
4. 如果没有明显 bug，也要说明剩余风险或测试缺口
```

## 什么时候不会自动写文件

下面这些情况它不会默认修改文件：

- 你明确说了 `only review`
- 你明确说了 `do not edit files`
- 目标文件和映射关系真的不清楚，且最小检查后仍无法安全判断

## 和 stage-note-sync 的区别

`stage-note-sync` 更偏向：

- 解释 lecture / lab 文本
- 把解释同步到 stage note

`learning-code-review-sync` 更偏向：

- review 代码实现
- 找 bug、风险、职责混乱、需求偏差
- 把审查结论和修正方向同步到 note 或 review

也就是说：

- 解释型问题，用 `stage-note-sync`
- 代码审查型问题，用 `learning-code-review-sync`
