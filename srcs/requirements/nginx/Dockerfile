FROM debian:buster

RUN apt -y update && apt install -y nginx

COPY ./tools/script.sh /
COPY ./tools/index.html ./usr/share/nginx/html/index.html
#COPY conf/default /etc/nginx/nginx.conf

CMD [ "/script.sh" ]