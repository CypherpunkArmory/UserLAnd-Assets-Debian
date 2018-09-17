#! /bin/bash

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user"
fi
if [[ -z "${INITIAL_PASSWORD}" ]]; then
  INITIAL_PASSWORD="userland"
fi

useradd $INITIAL_USERNAME -s /bin/bash -m -u 5000 
echo $INITIAL_USERNAME:$INITIAL_PASSWORD | chpasswd
chsh -s /bin/bash $INITIAL_USERNAME
