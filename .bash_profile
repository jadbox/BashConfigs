# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs



alias antFlash='ant compileSWF; ant build-ui-norules;'
alias antAssets='ant get-assets; ant get-locale;'
alias md='mkdir'
alias tarz='tar xzvf'
alias af='antFlash'
# alias wvim='ps ux | grep vim'

# export PATH="/home/jonathan/ctags/bin:$PATH"
cd MonsterPortalFB
