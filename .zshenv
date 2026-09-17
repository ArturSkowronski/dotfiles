# Ensure Homebrew is in PATH for all shell types (including non-interactive SSH/mosh)
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Default Node (fnm) and Rust (rustup) for ALL shell types — scripts, launchd, SSH.
# Interactive shells additionally get per-project Node switching from ~/.shell/init/fnm.sh.
[ -d "$HOME/.local/share/fnm/aliases/default/bin" ] && export PATH="$HOME/.local/share/fnm/aliases/default/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
