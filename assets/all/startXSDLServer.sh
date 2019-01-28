#! /bin/bash

if [[ -z "${DISPLAY}" ]]; then
  DISPLAY=":4721"
fi

nohup twm & echo $! > /tmp/xsdl.pidfile