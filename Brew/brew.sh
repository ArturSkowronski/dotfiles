
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/boneyard

# Install `wget` with IRI support.
brew install wget --with-iri

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
# brew install xz

#OSX
brew install dark-mode
brew install git
brew install ack
brew install hub
brew install git-lfs #An open source Git extension for versioning large files https://git-lfs.github.com/
brew install git-open
brew install git-ignore
brew install imagemagick --with-webp
brew install p7zip #Tool for 7zip
brew install pigz #MultiProcessor gzip
brew install rename #PowerFull tool to Rename http://plasmasturm.org/code/rename/
brew install mac-cli
brew install ssh-copy-id #Copy SSH pub id to server
brew install tree

brew install webkit2png #ScreenShot of webpage
brew install zopfli #Compression algorithm
brew install pkg-config libffi
brew install pandoc

#Scala
brew install scala
brew install typesafe-activator
brew install sbt

#Shell
brew install ccat
brew install thefuck
brew install jq

#Clojure
brew install leiningen

#DB
brew install postgresql
brew install mongodb
brew install pgcli

#Tools
brew install highlight
brew install s3cmd
brew install ttyrec
brew install ffmpeg
brew install https://raw.githubusercontent.com/icholy/ttygif/master/ttygif.rb

brew install xmlstarlet
brew install pstree
brew install tmux
