FROM debian:bullseye

RUN apt update -y 
RUN apt install curl -y
RUN apt install php7.4 -y
RUN apt install php7.4-fpm -y
RUN apt install php-mysqli -y

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/script.sh /

RUN mkdir run/php/
RUN chmod +x script.sh

CMD [ "/script.sh" ]
