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

alias git='hub'
alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'

#Smart Recruiters
alias proxy-run='(cd /opt/proxy; rm nohup.out ; (nohup node smart-proxy.js &); sleep 2; tail -30 /opt/proxy/nohup.out)'
alias proxy-stop='kill `ps -eo pid,command | grep smart-proxy.js | grep -v grep | awk '"'"'{print $1}'"'"'`'
alias proxy-restart='proxy-stop; proxy-run'
alias proxy-config='subl /opt/proxy/smart-proxy.js'

alias gcb-cp='gradle -Dskip.tests clean build && cp -f ~/Projects/candidate-portal/candidate-portal-api/build/libs/candidate-portal-api.war ~/sr-docker/cp0wildfly/deployment/'
alias gcb-sats='gcb && cp -f ~/Projects/smart-ats/smart-ats-api/build/libs/smart-ats-api.war ~/sr-docker/cp0facade/deployment/'

alias faf='ssh rman@deploy1-int faf'
alias fafr='java -jar ~/Projects/fafr/build/libs/fafr-1.22.jar'
alias faf-go-cert='ssh rman@deploy1-cert faf-go $@'
alias faf-go-int='ssh rman@deploy1-int faf-go $@'