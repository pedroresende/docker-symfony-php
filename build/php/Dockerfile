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

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

WORKDIR /symfony

EXPOSE 9000

CMD ["php-fpm7.0"]
