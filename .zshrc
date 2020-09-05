zmodload zsh/zprof
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

# taocl

. ~/.shell/init/conda.sh
. ~/.shell/init/sdkman.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
