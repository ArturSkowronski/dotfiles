#!/bin/zsh

# Script to rename academic papers in format "[YYYY-MM] Title.pdf"
# Uses pdftotext to extract content and Claude API to parse title and date

set -e
setopt null_glob

# Check if pdftotext is available
if ! command -v pdftotext &> /dev/null; then
    echo "Error: pdftotext not found. Install with: brew install poppler"
    exit 1
fi

# Default provider can be overridden via --provider or PROVIDER env var
PROVIDER=${PROVIDER:-openai}

# Parse optional --provider flag
while [[ $# -gt 0 ]]; do
    case "$1" in
        --provider)
            shift
            if [[ -z "$1" ]]; then
                echo "Error: --provider requires a value (openai|anthropic)"
                exit 1
            fi
            PROVIDER="$1"
            shift
            ;;
        --provider=*)
            PROVIDER="${1#*=}"
            shift
            ;;
        *)
            break
            ;;
    esac
done

# Validate provider
if [[ "$PROVIDER" != "openai" && "$PROVIDER" != "anthropic" ]]; then
    echo "Error: Unsupported provider: $PROVIDER (use openai or anthropic)"
    exit 1
fi

# Function to get new filename via Anthropic Claude
get_new_filename_anthropic() {
    local pdf_path="$1"
    
    # Extract first 3 pages of text (usually contains title, abstract, date)
    local content=$(pdftotext -l 3 "$pdf_path" - 2>/dev/null | head -c 4000)
    
    if [[ -z "$content" ]]; then
        echo "Error: Could not extract text from PDF" >&2
        return 1
    fi
    
    # Create JSON payload properly
    local prompt="Extract the title and publication date from this academic paper. Return ONLY in this exact format: [YYYY-MM] Title\n\nFor the date:\n- Use the publication date (not submission/revision dates)\n- Format as [YYYY-MM] where YYYY is 4-digit year, MM is 2-digit month\n- If only year is available, use [YYYY-01]\n- If date is unclear, make your best guess from context\n\nFor the title:\n- Use the main paper title\n- Remove any subtitle after colon if it makes the name too long\n- Keep it concise (prefer <80 chars)\n- Remove special characters that are invalid in filenames\n\nExamples:\n- [2017-06] Attention Is All You Need\n- [2024-12] Constitutional AI Harmlessness from AI Feedback\n\nPaper content:\n\n$content"
    
    local json_payload=$(jq -n \
        --arg content "$prompt" \
        '{
            "model": "claude-3-5-sonnet-20241022",
            "max_tokens": 500,
            "messages": [{
                "role": "user",
                "content": $content
            }]
        }')
    
    # Call Claude API
    local response=$(curl -s https://api.anthropic.com/v1/messages \
        -H "content-type: application/json" \
        -H "x-api-key: $ANTHROPIC_API_KEY" \
        -H "anthropic-version: 2023-06-01" \
        -d "$json_payload")
    
    # Extract the text content from Claude's response
    local new_name=$(echo "$response" | jq -r '.content[0].text' | tr -d '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    if [[ -z "$new_name" ]] || [[ "$new_name" == "null" ]]; then
        echo "Error: Failed to get response from Claude API" >&2
        echo "Response: $response" >&2
        return 1
    fi

    echo "$new_name"
}

# Function to get new filename via OpenAI (default)
get_new_filename_openai() {
    local pdf_path="$1"

    # Extract first 3 pages of text (usually contains title, abstract, date)
    local content=$(pdftotext -l 3 "$pdf_path" - 2>/dev/null | head -c 4000)

    if [[ -z "$content" ]]; then
        echo "Error: Could not extract text from PDF" >&2
        return 1
    fi

    local prompt="Extract the title and publication date from this academic paper. Return ONLY in this exact format: [YYYY-MM] Title\n\nFor the date:\n- Use the publication date (not submission/revision dates)\n- Format as [YYYY-MM] where YYYY is 4-digit year, MM is 2-digit month\n- If only year is available, use [YYYY-01]\n- If date is unclear, make your best guess from context\n\nFor the title:\n- Use the main paper title\n- Remove any subtitle after colon if it makes the name too long\n- Keep it concise (prefer <80 chars)\n- Remove special characters that are invalid in filenames\n\nExamples:\n- [2017-06] Attention Is All You Need\n- [2024-12] Constitutional AI Harmlessness from AI Feedback\n\nPaper content:\n\n$content"

    local json_payload=$(jq -n \
        --arg content "$prompt" \
        '{
            "model": "gpt-4o-mini",
            "max_tokens": 500,
            "messages": [{
                "role": "user",
                "content": $content
            }]
        }')

    local response=$(curl -s https://api.openai.com/v1/chat/completions \
        -H "content-type: application/json" \
        -H "authorization: Bearer $OPENAI_API_KEY" \
        -d "$json_payload")

    local new_name=$(echo "$response" | jq -r '.choices[0].message.content' | tr -d '\n' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

    if [[ -z "$new_name" ]] || [[ "$new_name" == "null" ]]; then
        echo "Error: Failed to get response from OpenAI API" >&2
        echo "Response: $response" >&2
        return 1
    fi
    
    echo "$new_name"
}

# Provider router
get_new_filename() {
    case "$PROVIDER" in
        openai)
            if [[ -z "${OPENAI_API_KEY}" ]]; then
                echo "Error: OPENAI_API_KEY environment variable not set" >&2
                echo "Set it with: export OPENAI_API_KEY='your-api-key'" >&2
                return 1
            fi
            get_new_filename_openai "$1"
            ;;
        anthropic)
            if [[ -z "${ANTHROPIC_API_KEY}" ]]; then
                echo "Error: ANTHROPIC_API_KEY environment variable not set" >&2
                echo "Set it with: export ANTHROPIC_API_KEY='your-api-key'" >&2
                return 1
            fi
            get_new_filename_anthropic "$1"
            ;;
    esac
}

# Main script
main() {
    if [[ $# -eq 0 ]]; then
        # No files provided: process all PDFs in current directory (case-insensitive)
        set -- *.pdf *.PDF
        if [[ $# -eq 0 ]]; then
            echo "No PDF files found in current directory."
            echo "Usage: $0 [--provider openai|anthropic] <pdf_file> [pdf_file2 ...]"
            return 1
        fi
        echo "No files specified. Processing all PDFs in current directory..."
    fi
    
    for pdf_file in "$@"; do
        if [[ ! -f "$pdf_file" ]]; then
            echo "Error: File not found: $pdf_file"
            continue
        fi
        
        if [[ "${pdf_file:l}" != *.pdf ]]; then
            echo "Error: Not a PDF file: $pdf_file"
            continue
        fi
        
        echo "Processing: $pdf_file"
        
        new_name=$(get_new_filename "$pdf_file")
        if [[ $? -ne 0 ]]; then
            echo "Failed to process: $pdf_file"
            continue
        fi
        
        # Get directory and construct new path
        local dir=$(dirname "$pdf_file")
        local new_path="$dir/$new_name.pdf"
        
        # Check if file already exists
        if [[ -f "$new_path" ]]; then
            echo "Warning: File already exists: $new_path"
            read "response?Overwrite? (y/N): "
            if [[ ! "$response" =~ ^[Yy]$ ]]; then
                echo "Skipping..."
                continue
            fi
        fi
        
        # Rename the file
        mv "$pdf_file" "$new_path"
        echo "✓ Renamed to: $new_name.pdf"
        echo ""
    done
}

main "$@"
