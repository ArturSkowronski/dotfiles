#Load Plugin Framework
. ~/.shell/init/prezto.sh
# . ~/.shell/init/antigen.sh

set +o noclobber

# Load Environment
. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.shell/scripts.sh

# Initialize Environment
. ~/.shell/init/prompt.sh
. ~/.shell/init/iterm.sh
. ~/.shell/init/sdkman.sh
. ~/.shell/init/nvm.sh

# taocl


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/arturskowronski/.sdkman"
[[ -s "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# added by travis gem
[ -f /Users/arturskowronski/.travis/travis.sh ] && source /Users/arturskowronski/.travis/travis.sh
