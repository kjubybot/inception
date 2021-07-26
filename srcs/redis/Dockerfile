FROM alpine:3.14

RUN apk add redis

COPY redis.conf /etc/

CMD ["redis-server", "/etc/redis.conf"]
