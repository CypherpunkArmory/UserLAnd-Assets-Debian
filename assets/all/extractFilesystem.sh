#!/support/busybox sh

/support/busybox tar -xzvf /support/rootfs.tar.gz -C /

if [[ $? == 0 ]]; then
	touch /support/.success_filesystem_extraction
else
	touch /support/.failure_filesystem_extraction
fi
