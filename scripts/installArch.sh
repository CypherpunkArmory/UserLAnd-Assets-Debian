#! /bin/bash

export ARCH_DIR=output/$1
export ROOTFS_DIR=$ARCH_DIR/rootfs
export INSTALL_DIR=assets/$1

if [ "$1" != "all" ]
then
    split -d -b 50M $ARCH_DIR/rootfs.tar.gz "$INSTALL_DIR/rootfs.tar.gz.part"
    cp $ARCH_DIR/libdisableselinux.so $INSTALL_DIR/libdisableselinux.so
    cp $ARCH_DIR/busybox $INSTALL_DIR/busybox
fi

rm -f $INSTALL_DIR/assets.txt; for f in $(ls $INSTALL_DIR); do echo "$f $(date +%s -r $INSTALL_DIR/$f)" >> $INSTALL_DIR/assets.txt; done
