#!/bin/bash

# Install composer dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Generate application key
php artisan key:generate

# Run database migrations
php artisan migrate --force

# Optimize Laravel
php artisan optimize
php artisan config:cache
php artisan route:cache

# Start PHP-FPM
php-fpm
