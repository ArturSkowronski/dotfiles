# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
# brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java

# Development tool casks
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant

# Misc casks
brew cask install google-chrome
brew cask install --appdir="/Applications" firefox

brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" intellij-idea	      
brew cask install --appdir="/Applications" lighttable

brew cask install --appdir="/Applications" postgres	    
brew cask install --appdir="/Applications" psequel
brew cask install --appdir="/Applications" robomongo	

#Utls
brew cask install --appdir="/Applications" flux	      
brew cask install --appdir="/Applications" retinizer	
brew cask install --appdir="/Applications" teamviewer	      
brew cask install --appdir="/Applications" todoist  
brew cask install --appdir="/Applications" simple-comic	
brew cask install --appdir="/Applications" steam	
brew cask install --appdir="/Applications" calibre	    
brew cask install --appdir="/Applications" cheatsheet

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
