FROM php:7.4-apache

# pcntl is requirement of horizon
# docker-php-ext-install is installing args(extension name)
# docker-php-ext-configure is setting args(phpize config name)
# docker-php-ext-enable is enabling args(extension name)
RUN apt-get update \
    && apt-get install -y zip unzip vim libpq-dev \
    && pecl install xdebug \
    && docker-php-ext-install pdo_mysql pdo_pgsql pcntl \
    && docker-php-ext-enable xdebug
COPY php-base.ini $PHP_INI_DIR/conf.d/

COPY httpd-base.conf /etc/apache2/sites-available/laravel.conf
RUN a2dissite 000-default.conf && a2ensite laravel.conf && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
