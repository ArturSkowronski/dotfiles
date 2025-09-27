zmodload zsh/zprof
#Load Plugin Framework
. ~/.shell/init/prezto.sh
. ~/.shell/scripts/lazy-compinit.sh
. ~/.shell/init/fzf.sh

set +o noclobber

# Load Environment
. ~/.shell/variables.sh
. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.shell/scripts.sh
. ~/.secrets.sh

# Initialize Environment
# . ~/.shell/init/antigen.sh
. ~/.shell/init/prompt.sh
. ~/.shell/init/iterm.sh
. ~/.shell/init/fnm.sh
. ~/.shell/init/pnpm.sh
# . ~/.shell/init/bun.sh
# . ~/.shell/init/conda.sh
. ~/.shell/init/sdkman.sh
. ~/.shell/init/gcloud.sh
. ~/.shell/init/pyenv.sh
. ~/.shell/init/kiro.sh
. ~/.shell/init/tornadovm.sh