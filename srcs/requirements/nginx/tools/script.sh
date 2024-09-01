#!/bin/bash

echo "Launching nginx!"

SSL_SUBJECT="\
/C=CA\
/ST=Quebec\
/L=Quebec\
/O=42Quebec\
/OU=QuebecNumerique\
/CN=${DOMAIN_NAME}\
/UID=${USER}";
openssl	req -new \
			-newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 365 \
			-nodes \
			-out ${CERTS_CRT} \
			-keyout ${CERTS_KEY} \
			-subj	${SSL_SUBJECT}

sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/sites-available/default
sed -i 's|WP_PATH|'${WP_PATH}'|g' /etc/nginx/sites-available/default
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default
sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/sites-available/default
sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/sites-available/default

nginx -g "daemon off;"