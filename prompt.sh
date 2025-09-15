#!/bin/bash
files=(
 "prompts-single-file/189-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/190-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/191-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/192-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/193-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/194-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/195-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/196-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/197-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/198-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/199-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/200-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done