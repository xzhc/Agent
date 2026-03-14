#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 labs/<topic>" >&2
  exit 1
fi

topic_dir="$1"

if [ ! -d "$topic_dir" ]; then
  echo "Topic directory not found: $topic_dir" >&2
  exit 1
fi

case "$topic_dir" in
  labs/*) ;;
  *)
    echo "Expected a labs topic directory, got: $topic_dir" >&2
    exit 1
    ;;
esac

venv_dir="$topic_dir/.venv"

if [ -d "$venv_dir" ]; then
  echo "Using existing topic lab environment: $venv_dir"
else
  echo "Creating topic lab environment: $venv_dir"
  python3 -m venv "$venv_dir"
fi

echo "Activate with:"
echo "source $venv_dir/bin/activate"
