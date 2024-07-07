FROM php:8.2-fpm-alpine

LABEL authors="Phan Minh Hung <hungpm372@gmail.com>"
LABEL version="1.0.0"
LABEL description="Docker image for PHP 8.2 FPM with Alpine Linux and Laravel 10 framework"
LABEL maintainer="Phan Minh Hung <hungpm372@gmail.com>"
LABEL vendor="Phan Minh Hung <hungpm372@gmail.com>"
LABEL license="MIT"
LABEL build-date="2024-07-07"
LABEL vcs-url="https://github.com/hungpm372/laravel-boilerplate"

# Set working directory
ARG workdir=/var/www/html

WORKDIR ${workdir}

# Install dependencies
RUN apk update
RUN apk add --no-cache \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    freetype-dev \
    libzip-dev \
    zip \
    bash \
    dos2unix

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install exif
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install -j$(nproc) gd

# Sync php.ini
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

# Copy source code
COPY . .

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy start script
COPY ./start.sh /var/www/html/start.sh

# Set permissions
RUN chmod +x /var/www/html/start.sh

# Run start script
CMD ["/var/www/html/start.sh"]
