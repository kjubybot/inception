FROM alpine

RUN apk add php7-fpm php7-session php7-json php7-mysqli php7-xml php7-curl php7-iconv php7-phar php7-redis php7-ctype

RUN mkdir -p /var/www
COPY php-fpm.conf /etc/php7/
COPY www.conf /etc/php7/php-fpm.d/

CMD ["php-fpm7", "-F", "-O"]
