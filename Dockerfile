FROM jorge07/alpine-php:7.1-front

RUN addgroup -g 1000 www \
    && adduser -u 1000 -G www -s /bin/sh -D www \
    && apk add --no-cache --update rsync sshpass \
    && rm -rf /var/cache/apk/*
