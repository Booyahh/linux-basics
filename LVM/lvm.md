## LVM configuration 

**Creating an LVM Logical Volume on Three Disks**


|Disk Name|
|-----|
|sdb,sdc,sdd|


create three disk physical volume using this command

```bash
pvcreate /dev/sda1 /dev/sdb1 /dev/sdc1
```

then create volume group for the above disk name `new_vol_group`

```bash
vgcreate new_vol_group /dev/sda1 /dev/sdb1 /dev/sdc1
```

After volume group created. 


