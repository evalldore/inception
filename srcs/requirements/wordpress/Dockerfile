FROM debian:buster

RUN apt update -y 
RUN apt install php-mysql -y
RUN apt install php-fpm -y
RUN apt install curl -y

COPY ./tools/script.sh /

CMD [ "/script.sh" ]
