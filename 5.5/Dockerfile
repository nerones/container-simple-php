FROM php:5.5.23-apache
RUN apt-get update && apt-get install -y libpng12-dev libpq-dev libmcrypt-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite && docker-php-ext-install mysql mysqli pdo_pgsql pgsql mcrypt bcmath zip gd mbstring
COPY ./php.ini /usr/local/etc/php/
