#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/git_learning_commit.sh --message "<subject>" --file <path> [--file <path> ...] [--body "<body>"] [--push] [--remote <name>] [--dry-run]

What it does:
  - stages only the files you list
  - creates one commit with the provided message
  - optionally pushes HEAD to the chosen remote

Safety behavior:
  - aborts if the Git index already has staged changes
  - does not push unless --push is explicitly set
  - requires explicit --file arguments instead of staging the whole repo
EOF
}

message=""
body=""
remote="origin"
push_after_commit=0
dry_run=0
declare -a files=()

require_value() {
  local flag="$1"
  local value="${2-}"

  if [[ -z "$value" ]]; then
    echo "Missing value for $flag" >&2
    usage >&2
    exit 1
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --message)
      require_value "$1" "${2-}"
      message="$2"
      shift 2
      ;;
    --body)
      require_value "$1" "${2-}"
      body="$2"
      shift 2
      ;;
    --file)
      require_value "$1" "${2-}"
      files+=("$2")
      shift 2
      ;;
    --remote)
      require_value "$1" "${2-}"
      remote="$2"
      shift 2
      ;;
    --push)
      push_after_commit=1
      shift
      ;;
    --dry-run)
      dry_run=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$message" ]]; then
  echo "--message is required" >&2
  usage >&2
  exit 1
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "At least one --file is required" >&2
  usage >&2
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "This script must be run inside a Git repository" >&2
  exit 1
fi

if ! git diff --cached --quiet --ignore-submodules --; then
  echo "The Git index already has staged changes. Commit or unstage them before using this helper." >&2
  exit 1
fi

declare -a commit_cmd=(git commit -m "$message")
if [[ -n "$body" ]]; then
  commit_cmd+=(-m "$body")
fi

declare -a push_cmd=(git push "$remote" HEAD)

if [[ $dry_run -eq 1 ]]; then
  echo "Dry run only. No Git changes were made."
  printf 'Would stage:%s\n' ""
  printf '  %s\n' "${files[@]}"
  printf 'Would commit: %q' "${commit_cmd[0]}"
  for arg in "${commit_cmd[@]:1}"; do
    printf ' %q' "$arg"
  done
  printf '\n'

  if [[ $push_after_commit -eq 1 ]]; then
    printf 'Would push: %q' "${push_cmd[0]}"
    for arg in "${push_cmd[@]:1}"; do
      printf ' %q' "$arg"
    done
    printf '\n'
  fi

  exit 0
fi

git add -- "${files[@]}"

if git diff --cached --quiet --ignore-submodules --; then
  echo "No staged changes were produced for the selected files." >&2
  exit 1
fi

"${commit_cmd[@]}"

if [[ $push_after_commit -eq 1 ]]; then
  "${push_cmd[@]}"
fi
