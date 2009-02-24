source ~/bin/git-completion.bash
export PATH=$PATH:~/bin:/usr/local/mysql/bin/

PS1="\[\e[32m\]\W\$(__git_ps1 '(%s)')>\[\e[0m\] "

# History
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=100000
shopt -s histappend

# Aliases
alias ll='ls -al'
alias mkpl='php ~/Sites/plugins/make_txp/make.php'

# Vi mode ftw
#set -o vi

