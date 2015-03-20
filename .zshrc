################################################################# FUNCTIONS
function e {
    emacs $* &
    disown
}

function pbcopy {
    xsel -i -b
}

################################################################# ENV
export EDITOR=emacsclient
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zhistory
export LESS="-R" # convert raw color codes for paging colors
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;31'
export MYSQL_PS1="\u@\d> " # MySQL prompt: user@database>

################################################################# ALIASES
alias ll='ls -l'
alias killfirst='sed "1d"'
alias cl='cd ~/src/theclymb'

if [[ $OSTYPE =~ "linux" ]]; then
    alias ls='ls --color=auto'
fi

################################################################# OPTIONS
autoload -U compinit && compinit                          # tab-completion
zstyle ':completion:*' menu select                        # interactive menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive
setopt autocd                                             # `~/d` == `cd ~/d`
setopt extendedhistory                                    # save the date
setopt inc_append_history                                 # append to HISTFILE
setopt histignorespace                                    # don't log ` cmd`
setopt share_history                                      # share w/active terms
bindkey -e                                                # use emacs keys

################################################################# PROMPT
# ~/path/to/dir % ls -al                            branch [exit status]

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla
zstyle ':vcs_info:*' formats "%b" # just the branch

precmd () { vcs_info }

PROMPT='%~ %F{red}%#%f '
RPROMPT='%F{green}${vcs_info_msg_0_}%f %(?/%F{green}o/%F{red}x)%f'
