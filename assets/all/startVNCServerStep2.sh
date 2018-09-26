#! /bin/bash

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user"
fi

if [[ -z "${INITIAL_VNC_PASSWORD}" ]]; then
  INITIAL_VNC_PASSWORD="userland"
fi

if [ ! -f /home/$INITIAL_USERNAME/.vnc/passwd ]; then

prog=/usr/bin/vncpasswd

/usr/bin/expect <<EOF
spawn "$prog"
expect "Password:"
send "$INITIAL_VNC_PASSWORD\r"
expect "Verify:"
send "$INITIAL_VNC_PASSWORD\r"
expect "(y/n)?"
send "n\r"
expect eof
exit
EOF

fi

rm /tmp/.X51-lock
rm /tmp/.X11-unix/X51
tightvncserver -kill :51
tightvncserver :51

while [ ! -f /home/$INITIAL_USERNAME/.vnc/localhost:51.pid ]
do
  sleep 1
done
cd ~
DISPLAY=localhost:51 xterm -geometry 80x24+0+0 -e /bin/bash --login &
