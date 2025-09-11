#!/bin/bash

# Script to generate a single Claude Code prompt file for all PDFs in learn_vocabulary_through_stories folder
# Based on the template: /Users/polodev/sites/eng-content/prompts/article-vocabulary-prompt.md

# Set variables
TEMPLATE_FILE="/Users/polodev/sites/eng-content/templates/article-with-story.json"
PDF_FOLDER="/Users/polodev/sites/eng-content/learn_vocabulary_through_stories"
PROMPT_FOLDER="/Users/polodev/sites/eng-content/prompts"
RESPONSE_FOLDER="/Users/polodev/sites/eng-content/response-json"
ALL_PROMPTS_FILE="$PROMPT_FOLDER/all-pdf-prompts.md"

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

echo "Starting PDF prompt generation..."
echo "PDF Folder: $PDF_FOLDER"
echo "Template File: $TEMPLATE_FILE"
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
        
        # Add heading and prompt for each PDF
        cat >> "$ALL_PROMPTS_FILE" << EOF
# $pdf_basename
## status: not done

my template file is \`$TEMPLATE_FILE\`
my pdf is in \`$pdf_file\`

please convert pdf content to text content and make a json file inside \`response-json\` folder with name like pdf. Json file should follow template style. exact same as template. as it has only single language. so other locale need to be done: translation, transliteration and native_transliteration
basic about 2 terms: 
- \`*_native_transliteration\`: datatype json with [bn, es, fr, hi] keys. written in respective language. Help non english speakers to know english pronunciation.
- \`*_transliteration\`: datatype string. written in Pure English. Help english speakers know its pronunciation 

EOF
        
        echo "Added prompt for: $pdf_basename"
        ((count++))
    fi
done

echo ""
echo "Completed! Generated single prompt file with $count PDF prompts: $ALL_PROMPTS_FILE"
echo "Response JSON files will be created in $RESPONSE_FOLDER when prompts are executed"