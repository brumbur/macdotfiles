#------------------
# Note: the following aliases overwrite any aliases specified in the Oh My Zsh plugins
#------------------
SCRIPT_DIR=${0:A:h}

# list various configs
alias shconfig='brew list && antigen list && hyper list && p10k help'

# ssh config
alias sshconfig="subl ~/.ssh/config"

# Open .zshrc to be editor in VS Code
alias zshcfg="code ~/.zshrc"

# Re-run source command on .zshrc to update current terminal session with new settings
alias zshupdate="source ~/.zshrc"

# search for an alias
alias salias='alias | grep -i'

# cd into iCloud drive folder in terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# clear terminal
alias c='clear'

#sublime
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# Python3
alias python='python3'
alias pip='pip3'

# exa
if [ -x "$(command -v exa)" ]; then
	# https://the.exa.website
	# When --long --grid are used at the same time, --grid will only apply if the
	# resulting output will be at least EXA_GRID_ROWS long.
	export EXA_GRID_ROWS=3
	source $SCRIPT_DIR/exa-colors.sh

	alias l='exa'
	alias ls='exa --icons -1'
	alias ll='exa --icons --long --all'
	alias la='exa --icons --long -all'
	alias lsa='exa --classify --header --icons --git --binary --extended --long --modified --group --all --sort=.name --group-directories-first'
	alias lsg='exa --icons --long --git --git-ignore'
	alias lt='exa --icons --color-scale -x -F -G -T -L 3'
fi