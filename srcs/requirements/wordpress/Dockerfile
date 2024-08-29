FROM debian:latest

RUN apt update -y 
RUN apt install php-mysqli -y
RUN apt install php-fpm -y
RUN apt install curl -y

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY ./tools/script.sh /

CMD [ "/script.sh" ]
