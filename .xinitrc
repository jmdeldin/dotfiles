#! /bin/sh

. /etc/X11/Xsession

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
ssh-add
exec i3
