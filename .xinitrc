#!/bin/sh

#
# ~/.config/sx/sxrc
#

xset b on

setxkbmap -option ctrl:nocaps
setxkbmap -option grp:switch,grp:win_space_toggle, us,il

feh --no-fehbg --bg-fill '/home/void/pics/pawel-czerwinski-O9SoTdFD1gA-unsplash.jpg'

picom -cf --vsync &

redshift -c ~/.config/redshift.conf &

exec dwm
