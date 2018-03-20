NODE_VERSION=5

mkdir -p ~/Priv/
chsh -s /bin/zsh

ln -sf `pwd`/.zsh ~/.zsh
ln -sf `pwd`/shell ~/.shell
ln -sf `pwd`/.zshrc ~/.zshrc
ln -sf `pwd`/.zpreztorc ~/.zpreztorc
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
