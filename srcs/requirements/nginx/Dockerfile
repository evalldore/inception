FROM debian:buster

RUN apt -y update && apt install -y nginx

COPY ./tools/script.sh /
COPY ./tools/index.html ./var/www/html/index.html
COPY conf/default /etc/nginx/conf.d/default.conf

CMD [ "/script.sh" ]