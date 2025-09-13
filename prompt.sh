#!/bin/bash
files=(
  "prompts-single-file/36-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/37-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/38-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/39-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/40-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/41-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/42-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/43-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/44-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/45-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/46-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/47-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/48-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/49-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/50-learn-vocabulary-through-stories-prompt.md"
 
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done