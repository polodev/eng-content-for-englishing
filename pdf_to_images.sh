#!/bin/bash

# PDF to Images Converter Configuration
PDF_PATH="/Users/polodev/sites/eng-content/biborna shahin/3000 Oxford vocabulary by Biborno Sahin.pdf"
BASE_OUTPUT_DIR="/Users/polodev/sites/eng-content/pdf-to-image"

# Function to slugify PDF name
slugify_name() {
    local name="$1"
    # Remove file extension
    name=$(basename "$name" .pdf)
    # Convert to lowercase, replace spaces and special chars with underscores
    echo "$name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/_/g' | sed 's/__*/_/g' | sed 's/^_\|_$//g'
}

# Create PDF-specific output directory
PDF_SLUG=$(slugify_name "$PDF_PATH")
OUTPUT_DIR="$BASE_OUTPUT_DIR/$PDF_SLUG"

# Check if PDF file exists
if [ ! -f "$PDF_PATH" ]; then
    echo "Error: PDF file '$PDF_PATH' not found."
    exit 1
fi

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
    echo "Created output directory: $OUTPUT_DIR"
fi

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "Error: Python3 is not installed."
    exit 1
fi

# Check if PyMuPDF (fitz) is installed, if not, install it
python3 -c "import fitz" 2>/dev/null || {
    echo "PyMuPDF (fitz) not found. Installing..."
    pip3 install PyMuPDF
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install PyMuPDF. Please install it manually:"
        echo "pip3 install PyMuPDF"
        exit 1
    fi
}

# Convert PDF to images using Python and PyMuPDF
python3 << EOF
import sys
import fitz  # PyMuPDF
from pathlib import Path
import os

try:
    pdf_path = "$PDF_PATH"
    output_dir = "$OUTPUT_DIR"
    
    # Open the PDF document
    pdf_document = fitz.open(pdf_path)
    
    # Get PDF filename without extension for naming
    pdf_name = Path(pdf_path).stem
    
    # Get page count before processing
    page_count = pdf_document.page_count
    
    # Convert each page to an image
    for page_num in range(page_count):
        page = pdf_document[page_num]
        
        # Create a transformation matrix for higher resolution (300 DPI)
        mat = fitz.Matrix(300/72, 300/72)  # 72 is default DPI, scale to 300 DPI
        
        # Render page to image
        pix = page.get_pixmap(matrix=mat)
        
        # Save the image
        image_path = os.path.join(output_dir, f"{pdf_name}_page_{page_num+1:03d}.png")
        pix.save(image_path)
        print(f"Saved: {image_path}")
    
    # Close the document
    pdf_document.close()
    
    print(f"\\nConversion completed! {page_count} pages converted.")
    print(f"Images saved to: {output_dir}")

except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)
EOF

if [ $? -eq 0 ]; then
    echo "PDF to image conversion completed successfully!"
else
    echo "Error occurred during conversion."
    exit 1
fi