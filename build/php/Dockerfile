FROM php:8.3-fpm

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

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer \
  && wget https://get.symfony.com/cli/installer -O - | bash \
  && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN git config --global user.email "you@example.com" \
  && git config --global user.name "Your Name"

WORKDIR /symfony

EXPOSE 9000

CMD ["php-fpm"]
