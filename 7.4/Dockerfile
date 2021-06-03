FROM php:7.4-apache-buster
RUN apt-get update \
    && apt-get install -y libfontconfig libxrender1 zlib1g-dev \
       libxtst6 libcurl4-gnutls-dev libpng-dev libjpeg-dev libsqlite3-dev \
       libjpeg62-turbo-dev libfreetype6-dev libzip-dev libonig-dev \
       libpq-dev libmcrypt-dev --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && a2enmod rewrite
RUN docker-php-ext-install curl mysqli pdo_pgsql pdo_sqlite pdo_mysql pgsql bcmath zip mbstring exif \
    && docker-php-ext-configure gd --with-jpeg=usr/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install gd \
    && pecl install -o -f xdebug apcu \
    && rm -rf /tmp/pear
RUN echo "extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/apcu.so" > /usr/local/etc/php/conf.d/apcu.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/xdebug.so\nxdebug.start_with_request=trigger\nxdebug.output_dir="/var/www/tmp"\nxdebug.discover_client_host=1\nxdebug.mode=debug,profile,develop" > /usr/local/etc/php/conf.d/xdebug.ini
COPY ./php.ini /usr/local/etc/php/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer
