FROM ubuntu:latest

RUN export DEBIAN_FRONTEND=noninteractive &&  apt-get update && apt-get install -my \
  curl \
  wget \
  php-curl \
  php-fpm \
  php-gd \
  php-xsl \
  php-mysqlnd \
  php-xdebug \
  php-cli \
  php-intl \
  php-bz2 \
  php-zip \
  php-mbstring \
  git \
  zip \
  php-apcu \
  php-opcache \
  --no-install-recommends

RUN ln -fs /usr/share/zoneinfo/Europe/Lisbon /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN mkdir /run/php

ADD conf/www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD conf/memory.ini /etc/php/7.2/fpm/conf.d/memory.ini
ADD conf/upload_max_filesize.ini /etc/php/7.2/fpm/conf.d/upload_max_filesize.ini

RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

EXPOSE 9000

CMD ["php-fpm7.2"]
