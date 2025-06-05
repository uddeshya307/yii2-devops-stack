FROM php:8.3-fpm


WORKDIR /var/www/html


COPY . .


RUN apt-get update && \
    apt-get install -y git zip unzip curl && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install pdo pdo_mysql


RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer


RUN chown -R www-data:www-data /var/www/html/sample-php-yii2-app/web/assets && \
    chmod -R 775 /var/www/html/sample-php-yii2-app/web/assets



RUN cd sample-php-yii2-app && \ 
    composer require yiisoft/yii2-debug


EXPOSE 9000

CMD ["php-fpm"]
