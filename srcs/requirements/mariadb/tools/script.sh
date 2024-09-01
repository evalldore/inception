#!/bin/bash

echo "Launching mariadb!"

sed -i 's|MYSQL_DATABASE|'${MYSQL_DATABASE}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_PASSWORD|'${MYSQL_PASSWORD}'|g' /etc/mysql/init.sql
sed -i 's|MYSQL_ROOT_PASSWORD|'${MYSQL_ROOT_PASSWORD}'|g' /etc/mysql/init.sql

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]

then
	echo "Database already exists."
	mysqld_safe

else
	#mysql_upgrade
	mysqld

fi
