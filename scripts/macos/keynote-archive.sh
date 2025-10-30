#!/usr/bin/env zsh

set -euo pipefail

KEYNOTE_DIR="${HOME}/Workspace/Keynote-Working-Dir"

# Export a single Keynote file to PDF using AppleScript via osascript
export_key_to_pdf() {
  local keyfile="$1"
  local pdfout="$2"

  /usr/bin/osascript <<APPLESCRIPT
  set keyPosix to "$keyfile"
  set pdfPosix to "$pdfout"
  tell application "System Events"
    set keyAlias to (POSIX file keyPosix) as alias
  end tell
  tell application "Keynote"
    activate
    set theDoc to open keyAlias
    -- Export to PDF next to the original file
    export theDoc to POSIX file pdfPosix as PDF
    close theDoc saving no
  end tell
APPLESCRIPT
}

# Walk all .key files under the iCloud Keynote folder
# (handles subfolders too)
find "$KEYNOTE_DIR" -type f -name "*.key" | while IFS= read -r keypath; do
  dirpath="$(dirname "$keypath")"
  filename="$(basename "$keypath")"
  base="${filename%.*}"           # name without extension
  pdfpath="${dirpath}/${base}.pdf"

  # Extract leading number from the filename (e.g., "123 Foo.key" -> "123")
  num=""
  if [[ "$base" =~ ^([0-9]+) ]]; then
    num="${match[1]}"
  fi

  if [[ -z "$num" ]]; then
    echo "⚠️  Skipping (no leading number): $filename"
    continue
  fi

  # Export PDF if missing (or overwrite if you prefer: remove the check)
  if [[ ! -f "$pdfpath" ]]; then
    echo "➡️  Exporting to PDF: $filename"
    export_key_to_pdf "$keypath" "$pdfpath"
  else
    echo "✅ PDF already exists: ${pdfpath}"
  fi

  # Create JPEG from the first page of the PDF; sips rasterizes page 1 by default
  jpgout="${dirpath}/${num}.jpg"
  echo "🖼  Creating JPEG thumbnail: ${jpgout}"
  # -Z 1200 constrains the longer side to 1200px (tweak as desired)
  # -s formatOptions 70 sets JPEG quality ~70
  /usr/bin/sips -s format jpeg -s formatOptions 70 -Z 1200 "$pdfpath" --out "$jpgout" >/dev/null

done

echo "🎉 Done."
