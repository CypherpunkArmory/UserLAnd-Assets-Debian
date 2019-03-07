#!/bin/bash

docker-compose -f debian.yml -f $1.yml down
docker-compose -f debian.yml -f $1.yml build
docker-compose -f debian.yml -f $1.yml up
mkdir -p release
cp output/rootfs.tar.gz release/$1-rootfs.tar.gz
mkdir -p release/assets
cp assets/* release/assets/
cp output/busybox release/assets/
cp output/libdisableselinux.so release/assets/
tar -czvf release/$1-assets.tar.gz -C release/assets/ .
rm -rf release/assets
