FROM node:8.9-alpine

LABEL maintainer "Carimus <connect@carimus.com>"

ARG COMPOSER_VERSION=1.6.2

WORKDIR /home/node

RUN apk add -U \
    php5 \
    php5-json \
    php5-phar \
    php5-openssl \
    php5-dom \
    php5-xml \
    bash \
    curl \
    wget \
    make \
    gcc \
    g++ \
    groff \
    less \
    python \
    py-pip \
    zip \
    && ln `which php5` /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
    && rm -rf /var/cache/* /tmp/* \
    && mkdir /var/cache/apk
