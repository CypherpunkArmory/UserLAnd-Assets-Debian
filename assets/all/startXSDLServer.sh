#! /bin/bash

if [[ -z "${DISPLAY}" ]]; then
  DISPLAY=:4721
fi

if [[ -z "${PULSE_SERVER}" ]]; then
  PULSE_SERVER=localhost:4721
fi

until env DISPLAY=:4721 xmessage -timeout 1 ignore-this ; do sleep 1 ; done

nohup twm & echo $! > /tmp/xsdl.pidfile