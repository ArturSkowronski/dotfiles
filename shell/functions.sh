mkcd () {
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

dls () {
 echo `ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/"`
}

dgrep() {
    # A recursive, case-insensitive grep that excludes binary files
    grep -iR "$@" * | grep -v "Binary"
}


transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

alias transfer=transfer

function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }

function init() {
    # eval "$(scalaenv init -)"
    # eval "$(jenv init -)"
    export SDKMAN_DIR="/Users/arturskowronski/.sdkman"
    [[ -s "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"
}

free-port() { kill "$(lsof -t -i :$1)"; }
kill-port() { kill -kill "$(lsof -t -i :$1)"; }

function taocl() {
  printf '%20s\n' | tr ' ' -
  cat /Users/arturskowronski/Misc/taocl |
  pandoc -f markdown -t html |
  xmlstarlet fo --html --dropdtd |
  xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
  xmlstarlet unesc | fmt -80
  printf '%20s\n' | tr ' ' -
}

function code-maat () {
  git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat >> logfile.log
  mv logfile.log ~/Priv/code-maat
  pushd ~/Priv/code-maat
    DIR_NAME=$(date '+%Y-%m-%d.%H.%M.%S')
    mkdir -p "reports/$DIR_NAME"
    mv logfile.log "reports/$DIR_NAME/"
    lein run -l "reports/$DIR_NAME/logfile.log" -c git -a summary >> "reports/$DIR_NAME/summary.log"
    lein run -l "reports/$DIR_NAME/logfile.log" -c git >> "reports/$DIR_NAME/data.log"
    lein run -l "reports/$DIR_NAME/logfile.log" -c git -a coupling >> "reports/$DIR_NAME/coupling.log"
    lein run -l "reports/$DIR_NAME/logfile.log" -c git -a age >> "reports/$DIR_NAME/age.log"
    rm "reports/$DIR_NAME/logfile.log"
    subl "reports/$DIR_NAME" 
  popd
}


:only() {
  PROG='!'"/^$$|ack/&&/$(basename $SHELL)"'$/{print$2}'
  ps -ao pid,ppid,comm= | awk "$PROG" | xargs kill
}

if [[ "$SHELL" == *zsh ]]; then
  zle -N :only
  bindkey "^Wo" :only
  bindkey "^W^O" :only
fi

# nvm() {
#     unset -f nvm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     nvm "$@"
# }
 
# node() {
#     unset -f node
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     node "$@"
# }
 
# npm() {
#     unset -f npm
#     export NVM_DIR=~/.nvm
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#     npm "$@"
# }
