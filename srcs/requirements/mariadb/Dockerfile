FROM debian:bullseye

# ARG MYSQL_ROOT_PASSWORD
# ARG MYSQL_DATABASE
# ARG MYSQL_USER
# ARG MYSQL_PASSWORD

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY conf/config.sh config.sh
COPY conf/init.sql /docker-entrypoint-initdb.d/
RUN chmod +x config.sh

EXPOSE 3306

CMD ["./config.sh"]