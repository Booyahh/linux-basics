## assign static ip in ubuntu

In this example, assign the local network a static IP address.

```bash
cp /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak
```
`sudo vim 00-installer-config.yaml`

```bash
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
     dhcp4: no
     addresses: [192.168.1.233/24]
     gateway4: 192.168.1.1
     nameservers:
       addresses: [8.8.8.8,8.8.4.4]
```

