source ~/dotfiles/bash/bash_completion
export PATH=$PATH:~/bin:/usr/local/mysql/bin

# Prompt
# {green}cwd(git_branch)>{/green}
PS1="\[\e[32m\]\W\$(__git_ps1 '(%s)')>\[\e[0m\] "

# History
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=100000
shopt -s histappend

# Aliases
alias ll='ls -al'
alias php='/usr/local/php5/bin/php' # entropy.ch version

