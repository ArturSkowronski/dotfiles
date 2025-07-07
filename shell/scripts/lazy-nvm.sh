# Lazy loading for NVM - speeds up shell startup significantly
export NVM_DIR="$HOME/.nvm"

# Create nvm function that loads nvm on first use
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

# Create node, npm, and other common commands that will trigger nvm loading
for cmd in node npm npx yarn; do
    eval "${cmd}() { unset -f ${cmd}; nvm >/dev/null 2>&1; ${cmd} \$@; }"
done
