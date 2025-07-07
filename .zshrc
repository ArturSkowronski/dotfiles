zmodload zsh/zprof
#Load Plugin Framework
. ~/.shell/init/prezto.sh
# . ~/.shell/init/antigen.sh

set +o noclobber

# Load Environment
. ~/.shell/variables.sh
. ~/.secrets.sh
. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.shell/scripts.sh

# Initialize Environment
. ~/.shell/init/prompt.sh
. ~/.shell/init/iterm.sh

# taocl

# . ~/.shell/init/conda.sh
# . ~/.shell/init/sdkman.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/askowronski/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/askowronski/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/askowronski/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/askowronski/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# bun completions
[ -s "/Users/askowronski/.bun/_bun" ] && source "/Users/askowronski/.bun/_bun"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/Projects/TornadoVM/setvars.sh"
# pnpm
export PNPM_HOME="/Users/askowronski/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Lazy load NVM for faster startup
. ~/.shell/lazy-nvm.sh
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/askowronski/.docker/completions $fpath)
# Optimized compinit - only run if completions are older than 24 hours
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# End of Docker CLI completions

# Add Docker CLI to PATH
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# opencode
export PATH=/Users/askowronski/.opencode/bin:$PATH
