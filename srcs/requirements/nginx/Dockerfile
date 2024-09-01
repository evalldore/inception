FROM debian:latest

RUN apt -y update 
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

COPY ./tools/script.sh /
COPY conf/default /etc/nginx/sites-available/

RUN mkdir /run/nginx
RUN chmod +x script.sh

EXPOSE 443

CMD [ "/script.sh" ]