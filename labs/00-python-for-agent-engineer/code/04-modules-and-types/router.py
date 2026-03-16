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
        return "Focus on file I/O operations."
    return "Focus on basic control flow first."
