FROM debian:11.8

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/config.sh config.sh
RUN chmod +x config.sh

EXPOSE 3306

CMD ["./config.sh"]