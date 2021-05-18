FROM php:7.4-fpm

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libonig-dev
RUN apt-get install -y curl libcurl4-openssl-dev

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd
RUN docker-php-ext-install pdo pdo_mysql mysqli gmp gd soap mbstring json


