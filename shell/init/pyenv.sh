# pyenv: shims added statically (instant); full `pyenv init` runs lazily
# on the first `pyenv` invocation (rehash, shell integration).
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

pyenv() {
  unfunction pyenv
  eval "$(command pyenv init - --no-rehash zsh)"
  pyenv "$@"
}
