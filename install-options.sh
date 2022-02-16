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

# ------------------------------------
# shell options - hyper, antigen, etc.
# ------------------------------------
echo " -- installing options from $SCRIPT_DIR"
# brew - optional packages
[[ -f "$SCRIPT_DIR/Brewfile.optional" ]] && $PATH_PREFIX/bin/brew bundle --file=~"$SCRIPT_DIR/Brewfile.optional"

# antigen
[[ ! -f "$USER_HOME/antigen.zsh" ]] && curl -L git.io/antigen > antigen.zsh &>/dev/null

# source custom vars and paths
if [[ -f "$SCRIPT_DIR/shell/.zprofile-local" ]]  && ! grep -q "zprofile-local" $USER_HOME/.zprofile; then
	printf "%s\n"  >> ~/.zprofile
	printf "source $SCRIPT_DIR/shell/.zprofile-local" >> ~/.zprofile
fi

# source p10k
if [[ -f "$SCRIPT_DIR/shell/.p10k.zsh" ]]  && ! grep -q "source ~/.p10k.zsh" $USER_HOME/.zshrc; then
	echo " -- configuring p10k prmpt..."
cat <<-EOF > ~/.zshrc.new
	# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
	# Initialization code that may require console input (password prompts, [y/n]
	# confirmations, etc.) must go above this block; everything else may go below.
	if [[ -r \"${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh\" ]]; then
	  source \"${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh\"
	fi
	
EOF
	cat ~/.zshrc >> ~/.zshrc.new

	# { printf "${p10k}"; cat ~/.zshrc } > ~/.zshrc.new
	cp ~/.zshrc ~/.zshrc.bak
	mv ~/.zshrc.new ~/.zshrc

	printf "\n%s\n" "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> ~/.zshrc
	printf "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc

	cp "$SCRIPT_DIR/shell/.p10k.zsh" ~/.p10k.zsh
fi

# all antigen plugins already configured in .zshrc-local
if [[ -f "$SCRIPT_DIR/shell/.zshrc-local" ]] && ! grep -q "zshrc-local" "$USER_HOME/.zshrc"; then
	printf "%s\n"  >> ~/.zshrc
	printf "source $SCRIPT_DIR/shell/.zshrc-local" >> ~/.zshrc
fi

# hyper
rm -f ~/.hyper.js && ln -s "$SCRIPT_DIR/hyper/.hyper.js" ~/.hyper.js

# key-bindings (macos only)
[[ ! $ARCH == $ARCH_Win64 ]] && $SCRIPT_DIR/macos/install.sh

# install docker (macos only)
[[ ! $ARCH == $ARCH_Win64 && $SCRIPT_DIR/docker/install-docker.sh

# colorls @update: no longer needed, using exa
# gem install colorls

# ssh
# $SCRIPT_DIR/.ssh/install.sh

# pip config
# aws config

echo " -- installed options ok"