case $1 in
lxde)
    startlxde
    ;;
dwm)
    xset +fp /usr/share/fonts/local
    xset fp rehash
    conky | while read -r; do xsetroot -name "$REPLY"; done &
    exec dwm
    ;;
*)
    exec dbus-launch ~/.xstart
    ;;
esac
