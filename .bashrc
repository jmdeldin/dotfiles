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

# options for `less` - convert raw color codes (for paging colorized output)
export LESS="-R"

# recursive egrep
g(){
    opts=""
    # build exclude list
    exclude=(.git .svn .hg .swp)
    for f in ${exclude[*]}; do
        opts="${opts} --exclude '$f'"
    done

    egrep ${opts} \
         --before-context=5 --after-context=5 \
         --color=always \
         --recursive \
         --line-number \
         $*
}

