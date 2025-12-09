FROM php:8.3-cli-alpine
RUN apk add --no-cache git zip unzip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY composer.json composer.lock ./
RUN composer install --no-interaction --optimize-autoloader --prefer-dist
COPY . .
CMD ["php", "index.php"]