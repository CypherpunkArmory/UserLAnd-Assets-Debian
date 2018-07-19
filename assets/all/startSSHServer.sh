#! /bin/bash

if [ ! -d /etc/dropbear ]; then
    mkdir /etc/dropbear
fi

if [ ! -f /etc/dropbear/dropbear_dss_host_key ]; then
    dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
fi

if [ ! -f /etc/dropbear/dropbear_rsa_host_key ]; then
    dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
fi

dropbear -E -p 2022
