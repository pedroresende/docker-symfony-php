FROM php:7.4.3-fpm-buster

LABEL maintainer="Pedro Resende <pedroresende@mail.resende.biz>"

ENV TZ=Europe/Lisbon
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -my \
  acl \
  curl \
  git \
  libcurl4-openssl-dev \
  libfreetype6-dev \
  libfuse-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libssl-dev \
  libxml++2.6-dev \
  libzip-dev \
  rsync \
  ssh \
  wget \
  zip

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd bcmath intl zip curl pdo_mysql mysqli

RUN mkdir /run/php

ADD opcache.ini /usr/local/etc/php/conf.d/10-opcache.ini

RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

WORKDIR /symfony

EXPOSE 9000

CMD ["php-fpm"]
