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

#!/usr/bin/env zsh #adding this to force silly gist highlighting. REMOVE THIS

# ZSH standalone npm install autocompletion. Add this to ~/.zshrc file.
_npm_install_completion() {
	local si=$IFS

	# if 'install' or 'i ' is one of the subcommands, then...
	if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then

		# add the result of `ls ~/.npm` (npm cache) as completion options
		compadd -- $(COMP_CWORD=$((CURRENT-1)) \
			COMP_LINE=$BUFFER \
			COMP_POINT=0 \
			ls ~/.npm -- "${words[@]}" \
			2>/dev/null)
	fi

	IFS=$si
}

compdef _npm_install_completion 'npm'
## END ZSH npm install autocompletion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/arturskowronski/.sdkman" \
    && export SDKMAN_VERSION="5.0.0+51" \
    && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/Users/arturskowronski/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
