FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y curl php7.4-fpm \
        php-xmlrpc php-mysql php-curl php-gd php-mbstring php-xml php-soap \ 
        php-intl php-zip mariadb-client

RUN mkdir -p /run/php/ && chmod 755 /run/php/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh config.sh

RUN chmod +x config.sh

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["./config.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F", "-R"]