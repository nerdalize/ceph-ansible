#!/bin/bash

echo "Waiting for ceph-disk to be installed"

while true; do
	if [ -f /usr/sbin/ceph-disk ]; then
		break
	fi
	sleep 30
done

echo "Ceph-disk was found in /usr/sbin/ceph-disk"

# Loop forever to act when new disks are attached
while true; do
	# Loop over all newly attached disks
	ceph-disk list | grep -Eo '.*other, unknown' | awk '{print $1}' | while read line
	do
		echo "Preparing disk ${line}"
		/usr/sbin/ceph-disk prepare ${line}
	done
	
	sleep 30
done	
