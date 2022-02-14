#!/usr/bin/env zsh
SCRIPT_DIR=${0:A:h}
set -o magicequalsubst && USER_HOME=~

ARCH_AMD64="i386"
ARCH_ARM64="arm"
ARCH_Win64="x86_64"

ARCH=$(uname -p)

[[ $ARCH == $ARCH_AMD64 ]] && PATH_PREFIX="/usr/local"
[[ $ARCH == $ARCH_ARM64 ]] && PATH_PREFIX="/opt/homebrew"
[[ $ARCH == $ARCH_Win64 ]] && PATH_PREFIX="/home/linuxbrew/.linuxbrew/Homebrew"

# oh-my-zsh
[[ ! -d "$USER_HOME/.oh-my-zsh" ]] && \
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Homebrew
! type brew &>/dev/null && \
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	
if ! grep -q "export PATH_PREFIX" "$USER_HOME/.zprofile"; then
	printf "%s\n" >> ~/.zprofile
	printf "export PATH_PREFIX=$PATH_PREFIX" >> ~/.zprofile
	printf "%s\n" >> ~/.zprofile
	printf "export PATH=$PATH:$PATH_PREFIX" >> ~/.zprofile	
	printf "%s\n" >> ~/.zprofile
	printf 'eval $($PATH_PREFIX/bin/brew shellenv)' >> ~/.zprofile
fi
[[ -f $SCRIPT_DIR/homebrew/Brewfile ]] && $PATH_PREFIX/bin/brew bundle --file=$SCRIPT_DIR/homebrew/Brewfile || \
	"Note: Could not find Bundle file, please install yourself the packages you want"

# Python3
pip3 install --user pipenv &>/dev/null
pip3 install virtualenv &>/dev/null
pip3 install virtualenvwrapper &>/dev/null
python3 -m pip install --upgrade pip &>/dev/null
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

echo "Configuration of .dotfiles completed"
echo "To configure optional tools please run $SCRIPT_DIR/install-options.sh"

return