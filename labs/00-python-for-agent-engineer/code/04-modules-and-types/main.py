from router import build_reply
from router import classify_task
from utils import find_first_message
from utils import normalize_messages


def main() -> None:
    raw_messages = [
        {"speaker": "user", "text": "find the summary"},
        {"speaker": "assistant", "text": "working on it"},
    ]
    user_input = input("Help me to parse a JSON file ")
    task_type = classify_task(user_input)
    reply = build_reply(task_type)
    messages = normalize_messages(raw_messages)
    first_user_message = find_first_message(messages, "user")
    first_assistant_message = find_first_message(messages, "assistant")

    print(reply)
    print(messages)
    print(first_user_message)
    print(first_assistant_message)


if __name__ == "__main__":
    main()
