#! /bin/bash
if ! [ -d /var/www/html/wordpress ];
then
	sleep 10
	wget  http://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz -C /var/www/html
	rm -rf latest.tar.gz
	
	chown -R www-data:www-data /var/www/html/wordpress
	chmod -R 755 /var/www/html/wordpress

	mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	sed -i -r "s/database_name_here/${MARIADB_NAME}/g" /var/www/html/wordpress/wp-config.php
	sed -i -r "s/username_here/${MARIADB_USER}/g" /var/www/html/wordpress/wp-config.php
	sed -i -r "s/password_here/${MARIADB_U_PSWRD}/g" /var/www/html/wordpress/wp-config.php
	sed -i -r "s/localhost/mariadb/g" /var/www/html/wordpress/wp-config.php

	wp core install --allow-root --path=/var/www/html/wordpress --url=$WP_DOMAIN --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADM_PSWRD --admin_email=$WP_ADMIN_MAIL --skip-email
		
	wp user create $WP_USER --allow-root --path=/var/www/html/wordpress $WP_USER_MAIL --user_pass=$WP_USER_PSWRD --role=author

	chown -R www-data:www-data /var/www/html/wordpress
	chmod -R 775 /var/www/html/wordpress
fi

if ! [ -f /run/php ];
then
	mkdir -p /run/php
fi

/usr/sbin/php-fpm7.3 -y /etc/php/7.3/fpm/php-fpm.conf -F