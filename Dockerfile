FROM php:8.2-apache
#COPY apache2.conf /etc/apache2
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libssl-dev pkg-config git    \  
        libzip-dev \
        zip \
    && pecl install mongodb 
	#&& pecl install xdebug-beta \
	#&& docker-php-ext-enable xdebug   ext-gd \ 
    #&& docker-php-ext-install zip
    #&& docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql \
    #&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    #&& docker-php-ext-install -j$(nproc) gd \

RUN docker-php-ext-install iconv mysqli pdo pdo_mysql \
# node
    #&& apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get install nodejs -yq
    # node
  
RUN echo "extension=mongodb.so" > $PHP_INI_DIR/conf.d/mongodb.ini

