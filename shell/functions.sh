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

#http://zwischenzugs.tk/index.php/2015/06/14/my-favourite-docker-tip/
function basher() {
    if [[ $1 = 'run' ]]
    then
        shift
        /usr/bin/docker run -e
            HIST_FILE=/root/.bash_history
            -v $HOME/.bash_history:/root/.bash_history
            "$@"
    else
        /usr/bin/docker "$@"
    fi
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

 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }


function docker-srmachine() {
    if [[ $1 = 'set' ]]
    then
        echo 'eval "$(docker-machine env '$2')"' >! ~/.shell/config/docker-machine
    else
        docker-machine "$@"
    fi
}

function sit() {
    case "$1" in

    'wtemp')  timestamp=$(date +%s)
        git clone git@github.com:smartrecruiters/$2.git $2'-'$timestamp
        ;;
    'wclone') git clone git@github.com:smartrecruiters/$2.git $3
        ;;
    'pclone')
        git clone git@github.com:arturskowronski/$2.git $3
        ;;
    *) git $@
       ;;
    esac
}
alias g=sit

function init() {
    eval "$(scalaenv init -)"
    eval "$(jenv init -)"
    export SDKMAN_DIR="/Users/arturskowronski/.sdkman"
    [[ -s "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"
}

function taocl() {
  printf '%20s\n' | tr ' ' -
  cat /Users/arturskowronski/Misc/taocl |
  pandoc -f markdown -t html |
  xmlstarlet fo --html --dropdtd |
  xmlstarlet sel -t -v "(html/body/ul/li[count(p)>0])[$RANDOM mod last()+1]" |
  xmlstarlet unesc | fmt -80
  printf '%20s\n' | tr ' ' -
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

alias docker-machine=docker-srmachine
alias g=sit
