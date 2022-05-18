## MySQL Install And create user Process (Ubuntu OS)

In this case first Update and install the MYsql USing this Command

Ctrl +Alt+ t - open terminal and 

```bash
sudo apt update
```
- update the previous files then 

```bash
Sudo apt-get install mysql-server -y
```
after install the server

check running status on the server using 
```bash
sudo systemctl status mysql.service
```
It complete status shown `Active` then going to coinfig process

## MYSQL Config process

 In this section first run secure Process Like Password, privilages set and etc... using this commant
 
 ```bash
 sudo mysql_secure_installation**
```
after enter the (yes or no) option 
set ROOT password and remind or note the Root password on your dairy or Note
then select your Password strenght (Low,medium,High) 
complete this section then move user,datebase,table creation privileges 

## Mysql user,datebase,table creation privileges

In this section we will show how to create user datebase table and the privileges 

first of all enter with ur root user and password using this comment

```bash
mysql -u root -p
```
then enter ur Root Password

then enter mysql server 

first create the user on the server using this command
```bash
CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'password';
```
(corrctly enter user name and password)

then check user is created or not using this command

```bash
select user from mysql.user;
```
then grant ALL privileges to user for this command

```bash
GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
```

in this section give specific database permission for this command

```bash
GRANT ON database_name.* TO 'sammy'@'localhost';
```

then save ur privilege changes using this command

```bash
fluses privileges;
```

and check ur privileges are assign or not using this commant

```bash
show grants for user1@localhost;
```

Next We will create database on Root user Set privilege to specify user

first create database on Root User account and give specify permission to user this account

```bash
create database database_name;
```

and check database are create or niot using this commant

```bash
show databases;
```

then give permission to access the user

```bash
grant all on user_name.* to user'3@'localhost';
```

check ur privileges are assign or not using this commant

```bash
show grants for user1@localhost;
```
To enter any database use this commant
```bash
use database name
```
To view the current database name
```bash
status;
```

in this section complete then next table create

**Next create table for the databases**

in this section first you enter ur user account 

then create table 

```bash
CREATE TABLE TABLE NAME( NAME varchar(50) , age int , address varchar(50) );
```

using this commant modify for ur changes

to view the table header name use below command

```bash
describe table_name;
```

then insert values to the Table using this commnad for ur values

```bash
insert into A(Memberid,MemberName,MemeberAge) values (3, 'deva1', 2);
```

to view the value you insert the table use below command

```bash
select * from table name;
```
 
complete the section Next How to get backup database and table
 
In this Section first how to backup single database for Mysql in below commant
 
 ```bash
 mysqldump -u root -p user1data > /home/deva/Mysql_bak/user1data_bak.sql
 ```

then create multiple databases backup in sinle comment

```bash
 mysqldump -u root -p --databases user1data user2data user3data > /home/deva/Mysql_bak/alldatabase_bak.sql
 ```

and Next create back in single Table

```bash
mysqldump -u root -p user1data A >/home/deva/Table_bak/single_bak.sql
```

and next Multiple table in single  command

```bash
mysqldump -u root -p user1data A B C >/home/deva/Table_bak/all_bak.sql
```

##Restore

in this section how to restore the bacup tables in single file

```bash
mysql -u root -p user3data < /home/deva/Table_bak/a3_bak.sql
```

Multiple table restore

```bash
mysql -u root -p user3data < /home/deva/Table_bak/all3_bak.sql
```

in this section restore single data base in mysql

in restore process first you remove privious databases using drop commant

create new empty database 

```bash
mysql -u root -p user1data < /home/deva/Mysql_bak/user1data_bak.sql
```

in this section restore single data base in mysql
**in this commant use is base terminal not mysql**

```bash
mysql -u root -p uset1 < /home/deva/Mysql_bak/alldatabase_bak.sql
```

restore single and mutiple restore process cmd is same.

to check the restore database table record
```bash
select count(*) from data_2;
```

## MySql backup database file transfer one server to another server

first enter the mysql console
backup ur need database using this command

```bash
 mysqldump -u root -p database name > file path/user1data_bak.sql
 ```
and tranfer ur file to another server using this command

```bash
scp source_file_name username@destination_host:destination_folder
```
once file transfered then next restore using this command **using command in base terminal not mysql console**

```bash
mysql -u root -p databasename < filepath/backup.sql;
```

to check the restore database table record
```bash
select count(*) from data_2;
```

