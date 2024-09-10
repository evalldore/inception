FROM debian:bullseye

RUN apt -y update 
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN mkdir /run/nginx

COPY ./tools/script.sh /
COPY conf/default /etc/nginx/sites-available/

RUN chmod +x script.sh

ENTRYPOINT [ "/script.sh" ]