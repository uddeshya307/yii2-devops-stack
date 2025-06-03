FROM php:8.3-fpm

COPY . yii2-devops-stack/sample-php-yii2-app
WORKDIR /sample-php-yii2-app
RUN docker-php-ext-install pdo pdo_mysql
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies
# RUN composer install --no-dev --optimize-autoloader

# RUN composer install --prefer-dist --no-scripts --no-dev --optimize-autoloader




EXPOSE 9000
#CMD ["php-fpm"]
# CMD ["php yii serve"]