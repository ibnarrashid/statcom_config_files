#!/bin/sh

# ~/.xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
    done
    unset f
fi

wm=openbox-session

numlockx &
xrdb ~/.Xresources &
xbrightness 45000 &
urxvtd -q -o -f &
nitrogen --restore &
xcompmgr -cf -r 0 -D 5 &
xscreensaver -no-splash &

if [[ $wm == "dwm" ]]; then
    while true; do
        xsetroot -name "| LOAD: $(uptime \
            | sed -e 's/.*://;s/ //' \
            | tr -d ',') | TMP: $(acpi -t \
            | awk '{print $4, $6}' \
            | tr -d ',') | HR: $(date +"%T")"
        sleep 1
    done &
elif [[ $wm == "openbox-session" ]]; then
    sleep 1 && tint2 &
elif [[ $wm == "i3" ]]; then
    sleep 1 && urxvtc &
else
    echo -en "$wm WM/DE not found!"
    exit 1
fi

exec $wm

# EOF.
