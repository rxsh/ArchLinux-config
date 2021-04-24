
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
  [ -s "$f" ] && . "$f"
 done
 unset fi
fi

# Transparencia
picom &

# DobleMonitor

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-1-1 --mode 1920x1080 --pos 0x0 --rotate normal &

# Keyboard layout
setxkbmap es &

# Wallpaper 
feh --bg-scale Downloads/wallpaper.jpg &

# Audio
pulseaudio &

# Volume Icon

volumeicon &

# Battery icon

cbatticon &

# Brightnessctl

brightnessctl &

# Rofi

rofi &

# Udiskie

udiskie -t &

# Wifi icon

nm-applet &
