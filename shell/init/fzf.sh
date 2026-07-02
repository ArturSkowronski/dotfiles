# fzf keybindings + completion (only in a real terminal — zle needs a tty)
[[ -t 0 ]] && command -v fzf >/dev/null 2>&1 && source <(fzf --zsh)
