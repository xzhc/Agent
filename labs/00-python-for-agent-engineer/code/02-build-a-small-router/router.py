def classify_task(user_input: str) -> str:
    if "json" in user_input.lower():
        return "data"
    if "file" in user_input.lower():
        return "io"
    return "other"
    
def build_reply(task_type: str) -> str:
    if task_type == "data":
        return "Focus on dict/list processing."
    if task_type == "io":
        return "Focus on file I/O operations."
    return "Focus on basic control flow first."


def main() -> None:
    user_input = input("Help me to parse a JSON file ")
    task_type = classify_task(user_input)
    reply = build_reply(task_type)
    print(reply)

if __name__ == "__main__":
    main()