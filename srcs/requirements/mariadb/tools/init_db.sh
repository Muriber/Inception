#! /bin/bash

if ! [ -f /var/lib/mysql/init_db.sql ];
then
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;" > init_db.sql
	echo "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_U_PSWRD' ;" >> init_db.sql
	echo "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%' ;" >> init_db.sql
	echo "ALTER USER '$MARIADB_ROOT_USER'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD' ;" >> init_db.sql
	echo "FLUSH PRIVILEGES;" >> init_db.sql

	chmod 777 init_db.sql
	sleep 5

	mysql < init_db.sql
	mv	init_db.sql var/lib/mysql/init_db.sql

	kill $(cat /var/run/mysqld/mysqld.pid)

	mysqld 
else
	mysqld_safe 
fi
	