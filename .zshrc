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

source /Users/askowronski/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

