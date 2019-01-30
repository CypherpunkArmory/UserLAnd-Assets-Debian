#! /bin/bash

if [[ -z "${DISPLAY}" ]]; then
  DISPLAY=:4721
fi

if [[ -z "${PULSE_SERVER}" ]]; then
  PULSE_SERVER=localhost:4721
fi

if [[ -z "${INITIAL_USERNAME}" ]]; then
  INITIAL_USERNAME="user"
fi

until env DISPLAY=:4721 ; do sleep 1 ; done

nohup twm & echo $! > /tmp/xsdl.pidfile

while [ ! -f /tmp/xsdl.pidfile ]
do
  sleep 1
done

su $INITIAL_USERNAME -c 'xterm -geometry 80x24+0+0 -e /bin/bash --login &'
