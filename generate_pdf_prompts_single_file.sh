#!/bin/bash

# Script to generate individual Claude Code prompt files for each PDF in learn_vocabulary_through_stories folder
# Based on the template: /Users/polodev/sites/eng-content/prompts/article-vocabulary-prompt.md
# Each PDF gets its own prompt file in prompts-single-file folder

# Set variables
TEMPLATE_FILE="/Users/polodev/sites/eng-content/templates/article-with-story.json"
PDF_FOLDER="/Users/polodev/sites/eng-content/learn_vocabulary_through_stories"
PROMPT_FOLDER="/Users/polodev/sites/eng-content/prompts-single-file"
RESPONSE_FOLDER="/Users/polodev/sites/eng-content/response-json"
PROMPT_TEMPLATE_FILE="/Users/polodev/sites/eng-content/prompts/article-vocabulary-prompt.md"

# Create prompt and response folders if they don't exist
mkdir -p "$PROMPT_FOLDER"
mkdir -p "$RESPONSE_FOLDER"

# Check if PDF folder exists
if [ ! -d "$PDF_FOLDER" ]; then
    echo "Error: PDF folder not found: $PDF_FOLDER"
    exit 1
fi

# Check if template file exists
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: Template file not found: $TEMPLATE_FILE"
    exit 1
fi

# Check if prompt template file exists
if [ ! -f "$PROMPT_TEMPLATE_FILE" ]; then
    echo "Error: Prompt template file not found: $PROMPT_TEMPLATE_FILE"
    exit 1
fi

echo "Starting individual PDF prompt file generation..."
echo "PDF Folder: $PDF_FOLDER"
echo "Template File: $TEMPLATE_FILE"
echo "Prompt Template File: $PROMPT_TEMPLATE_FILE"
echo "Prompt Folder: $PROMPT_FOLDER"
echo "Response Folder: $RESPONSE_FOLDER"
echo ""

# Counter for generated prompts
count=0

# Loop through all PDF files in the folder
for pdf_file in "$PDF_FOLDER"/*.pdf; do
    if [ -f "$pdf_file" ]; then
        pdf_basename=$(basename "$pdf_file" .pdf)
        individual_prompt_file="$PROMPT_FOLDER/$pdf_basename-prompt.md"
        
        # Initialize the individual prompt file
        > "$individual_prompt_file"
        
        # Read the prompt template and customize it for current PDF
        sed -e "s|01-learn-vocabulary-through-stories|$pdf_basename|g" \
            -e "s|/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf|$pdf_file|g" \
            -e "s|response-json/01-learn-vocabulary-through-stories.json|response-json/$pdf_basename.json|g" \
            "$PROMPT_TEMPLATE_FILE" > "$individual_prompt_file"
        
        echo "Created prompt file: $individual_prompt_file"
        ((count++))
    fi
done

echo ""
echo "Completed! Generated $count individual prompt files in: $PROMPT_FOLDER"
echo "Response JSON files will be created in $RESPONSE_FOLDER when prompts are executed"