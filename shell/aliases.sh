alias zshrcs='subl ~/.zshrc'
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

#Vagrant Aliases
alias osx-conf='subl $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'
alias cat='ccat'
alias jboss_run='~/bin/jboss-eap-6.1/bin/standalone.sh'

alias gcb='gradle clean build'

alias bci='brew cask install'
alias bi='brew install'
alias home-mode='killall -9 java ; killall -9 idea ; killall -9 PSequel ; killall -9 Robomongo'

alias lprop='subl /Volumes/code/local.properties'
alias priv='subl /Users/arturskowronski/Priv'

alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'

alias t='trash'

# alias git='hub'
alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'

#Smart Recruiters
alias proxy-run='(cd /opt/proxy; rm nohup.out ; (nohup node smart-proxy.js &); sleep 2; tail -30 /opt/proxy/nohup.out)'
alias proxy-stop='kill `ps -eo pid,command | grep smart-proxy.js | grep -v grep | awk '"'"'{print $1}'"'"'`'
alias bastion='ssh artur@52.209.2.114'
