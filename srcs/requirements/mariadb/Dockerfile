FROM debian:bullseye

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY conf/config.sh config.sh

RUN chmod +x config.sh
RUN mysql_install_db

ENTRYPOINT ["./config.sh"]