# Personal bin
[[ -d ~/bin ]] && export PATH=~/bin:$PATH

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
if command -v show_prompt &> /dev/null; then
    export PS1=$(show_prompt)
fi

# History
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=100000
shopt -s histappend

# Aliases
alias info='info --vi-keys'
alias ll='ls -al'

