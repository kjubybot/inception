FROM alpine

RUN apk add php-fpm php-mysqli php-session

RUN mkdir /var/www
COPY php-fpm.conf /etc/php7/
COPY www.conf /etc/php7/php-fpm.d/

CMD ["php-fpm7", "-F"]
