FROM node:8.16-alpine

LABEL maintainer "Carimus <connect@carimus.com>"

ARG COMPOSER_VERSION=1.6.2

WORKDIR /home/node

RUN apk add -U \
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
    zlib-dev \
    libpng-dev \
    libtool \
    autoconf \
    automake \
    nasm \
    file \
    git

RUN apk add -U \
    php7 \
    php7-json \
    php7-phar \
    php7-openssl \
    php7-dom \
    php7-xml \
    php7-iconv \
    php7-mbstring \
    php7-simplexml \
    php7-pdo \
    php7-fileinfo \
    php7-tokenizer \
    php7-xmlwriter \
    php7-zlib \
    php7-session \
    php7-ctype

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION}

# Set base cache locations
ADD pip.conf /root/.pip/pip.conf
RUN npm config set cache ~/.npm --global && \
    yarn config set cache-folder ~/.cache/yarn

# Install awscli
RUN pip install awscli boto3

# Cleanup
RUN rm -rf /var/cache/* /tmp/* && mkdir /var/cache/apk
