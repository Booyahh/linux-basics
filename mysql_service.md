## mysql


![]()

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


