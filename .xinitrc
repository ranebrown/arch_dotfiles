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

# source .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# change graphics card performance to max
#nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1 > /dev/null

#get rid of screen tearing
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"

# custom key bindings
xbindkeys

# use osx color profile
xcalib ~/colorprofiles/mac_colors.icc

# set initial backlight and keyboard light
xbacklight -set 50
kbdlight set 20

#case statement for different window managers, default is xmonad
#use xinit windowmanager rather than startx
session=${1:-xmonad}
case $session in
	xmonad )
		# use regular pointer mouse rather than x
		xsetroot -cursor_name left_ptr
		#compositing - transparency, alpha channel
		#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
		#open certain apps
		thunderbird &
		firefox &
		# set background image
		feh --bg-scale ~/Downloads/ice.jpg
		exec xmonad
		;;
	gnome )
		exec gnome-session
		;;
	gnome-classic )
		export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
		export GNOME_SHELL_SESSION_MODE=classic
		exec gnome-session --session=gnome-classic
		;;
	* )
		exec $1
		;;
esac
