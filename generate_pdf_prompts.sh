#!/bin/bash

# Script to generate a single Claude Code prompt file for all PDFs in learn_vocabulary_through_stories folder
# Based on the template: /Users/polodev/sites/eng-content/prompts/article-vocabulary-prompt.md

# Set variables
TEMPLATE_FILE="/Users/polodev/sites/eng-content/templates/article-with-story.json"
PDF_FOLDER="/Users/polodev/sites/eng-content/learn_vocabulary_through_stories"
PROMPT_FOLDER="/Users/polodev/sites/eng-content/prompts"
RESPONSE_FOLDER="/Users/polodev/sites/eng-content/response-json"
ALL_PROMPTS_FILE="$PROMPT_FOLDER/all-pdf-prompts.md"
PROMPT_TEMPLATE_FILE="$PROMPT_FOLDER/article-vocabulary-prompt.md"

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

echo "Starting PDF prompt generation..."
echo "PDF Folder: $PDF_FOLDER"
echo "Template File: $TEMPLATE_FILE"
echo "Prompt Template File: $PROMPT_TEMPLATE_FILE"
echo "Prompt Folder: $PROMPT_FOLDER"
echo "Response Folder: $RESPONSE_FOLDER"
echo "Output File: $ALL_PROMPTS_FILE"
echo ""

# Initialize the combined prompt file
> "$ALL_PROMPTS_FILE"

# Counter for generated prompts
count=0

# Loop through all PDF files in the folder
for pdf_file in "$PDF_FOLDER"/*.pdf; do
    if [ -f "$pdf_file" ]; then
        pdf_basename=$(basename "$pdf_file" .pdf)
        
        # Add heading and status
        cat >> "$ALL_PROMPTS_FILE" << EOF
# status: not done
EOF
        
        # Read the prompt template and customize it for current PDF
        sed -e "s|01-learn-vocabulary-through-stories|$pdf_basename|g" \
            -e "s|/Users/polodev/sites/eng-content/learn_vocabulary_through_stories/01-learn-vocabulary-through-stories.pdf|$pdf_file|g" \
            -e "s|response-json/01-learn-vocabulary-through-stories.json|response-json/$pdf_basename.json|g" \
            "$PROMPT_TEMPLATE_FILE" >> "$ALL_PROMPTS_FILE"
        
        # Add separator between prompts
        echo "" >> "$ALL_PROMPTS_FILE"
        echo "" >> "$ALL_PROMPTS_FILE"
        
        echo "Added prompt for: $pdf_basename"
        ((count++))
    fi
done

echo ""
echo "Completed! Generated single prompt file with $count PDF prompts: $ALL_PROMPTS_FILE"
echo "Response JSON files will be created in $RESPONSE_FOLDER when prompts are executed"