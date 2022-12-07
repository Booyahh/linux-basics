## mysql


![](https://camo.githubusercontent.com/76109812f3127b0f86940373897b04ac8943cb3c0f057f90046444480f61bafd/68747470733a2f2f692e696d6775722e636f6d2f77617856496d762e706e67)

**MySQL Complete remove**

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

![](https://camo.githubusercontent.com/76109812f3127b0f86940373897b04ac8943cb3c0f057f90046444480f61bafd/68747470733a2f2f692e696d6775722e636f6d2f77617856496d762e706e67)

**MySQL root passwd change**

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Nsdeva4036@';
GRANT all ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
```

**user creation**

```sql
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
```

 ALL PRIVILEGES – As previously seen, this grants a MySQL user full access to a specific database.
 * CREATE – Allows users to create new databases or tables.
 * DROP – Enables users to delete databases or users.
 * INSERT – Allows users to insert rows in tables.
 * DELETE – Allows users to delete rows from tables.
 * SELECT – with ‘SELECT’ permission, users are able to read the contents of a table.
 * UPDATE – Allows users to updates the rows in a table.
 * GRANT OPTION – Users can grant or remove the privileges of other users.

_check privileges_

```sql
SHOW GRANTS FOR 'newuser'@'localhost'
```

_revoke permission_

```sql
REVOKE INSERT ON testdb.* FROM newser'@'localhost';
FLUSH PRIVILEGES;
````

_Remove User_

```sql
DROP USER 'username'@'localhost';
```

_view user_

```sql
SELECT user FROM mysql.user;
# To view current user
SELECT current_user();
# To view current logged user
SELECT user, host, db, command FROM information_schema processlist;

```
![](https://camo.githubusercontent.com/76109812f3127b0f86940373897b04ac8943cb3c0f057f90046444480f61bafd/68747470733a2f2f692e696d6775722e636f6d2f77617856496d762e706e67)

**DB creation**

```aql
CREATE DATABASE test;
USE test;
SHOW DATABASES;

```

**Table creation**

```sql
CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

#view table
SHOW DATABASES

#get table details
DESCRIBE pet;

#insert table
INSERT INTO pet VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);

#to view insert data
SELECT * FROM pet;
```




