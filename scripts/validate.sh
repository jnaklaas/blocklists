#!/usr/bin/env bash

set -e

# Repo root
ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
BLOCKLIST_DIR="$ROOT_DIR/blocklists"

echo "=== Validating blocklists in $BLOCKLIST_DIR ==="

ERROR=0

for file in "$BLOCKLIST_DIR"/*.txt; do
    echo ""
    echo "Checking $file ..."

    # ----------------------------
    # Check for required headers
    # ----------------------------
    for header in "Title" "Version" "Last modified"; do
        if ! grep -q "^! $header:" "$file"; then
            echo "⚠ Missing ! $header header in $file"
            ERROR=1
        fi
    done

    # ----------------------------
    # Check for trailing whitespace
    # ----------------------------
    if grep -n "[[:space:]]$" "$file"; then
        echo "⚠ Trailing whitespace found in $file"
        ERROR=1
    fi

    # ----------------------------
    # Check for leading whitespace
    # ----------------------------
    if grep -n "^[[:space:]]" "$file" | grep -v "^!"; then
        echo "⚠ Leading whitespace found in $file"
        ERROR=1
    fi

    # ----------------------------
    # Check for invalid uBlock syntax
    # ----------------------------
    # Very basic: look for lines not starting with ! or || or @@
    invalid_lines=$(grep -vE '^!|^\|\||^@@|\*' "$file" || true)
    if [[ -n "$invalid_lines" ]]; then
        echo "⚠ Invalid uBlock syntax in $file:"
        echo "$invalid_lines"
        ERROR=1
    fi

    # ----------------------------
    # Check for duplicate rules
    # ----------------------------
    dup=$(grep -v '^!' "$file" | sort | uniq -d)
    if [[ -n "$dup" ]]; then
        echo "⚠ Duplicate rules in $file:"
        echo "$dup"
        ERROR=1
    fi

    # ----------------------------
    # Count total rules (exclude comments/empty lines)
    # ----------------------------
    total_rules=$(grep -vE '^\s*!|^\s*$' "$file" | wc -l | tr -d ' ')
    echo "✅ $total_rules rules in $file"

done

if [[ $ERROR -eq 1 ]]; then
    echo ""
    echo "❌ Validation finished with errors."
    exit 1
else
    echo ""
    echo "🎉 Validation finished successfully. No issues found."
fi