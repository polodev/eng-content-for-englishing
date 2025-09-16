#!/bin/bash
files=(
 "prompts-single-file/239-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/240-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/241-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/242-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done