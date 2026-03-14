import os


def main() -> None:
    agent_name = os.getenv("AGENT_NAME", "agent-student")
    print(f"hello, {agent_name}!")

if __name__ == "__main__":
    main()
