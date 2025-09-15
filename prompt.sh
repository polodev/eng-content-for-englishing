#!/bin/bash
files=(
 "prompts-single-file/221-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/222-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/223-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/224-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/225-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/226-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/227-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/228-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/229-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/230-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/231-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/232-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/233-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/234-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/235-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/236-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/237-learn-vocabulary-through-stories-prompt.md"
 "prompts-single-file/238-learn-vocabulary-through-stories-prompt.md"
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