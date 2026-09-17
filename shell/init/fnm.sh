# fnm (Fast Node Manager)
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  # --use-on-cd: follow .nvmrc / .node-version (searched up the tree); otherwise the fnm default
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
  # Override any lazy loading functions that might interfere
  unset -f node npm 2>/dev/null || true
fi