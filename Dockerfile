FROM jorge07/alpine-php:7.1-front

RUN apk add --update rsync sshpass && rm -rf /var/cache/apk/*
