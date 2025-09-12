#!/bin/bash
files=(
  "prompts-single-file/31-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/32-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/33-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/34-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/35-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/36-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/37-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/38-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/39-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/40-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f..."
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done