export PRIV="$HOME/Priv"
export PROJECTS="$HOME/Projects"
export DOTFILES="$PRIV/dotfiles"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$DOTFILES/scripts/macos:$PATH"

export GRAALVM_HOME="$HOME/Library/Java/JavaVirtualMachines/graalvm-ce-22.0.0/Contents/Home"
export JAVA_BABYLON_ROOT="$HOME/GitHub/babylon"

export GOPATH="$HOME/Projects/go"

export LLAMA_FP16_PATH="$HOME/.llama/models/Llama-3.2-1B-Instruct-f16.gguf"

# Prefer Docker Desktop when its CLI is available. If an inherited Podman
# DOCKER_HOST is present, clear it so Docker contexts can work normally.
if command -v docker >/dev/null 2>&1; then
  case "${DOCKER_HOST:-}" in
    *podman*)
      unset DOCKER_HOST
      ;;
  esac
elif command -v podman >/dev/null 2>&1; then
  export DOCKER_HOST=unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
fi
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_RYUK_DISABLED=true
