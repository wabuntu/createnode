# createnode

```

sudo virsh net undefine default
sudo virsh net-define virbr0.xml
sudo virsh net-start virbr0
sudo virsh net define virbr1.xml
sudo virsh net-start virbr1


wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
sudo cp jammy-server-cloudimg-amd64.img /var/lib/libvirt/images/node01-vda.qcow2

virsh console node03
ssh ubuntu@192.168.122.5 sudo /sbin/remove-juju-services
juju add-machine ssh:ubuntu@192.168.122.5
juju deploy ./bundle.yaml --map-machines=existing




```
