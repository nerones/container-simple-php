FROM php:5.6.24-apache
RUN apt-get update \
    && apt-get install -y libcurl4-gnutls-dev libjpeg-dev libpng12-dev libsqlite3-dev libpq-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite \
    && docker-php-ext-configure gd --with-jpeg-dir=usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install curl mysql mysqli pdo_mysql pdo_sqlite pdo_pgsql pgsql mcrypt bcmath zip gd mbstring calendar \
    && pecl install -o -f xdebug apcu-4.0.10 \
    && rm -rf /tmp/pear \
    && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so\nxdebug.profiler_enable_trigger=1\nxdebug.profiler_output_dir="/var/www/html/tmp"\nxdebug.remote_connect_back=1\nxdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/
COPY ./mpm_prefork.conf /etc/apache2/mods-available/mpm_prefork.conf
