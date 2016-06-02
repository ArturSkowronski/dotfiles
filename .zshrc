source "$HOME/.zprezto/init.zsh"
# Customize to your needs...

. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.shell/scripts.sh

#. ~/.shell/config/docker-machine.sh
taocl
autoload -Uz promptinit
promptinit
prompt steeef

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/arturskowronski/.sdkman"
[[ -s "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"
