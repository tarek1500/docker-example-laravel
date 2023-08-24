FROM composer

RUN docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR /var/www/html/laravel

COPY composer.json .
COPY composer.lock .

RUN composer install --no-scripts

COPY . .

RUN composer run post-autoload-dump

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
