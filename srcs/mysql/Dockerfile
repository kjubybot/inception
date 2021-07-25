FROM alpine:3.14

RUN apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld

COPY my.cnf /etc/
#COPY initdb.sql .
COPY wp.sql .
COPY start.sh .

CMD ["./start.sh"]
