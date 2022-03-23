#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Display Resolution
xrandr --output Virtual-1 --mode 1920x1080 &

# Compositor
picom -f &

# Uncomment and edit to set the wallpaper.
xwallpaper --zoom ~/.config/wall

# Hides the mouse cursor after 3 seconds of inactivity
unclutter -idle 3 &

# Uncomment to load xresources file
#xrdb ~/.Xresources &

# Start slstatus
slstatus &

# Lock screen after 5min of inactivity
~/.config/xssstate/xsidle.sh slock &
xset s 300

# Start dwm, saving a log
exec dwm

