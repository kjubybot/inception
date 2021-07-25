#!/bin/sh

if [ ! -f /var/lib/mysql/init ]; then
    echo "initializing db"

    mysql_install_db --datadir=/var/lib/mysql

    mysqld --datadir=/var/lib/mysql &

    cat <<EOF > /initdb.sql
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
EOF
    sleep 3
    mysql < /initdb.sql
    mysql -u root --password=$DB_PASS wp < /wp.sql

    pkill -TERM mysqld
    touch /var/lib/mysql/init
fi

mysqld_safe --datadir=/var/lib/mysql
