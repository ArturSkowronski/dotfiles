#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh" > /dev/null 2>&1

# Fix for SDKMAN auto-env hook issue
sdkman_auto_env() {
    if [[ -f ".sdkmanrc" ]]; then
          sdk env
    fi
}

# # Add to chpwd (directory change) hook for auto-env
autoload -Uz add-zsh-hook
add-zsh-hook chpwd sdkman_auto_env

export SDKMAN_VERBOSE_MODE=false
