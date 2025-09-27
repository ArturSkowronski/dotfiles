# fnm (Fast Node Manager)
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd)"
  fnm use --install-if-missing 22.20.0 > /dev/null 2>&1 || true
  # Override any lazy loading functions that might interfere
  unset -f node npm 2>/dev/null || true
fi