#!/bin/bash

echo "Launching mariadb!"

export MYSQL_USER=$(cat $(echo /run/secrets/db_user))
export MYSQL_PASSWORD=$(cat $(echo /run/secrets/db_user_password))
export MYSQL_ROOT_PASSWORD=$(cat $(echo /run/secrets/db_root_password))

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
