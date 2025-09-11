#!/bin/bash
files=(
  "prompts-single-file/16-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/17-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/18-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/19-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/20-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f..."
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done