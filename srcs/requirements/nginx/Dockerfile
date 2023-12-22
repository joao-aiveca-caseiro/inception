FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=PT/L=Lisbon/O=Inception/CN=jaiveca-.42.fr"

COPY conf/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

CMD ["nginx", "-g", "daemon off;"]