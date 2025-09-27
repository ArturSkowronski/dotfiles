# Async compinit for much faster startup
autoload -Uz compinit
# Run compinit in background to avoid blocking shell startup
{
  if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
  else
    compinit -C
  fi
} &!