#! /bin/bash

useradd user -s /bin/bash -m -u 2048
echo user:userland | chpasswd
chsh -s /bin/bash user
