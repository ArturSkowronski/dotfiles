# pnpm
PNPM_HOME="$HOME/Library/pnpm"
if ! [ -d "$PNPM_HOME" ]; then return; fi
export PNPM_HOME
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
