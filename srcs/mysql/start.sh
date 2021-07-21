#!/bin/sh

if [ ! -f /var/lib/mysql/init ]; then
    echo "initializing db"

    mysql_install_db --datadir=/var/lib/mysql

    mysqld --datadir=/var/lib/mysql &

    sleep 3
    mysql < /initdb.sql
    mysql wp < /wp.sql

    pkill -TERM mysqld
    touch /var/lib/mysql/init
fi

mysqld_safe --datadir=/var/lib/mysql
