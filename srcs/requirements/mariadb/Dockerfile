FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY conf/config.sh config.sh

RUN chmod +x config.sh
RUN mysql_install_db

EXPOSE 3306

ENTRYPOINT ["./config.sh"]