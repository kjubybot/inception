FROM alpine

RUN apk add redis

COPY redis.conf /etc/

CMD ["redis-server", "/etc/redis.conf"]
