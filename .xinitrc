#set the cursor
xsetroot -cursor_name left_ptr -solid '#121212'
setxkbmap -layout gb
xset +fp /usr/share/fonts/local
xset fp rehash
xset m 1 4
xbindkeys
exec xmonad
