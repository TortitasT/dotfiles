setxkbmap -layout es
xautolock -time 5 -locker "i3lock -u -c 0f0f0f" &
feh --bg-scale ~/.config/i3/wallpaper.png
exec i3
