#!/bin/bash

if [ $# -ne 2 ]; then
  echo "usage: $0 NAME NUMBER" 1>&2
  exit 1
fi
NAME=${1}
NODE=${2}

date;

qemu-img resize focal-server-cloudimg-amd64.img 32G
cp focal-server-cloudimg-amd64.img /var/lib/libvirt/images/${NAME}${NODE}-vda.qcow2


virt-install --name ${NAME}${NODE} --vcpus 5 --ram 16384 \
--osinfo=ubuntu-lts-latest \
--cpu host-model \
--pxe --boot network,hd,menu=on --graphics spice \
--controller scsi,model=virtio-scsi,index=0 \
--disk path=/var/lib/libvirt/images/${NAME}${NODE}-vda.qcow2,size=32,format=qcow2 \
--disk path=/var/lib/libvirt/images/${NAME}${NODE}-vdb.qcow2,size=64,format=qcow2 \
--network bridge=virbr0,mac=52:54:00:00:00:${NODE},model=virtio \
--network bridge=virbr1,mac=52:54:00:00:00:${NODE},model=virtio \
--cloud-init user-data=user-data

#--noautoconsole
