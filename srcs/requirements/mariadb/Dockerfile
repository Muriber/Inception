FROM	debian:buster
RUN		apt-get update

RUN		apt-get install -y mariadb-server

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	/tools/init_db.sh ./init_db.sh
RUN		chmod 777 init_db.sh
EXPOSE	3306

CMD		["./init_db.sh"]