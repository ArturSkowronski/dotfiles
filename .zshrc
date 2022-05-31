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

# . ~/.shell/init/conda.sh
. ~/.shell/init/sdkman.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/askowronski/.config/broot/launcher/bash/br




# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/askowronski/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/askowronski/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/askowronski/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/askowronski/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
