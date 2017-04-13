FROM ubuntu:latest
RUN apt-get update && apt-get install -my \
  curl \
  wget \
  php-curl \
  php-fpm \
  php-gd \
  php-xsl \
  php-mysqlnd \
  php-mcrypt \
  php-xdebug \
  php-cli \
  php-intl

RUN mkdir /run/php

ADD conf/www.conf /etc/php/7.0/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
ADD conf/memory.ini /etc/php/7.0/fpm/conf.d/memory.ini

WORKDIR /cms2

EXPOSE 9000

CMD ["php-fpm7.0"]
