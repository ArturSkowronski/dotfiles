alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias osx-conf='subl $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'
alias cat='ccat'

alias gcb='gradle clean build'

alias bci='brew cask install'
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


# TESCO
alias run_environment="~/Projects/tescolocationservice/environment.sh"
alias run_integration_tests="/Users/arturskowronski/Projects/tescolocationservice/app/test/run_integration_tests.sh -l"
alias vived-preprod-tunnel='ssh -i "/Users/arturskowronski/Projects/vived/aws-micro-mongo-ppe.pem" ec2-user@ec2-34-241-155-148.eu-west-1.compute.amazonaws.com -L 27019:127.0.0.1:27017'
