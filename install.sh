#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

ARCH_AMD64="i386"
ARCH_ARM64="arm"

ARCH=$(uname -p)

[[ $ARCH == $ARCH_AMD64 ]] && PATH_PREFIX="/usr/local"
[[ $ARCH == $ARCH_ARM64 ]] && PATH_PREFIX="/opt/homebrew"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if ! grep -q "export PATH_PREFIX" "$USER_HOME/.zprofile"; then
	echo "export PATH_PREFIX=\"$PATH_PREFIX\"" >> ~/.zprofile
	echo 'eval $($PATH_PREFIX/bin/brew shellenv)' >> ~/.zprofile
fi
source ~/.zprofile
[[ -f $SCRIPT_DIR/homebrew/Brewfile ]] && brew bundle --file=$SCRIPT_DIR/homebrew/Brewfile || \
	"Note: Could not find Bundle file, please install yourself the packages you want"

# Python3
alias python='python3'
alias pip='pip3'
pip3 install --user pipenv
pip3 install virtualenv
pip3 install virtualenvwrapper

# Docker Desktop
DOCKER_URL="https://desktop.docker.com/mac/main/amd64/Docker.dmg"
[[ $ARCH == $ARCH_AMD64 ]] && DOCKER_URL="$DOCKER_URL?utm_campaign=docs-driven-download-mac-amd64"
[[ $ARCH == $ARCH_ARM64 ]] && DOCKER_URL="$DOCKER_URL?utm_campaign=docs-driven-download-mac-arm64"
if [[ ! -d "/Applications/Docker.app" ]]; then
	curl $DOCKER_URL --output ~/Downloads/Docker.dmg
	hdiutil mount ~/Downloads/Docker.dmg
	sudo cp -R /Volumes/Docker/Docker.app /Applications
	hdiutil unmount /Volumes/Docker
fi

# --------------------
# custom shell options
# --------------------
# antigen
curl -L git.io/antigen > antigen.zsh

# all antigen plugins already configured in .zshrc-local
if [[ -f "$SCRIPT_DIR/shell/.zshrc-local" ]] && ! grep -q "zshrc-local" "$USER_HOME/.zshrc"; then
	echo "source $SCRIPT_DIR/shell/.zshrc-local" >> ~/.zshrc
fi

# source custom vars and paths
if [[ -f "$SCRIPT_DIR/shell/.zprofile-local" ]]  && ! grep -q "zprofile-local" "$USER_HOME/.zprofile"; then
	echo "source $SCRIPT_DIR/shell/.zprofile-local" >> ~/.zprofile
fi
	
# hyper
rm -f ~/.hyper.js && ln -s "$SCRIPT_DIR/.hyper.js" ~/.hyper.js

# brew - optional packages
[[ -f "$SCRIPT_DIR/Brewfile.optional" ]] && brew bundle --file=~"$SCRIPT_DIR/Brewfile.optional"



# colorls @update: no longer needed, using exa
# gem install colorls

# ssh
# $SCRIPT_DIR/.ssh/install.sh

# git config
# pip config
# aws config
