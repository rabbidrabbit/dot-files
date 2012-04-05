if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
    screen -d -m startx && vlock
fi
