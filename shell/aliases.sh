alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"


alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'

alias osx-conf='code $DOTFILES'
alias docker-kill-all='docker kill $(docker ps -q)'ą || echo "Warning: docker not found"
alias docker-rm-all='docker rm $(docker ps -a -q)' || echo "Warning: docker not found"

alias bci='brew install --cask'
alias bi='brew install'
alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

command -v trash >/dev/null 2>&1 && alias t='trash' || echo "Warning: trash not found"
command -v ccat >/dev/null 2>&1 && alias cat='ccat' || echo "Warning: ccat not found"
command -v ncal >/dev/null 2>&1 && alias cal='ncal' || echo "Warning: ncal not found"
command -v prettyping >/dev/null 2>&1 && alias ping='prettyping --nolegend' || echo "Warning: prettyping not found"
command -v ncdu >/dev/null 2>&1 && alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules" || echo "Warning: ncdu not found"
command -v most >/dev/null 2>&1 && alias less="most" || echo "Warning: most not found"
command -v bpytop >/dev/null 2>&1 && alias top="bpytop" || echo "Warning: bpytop not found"

alias python="python3"
alias pip="pip3"

alias moment-guess="npx moment-guess --date "
alias sherlock='python3 $HOME/bin/sherlock/sherlock'
