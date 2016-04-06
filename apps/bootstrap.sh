#!/bin/bash

now=$(date +"%T")

echo "Current time : $now"

set -e

export PATH=/usr/local/bin:$PATH

# Download and install Command Line Tools with a checking heuristic
echo "Check Xcode status..."
if [[ $(/usr/bin/gcc 2>&1) =~ "no developer tools were found" ]] || [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
  else
    echo -e "\033[32mXcode present"
fi

echo -e "\033[0mCheck Brew status..."
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Info   | Update   | brew"
	  brew update
    brew cask update
  else
    echo -e "\033[32mBrew present"
fi

echo -e "\033[0mCheck Python status..."
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
else
  echo -e "\033[32mPython present"
fi


echo -e "\033[0mCheck Ansible status..."
if [[ ! -x /usr/local/bin/ansible ]]; then
    brew install ansible
else
  echo -e "\033[32mAnsible present"
fi

echo -e "\033[0mUpdate Brew & Cask"
brew update
brew cask update

echo "USING $OSX_CONFIG/apps/main.yml"


ansible-playbook "$OSX_CONFIG/apps/main.yml" -i "$OSX_CONFIG/apps/hosts" --ask-sudo-pass

now=$(date +"%T")

echo "Current time : $now"
