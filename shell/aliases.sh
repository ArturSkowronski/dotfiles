alias zshrcs='subl ~/.zshrc'
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES && killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO && killall Finder"

alias osx-conf='subl $OSX_CONFIG'
alias ssh-key='pbcopy < ~/.ssh/id_rsa.pub'
alias cat='bat'

alias gcb='gradle clean build'

alias bci='brew cask install'
alias bi='brew install'

alias priv='subl /Users/arturskowronski/Priv'

alias @='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias docker-kill-all='docker kill $(docker ps -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'

alias t='trash'

alias npm-init='npm init --yes && npm config set save=true && npm config set save-exact=true'

#VirtusLab
alias bastion='ssh artur@52.209.2.114'

alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias setJdk9='export JAVA_HOME=$(/usr/libexec/java_home -v 1.9)'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"