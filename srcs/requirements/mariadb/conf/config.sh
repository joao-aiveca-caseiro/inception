#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
service mariadb start;

sleep 5;

service mariadb status

# mysqladmin -u root password "$DB_ROOT_PASSWORD"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -e "USE $DB_NAME; CREATE TABLE IF NOT EXISTS User (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255) NOT NULL, comment TEXT NOT NULL);"

mysql -u root -e "USE $DB_NAME, INSERT INTO User (username, comment) VALUES ('example_user', 'This is a comment.');"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"
echo AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
fi


exec mysqld_safe --bind-address=0.0.0.0