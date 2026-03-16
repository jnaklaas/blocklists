#!/usr/bin/env bash
set -e

DATE=$(date +%Y.%m.%d)
CHANGELOG="CHANGELOG.md"
BLOCKLIST_DIR="blocklists"

# Create changelog if it doesn't exist
if [ ! -f "$CHANGELOG" ]; then
  cat <<EOF > "$CHANGELOG"
# Changelog

All notable changes to this project will be documented in this file.

The format is based on **Keep a Changelog** https://keepachangelog.com/en/1.1.0/,
and this project uses **date-based versioning**.

<!-- HEADER_END -->
EOF
fi

# Detect changes in blocklists
if [ -n "$GITHUB_ACTIONS" ]; then
    # Workflow: use diff from last commit
    CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD -- "$BLOCKLIST_DIR")
    if [ -z "$CHANGED_FILES" ]; then
        echo "No blocklist changes detected in last commit. Skipping changelog update."
        exit 0
    fi
else
    # Local: use diff from working directory
    CHANGED_FILES=$(git diff --name-only HEAD -- "$BLOCKLIST_DIR")
    if [ -z "$CHANGED_FILES" ]; then
        echo "No local changes detected in blocklists. Skipping changelog update."
        exit 0
    fi
fi

# Check if changelog already has an entry for today
if [ -n "$GITHUB_ACTIONS" ]; then
	if grep -q "## \[$DATE\]" "$CHANGELOG"; then
		echo "Changelog already has an entry for $DATE. Skipping."
		exit 0
	fi
fi


# Generate changelog entry
TMP_ENTRY=$(mktemp)
{
    echo ""
    echo "## [$DATE]"
    echo ""
	for file in "$BLOCKLIST_DIR"/*.txt; do
		name=$(basename "$file")

		if [ -n "$GITHUB_ACTIONS" ]; then
			ADDED=$(git diff HEAD~1 HEAD --unified=0 -- "$file" | grep '^+' | grep -vE '^\+\s*!|^\+\s*$|^\+\+\+ ' | sed 's/^+//')
			REMOVED=$(git diff HEAD~1 HEAD --unified=0 -- "$file" | grep '^-' | grep -vE '^\-\s*!|^\-\s*$|^\-\-\- ' | sed 's/^-//')
		else
			ADDED=$(git diff HEAD --unified=0 -- "$file" | grep '^+' | grep -vE '^\+\s*!|^\+\s*$|^\+\+\+ ' | sed 's/^+//')
			REMOVED=$(git diff HEAD --unified=0 -- "$file" | grep '^-' | grep -vE '^\-\s*!|^\-\s*$|^\-\-\- ' | sed 's/^-//')
		fi

		# Strip trailing whitespace en verwijder regels die in beide staan
		if [ -n "$ADDED" ] && [ -n "$REMOVED" ]; then
			# maak arrays van de regels
			mapfile -t ADDED_ARR <<< "$ADDED"
			mapfile -t REMOVED_ARR <<< "$REMOVED"

			# tijdelijke arrays
			NEW_ADDED=()
			NEW_REMOVED=()

			# voeg alleen toe aan NEW_ADDED als regel niet in REMOVED zit
			for line in "${ADDED_ARR[@]}"; do
				clean_line="$(echo -e "${line}" | sed 's/[[:space:]]*$//')"
				if ! printf '%s\n' "${REMOVED_ARR[@]}" | grep -Fxq "$clean_line"; then
					NEW_ADDED+=("$line")
				fi
			done

			# voeg alleen toe aan NEW_REMOVED als regel niet in ADDED zit
			for line in "${REMOVED_ARR[@]}"; do
				clean_line="$(echo -e "${line}" | sed 's/[[:space:]]*$//')"
				if ! printf '%s\n' "${ADDED_ARR[@]}" | grep -Fxq "$clean_line"; then
					NEW_REMOVED+=("$line")
				fi
			done

			# terugzetten
			ADDED=$(printf '%s\n' "${NEW_ADDED[@]}")
			REMOVED=$(printf '%s\n' "${NEW_REMOVED[@]}")
		fi

		# Only include in changelog if there are added or removed rules
		if [ -n "$ADDED" ] || [ -n "$REMOVED" ]; then
			echo "### $name" >> "$TMP_ENTRY"

			if [ -n "$ADDED" ]; then
				echo "" >> "$TMP_ENTRY"
				echo "#### Added" >> "$TMP_ENTRY"
				while IFS= read -r line; do
					echo "- \`$line\`" >> "$TMP_ENTRY"
				done <<< "$ADDED"
			fi

			if [ -n "$REMOVED" ]; then
				echo "" >> "$TMP_ENTRY"
				echo "#### Removed" >> "$TMP_ENTRY"
				while IFS= read -r line; do
					echo "- \`$line\`" >> "$TMP_ENTRY"
				done <<< "$REMOVED"
			fi

			echo "" >> "$TMP_ENTRY"
		fi
	done
} > "$TMP_ENTRY"

# Split header and rest of changelog
HEADER=$(awk '/^<!-- HEADER_END -->$/ {print; exit} {print}' "$CHANGELOG")
REST=$(awk 'found{print} /^<!-- HEADER_END -->$/ {found=1}' "$CHANGELOG")

# Combine header, new entry, and rest into final changelog
{
    echo "$HEADER"
    cat "$TMP_ENTRY"
    echo ""
    echo "$REST"
} > "$CHANGELOG.tmp"

mv "$CHANGELOG.tmp" "$CHANGELOG"
rm "$TMP_ENTRY"

echo "Changelog updated for $DATE (newest entry below header)"
if [ -z "$GITHUB_ACTIONS" ]; then
    echo "✔ Review the changelog before committing!"
fi