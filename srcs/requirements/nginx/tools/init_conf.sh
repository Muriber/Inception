#! /bin/bash

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout $C_KEY -out $CERT -subj "$SUBJ_DATA"

sed -i -r "s|CERT|$CERT|" /etc/nginx/nginx.conf
sed -i -r "s|C_KEY|$C_KEY|" /etc/nginx/nginx.conf
sed -i -r "s|SERVER_NAME|$SERVER_NAME|" /etc/nginx/nginx.conf
sed -i -r "s|ROOT_PATH|$ROOT_PATH|" /etc/nginx/nginx.conf

sleep 10

nginx -g "daemon off;"