## mysql


![](https://camo.githubusercontent.com/76109812f3127b0f86940373897b04ac8943cb3c0f057f90046444480f61bafd/68747470733a2f2f692e696d6775722e636f6d2f77617856496d762e706e67)

Make sure MySQL is not running:

```sql
sudo systemctl stop mysql
```
Then purge all of the MySQL packages:

```sql
sudo apt purge mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-*
```
Then delete all of the MySQL files:

```sql
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql
```
Finally clean all packages that are not needed:

```sql
sudo apt autoremove
sudo apt autoclean
```


