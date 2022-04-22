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

then eject the usb and re insert

type 

```bash
sudo umount /dev/sdb "no result shown"
```
then 

```bash
sudo mkfs.vfat -I /dev/sdb -- format the disk
```
finally using 

```bash
dd command dd if=pathname of=dev/sdb
```
