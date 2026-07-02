# SDKMAN: JAVA_HOME and candidate bins set statically via stable `current`
# symlinks (instant); sdkman-init.sh loads lazily on the first `sdk` call.
export SDKMAN_DIR="$HOME/.sdkman"
export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
for _c in "$SDKMAN_DIR"/candidates/*/current/bin(N); do
  export PATH="$_c:$PATH"
done
unset _c

sdk() {
  unset -f sdk
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh" > /dev/null 2>&1
  sdk "$@"
}

# Auto `sdk env` when entering a directory with .sdkmanrc (loads SDKMAN on demand)
sdkman_auto_env() {
  [[ -f ".sdkmanrc" ]] && sdk env
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd sdkman_auto_env

export SDKMAN_VERBOSE_MODE=false
