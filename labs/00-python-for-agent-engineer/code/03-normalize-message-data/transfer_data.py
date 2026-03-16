raw_messages = [
    {"speaker": "user", "text": "find the summary"},
    {"speaker": "assistant", "text": "working on it"},
]

messages = [
    {"role": item["speaker"], "content": item["text"]} for item in raw_messages
]

first_user_message = next(item["content"] for item in messages if item["role"] == "user")
first_assistant_message = next(item["content"] for item in messages if item["role"] == "assistant")

def main():
    print(messages)
    print(first_user_message)
    print(first_assistant_message)


if __name__ == "__main__":
    main()