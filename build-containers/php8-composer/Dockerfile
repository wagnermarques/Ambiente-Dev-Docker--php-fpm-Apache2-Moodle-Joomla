FROM php:8.1

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    libzip4 \
    libgd3 \
    libgd-dev \
    libicu-dev \
    libsodium-dev

# Install PHP extensions
RUN docker-php-ext-install gd intl zip sodium

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
