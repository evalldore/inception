FROM debian:latest

RUN apt update
RUN apt upgrade
RUN apt install mariadb-server -y

COPY tools/script.sh /

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init.sql /etc/mysql/
RUN mkdir /run/mysqld

CMD [ "/script.sh" ]