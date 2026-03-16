#!/usr/bin/env bash
set -e

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
BLOCKLIST_DIR="$ROOT_DIR/blocklists"
DATE=$(date +%Y.%m.%d)
DATE_UTC=$(date -u "+%d %b %Y %H:%M UTC")

echo "Updating blocklist versions..."

TOTAL_COUNT=0

for file in "$BLOCKLIST_DIR"/*.txt
do
    COUNT=$(grep -vE '^\s*!|^\s*$' "$file" | wc -l | tr -d ' ')
    TOTAL_COUNT=$((TOTAL_COUNT + COUNT))
    BASENAME=$(basename "$file")

    # Update Version header
    if sed --version >/dev/null 2>&1; then
        # GNU sed
        sed -i "s|^! Version:.*|! Version: $DATE ($COUNT rules)|" "$file"
    else
        # macOS/BSD sed
        sed -i '' "s|^! Version:.*|! Version: $DATE ($COUNT rules)|" "$file"
    fi

    # Update Last modified header
    if grep -q "^! Last modified:" "$file"; then
        if sed --version >/dev/null 2>&1; then
            sed -i "s|^! Last modified:.*|! Last modified: $DATE_UTC|" "$file"
        else
            sed -i '' "s|^! Last modified:.*|! Last modified: $DATE_UTC|" "$file"
        fi
    else
        # Add Last modified header if it doesn't exist
        if sed --version >/dev/null 2>&1; then
            sed -i "1i! Last modified: $DATE_UTC" "$file"
        else
            sed -i '' "1i\\
			! Last modified: $DATE_UTC
			" "$file"
        fi
    fi

    echo "$file → $COUNT rules"
done

echo "Version headers updated."