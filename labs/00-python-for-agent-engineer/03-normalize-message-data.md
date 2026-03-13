# Lab 03：把原始消息转换成统一结构

## 实验目标

练习 `list`、`dict`、嵌套结构访问和最小数据变换。

## 运行方式

给自己准备一组原始消息数据，例如：

```python
[
    {"speaker": "user", "text": "find the summary"},
    {"speaker": "assistant", "text": "working on it"},
]
```

把它们转成：

```python
[
    {"role": "user", "content": "find the summary"},
    {"role": "assistant", "content": "working on it"},
]
```

## 关键代码

- 使用 `for` 循环或推导式
- 尝试提取最后一条 `user` 消息
- 对缺字段情况给出默认处理

## 预期输出

- 结构统一
- 能正确拿到最后一条用户消息
- 缺字段时不会直接崩掉

## 常见报错

- `KeyError`
- 把单个对象当作列表用
- 推导式写过头，自己也读不懂

## 实验结论

做完后你应该能解释：

- 为什么 messages 天然适合 `list[dict]`
- 为什么很多 LLM 输出处理失败其实是结构处理失败
