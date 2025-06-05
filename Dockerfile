FROM php:8.3-fpm


WORKDIR /var/www/html


COPY ./sample-php-yii2-app .


RUN apt-get update && \
    apt-get install -y git zip unzip curl && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install pdo pdo_mysql


RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer


RUN chown -R www-data:www-data web/assets && \
    chmod -R 775 web/assets



RUN composer require yiisoft/yii2-debug --dev

RUN apt-get update && apt-get install -y imagemagick libmagickwand-dev && \
    pecl install imagick && \
    docker-php-ext-enable imagick


EXPOSE 9000

CMD ["php-fpm"]