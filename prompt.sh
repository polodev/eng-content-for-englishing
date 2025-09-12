#!/bin/bash
files=(
  "prompts-single-file/23-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/24-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/25-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/26-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/27-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/28-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/29-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/30-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/31-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/32-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/33-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/34-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/35-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done