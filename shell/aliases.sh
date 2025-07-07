alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias osx-conf='code $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'

alias gcb='gradle clean build'

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
# alias du="duf"
alias tldr="npx tldr"
alias tar="dtrx"
alias less="most"
alias top="bpytop"
alias python="python3"
alias pip="pip3"

alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'
alias flushdns='sudo networksetup -setnetworkserviceenabled Wi-Fi off ; sudo route flush ; sudo route flush ; sudo networksetup -setnetworkserviceenabled Wi-Fi on'

alias grammarly="open -a Grammarly"
alias moment-guess="npx moment-guess --date "

# Vived
alias vived-prod-psql-tunnel='ssh ec2-user@34.251.89.167 -L 27028:vived-prod-backend-postgres.ckwlbltrxdew.eu-west-1.rds.amazonaws.com:5432'
alias replica-vived-prod-psql-tunnel='ssh ec2-user@34.251.89.167 -L 27028:vived-prod-backend-postgres-read-replica.ckwlbltrxdew.eu-west-1.rds.amazonaws.com:5432'

alias sherlock='python3 $HOME/bin/sherlock/sherlock'