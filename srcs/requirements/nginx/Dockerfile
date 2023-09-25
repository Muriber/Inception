FROM	debian:buster

RUN		apt-get update

RUN		apt-get install nginx -y
RUN		apt-get install openssl -y

RUN		mkdir /etc/nginx/ssl
COPY	/conf/nginx.conf /etc/nginx/nginx.conf

COPY	/tools/init_conf.sh ./init_conf.sh

EXPOSE	443

RUN		mkdir -p /var/run/nginx
CMD		["./init_conf.sh"]
