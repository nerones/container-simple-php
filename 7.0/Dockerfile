FROM php:7.0.9-apache
RUN apt-get update \
    && apt-get install -y libcurl4-gnutls-dev libpng12-dev libpq-dev libsqlite3-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite \
    && docker-php-ext-install curl mysqli pdo_pgsql pdo_sqlite pdo_mysql pgsql mcrypt bcmath zip gd mbstring \
    && pecl install -o -f xdebug-beta apcu \
    && rm -rf /tmp/pear \
    && echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/apcu.so" > /usr/local/etc/php/conf.d/apcu.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so\nxdebug.profiler_enable_trigger=1\nxdebug.profiler_output_dir="/var/www/html/tmp"\nxdebug.remote_connect_back=1\nxdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/
