FROM debian:jessie
RUN apt-get update
RUN apt-get install -my \
  curl \
  wget \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-xsl \
  php5-mysqlnd \
  php5-mcrypt \
  php5-xdebug \
  php5-cli \
  php5-intl \
  git \
  zip \
  php5-apcu

RUN mkdir /run/php

ADD conf/www.conf /etc/php5/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php5/fpm/php-fpm.conf
ADD conf/memory.ini /etc/php5/fpm/conf.d/memory.ini
ADD conf/upload_max_filesize.ini /etc/php5/fpm/conf.d/upload_max_filesize.ini

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

WORKDIR /symfony

EXPOSE 9000

CMD ["php5-fpm"]
