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
. ~/.shell/init/kiro.sh
. ~/.shell/init/tmux.sh

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
# peon-ping quick controls
alias peon="bash ~/.claude/hooks/peon-ping/peon.sh"
