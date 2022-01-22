#------------------
# Aliases (for a full list of aliases, run `alias`). 
# Note: the following aliases overwrite any aliases specified in the Oh My Zsh plugins
#------------------
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Open .zshrc to be editor in VS Code
alias change="code ~/.zshrc"
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"
# Use the VS Code insiders build by default for the `code` CLI commands
alias co="code"
# cd into iCloud drive folder in terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# Clear terminal
alias c='clear'

# View files/folder alias using colorsls (https://github.com/athityakumar/colorls)
# if [ -x "$(command -v colorls)" ]; then
# 	alias l='colorls --group-directories-first --almost-all'
# 	alias la="colorls -al"
# 	alias ll='colorls --group-directories-first --almost-all --long'
# 	alias ls='colorls -h --group-directories-first -1'
# 	alias la='colorls -h --group-directories-first --almost-all --long'
# 	alias lla='colorls -h --group-directories-first --almost-all --long'
# 	alias lt='colorls --tree=3' # show as tree, 3 levels deep
# fi

# exa
if [ -x "$(command -v exa)" ]; then
	# ahttps://the.exa.website
	source $SCRIPT_DIR/exa-colors.sh
	alias lx='exa --classify --header --icons --git --binary --extended --long --modified --group --all --sort=.name  --group-directories-first'
	alias lxt='exa -la --icons --color-scale -x -F -G -T -L 3'
fi

#sublime
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
