FROM	debian:buster

RUN		apt-get update
RUN		apt-get install -y php7.3 php-mysqli php-fpm php-mysql php-pgsql php-fpm php-cli php-gd mariadb-client
RUN		apt-get install -y curl wget

RUN		mkdir -p var/www/html

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN		chmod +x /wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	/conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

RUN		mkdir /run/php
RUN		service php7.3-fpm start

COPY	/tools/init.sh ./

RUN		chmod +x init.sh

EXPOSE 9000

CMD	["/init.sh"]