def normalize_messages(raw_messages: list[dict[str, str]]) -> list[dict[str, str]]:
    return [
        {"role": item["speaker"], "content": item["text"]}
        for item in raw_messages
    ]


def find_first_message(messages: list[dict[str, str]], role: str) -> str:
    return next(
        (item.get("content", "") for item in messages if item.get("role") == role),
        "",
    )
