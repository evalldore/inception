#!/bin/bash

echo "Launching wordpress!"

export MYSQL_USER=$(cat $(echo /run/secrets/db_user))
export MYSQL_PASSWORD=$(cat $(echo /run/secrets/db_user_password))
export MYSQL_ROOT_PASSWORD=$(cat $(echo /run/secrets/db_root_password))

export WP_ADMIN=$(cat $(echo /run/secrets/wp_admin))
export WP_ADMIN_PASSWORD=$(cat $(echo /run/secrets/wp_admin_password))
export WP_ADMIN_EMAIL=$(cat $(echo /run/secrets/wp_admin_email))
export WP_USER=$(cat $(echo /run/secrets/wp_user))
export WP_USER_PASSWORD=$(cat $(echo /run/secrets/wp_user_password))
export WP_USER_EMAIL=$(cat $(echo /run/secrets/wp_user_email))

sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.4/fpm/pool.d/www.conf

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
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=administrator --porcelain --allow-root
fi

php-fpm7.4 -F