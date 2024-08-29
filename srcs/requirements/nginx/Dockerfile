FROM debian:latest

RUN apt -y update 
RUN apt install nginx -y
RUN apt install openssl -y

COPY ./tools/script.sh /
COPY conf/default /etc/nginx/sites-available/

CMD [ "/script.sh" ]