################################################################# FUNCTIONS
function e {
    emacs $* &
    disown
}

if ! which pbcopy > /dev/null; then
    function pbcopy {
        xsel -i -b
    }
fi

if ! which pbpaste > /dev/null; then
    function pbpaste {
        xsel -o
    }
fi

function setup_prompt {
    PROMPT='%~ %F{red}%#%f '
    RPROMPT='%F{green}${vcs_info_msg_0_}%f %(?/%F{green}o/%F{red}x)%f'
}

function clean_prompt {
    PROMPT='%% '
    RPROMPT=''
}

function setup_ssh {
    eval `ssh-agent`
    ssh-add
}

function screenshot {
    id=$(xwininfo | fgrep 'Window id' | awk '{print $4}')
    import -window "$id" "$1"
}

function iv {
    feh --cache-thumbnails --fullscreen --auto-zoom --auto-rotate --borderless --draw-tinted --draw-exif --draw-filename $*
}

################################################################# ENV
export EDITOR=emacsclient
export HISTFILE=~/src/etc.priv/zhistory
export HISTSIZE=1000000
export SAVEHIST=1000000
export LESS="-R" # convert raw color codes for paging colors
export LESSHISTFILE=/dev/null # disable less history

################################################################# ALIASES
alias be='bundle exec'
alias ll='ls -l'
alias killfirst='sed "1d"'
alias now='cd ~/now'
alias grep='grep --color=auto'
alias fuck_this_track='~/bin/remove_track'

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

if [ $TERM = "dumb" ]; then
    unset zle_bracketed_paste # prevent ^[[2004h from showing up in emacs shell
fi

setup_prompt
