FROM debian:buster

RUN apt -y update 
RUN apt install nginx -y
RUN apt install openssl -y

COPY ./tools/script.sh /
COPY ./tools/index.html ./var/www/html/index.html
COPY conf/default /etc/nginx/sites-available/default

CMD [ "/script.sh" ]