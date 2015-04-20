FROM php:5.4.39-apache
RUN apt-get update && apt-get install -y libpq-dev libmcrypt-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN a2enmod rewrite && docker-php-ext-install mysql pdo_pgsql pgsql mcrypt
COPY ./php.ini /usr/local/etc/php/
