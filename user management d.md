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
**change root or user*

```bash
sudo -i
su username 
```
use **exit** it is used to exit the change user

**delete user**

```bash
sudo  sudo deluser focal --remove-home 
