#! /bin/sh

set -e

. /etc/X11/Xsession

trackpad_id=$(xinput --list | grep TouchPad | sed 's/.*id=\([0-9]*\).*/\1/')
xinput set-prop $trackpad_id "libinput Natural Scrolling Enabled" 1
xinput set-prop $trackpad_id "libinput Tapping Enabled" 1

ssh-add

xrandr --dpi 210
exec i3
