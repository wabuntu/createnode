#!/bin/bash

if [ $# -ne 2 ]; then
  echo "usage: $0 NAME NUMBER" 1>&2
  exit 1
fi
NAME=${1}
NODE=${2}

date;

virt-install --name ${NAME}${NODE} --vcpus 5 --ram 8192 \
--osinfo=ubuntu-lts-latest \
--cpu host-model \
--pxe --boot network,hd,menu=on --graphics spice \
--controller scsi,model=virtio-scsi,index=0 \
--disk path=/var/lib/libvirt/images/${NAME}${NODE}-vda.qcow2,size=32,format=qcow2 \
--disk path=/var/lib/libvirt/images/${NAME}${NODE}-vdb.qcow2,size=64,format=qcow2 \
--check path_in_use=off \
--network bridge=virbr0,mac=52:54:00:00:86:${NODE},model=virtio \
--network bridge=virbr1,mac=52:54:00:00:87:${NODE},model=virtio \
--check mac_in_use=off \
--cloud-init user-data=user-data
