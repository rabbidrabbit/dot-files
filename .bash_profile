export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:/bin:/home/jonathan/bin/heroku-client
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
screen -d -m startx && logout
fi

[[ -s "/home/jonathan/.rvm/scripts/rvm" ]] && source "/home/jonathan/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
