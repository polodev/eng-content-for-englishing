#!/bin/bash
files=(
 "prompts-single-file/072-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/073-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/074-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/075-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/076-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/077-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/078-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/079-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/080-learn-vocabulary-through-stories-prompt.md"
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done