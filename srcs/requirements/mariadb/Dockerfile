FROM debian:latest

RUN apt -y update 
RUN apt install mariadb-server -y

COPY tools/script.sh /
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/init.sql /etc/mysql/

RUN chmod +x script.sh
RUN chown -R mysql:mysql /tmp/ && chown -R mysql:mysql /etc/mysql
RUN mkdir /run/mysqld

CMD [ "/script.sh" ]