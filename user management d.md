## User management 

what is User Managemen?

User Administration is the process of managing different user accounts and their respective permissions in an operating system.In Linux or Unix-based 
operating systems, we can create different user accounts, sort them into groups, change their set of permissions or delete them. The terminal commands 
for each of the above-stated actions are discussed below.

**Requirements**


|OS|
|---|
|Ubuntu|

**User Create**

In this case first user create using This command

```bash
adduser username
```

**In ubuntu OS using useradd command, user create under /etc/sh and so avoid 

**output**

![Screenshot from 2022-05-03 20-19-51](https://user-images.githubusercontent.com/102893121/166482036-27ddd27e-4d69-44c8-9906-b1462cd3ec8c.png)

**set Sudo Privileges**

```bash
sudo usermod -aG sudo username
```
**change root or user**

```bash
sudo -i
su username 
```
to view the added user use this commant
```bash 
cat /etc/passwd |grep username
```
use **exit** it is used to exit the change user

**delete user**

```bash
sudo deluser focal 

sudo  sudo deluser focal --remove-home 
```
2nd commend is used to delete user and te user home directory

** Create group**
```bash 
sudo groupadd groupname
```
to verify the group created or not
```bash
getent group |grep groupname
```

then add the user to the create the group 
```bash
sudo usermod -aG groupname username
```
to verify user add the group

```bash
getent user|grep groupname
```
Next give permission to access to root file for the group 

in this section files are here in sudo user directries 

to change group file using this command

```bash
chgrp groupname filename
```

in this case other user do not access the fle so change file permission
```bash
chmod 750 filename
```
![Screenshot from 2022-05-04 17-21-34](https://user-images.githubusercontent.com/102893121/166675778-c05b5b1e-b21a-4c15-9061-cd0a5f74a90f.png)



then check output samp
le usera access demo a_b.txt but not access demo c-d.txt

**output**

![Screenshot from 2022-05-04 17-29-58](https://user-images.githubusercontent.com/102893121/166677264-6130ced0-49c5-4624-a845-f5b44602d21d.png)

