#!/bin/bash -xv

cd /usr/bin
mysql_install_db --datadir="/var/lib/mysql" --user=mysql 

mysqld_safe --datadir="/var/lib/mysql" --socket="/var/lib/mysql/mysql.sock" --user=mysql  &

sleep 15

mysqladmin -u root password root
 
#cat /var/log/mariadb/mariadb.log

mysql -uroot -proot "GRANT ALL ON *.* TO root@'%' IDENTIFIED by '' with GRANT OPTION"

mysql -u root -proot < /opt/create.sql
