#Load Plugin Framework
. ~/.shell/init/prezto.sh
. ~/.shell/init/fzf.sh

set +o noclobber

# Load Environment
. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.secrets.sh

# Initialize Environment
. ~/.shell/init/iterm.sh
. ~/.shell/init/fnm.sh
. ~/.shell/init/sdkman.sh
. ~/.shell/init/pyenv.sh
. ~/.shell/init/tmux.sh

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
# peon-ping quick controls
alias peon="bash ~/.claude/hooks/peon-ping/peon.sh"

# --- Kindle / KOReader helpers (added by Claude) ---
# Push one or more books to the Kindle over SSH (works while KOReader is running).
# Uses cat-over-ssh so it needs only a shell on the device (no rsync/scp required).
# Target = /mnt/us/documents (standard Kindle folder; same one Calibre USB uses).
# Usage: kindle-send book.epub [more.epub ...]
KINDLE_BOOKS="${KINDLE_BOOKS:-/mnt/us/documents}"
# Pick a reachable host: Tailscale first, so the same command works away from
# home, then the LAN address as fallback. Override with KINDLE_HOST to force one.
# Probes use a short timeout of their own so falling back stays quick.
kindle-host() {
  if [ -n "$KINDLE_HOST" ]; then echo "$KINDLE_HOST"; return 0; fi
  for h in kindle-ts kindle; do
    if ssh -o BatchMode=yes -o ConnectTimeout=6 "$h" true 2>/dev/null; then echo "$h"; return 0; fi
  done
  return 1
}
kindle-send() {
  [ $# -eq 0 ] && { echo "usage: kindle-send <file> [file...]"; return 1; }
  local f base host
  host=$(kindle-host) || { echo "cannot reach Kindle (KOReader open + SSH started?)"; return 1; }
  echo "via $host"
  ssh "$host" "mkdir -p '$KINDLE_BOOKS'" || { echo "cannot reach Kindle (KOReader open + SSH started?)"; return 1; }
  for f in "$@"; do
    [ -f "$f" ] || { echo "skip (not a file): $f"; continue; }
    base=$(basename "$f")
    echo "-> $base"
    ssh "$host" "cat > '$KINDLE_BOOKS/$base'" < "$f" || { echo "FAILED: $base"; return 1; }
  done
  echo "Done -> $KINDLE_BOOKS. In KOReader: browse that folder (long-press -> refresh if needed)."
}
# Open a shell on the Kindle (KOReader must be running with SSH started/autostart).
kindle-ssh() { ssh "$(kindle-host || echo kindle)"; }
# --- end Kindle helpers ---
