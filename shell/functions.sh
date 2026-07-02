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

# ch - browse chrome history
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

alias transfer=transfer

# function setjdk() {
#   if [ $# -ne 0 ]; then
#    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
#    if [ -n "${JAVA_HOME+x}" ]; then
#     removeFromPath $JAVA_HOME
#    fi
#    export JAVA_HOME=`/usr/libexec/java_home -v $@`
#    export PATH=$JAVA_HOME/bin:$PATH
#   fi
#  }

function init() {
    # eval "$(scalaenv init -)"
    # eval "$(jenv init -)"
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}

free-port() { kill "$(lsof -t -i :$1)"; }
kill-port() { kill -kill "$(lsof -t -i :$1)"; }

function taocl() {
  printf '%20s\n' | tr ' ' -
  cat $HOME/Misc/taocl |
  pandoc -f markdown -t html |
  xmlstarlet fo --html --dropdtd |
  xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
  xmlstarlet unesc | fmt -80
  printf '%20s\n' | tr ' ' -
}

function code-maat () {
  git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat >> logfile.log
  mv logfile.log $PRIV/code-maat
  pushd $PRIV/code-maat
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

# Load TornadoVM project environment on demand (sets JAVA_HOME, PATH to project JDK/maven/cmake)
tornado() {
  . "$HOME/Projects/TornadoVM/setvars.sh"
}

# yt-instrumental - download YouTube audio and extract instrumental and vocals
# Usage: yt-instrumental <youtube_url> [output_dir]
yt-instrumental() {
  local url="$1"
  local outdir="${2:-$HOME/Downloads}"

  if [[ -z "$url" ]]; then
    echo "Usage: yt-instrumental <youtube_url> [output_dir]"
    return 1
  fi

  echo "[1/3] Downloading audio..."
  local tmpdir=$(mktemp -d)
  yt-dlp -x --audio-format mp3 -o "$tmpdir/%(title)s.%(ext)s" "$url" || return 1

  local mp3file=$(ls "$tmpdir"/*.mp3 | head -1)
  if [[ -z "$mp3file" ]]; then
    echo "Error: MP3 download failed."
    rm -rf "$tmpdir"
    return 1
  fi

  echo "[2/3] Separating vocals (this may take a few minutes)..."
  demucs --two-stems=vocals -o "$tmpdir/demucs_output" "$mp3file" || return 1

  local title=$(basename "$mp3file" .mp3)
  local clean_title=$(echo "$title" | perl -Mutf8 -CS -pe 'tr/ąćęłńóśźżĄĆĘŁŃÓŚŹŻ/acelnoszzACELNOSZZ/; s/ /-/g')
  local target_dir="$outdir/$clean_title"
  local instrumental="$tmpdir/demucs_output/htdemucs/$title/no_vocals.wav"
  local vocals="$tmpdir/demucs_output/htdemucs/$title/vocals.wav"

  if [[ -f "$instrumental" && -f "$vocals" ]]; then
    echo "[3/3] Converting to MP3 and saving to $target_dir..."
    mkdir -p "$target_dir"
    cp "$mp3file" "$target_dir/${clean_title}_original.mp3"
    ffmpeg -hide_banner -loglevel error -i "$instrumental" -q:a 0 "$target_dir/${clean_title}_instrumental.mp3" -y
    ffmpeg -hide_banner -loglevel error -i "$vocals" -q:a 0 "$target_dir/${clean_title}_vocal.mp3" -y
    echo "Done! Saved to: $target_dir"
  else
    echo "Error: separated files not found."
    rm -rf "$tmpdir"
    return 1
  fi

  rm -rf "$tmpdir"
}

if [[ "$SHELL" == *zsh ]]; then
  zle -N :only
  bindkey "^Wo" :only
  bindkey "^W^O" :only
fi
