#!/bin/bash

# Prompt Log Plugin for Claude Code
# Logs all user prompts to a markdown file for documentation

# Read JSON input from stdin
input=$(cat)

# Extract the prompt
prompt=$(echo "$input" | python3 -c "import sys, json; print(json.load(sys.stdin).get('prompt', ''))")

# Skip if prompt is empty
if [ -z "$prompt" ]; then
    exit 0
fi

# Get current working directory from input
cwd=$(echo "$input" | python3 -c "import sys, json; print(json.load(sys.stdin).get('cwd', ''))")

# Path to the log file
log_file="$cwd/prompt-build-log.txt"

# Create file with header if it doesn't exist
if [ ! -f "$log_file" ]; then
    echo "# Prompt Build Log" > "$log_file"
    echo "" >> "$log_file"
    echo "This documents the prompts used to build this project with Claude." >> "$log_file"
    echo "" >> "$log_file"
    echo "---" >> "$log_file"
    last_num=0
else
    # Get the last entry number
    last_num=$(grep -E "^## [0-9]+" "$log_file" | tail -1 | sed 's/## \([0-9]*\).*/\1/')
    last_num=${last_num:-0}
fi

next_num=$((last_num + 1))

# Append the new prompt
echo "" >> "$log_file"
echo "## $next_num. User prompt" >> "$log_file"
echo "> $prompt" >> "$log_file"

exit 0
