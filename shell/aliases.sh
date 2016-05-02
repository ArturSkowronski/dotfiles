alias zshrcs='subl ~/.zshrc'
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

#Vagrant Aliases
alias osx-conf='atom $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'
alias cat='ccat'
alias jboss_run='~/bin/jboss-eap-6.1/bin/standalone.sh'

#Smart Recruiters
alias proxy-run='(cd /opt/proxy; rm nohup.out ; (nohup node smart-proxy.js &); sleep 2; tail -30 /opt/proxy/nohup.out)'
alias proxy-stop='kill `ps -eo pid,command | grep smart-proxy.js | grep -v grep | awk '"'"'{print $1}'"'"'`'
alias proxy-restart='proxy-stop; proxy-run'
alias proxy-config='subl /opt/proxy/smart-proxy.js'

alias gcb='export JAVA_HOME=/usr/local/opt/jenv/versions/1.8;gradle -Dskip.tests clean build'

alias gtb='export JAVA_HOME=/usr/local/opt/jenv/versions/1.8;gradle --continuous test' #Continous Build
alias gqb='export JAVA_HOME=/usr/local/opt/jenv/versions/1.8;gradle build --no-rebuild --parallel --offline --daemon' #Quick Build
alias gcb7='export JAVA_HOME=/usr/local/opt/jenv/versions/1.7;gradle clean build'

alias jboss6='export JAVA_HOME=/usr/local/opt/jenv/versions/1.7;gradle clean build'
alias bci='brew cask install'
alias bi='brew install'

alias lprop='subl /Volumes/code/local.properties'
alias til='subl /Users/arturskowronski/Priv/til'
alias priv='subl /Users/arturskowronski/Priv'

alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'
alias dc='docker-compose'

alias t='trash'
alias jshell='cd ~/Misc/kulla-dev/langtools/repl && bash scripts/run.sh'
alias gcb-cp='gradle -Dskip.tests clean build && cp -f ~/Projects/candidate-portal/candidate-portal-api/build/libs/candidate-portal-api.war ~/sr-docker/cp0wildfly/deployment/'
alias gcb-sats='gcb && cp -f ~/Projects/smart-ats/smart-ats-api/build/libs/smart-ats-api.war ~/sr-docker/cp0facade/deployment/'

alias tl='termit auto'
alias ten='termit auto en'
alias tpl='termit auto pl'

alias git='hub'
alias faf='ssh rman@deploy1-int faf'

alias api-zotest='ssh rman@api2-zotest'
alias api-zotest-tail='ssh rman@api2-zotest tail -f /logs/jboss-as/server.log'
alias api-zotest-tail-log='ssh rman@api2-zotest tail -f -n 1000 /logs/jboss-as/server.log'
alias fafr='java -jar ~/Projects/fafr/build/libs/fafr-1.2.jar'

alias cp-zotest='ssh rman@candidateportal2-zotest'
alias cp-zotest-tail='ssh rman@candidateportal2-zotest tail -f /logs/jboss-as/server.log'
alias cp-zotest-tail-log='ssh rman@candidateportal2-zotest tail -f -n 1000 /logs/jboss-as/server.log'
alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'
