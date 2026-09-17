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

# Auto-env: inside a project with .sdkmanrc (in cwd or any parent) use its versions,
# everywhere else fall back to the SDKMAN defaults. Loads SDKMAN on demand.
# (sdkman_auto_env=false in ~/.sdkman/etc/config — this hook replaces the built-in one.)
_sdk_auto_env() {
  local d="$PWD" rc=""
  while [[ "$d" != "/" && -n "$d" ]]; do
    [[ -f "$d/.sdkmanrc" ]] && { rc="$d"; break; }
    d="${d:h}"
  done
  if [[ -n "$rc" ]]; then
    if [[ "$rc" != "$_SDK_AUTO_ENV_DIR" ]]; then
      if [[ "$rc" == "$PWD" ]]; then
        sdk env > /dev/null
      else
        # `sdk env` only reads .sdkmanrc from cwd: hop there and back without
        # touching the dir stack (prezto sets AUTO_PUSHD) or OLDPWD.
        setopt local_options no_auto_pushd
        local here="$PWD" old="$OLDPWD"
        builtin cd -q "$rc" && sdk env > /dev/null
        [[ -d "$old" ]] && builtin cd -q "$old"   # so that `cd -` still goes where it should
        builtin cd -q "$here"
      fi
      export _SDK_AUTO_ENV_DIR="$rc"
    fi
  elif [[ -n "$_SDK_AUTO_ENV_DIR" ]]; then
    sdk env clear > /dev/null
    unset _SDK_AUTO_ENV_DIR
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _sdk_auto_env
_sdk_auto_env  # also apply to the directory the shell starts in

export SDKMAN_VERBOSE_MODE=false
