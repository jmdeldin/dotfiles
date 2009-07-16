[[ -d ~/bin ]] && export PATH=$PATH:~/bin

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

# Load bash scripts
if [ -d ~/bash ]; then
    for f in ~/bash/*; do
        . $f
    done
fi

# Prompt
# cwd{red}(git_branch)>{/red}
PS1="\w\[\e[1;31m\]\$(git_prompt)>\[\e[0m\] "

# History
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=100000
shopt -s histappend

# Aliases
alias info='info --vi-keys'
alias ll='ls -al'
alias pi='sudo port -v install'

