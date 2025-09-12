#!/bin/bash
has_errors=false

for file in response-json/*.json; do
    if [ -f "$file" ]; then
        if python3 -m json.tool "$file" > /dev/null 2>&1; then
            echo "OK: $file"
        else
            echo "ERROR: $file has invalid JSON syntax"
            has_errors=true
        fi
    fi
done

if [ "$has_errors" = true ]; then
    exit 1
else
    echo "All JSON files are valid"
    exit 0
fi