FROM debian:buster

ARG DB_ROOT_PASSWORD

RUN apt-get update && apt-get upgrade -y\
	&& apt-get install -y vim

RUN apt-get install -y mariadb-server

#configure mariadb to accept conecctions from any ip
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf


ADD wordpress.sql ./

ENTRYPOINT    [ ! -d "/var/lib/mysql/wordpress/" ] \
              && service mysql start \
              && sleep 2 \ 
              && mysql -u root < wordpress.sql  \
              && mysql -u root -e "USE mysql; ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" \
              && sleep 2 && mysqladmin -uroot -p${DB_ROOT_PASSWORD} shutdown \
              ; mysqld_safe 
