#!/bin/bash

echo "Launching wordpress!"

sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/php/8.2/fpm/pool.d/www.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/8.2/fpm/pool.d/www.conf

if [ -f "${WP_PATH}/wp-config.php" ]

then
	echo "Wordpress already configured."
else
	echo "Configuring wordpress."
	cd /usr/local/bin
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar ./wp

	cd $WP_PATH
	wp core download --allow-root
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --allow-root
fi

php-fpm8.2 -F