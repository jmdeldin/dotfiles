[[ -d ~/bin ]]; export PATH=$PATH:~/bin

# MacPorts
if [ $(uname) == 'Darwin' ] && [ -d /opt/local ]; then
    export PATH=$PATH:/opt/local/bin:/opt/local/sbin
    export MANPATH=$MANPATH:/opt/local/share/man
fi;

# Bash completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi;
# Load custom configs
. ~/bash/completions

# Prompt
# {green}cwd(git_branch)>{/green}
PS1="\[\e[32m\]\W\$(__git_ps1 '(%s)')>\[\e[0m\] "

# History
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=100000
shopt -s histappend

# Aliases
alias ll='ls -al'
alias pi='sudo port -v install'

