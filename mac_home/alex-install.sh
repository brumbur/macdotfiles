# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# colorls (to show file icons, etc.)
gem install colorls

# patched nerd fonts
# https://github.com/ryanoasis/nerd-fonts
brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-Fira-Code-nerd-font
brew install font-hack-nerd-font

# hyper
brew install --cask hyper

# add plugins or just use hyper.js
hyper i hyper-one-dark
hyper i hyper-font-ligatures
hyper i hyper-active-tab

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# antigen -> all plugins already configured in .zshrc-alex
curl -L git.io/antigen > antigen.zsh

# source ~/.other

# ssh
ssh-add -K ~/.ssh/id_ed25519
ssh-add -K ~/.ssh/id_rsa
