##############################################################################
# Paths                                                                   {{{1
##############################################################################

# Bash completion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Load bash scripts
if [ -d ~/bash ]; then
  for f in ~/bash/*; do
    . $f
  done
fi


##############################################################################
# ENV                                                                     {{{1
##############################################################################

export EDITOR=vim

# convert raw color codes (for paging colorized output)
export LESS="-R"

# color by default for grep
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;31'

# MySQL prompt: user@database>
export MYSQL_PS1="\u@\d> "

# prevent incorrect line-wrapping when the terminal is resized
# see: <http://forums.gentoo.org/viewtopic-t-112348-highlight-bash+wrap.html>
shopt -s checkwinsize

# case insensitive
shopt -s nocaseglob

# PS1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
# if git is available, show the branch status in the prompt
[[ $(command -v __git_ps1) ]] && \
  g=" \$(__git_ps1 '(\[$txtred\]%s\[$txtrst\])')" || g=""
export PS1="\n\h:\[$undblu\]\w\[$txtrst\]$g\n\[$txtred\]\\$ \[$txtrst\]"
unset g

# PS2 (continuation prompt)
export PS2="\[$txtred\]>>> \[$txtrst\]"


##############################################################################
# History                                                                 {{{1
##############################################################################

# erase duplicates and ignore spaces
export HISTCONTROL=erasedups:ignorespace

# 100000 entries
export HISTSIZE=100000

# store the date & time with each command
export HISTTIMEFORMAT="%Y-%m-%d %T "

# don't overwrite the history file
shopt -s histappend

# store multiline-commands into one line so they're easier to edit
shopt -s cmdhist


##############################################################################
# Aliases                                                                 {{{1
##############################################################################

# use vi-keys for info
alias info='info --vi-keys'

# page MySQL output
alias mysql='mysql --pager=less'

alias ll='ls -l'
alias lal='ls -al'

# OS-specific
if [[ $(uname) == "Darwin" ]]; then
  # `gls` might not be available -- best not to clobber `ls`
  [[ $(command -v gls) ]] && alias ls='gls --color=auto'
  alias gvim='mvim'
  alias pi='sudo port -v install'
  alias pu='sudo port -d selfupdate'
else
  alias ls='ls --color=auto'
fi


##############################################################################
# Functions                                                               {{{1
##############################################################################

# http://www.macosxhints.com/article.php?story=20060719155640762
# get the path of the topmost Finder window
function ff {
  osascript -e 'tell application "Finder"'\
            -e "if (${1-1} <= (count Finder windows)) then"\
            -e "get POSIX path of (target of window ${1-1} as alias)"\
            -e 'else' -e 'get POSIX path of (desktop as alias)'\
            -e 'end if' -e 'end tell'
}

function cdff {
  cd "$(ff $@)"
}

# vim: set fdm=marker:

