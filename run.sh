NODE_VERSION=5

mkdir -p ~/Priv/
chsh -s /bin/zsh

ln -sf `pwd`/shell ~/.shell
ln -sf `pwd`/.zshrc ~/.zshrc
ln -sf `pwd`/.zpreztorc ~/.zpreztorc
ln -sf `pwd`/.gitignore_global ~/.gitignore_global
ln -sf `pwd`/shell/prezto ~/.zprezto
ln -sf `pwd`/atom/packages.cson ~/.atom/packages.cson
ln -sf `pwd`/shell/prezto/runcoms/zlogin ~/.zlogin
ln -sf `pwd`/shell/prezto/runcoms/zlogout ~/.zlogout
ln -sf `pwd`/shell/prezto/runcoms/zprofile ~/.zprofile
ln -sf `pwd`/shell/prezto/runcoms/zshenv ~/.zshenv

source ~/.shell/variables.sh

#Installing Brew and Application
./apps/bootstrap.sh

#Installing Stable Node
n stable
./apps/bootstrap.sh

#Installing GVM & Gradle
curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

legit install

dscacheutil -flushcache

curl -sSL https://get.rvm.io | bash
source /Users/arturskowronski/.rvm/scripts/rvm

defaults write com.apple.finder AppleShowAllFiles YES
killall Finder /System/Library/CoreServices/Finder.app

git config --global core.excludesfile '~/.gitignore'
git config --global user.name "Artur Skowronski"
git config --global user.email "me@arturskowronski.com"

defaults write com.apple.Dock showhidden -bool YES && killall Dock
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock show-recents -bool false



# echo "  Easter Egg seals are happy                                           ";
# echo "          (\/ )        _  _         ( \/)                              ";
# echo "           \  |       ( \/ )        |  /                               ";
# echo "            ) |        \  /         | (                                ";
# echo "           /  \         \/         /   \                               ";
# echo "         ,-    \       /  \       /    -,                              ";
# echo "        /6 6    \     / _  \     /     a a                             ";
# echo "     &/(_x_ ),_/.)   / 6 6  \   (.\_,( _x_)-/}                         ";
# echo "                  .-*>(_x_)< .-*                                       ";
# echo "                                                                       ";
