#!/bin/bash
files=(
  "prompts-single-file/51-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/52-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/53-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/54-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/55-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/56-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/57-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/58-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/59-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/60-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/61-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/62-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/63-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/64-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/65-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/66-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/67-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/68-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/69-learn-vocabulary-through-stories-prompt.md"
  "prompts-single-file/70-learn-vocabulary-through-stories-prompt.md"
 
)

for f in "${files[@]}"; do
  echo "▶ Running $f... ($(date '+%Y-%m-%d %H:%M:%S'))"
  claude --dangerously-skip-permissions -p < "$f"
  sleep 5
done