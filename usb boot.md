## USB BOOTING PROCESS

Insert the USB 
to find usb device
```bash
lsblk 
```

then
```bash
sudo fdisk /dev/sdb
```
type m

d - enter 3rd partion delete

d - enter 2nd partion delete

d - enter 1st partion delete

then type "partprobe"

then enter w

press q for quit

then Eject the USB so use below command

```bash
sudo umount /dev/sdb
```
then format the disk use below command

```bash
sudo mkfs.vfat -I /dev/sdb -- format the disk
```
finally using iso Image convert to bootable file use below command 

```bash
dd if=/home/username/downloads/ubuntu os of=dev/sdb
```
