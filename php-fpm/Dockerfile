FROM php:fpm

# Install APCu extension
RUN pecl install apcu && docker-php-ext-enable apcu
RUN docker-php-ext-install pdo pdo_mysql mysqli