FROM alpine

RUN apk add bind

COPY named.conf /etc/bind
COPY tmeizo.42.fr /var/bind

CMD ["named", "-g"]
