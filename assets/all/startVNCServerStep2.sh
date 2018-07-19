#! /bin/bash

if [ ! -f /home/user/.vnc/passwd ]; then

prog=/usr/bin/vncpasswd
mypass="userland"

/usr/bin/expect <<EOF
spawn "$prog"
expect "Password:"
send "$mypass\r"
expect "Verify:"
send "$mypass\r"
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

while [ ! -f /home/user/.vnc/localhost:51.pid ]
do
  sleep 1
done
cd ~
DISPLAY=localhost:51 xterm -geometry 80x24+0+0 -e /bin/bash --login &
