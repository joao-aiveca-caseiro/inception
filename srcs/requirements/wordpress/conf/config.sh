#!/bin/bash

sleep 5

if [ ! -f "/var/www/html/wp-config.php" ]; then
    if cd /var/www/html && wp core download --allow-root

    then
    wp config create --allow-root \
        --path=/var/www/html/ \
        --dbhost=$DB_HOST \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD && \
    wp core install \
        --allow-root \
        --title=$WP_TITLE\
        --admin_user=$WP_ADMIN_USER\
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL\
        --url=$WP_URL  && \
    wp user create\
        --allow-root \
        $WP_USER $WP_EMAIL \
        --user_pass=$WP_USER_PASSWORD
    echo "Successfully configured WordPress"
    fi
fi

exec "$@"