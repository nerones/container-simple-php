FROM php:7.1.33-apache
RUN apt-get update \
    && apt-get install -y libfontconfig libxrender1 libxtst6 libcurl4-gnutls-dev libjpeg-dev libpng-dev libsqlite3-dev libpq-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite \
    && docker-php-ext-configure mcrypt \
    && docker-php-ext-install curl mysqli pdo_pgsql pdo_sqlite pdo_mysql pgsql bcmath zip gd mbstring
RUN pecl install -o -f xdebug-2.9.8 apcu mcrypt-1.0.0 \
    && rm -rf /tmp/pear \
    && echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/apcu.so" > /usr/local/etc/php/conf.d/apcu.ini \
    && echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/mcrypt.so" > /usr/local/etc/php/conf.d/mcrypt.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/xdebug.so\nxdebug.profiler_enable_trigger=1\nxdebug.profiler_output_dir="/var/www/html/tmp"\nxdebug.remote_connect_back=1\nxdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/
