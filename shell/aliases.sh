alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias osx-conf='code $OSX_CONFIG'

alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'

alias bci='brew install --cask'
alias bi='brew install'

alias priv='subl /Users/askowronski/Priv'

alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias docker-kill-all='docker kill $(docker ps -q)'ą
alias docker-rm-all='docker rm $(docker ps -a -q)'

alias t='trash'
alias cat='ccat'
alias cal='ncal'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias tar="dtrx"
alias less="most"
alias top="bpytop"
alias python="python3"
alias pip="pip3"

alias moment-guess="npx moment-guess --date "
alias sherlock='python3 $HOME/bin/sherlock/sherlock'