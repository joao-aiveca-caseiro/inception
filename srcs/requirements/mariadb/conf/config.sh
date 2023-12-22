#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
service mariadb start;

sleep 5;

service mariadb status

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"
fi


exec mysqld_safe --bind-address=0.0.0.0