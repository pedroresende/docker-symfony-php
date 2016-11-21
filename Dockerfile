FROM ubuntu:latest
RUN apt-get update && apt-get install -my \
  supervisor \
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

ADD . /host

