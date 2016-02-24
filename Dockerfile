FROM php:5.4.43-apache
RUN apt-get update \
    && apt-get install -y libcurl4-gnutls-dev libjpeg-dev libpng12-dev libpq-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite \
    && docker-php-ext-configure gd --with-jpeg-dir=usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install curl mysql mysqli pdo_pgsql pgsql mcrypt bcmath zip gd mbstring calendar \
    && pecl install -o -f xdebug \
    && rm -rf /tmp/pear \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so\nxdebug.profiler_enable_trigger=1\nxdebug.profiler_output_dir="/var/www/html/tmp"\nxdebug.remote_connect_back=1\nxdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/
