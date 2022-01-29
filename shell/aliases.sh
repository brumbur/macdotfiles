#------------------
# Note: the following aliases overwrite any aliases specified in the Oh My Zsh plugins
#------------------
SCRIPT_DIR=${0:A:h}

# list various configs
alias shconfig='brew list && antigen list && hyper list && p10k help'
# Open .zshrc to be editor in VS Code
alias zshcfg="code ~/.zshrc"
# Re-run source command on .zshrc to update current terminal session with new settings
alias zshupdate="source ~/.zshrc"
# cd into iCloud drive folder in terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
# clear terminal
alias c='clear'
#sublime
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# exa
if [ -x "$(command -v exa)" ]; then
	# https://the.exa.website
	source $SCRIPT_DIR/exa-colors.sh
	alias lx='exa --classify --header --icons --git --binary --extended --long --modified --group --all --sort=.name  --group-directories-first'
	alias lxt='exa -la --icons --color-scale -x -F -G -T -L 3'
fi