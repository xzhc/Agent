# learning-repo-git-ops 使用说明

这份说明告诉你后续怎么用 `learning-repo-git-ops`，让 Codex 帮你把当前改动按这个学习仓库的语义拆成 clean commits，并在需要时调用本地脚本完成 commit 和 push。

## 这个 skill 是干什么的

它解决的不是“Git 命令不会敲”，而是下面这类更容易反复出错的问题：

- 现在这批改动到底该拆成几条 commit
- 这是仓库系统构建，还是具体学习内容推进
- 学习内容推进里到底是 `roadmap / pack / lecture / lab / notes / project / review` 哪一类
- commit message 应该怎么写，才能以后回看历史时仍然清楚

它负责“看 diff、做判断、生成 commit 方案”。

真正执行 Git 的确定性动作，由脚本 [git_learning_commit.sh](/Users/xzh/Tech/CS/Agent/scripts/git_learning_commit.sh) 完成。

## 为什么不是只做一个大脚本

因为这件事有两层：

1. 语义判断
   例如这次改动该拆成 `chore(repo)` 和 `docs(notes)` 两条，还是只要一条 `feat(pack)`
2. 确定性执行
   例如按明确文件列表去 `git add`、`git commit`、`git push`

第一层适合给 Codex + skill。

第二层适合交给本地脚本。

所以这个方案是：

- skill 负责判断和生成 commit 信息
- 脚本负责稳定执行

## skill 在哪里

仓库内源文件在：

- [SKILL.md](/Users/xzh/Tech/CS/Agent/skills/learning-repo-git-ops/SKILL.md)
- [openai.yaml](/Users/xzh/Tech/CS/Agent/skills/learning-repo-git-ops/agents/openai.yaml)
- [commit-taxonomy.md](/Users/xzh/Tech/CS/Agent/skills/learning-repo-git-ops/references/commit-taxonomy.md)

配套脚本在：

- [git_learning_commit.sh](/Users/xzh/Tech/CS/Agent/scripts/git_learning_commit.sh)

## 这个 skill 默认怎么判断提交类型

默认先分成两大类：

1. 仓库系统构建
   例如 skill、script、文件组织、全局工作流文档、README、自动化
2. 具体学习内容
   再细分成：
   - `roadmap`
   - `pack`
   - `lecture`
   - `lab`
   - `notes`
   - `project`
   - `review`

对应 commit 类型见：

- [commit-taxonomy.md](/Users/xzh/Tech/CS/Agent/skills/learning-repo-git-ops/references/commit-taxonomy.md)

## 怎么调用

最稳的方式是显式写 skill 名。

### 只分析，不执行

```text
使用 $learning-repo-git-ops，
分析当前仓库改动，按这个学习仓库的提交分类拆成 clean commits，
只给我提交方案和 commit message，不要执行 git commit 或 push。
```

### 自动拆 commit 并提交，但不 push

```text
使用 $learning-repo-git-ops，
分析当前改动并按仓库约定拆成多条 commit，
直接执行提交，但先不要 push 到 GitHub。
```

### 自动拆 commit、提交并上传到 GitHub

```text
使用 $learning-repo-git-ops，
分析当前改动，按仓库约定拆成 clean commits，
生成 commit message，执行提交，并 push 到 GitHub。
```

这里要显式写“push 到 GitHub”，因为这个 skill 默认不会替你自动 push。

## 推荐提示词模板

以后你可以直接复用这个模板：

```text
使用 $learning-repo-git-ops，
检查当前仓库改动。
要求：
1. 先判断哪些属于仓库系统构建，哪些属于具体学习内容
2. 具体学习内容按 roadmap / pack / lecture / lab / notes / project / review 继续细分
3. 如果应该拆成多条 commit，就给出明确分组
4. commit message 按仓库约定生成
5. 如果我没明确说 push，就不要 push
```

## 直接用脚本的场景

如果你已经非常确定这次只需要一条 commit，而且文件范围很清楚，也可以不经过 skill，直接调用脚本。

### 先 dry run

```bash
./scripts/git_learning_commit.sh \
  --dry-run \
  --message "docs(notes): capture runtime environment debugging checklist" \
  --file notes/00-python-for-agent-engineer/docs/01-runtime-and-environment.md
```

### 直接提交

```bash
./scripts/git_learning_commit.sh \
  --message "feat(lab): implement clean environment hello script" \
  --file labs/00-python-for-agent-engineer/code/01-run-a-script-in-a-clean-env/hello_env.py
```

### 提交并 push

```bash
./scripts/git_learning_commit.sh \
  --message "chore(repo): add learning repo git automation skill" \
  --file skills/learning-repo-git-ops/SKILL.md \
  --file skills/learning-repo-git-ops/agents/openai.yaml \
  --file skills/learning-repo-git-ops/references/commit-taxonomy.md \
  --file scripts/git_learning_commit.sh \
  --push
```

## 这个脚本故意不帮你做什么

它不会：

- 自动 `git add -A`
- 自动猜这次该提交哪些文件
- 默认就 push
- 在 index 里已经有 staged changes 的情况下继续硬做

这些限制是故意的，因为它的目标是减少误提交，而不是追求最短命令。

## 一个推荐工作流

日常最稳的用法是：

1. 先让 `learning-repo-git-ops` 看 `git status` 和 `git diff`
2. 让它给出 commit 分组和 message
3. 先确认分组是否符合你自己的真实意图
4. 再让它调用脚本执行 commit
5. 只有在你明确说了“上传 GitHub”时，再 push

## 当前安装和使用建议

仓库里的这份是源文件，方便你版本管理和后续迭代。

我已经把它安装到了：

- `/Users/xzh/.codex/skills/learning-repo-git-ops`

这意味着后续新会话里，显式写 `$learning-repo-git-ops` 会更稳。

需要注意：

- 当前这个正在进行的会话不一定会立刻把新 skill 加入“可用 skills 列表”
- 重新开一个新会话后再调用，通常最可靠

## 什么时候该改 skill，什么时候该改脚本

改 skill：

- 经常分错 commit 类型
- 总是忘某种学习场景的提交分类
- commit message 风格不稳定
- 你又新增了一个稳定的学习产物类型

改脚本：

- 需要新的执行参数，例如 `--dry-run`、`--remote`
- 需要更强的 Git 安全检查
- 需要更稳定地处理 staged / deleted / renamed files

也就是说：

- 判断错了，改 skill
- 执行不稳，改脚本
