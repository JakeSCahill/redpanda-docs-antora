#!/bin/bash

SOURCE_DIRECTORY="./version-21.11"
OUTPUT_DIRECTORY="./asciidoc_docs/modules"
PARTIALS_DIRECTORY="./asciidoc_docs/partials"

# Create the output and partials directories if they don't exist
mkdir -p "$OUTPUT_DIRECTORY"
mkdir -p "$PARTIALS_DIRECTORY"

# Convert a Markdown file to AsciiDoc and add the description
function convert_markdown_to_asciidoc() {
  local markdown_file="$1"
  local output_file="$2"
  local content="$(cat "$markdown_file")"

  local output_file_dir="$(dirname "$output_file")"
  mkdir -p "$output_file_dir"

  # Convert Markdown content to AsciiDoc using Kramdoc
  local asciidoc_content="$(kramdoc -o "$output_file" "$markdown_file")"

  echo "Converted: $markdown_file -> $output_file"
}

# Convert all Markdown files in the source directory
while IFS= read -r -d '' markdown_file; do
  output_file="$(echo "$markdown_file" | sed "s|$SOURCE_DIRECTORY|$OUTPUT_DIRECTORY|" | sed 's|\.mdx$|.adoc|')"
  convert_markdown_to_asciidoc "$markdown_file" "$output_file"
done < <(find "$SOURCE_DIRECTORY" -name "*.mdx" -print0)

echo "All Markdown files converted to AsciiDoc."
