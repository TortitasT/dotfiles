setxkbmap -layout es
xautolock -time 5 -locker "i3lock -u -c 0f0f0f" &
alttab -d 2 -bg #131020 -frame #c5c8c6 -font xft:Fira-Code-14 &
feh --bg-scale ~/.config/i3/wallpaper
# picom -f &
exec i3
