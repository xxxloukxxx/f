systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment DISPLAY XAUTHORITY
export _JAVA_AWT_WM_NONREPARENTING=1

xrdb -merge ~/.Xresources

xrandr --output DP-1 --off && xrandr --output HDMI-1 --auto 

sleep 1 && exec i3
