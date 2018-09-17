#! /bin/bash

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user2"
fi
if [[ -z "${INITIAL_PASSWORD}" ]]; then
  INITIAL_PASSWORD="userland"
fi

useradd $INITIAL_USERNAME -s /bin/bash -m -u 4096 
echo $INITIAL_USERNAME:$INITIAL_PASSWORD | chpasswd
chsh -s /bin/bash $INITIAL_USERNAME

mkdir -p /home/$INITIAL_USERNAME/.vnc/
echo $INITIAL_PASSWORD | vncpasswd -f > /home/$INITIAL_USERNAME/.vnc/passwd
