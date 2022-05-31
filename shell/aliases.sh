alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias osx-conf='code $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'
alias cat='ccat'

alias gcb='gradle clean build'

alias bci='brew install --cask'
alias bi='brew install'

alias priv='subl /Users/arturskowronski/Priv'

alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'

alias t='trash'
alias cal='ncal'

alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'

alias flushdns='sudo networksetup -setnetworkserviceenabled Wi-Fi off ; sudo route flush ; sudo route flush ; sudo networksetup -setnetworkserviceenabled Wi-Fi on'

alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias grammarly="open -a Grammarly"
alias moment-guess="npx moment-guess --date "
alias tldr="npx tldr"
alias tar="dtrx"
alias ls="exa"

# TESCO
alias run_environment="$TLS_HOME/environment.sh"
alias production_restore_local_mongo="$TLS_HOME/environment/mongo/restore-local-mongo-from-dump.sh"
alias ppe_restore_local_mongo="$TLS_HOME/environment/mongo/restore-local-mongo-from-dump.sh --preprod"
alias run_integration_tests="$TLS_HOME/app/test/run_integration_tests.sh -l"
alias vived-prod-tunnel='ssh ec2-user@ec2-52-212-139-137.eu-west-1.compute.amazonaws.com -L 27018:127.0.0.1:27017'
alias vived-preprod-tunnel='ssh -i "$VIVED_HOME/aws-micro-mongo-ppe.pem" ec2-user@ec2-34-241-155-148.eu-west-1.compute.amazonaws.com -L 27019:127.0.0.1:27017'
alias vived-prod-psql-tunnel='ssh ec2-user@34.251.89.167 -L 27028:vived-prod-backend-postgres.ckwlbltrxdew.eu-west-1.rds.amazonaws.com:5432'
alias replica-vived-prod-psql-tunnel='ssh ec2-user@34.251.89.167 -L 27028:vived-prod-backend-postgres-read-replica.ckwlbltrxdew.eu-west-1.rds.amazonaws.com:5432'
