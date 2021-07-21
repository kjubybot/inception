FROM alpine

RUN apk add mariadb mariadb-client

RUN mkdir /run/mysqld

COPY my.cnf /etc/
COPY start.sh .

CMD ["./start.sh"]
