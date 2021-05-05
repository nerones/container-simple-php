FROM php:7.2-apache-stretch
RUN apt-get update \
    && apt-get install -y libfontconfig libxrender1 zlib1g-dev libicu-dev \
       libxtst6 libcurl4-gnutls-dev libpng-dev libjpeg-dev libsqlite3-dev \
       libjpeg62-turbo-dev libfreetype6-dev \
       libpq-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite
RUN docker-php-ext-install curl mysqli pdo_pgsql pdo_sqlite pdo_mysql pgsql bcmath zip mbstring intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && pecl install -o -f xdebug apcu \
    && rm -rf /tmp/pear
RUN echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/apcu.so" > /usr/local/etc/php/conf.d/apcu.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so\nxdebug.profiler_enable_trigger=1\nxdebug.profiler_output_dir="/var/www/html/tmp"\nxdebug.remote_connect_back=1\nxdebug.remote_enable=1" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/
