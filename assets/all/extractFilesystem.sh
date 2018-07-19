#!/support/busybox sh

if [ ! -f /support/rootfs.tar.gz ]; then
   cat /support/rootfs.tar.gz.part* > /support/rootfs.tar.gz 
   rm -f /support/rootfs.tar.gz.part*
fi

/support/busybox tar -xzvf /support/rootfs.tar.gz -C /

if [[ $? == 0 ]]; then
	touch /support/.success_filesystem_extraction
else
	touch /support/.failure_filesystem_extraction
fi
